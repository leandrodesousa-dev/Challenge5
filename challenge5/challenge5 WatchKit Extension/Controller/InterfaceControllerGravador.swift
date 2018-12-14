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

    
    
    //Botoes
    @IBAction func btGravador() {
        let oi = WKAudioRecorderPreset.narrowBandSpeech
        let pao = newOutputURL()
        let options: [String : Any] =
            [WKAudioRecorderControllerOptionsAutorecordKey: 30]
        presentAudioRecorderController(withOutputURL: pao, preset: oi, options: options){
            [weak self] (didSave: Bool, error: Error?) in
            
            // 5
            guard didSave else { return }
            //self?.processRecordedAudio(at: pao)
        }

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
    
    //Funcoes
    func newOutputURL() -> URL {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmssZZZ"
        let date = Date()
        let filename = dateFormatter.string(from: date)
        let output = FileManager.default.userDocumentsDirectory.appendingPathComponent("\(filename).m4a")
        return output
    }

}
