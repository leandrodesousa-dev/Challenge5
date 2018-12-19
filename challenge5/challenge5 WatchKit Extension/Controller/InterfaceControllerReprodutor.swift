//
//  InterfaceControllerReprodutor.swift
//  challenge5 WatchKit Extension
//
//  Created by Nickson Kley Gonçalves Da Silva on 19/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import WatchKit
import WatchConnectivity
import Foundation


class InterfaceControllerReprodutor: WKInterfaceController {
    
    var index = 0
    var atual = 0
    var tempo = 0
    var audio = ""

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if let contexto = context as? [ String: Any]{
            index = contexto["0"] as! Int
            atual = contexto["2"] as! Int
            tempo = contexto["6"] as! Int
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
    
    @IBAction func Gravar() {
        let oi = WKAudioRecorderPreset.narrowBandSpeech
        let pao = newOutputURL()
        let options: [String : Any] =
            [WKAudioRecorderControllerOptionsAutorecordKey: 30]
        presentAudioRecorderController(withOutputURL: pao, preset: oi, options: options){
            [weak self] (didSave: Bool, error: Error?) in

            // 5
            guard didSave else { return }
            //self?.processRecordedAudio(at: pao)
            
            self!.audio = pao.absoluteString
            print(self!.audio)
        }
    }
    
    //Funcoes
    func newOutputURL() -> URL {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmssZZZ"
        let date = Date()
        let filename = dateFormatter.string(from: date)
        let output = FileManager.default.userDocumentsDirectory.appendingPathComponent("\(filename).m4a")
        return output
    }
    
    @IBAction func Prosseguir() {
        
        WCSession.default.sendMessage(["0":index, "2":atual, "5":audio, "6":tempo], replyHandler: nil, errorHandler: nil)
        WKInterfaceController.reloadRootControllers(withNames: ["InterfaceControllerLivros"], contexts: nil)
        
    }
    
}
