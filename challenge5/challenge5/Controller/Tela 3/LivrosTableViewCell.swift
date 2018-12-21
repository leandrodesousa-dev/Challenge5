//
//  LivrosTableViewCell.swift
//  challenge5
//
//  Created by Leandro de Sousa Silva on 18/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import UIKit

class LivrosTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloText: UILabel!
    
    @IBOutlet weak var imagemLivro: UIImageView!
    
    @IBOutlet weak var horarioLabel: UILabel!
    
    @IBOutlet weak var diasLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
