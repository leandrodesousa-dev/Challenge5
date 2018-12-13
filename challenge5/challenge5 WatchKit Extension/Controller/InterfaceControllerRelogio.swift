//
//  InterfaceControllerRelogio.swift
//  challenge5 WatchKit Extension
//
//  Created by Leandro de Sousa Silva on 13/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceControllerRelogio: WKInterfaceController {

    //Variaveis
    var tempo = 0
    var timer = Timer()
    var chave = true
    var minutos = 0
    var horas = 0
    
    //Outlet da label e botões
    
    @IBOutlet weak var LabelRelogio: WKInterfaceLabel!
    
    
    @IBOutlet weak var btIniciarOut: WKInterfaceButton!
    
    @IBOutlet weak var btFinalizarOut: WKInterfaceButton!
    
    //Ações de botões
    
    @IBAction func IniciarPausar() {
        
    }
    
    @IBAction func FinalizarBt() {
        
    }
    
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
