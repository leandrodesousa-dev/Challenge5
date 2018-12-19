//
//  InterfaceControllerLivros.swift
//  challenge5 WatchKit Extension
//
//  Created by Leandro de Sousa Silva on 14/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceControllerLivros: WKInterfaceController {

    //Criacao de Outlet
    @IBOutlet weak var tableView: WKInterfaceTable!

//criacao de variaveis
    //var tableData : [String] = []
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        loadTableData()
        NotificationCenter.default.addObserver(self, selector: #selector(InterfaceControllerLivros.notificacaoDerecebimento(_:)), name: notificacaoDeRecebimentoDeLivro, object: nil)
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        NotificationCenter.default.removeObserver(self)
    }

    private func loadTableData() {
        
        tableView.setNumberOfRows(listaTitulo.count, withRowType: "RowController")
        
        for (index,rowModel) in listaTitulo.enumerated(){
            if let rowController = tableView.rowController(at: index) as? RowController{
                rowController.rowLabel.setText(rowModel)
                //rowController.imageBook.setImageData(listaImagens[index])
                rowController.progressoLabel.setText("\(listaAtual[index])/\(listaPaginas[index])")
            }
        }
    }
    
    internal override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        pushController(withName: "InterfaceControllerRelogio", context: rowIndex)
        
    }
    
    @objc private func notificacaoDerecebimento(_ notification: Notification){
        
        DispatchQueue.main.async {
            self.loadTableData()
        }
        
    }
    
}
