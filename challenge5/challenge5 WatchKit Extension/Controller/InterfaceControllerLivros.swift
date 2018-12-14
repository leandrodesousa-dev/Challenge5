//
//  InterfaceControllerLivros.swift
//  challenge5 WatchKit Extension
//
//  Created by Leandro de Sousa Silva on 14/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceControllerLivros: WKInterfaceController {

    //Criacao de Outlet
    @IBOutlet weak var tableView: WKInterfaceTable!

//criacao de variaveis
    let tableData = ["um","dois","Tres","Quatro"]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        loadTableData()
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

    private func loadTableData() {
        
        tableView.setNumberOfRows(tableData.count, withRowType: "RowController")
        
        for (index,rowModel) in tableData.enumerated(){
            if let rowController = tableView.rowController(at: index) as? RowController{
                rowController.rowLabel.setText(rowModel)
            }
        }
    }
    
    internal override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        pushController(withName: "InterfaceControllerGravador", context: tableData[rowIndex])
        
    }
}
