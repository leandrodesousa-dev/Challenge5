//
//  Extension.swift
//  challenge5
//
//  Created by Nickson Kley Gonçalves Da Silva on 20/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import Foundation

extension String{
    func time() -> String{
        
        let valor = Double(self)
        let hora = floor(valor!/3600)
        let min = floor((valor! - (hora * 3600))/60)
        
        return "\(Int(hora))h\(Int(min))min"
        
    }
}
