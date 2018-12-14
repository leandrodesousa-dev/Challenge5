//
//  InterfaceControllerLivros.swift
//  challenge5 WatchKit Extension
//
//  Created by Leandro de Sousa Silva on 14/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceControllerLivros: WKInterfaceController {

    @IBOutlet weak var tableView: WKInterfaceTable!
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
