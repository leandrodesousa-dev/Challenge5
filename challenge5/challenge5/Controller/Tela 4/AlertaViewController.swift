//
//  AlertaViewController.swift
//  challenge5
//
//  Created by Leandro de Sousa Silva on 19/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import UIKit

class AlertaViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
       
        
//        return 1
        
        if pickerView == livrosPicker {
            //      return arrayAltura.count
            return 1
        }
        else if pickerView == horarioPicker {
            return 1
        }  else {
            return 1
        }
      
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       // return testeLivros.count
        
        switch pickerView {
        case livrosPicker:
            return self.testeLivros.count
        default:
            return self.testeHorario.count
        }

        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     //   return testeLivros[row]

        switch pickerView {
        case livrosPicker:
            return self.testeLivros[row]
        default:
            return self.testeHorario[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        selecaoLivros = testeLivros[row]
//        livrosPicker.text = selecaoLivros
        if pickerView == livrosPicker {
            print("Livro Selecionada: \(row)")
           selecaoLivros = testeLivros[row]
            livrosPicker.text = selecaoLivros
        }
        else if pickerView == horarioPicker {
            print("horario Selecionada: \(row)")
            selecaoHorario = testeHorario[row]
            horarioPicker.text = selecaoHorario
        }
   
    }
    
    
    func criarPickerView(){
        let pickerView1 = UIPickerView()
        pickerView1.delegate = self
        
        let pickerView2 = UIPickerView()
        pickerView2.delegate = self
        
        
        livrosPicker.inputView = pickerView1
        horarioPicker.inputView = pickerView2
    }
    
    @objc func descerPickerView(){
       let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dissmissKeyboard))
        
        
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        livrosPicker.inputAccessoryView = toolbar
        horarioPicker.inputAccessoryView = toolbar
        
    }
    
    @objc func dissmissKeyboard(){
        view.endEditing(true)
    }
    
    var selecaoLivros: String?
    var selecaoHorario: String?
    
    var testeLivros = ["livro1","livro2","livro3"]
    
    var testeDias = ["dia1","dia2","dia3"]
    
    var testeHorario = ["hora1","hora2","hora3"]

    @IBOutlet weak var imgLivro: UIImageView!
  
    @IBOutlet weak var livrosPicker: UITextField!
    
    @IBOutlet weak var diasPicker: UITextField!
    
    @IBOutlet weak var horarioPicker: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
criarPickerView()
 descerPickerView()
     
    }
    


}
