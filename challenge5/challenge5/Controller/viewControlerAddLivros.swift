//
//  viewControlerAddLivros.swift
//  challenge5
//
//  Created by Leandro de Sousa Silva on 18/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import WatchKit
import UIKit

class viewControlerAddLivros: UIViewController {
    
    @IBOutlet weak var tituloLabel: UITextField!
    @IBOutlet weak var Paginas: UITextField!
    
    override func viewDidLoad() {
        print("foi\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\")
        super.viewDidLoad()
    }
    
    @IBAction func salvarLivros(_ sender: Any) {
        
        saveCoreData(image: nil, titulo: tituloLabel.text!, paginas: Int(Paginas.text!)!)
       
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
}
