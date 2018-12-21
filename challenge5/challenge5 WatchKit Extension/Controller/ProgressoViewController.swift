//
//  ProgressoViewController.swift
//  challenge5 WatchKit Extension
//
//  Created by Nickson Kley Gonçalves Da Silva on 20/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import WatchKit
import Foundation


class ProgressoViewController: WKInterfaceController {
    
    @IBOutlet var progressoLabel: WKInterfaceLabel!
    @IBOutlet var coiso: WKInterfaceButton!
    var timer = Timer()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let contexto = context as! [String : Any]
        let atual = contexto["2"] as! Int
        let paginas = contexto["3"] as! Int
        progressoLabel.setText("\(atual)/\(paginas)")
        // Configure interface objects here.
        //animar(atual: atual, paginas: paginas)
        animar(atual: atual, paginas: paginas)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func animar(atual: Int, paginas: Int) {
        animate(withDuration: 1, animations: {self.coiso.setRelativeWidth(CGFloat(atual/paginas), withAdjustment: CGFloat(0))})
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ProgressoViewController.action), userInfo: nil , repeats: false)
    }
    
    @objc func action() {
        
        WKInterfaceController.reloadRootControllers(withNames: ["InterfaceControllerLivros"], contexts: nil)
        
    }

}
