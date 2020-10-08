//
//  Send.swift
//  challenge5
//
//  Created by Nickson Kley Gonçalves Da Silva on 18/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import Foundation
import UIKit
import WatchConnectivity

func sendContext() {
    var titulos : [String] = []
    var atual : [Int] = []
    var paginas : [Int] = []
    //var imagens : [Data] = []
    
    for livro in livros{
        titulos.append(livro.value(forKey: "title") as! String)
        atual.append(livro.value(forKey: "atualPagina") as? Int ?? 0)
        paginas.append(livro.value(forKey: "pagina") as? Int ?? 0)
        //imagens.append(livro.value(forKey: "image") as? Data ?? )
    }
    WCSession.default.transferUserInfo(["1":titulos, "2":atual, "3":paginas/*, "4":imagens*/])
}
