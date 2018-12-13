//
//  Extensions.swift
//  challenge5 WatchKit Extension
//
//  Created by Leandro de Sousa Silva on 13/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import Foundation

extension FileManager{
    var userDocumentsDirectory: URL {
        let manager = FileManager.default
        let url: URL = manager.urls(for: .documentDirectory, in: .userDomainMask).last!
        return url
    }
}
