//
//  DiasViewController.swift
//  challenge5
//
//  Created by Leandro de Sousa Silva on 20/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import UIKit

class DiasViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DiasdaSemana.all
        .count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! diasTableViewCell
       
        let dias = DiasdaSemana.all[indexPath.row]
        
     
        cell.diasText.text = dias.Dsemana
        cell.boolSwitch.isOn = dias.enabled
        cell.indexCell = indexPath.row
        self.tabBarController?.tabBar.isHidden = true
     return cell
    }
    
 

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  
    
   

}


