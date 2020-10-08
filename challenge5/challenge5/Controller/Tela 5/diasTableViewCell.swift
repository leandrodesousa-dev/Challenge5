//
//  diasTableViewCell.swift
//  challenge5
//
//  Created by Leandro de Sousa Silva on 20/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import UIKit

class diasTableViewCell: UITableViewCell {

    @IBOutlet weak var textTeste: UITextField!
    
   
    @IBOutlet weak var diasText: UILabel!
    @IBOutlet weak var boolSwitch: UISwitch!
    var indexCell : Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func change(_ sender: Any) {
        DiasdaSemana.all[indexCell!].enabled = boolSwitch.isOn
    }
    
}
