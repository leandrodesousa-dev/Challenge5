//
//  InterfaceControllerGravador.swift
//  challenge5 WatchKit Extension
//
//  Created by Leandro de Sousa Silva on 13/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceControllerGravador: WKInterfaceController {
    
    var index = 0;
    var titulo = ""
    var atual = 0
    var paginas = 0
    var audio = ""
    
    @IBOutlet weak var prosseguiButton: WKInterfaceButton!
    //Botoes
    @IBAction func btGravador() {
        print(audio)
        presentMediaPlayerController(with: URL(fileURLWithPath: audio), options: nil){_,_,_ in
            
        }
        
    }
    
    
    @IBAction func Proseguir() {
        WKInterfaceController.reloadRootControllers(withNames: ["InterfaceControllerRelogio"], contexts: [["0":index,"1":titulo,"2":atual,"3":paginas]])
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let detailData = context as? [String:Any?] {
            index = detailData["0"] as! Int
            titulo = detailData["1"] as! String
            atual = detailData["2"] as! Int
            paginas = detailData["3"] as! Int
            if let coiso = detailData["5"] as? String{
                audio = coiso
            }
            else{
                WKInterfaceController.reloadRootControllers(withNames: ["InterfaceControllerRelogio"], contexts: [["0":index,"1":titulo,"2":atual,"3":paginas]])
            }
            self.setTitle(titulo)
        }
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
