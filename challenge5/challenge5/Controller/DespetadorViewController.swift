//
//  DespetadorViewController.swift
//  challenge5
//
//  Created by Leandro de Sousa Silva on 19/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import UIKit

class DespetadorViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let exemplo = ["pegou 1", "pegou 2", "pegou 3", "pegou 4"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return exemplo[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return exemplo.count
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
