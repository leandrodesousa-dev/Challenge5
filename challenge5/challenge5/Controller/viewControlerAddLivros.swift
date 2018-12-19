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
