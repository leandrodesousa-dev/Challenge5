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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func salvarLivros(_ sender: Any) {
   
        let salvarLivrosOk = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let mainNavigationVC = salvarLivrosOk.instantiateViewController(withIdentifier: "ViewController") as? ViewController else{
            return
        }
        
        present(mainNavigationVC, animated: true, completion: nil)
        
    }
    
    
    
}
