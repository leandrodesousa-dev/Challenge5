//
//  ViewController.swift
//  challenge5
//
//  Created by Leandro de Sousa Silva on 12/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titulo: UITextField!
    @IBOutlet weak var paginas: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initCoreData()
        
    }

    @IBAction func ENVIAR(_ sender: Any) {
        saveCoreData(image: nil, titulo: titulo.text!, paginas: Int(paginas.text!) ?? 0)
        
    }
    
}

