//
//  TableViewCell.swift
//  challenge5
//
//  Created by Nickson Kley Gonçalves Da Silva on 19/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageBook: UIImageView!
    @IBOutlet weak var titleBook: UILabel!
    @IBOutlet weak var allTime: UILabel!
    @IBOutlet weak var currntPage: UILabel!
    @IBOutlet weak var allPages: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        progress.transform = progress.transform.scaledBy(x: 1, y: 5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
