//
//  DiasdaSemana.swift
//  challenge5
//
//  Created by Leandro de Sousa Silva on 20/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import Foundation

public struct Dias {
   
    let Dsemana: String
    
    init(title: String) {
        self.Dsemana = title
    }
    
}

public struct DiasdaSemana {
    public static let all: [Dias] = [
        Dias(title: "Domingo"),
        Dias(title: "Segunda-Feira"),
        Dias(title: "Terça-Feira"),
        Dias(title: "Quarta-Feira"),
        Dias(title: "Quinta-Feira"),
        Dias(title: "Sexta-Feira"),
        Dias(title: "Sábado")
    ]
}
