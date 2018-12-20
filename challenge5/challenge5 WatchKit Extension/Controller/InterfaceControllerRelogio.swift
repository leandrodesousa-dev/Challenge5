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
    
    //Context
    var index = 0
    var atual = 0
    var paginas = 0
    
    //Outlet da label e botões
    
    @IBOutlet weak var LabelRelogio: WKInterfaceLabel!
    
    
    @IBOutlet weak var btIniciarOut: WKInterfaceButton!
    
    @IBOutlet weak var btFinalizarOut: WKInterfaceButton!
    
    //Ações de botões
    
    @IBAction func IniciarPausar() {
        StartStop()
       
        
    }
    
    @IBAction func FinalizarBt() {
        //WCSession.default.sendMessage(["0":index,"2":atual], replyHandler: nil, errorHandler: nil)
        let coiso = (horas*3600)+(minutos*60)
        pushController(withName: "InterfaceControllerPaginas", context: ["0":index, "2":atual, "3":paginas, "6":coiso])
        
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        var contexto = context as! [String:Any?]
        index = contexto["0"] as! Int
        self.setTitle(contexto["1"] as? String)
        atual = contexto["2"] as! Int
        paginas = contexto["3"] as! Int
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

    
    //Funcoes
    
    func StartStop(){
        if chave {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(InterfaceControllerRelogio.action), userInfo: nil , repeats: true)
            btIniciarOut.setTitle("Stop")
            chave = false
             self.btIniciarOut.setBackgroundColor(UIColor.init(red: 32, green: 133, blue: 169))
        } else {
            timer.invalidate()
            chave = true
            btIniciarOut.setTitle("Start")
             self.btIniciarOut.setBackgroundColor(UIColor.init(red: 31, green: 33, blue: 36))
        }
    }
    
    @objc func action(){
        calculoDoTempo()
    }
    
    func calculoDoTempo(){
        tempo = tempo + 1
        
        if tempo == 60{
            tempo=0
            minutos += 1
        }
        
        if minutos == 60{
            minutos=0
            horas+=1
        }
        
        if tempo < 10 {
            LabelRelogio.setText("00:0\(minutos):0\(tempo)")
        } else {
            if minutos < 10 {
                LabelRelogio.setText("00:0\(minutos):\(tempo)")
            }else{
                if horas < 10{
                    LabelRelogio.setText("0\(horas):\(minutos):\(tempo)")
                }
                else{
                    LabelRelogio.setText("\(horas):\(minutos):\(tempo)")
                }
            }
        }
    }
    
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
