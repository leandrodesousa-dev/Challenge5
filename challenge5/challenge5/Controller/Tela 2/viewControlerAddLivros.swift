//
//  viewControlerAddLivros.swift
//  challenge5
//
//  Created by Leandro de Sousa Silva on 18/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import WatchKit
import UIKit

class viewControlerAddLivros: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var galeriaOut: UIButton!
    
    @IBOutlet weak var tituloLabel: UITextField!
    @IBOutlet weak var Paginas: UITextField!
  
    var imagePicker = UIImagePickerController()
    var activeTextField: UITextField!
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("chamou")
        activeTextField = textField
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tituloLabel.resignFirstResponder()
        
        Paginas.resignFirstResponder()
        
        return(true)
    }
    
    @objc func keyboardDidShow(notification: Notification) {
        let info: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let keyboardY = self.view.frame.size.height - keyboardSize.height
        print(activeTextField)
        let editingTextFieldY: CGFloat! = self.activeTextField?.frame.origin.y
        
        // Verificando se o textfield está realmente escondido atrás do teclado
        if self.view.frame.origin.y >= 0 {
            
            if editingTextFieldY > keyboardY - 45 {
                UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                    self.view.frame = CGRect(x: 0, y: self.view.frame.origin.y - (editingTextFieldY - (keyboardY - 45)), width: self.view.bounds.width, height: self.view.bounds.height)
                }, completion: nil)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)}, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tituloLabel.delegate = self
        self.Paginas.delegate = self
        
        // Listen for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: viewControlerAddLivros.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: viewControlerAddLivros.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: viewControlerAddLivros.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: viewControlerAddLivros.keyboardWillHideNotification, object: nil)
        
    }
    
    @IBAction func salvarLivros(_ sender: Any) {
        saveCoreData(image: galeriaOut!.imageView?.image, titulo: tituloLabel.text!, paginas: Int(Paginas.text!)!)
        DispatchQueue.main.async{
            sendContext()
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func galeriaBt(_ sender: Any) {
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
   
        imagePicker.allowsEditing = false
        
        self.present(imagePicker, animated: true, completion: nil)
    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        
            galeriaOut.setImage(image, for: .normal)
        
          dismiss(animated: true, completion: nil)
        
    }
    
}
