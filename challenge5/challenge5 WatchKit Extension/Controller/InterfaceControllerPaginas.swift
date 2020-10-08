//
//  InterfaceController.swift
//  challenge5 WatchKit Extension
//
//  Created by Leandro de Sousa Silva on 12/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import WatchKit
import WatchConnectivity
import Foundation


class InterfaceControllerPaginas: WKInterfaceController {
    
    var index = 0
    var atual = 0
    var paginas = 0
    var tempo = 0
    
    var itens : [WKPickerItem] = []

    @IBOutlet weak var piker: WKInterfacePicker!
    
    @IBAction func Trocou(_ value: Int) {
        //
        atual = Int(itens[value].title!)!
    }
    
    @IBAction func Prosseguir() {
        //pushController(withName: "InterfaceControllerReprodutor", context: ["0":index, "2":atual,"6":tempo])
        WKInterfaceController.reloadRootControllers(withNames: ["Progresso"], contexts: [["2":atual,"3":paginas]])
        WCSession.default.sendMessage(["0":index, "2":atual, "6":tempo], replyHandler: nil, errorHandler: nil)
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        print("inicio")
        // Configure interface objects here.
        let contexto = context as! [String:Any?]
        
        index = contexto["0"] as! Int
        atual = contexto["2"] as! Int
        paginas = contexto["3"] as! Int
        tempo = contexto["6"] as! Int
        
        if let quantidade = contexto["3"] as? Int{
            for indice in 1...quantidade{
                let item = WKPickerItem()
                item.title = "\(indice)"
                itens.append(item)
            }
        }
        
        piker.setItems(itens)
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
