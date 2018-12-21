//
//  AlertaViewController.swift
//  challenge5
//
//  Created by Leandro de Sousa Silva on 19/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import UIKit

class AlertaViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
  
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
        
        livrosPicker.text = livros[row].value(forKey: "title") as? String
        imgLivro.image = UIImage(data: (livros[row].value(forKey: "image") as? Data) ?? #imageLiteral(resourceName: "background_cadastro").pngData()!)
        
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
        print(DiasdaSemana.all)
        trocarTextoDias()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func trocarTextoDias() {
        var listAtivados : [String] = []
        for iten in DiasdaSemana.all.enumerated(){
            if iten.element.enabled{
                listAtivados.append(iten.element.Dsemana)
            }
        }
        if listAtivados.count == 1{
            dias.titleLabel?.text = "Todo(a) \(listAtivados[0])"
        }
        else if listAtivados == ["Domingo","Sábado"]{
            dias.titleLabel?.text = "Todo fins de semana"
        }
        else if listAtivados == ["Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira"]{
            dias.titleLabel?.text = "Todos os dias da semana"
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

}
