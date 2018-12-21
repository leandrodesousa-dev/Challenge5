//
//  DiasdaSemana.swift
//  challenge5
//
//  Created by Leandro de Sousa Silva on 20/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import Foundation

public struct Dias {
   
    let Dsemana : String
    var enabled : Bool
    
    init(title: String, enable: Bool) {
        self.Dsemana = title
        self.enabled = enable
    }
    
}

public struct DiasdaSemana {
    public static var all: [Dias] = [
        Dias(title: "Domingo", enable: false),
        Dias(title: "Segunda-Feira", enable: false),
        Dias(title: "Terça-Feira", enable: false),
        Dias(title: "Quarta-Feira", enable: false),
        Dias(title: "Quinta-Feira", enable: false),
        Dias(title: "Sexta-Feira", enable: false),
        Dias(title: "Sábado", enable: false)
    ]
    public static var inicio: [Dias] = [
        Dias(title: "Domingo", enable: false),
        Dias(title: "Segunda-Feira", enable: false),
        Dias(title: "Terça-Feira", enable: false),
        Dias(title: "Quarta-Feira", enable: false),
        Dias(title: "Quinta-Feira", enable: false),
        Dias(title: "Sexta-Feira", enable: false),
        Dias(title: "Sábado", enable: false)
    ]
}
