//
//  Send.swift
//  challenge5
//
//  Created by Nickson Kley Gonçalves Da Silva on 18/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import Foundation
import WatchConnectivity

func sendContext() {
    var titulos : [String] = []
    for livro in livros{
        titulos.append(livro.value(forKey: "title") as! String)
    }
    WCSession.default.transferUserInfo(["":titulos])
}
