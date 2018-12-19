//
//  viewControlerAddLivros.swift
//  challenge5
//
//  Created by Leandro de Sousa Silva on 18/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import WatchKit
import UIKit

class viewControlerAddLivros: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var galeriaOut: UIButton!
    
    @IBOutlet weak var tituloLabel: UITextField!
    @IBOutlet weak var Paginas: UITextField!
  
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var activeTextField: UITextField!
    
    @objc func keyboardDidShow(notification: Notification) {
        let info: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let keyboardY = self.view.frame.size.height - keyboardSize.height
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
    
    @IBAction func salvarLivros(_ sender: Any) {
        saveCoreData(image: galeriaOut!.imageView?.image, titulo: tituloLabel.text!, paginas: Int(Paginas.text!)!)
        sendContext()
        navigationController?.popViewController(animated: true)
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
