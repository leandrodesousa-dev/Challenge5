//
//  DiasViewController.swift
//  challenge5
//
//  Created by Leandro de Sousa Silva on 20/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import UIKit

class DiasViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var dias = ["segunda","terça","quarta"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! diasTableViewCell
        
        //aqui
        for i in 0...2 {
            cell.diasText.text = dias[i]
        }
        
        
     return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
