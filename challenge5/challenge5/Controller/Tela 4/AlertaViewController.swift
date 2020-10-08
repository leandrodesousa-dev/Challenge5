//
//  AlertaViewController.swift
//  challenge5
//
//  Created by Leandro de Sousa Silva on 19/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import UIKit
import WatchConnectivity
import UserNotifications

class AlertaViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
  
    var indexSelected : Int?
    var textF = UITextField()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      
        return 1
      
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return livros.count
        
    }
   
    var dictionary = [Int: Bool]()
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return livros[row].value(forKey: "title") as? String
    
    }
    


    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        indexSelected = row
        livrosPicker.text = livros[row].value(forKey: "title") as? String
        imgLivro.image = UIImage(data: (livros[row].value(forKey: "image") as? Data) ?? #imageLiteral(resourceName: "background_cadastro").pngData()!)
        horarioPicker.text = livros[row].value(forKey: "horario") as? String ?? ""
        let dias = livros[row].value(forKey: "diasAlarme") as? String ?? ""
        let lista = dias.dropLast().split(separator: "|")
        trocarTextoDias(listAtivados: lista)
    }
    
    private var datePicker: UIDatePicker?
    
    func criarPicker(){
        let pickerView1 = UIPickerView()
        pickerView1.delegate = self
        pickerView1.dataSource = self
        
        livrosPicker.inputView = pickerView1
        
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .time
        
        
        datePicker?.addTarget(self, action: #selector(AlertaViewController.dateChanged(dataPicker:)) , for: .allEditingEvents)
        
        horarioPicker.inputView = datePicker
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AlertaViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        //view.endEditing(true)
    }
    
    @objc func dateChanged(dataPicker: UIDatePicker){
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "HH:mm"
        horarioPicker.text = dateFormat.string(from: dataPicker.date)
        view.endEditing(true)
    }
    
    @objc func descerPickerView(){
        
       let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dissmissKeyboard))
        
        
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        let toolbar1 = UIToolbar()
        toolbar1.sizeToFit()
        
        let doneButton1 = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dissmissKeyboard1))
        
        
        toolbar1.setItems([doneButton1], animated: false)
        toolbar1.isUserInteractionEnabled = true
        
        
       livrosPicker.inputAccessoryView = toolbar
        horarioPicker.inputAccessoryView = toolbar1
        
    }
    
    @objc func dissmissKeyboard(){
        view.endEditing(true)
    }
    
    @objc func dissmissKeyboard1(){
        dateChanged(dataPicker: datePicker!)
        view.endEditing(true)
    }
    
    var selecaoLivros: String?
    var selecaoHorario: String?

    @IBOutlet weak var imgLivro: UIImageView!
  
    @IBOutlet weak var livrosPicker: UITextField!
    
    @IBOutlet weak var dias: UIButton!
    
    @IBOutlet weak var horarioPicker: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        descerPickerView()
        criarPicker()
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var listAtivados : [Substring] = []
        for iten in DiasdaSemana.all.enumerated(){
            if iten.element.enabled{
                listAtivados.append(iten.element.Dsemana.split(separator: "{")[0])
            }
        }
        trocarTextoDias(listAtivados: listAtivados)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func trocarTextoDias(listAtivados: [Substring]) {
        
        if listAtivados.count == 1{
            dias.titleLabel?.text = "Todo(a) \(listAtivados[0])"
        }
        else if listAtivados == ["Domingo","Sábado"]{
            dias.titleLabel?.text = "Todo fins de semana"
        }
        else if listAtivados == ["Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira"]{
            dias.titleLabel?.text = "Todos os dias da semana"
        }
        else if listAtivados.count == 0{
            
        }
        else{
            var title = "Toda "
            for i in listAtivados{
                title += "\(i), "
            }
            title = String(title.dropLast())
            dias.titleLabel?.text = title
        }
    }
    
    @IBAction func Salvar(_ sender: Any) {
        
        // TODO: não pega o dia da semana
        
        if let ind = indexSelected{
            var dias = ""
            var listAtivados : [String] = []
           
            for iten in DiasdaSemana.all.enumerated(){
                if iten.element.enabled{
                    listAtivados.append(iten.element.Dsemana)
                }
            }

            for iten in listAtivados{
                dias += "\(iten)|"
            }
            editHorario(index: ind, horario: horarioPicker.text ?? "", dias: String(dias.dropLast()))
            
            let indentificador = NSUUID().uuidString
            let conteudo = UNMutableNotificationContent()
            conteudo.body = "Ler \(livrosPicker.text!)"
            
            var dateComponente = DateComponents()
            let hora = String((horarioPicker.text?.split(separator: ":").first)!)
            let minuto = String((horarioPicker.text?.split(separator: ":").last)!)
            
            dateComponente.hour = Int(hora)
            dateComponente.minute = Int(minuto)
            let tipoNotificacao = UNCalendarNotificationTrigger(dateMatching: dateComponente, repeats: false)
            let request = UNNotificationRequest(identifier: indentificador, content: conteudo, trigger: tipoNotificacao)
            
            UNUserNotificationCenter.current().add(request){ a -> Void in
                //
            }
            
            DiasdaSemana.all = DiasdaSemana.inicio
            navigationController?.popViewController(animated: true)
        }
    }
    
}
