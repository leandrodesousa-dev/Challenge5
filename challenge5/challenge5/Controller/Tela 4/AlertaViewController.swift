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
//        return 1
        
        switch pickerView {
        case livrosPicker:
            return 1
        default:
            return 1
        }
      
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       // return testeLivros.count

        if textF == livrosPicker{
          return testeLivros.count
        } else if textF == horarioPicker{
            return testeHorario.count
        }else {
            return 0
        }
        
    }
    var dictionary = [Int: Bool]()
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return testeLivros[row]

        switch textF {
        case livrosPicker:
           
            return  livros[row].value(forKey: "title") as? String
            
        default:
            return testeHorario[row]
        }
    
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let pickerView1 = UIPickerView()
        pickerView1.delegate = self
        pickerView1.dataSource = self
        
        textF = textField
        if textF == livrosPicker{
            livrosPicker.inputView = pickerView1
        } else if textF == horarioPicker{
            horarioPicker.inputView = pickerView1
        }
    }
    

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        selecaoLivros = testeLivros[row]
//        livrosPicker.text = selecaoLivros

//        if textF == livrosPicker{
//            livrosPicker.text = testeLivros[row]
//
//        } else if textF == horarioPicker{
//            horarioPicker.text = testeHorario[row]
//     //   self.view.endEditing(true)
//        }
        
     //UIImage(data: (livros[indexPath.item].value(forKey: "image") as? Data) ?? #imageLiteral(resourceName: "background_cadastro").pngData()!)
        
        if textF == livrosPicker{
            livrosPicker.text = livros[row].value(forKey: "title") as? String
            imgLivro.image = UIImage(data: (livros[row].value(forKey: "image") as? Data) ?? #imageLiteral(resourceName: "background_cadastro").pngData()!)
        } else if textF == horarioPicker{
            horarioPicker.text = testeHorario[row]
            //   self.view.endEditing(true)
        }

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
    
    
    var testeHorario = ["hora1","hora2","hora3"]
    
    var horas: [Int] = []
    var minutos: [Int] = []
    

    @IBOutlet weak var imgLivro: UIImageView!
  
    @IBOutlet weak var livrosPicker: UITextField!
    
    
    @IBOutlet weak var horarioPicker: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descerPickerView()

       
       
    }
    


}
