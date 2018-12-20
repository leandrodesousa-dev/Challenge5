//
//  CoreData.swift
//  challenge5
//
//  Created by Nickson Kley Gonçalves Da Silva on 14/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import Foundation
import CoreData
import UIKit

func initCoreData(){
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
        return
    }
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Livros")
    
    do {
        livros = try managedContext.fetch(fetchRequest)
    } catch let error as NSError{
        print("Não fez o fetch. \(error),\(error.userInfo)")
    }
}

func saveCoreData(image: UIImage?, titulo: String, paginas: Int){
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let entidade = NSEntityDescription.entity(forEntityName: "Livros", in: managedContext)!
    
    let livroSave = NSManagedObject(entity: entidade, insertInto: managedContext)
    
    livroSave.setValue(titulo, forKey: "title")
    livroSave.setValue(paginas, forKey: "pagina")
    livroSave.setValue(image?.pngData(), forKey: "image")
    
    do{
        try managedContext.save()
        livros.append(livroSave)
        NotificationCenter.default.post(name: notificacaoDeCadastroDeLivro, object: nil, userInfo: nil)
    } catch let error as NSError {
        print("Não consegui salvar. \(error), \(error.userInfo)")
    }
}

func editCoreData(dicionario: [String:Any]){
    let index = dicionario["0"] as! Int
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let requestDel = NSFetchRequest<NSFetchRequestResult>(entityName: "Livros")
    requestDel.returnsObjectsAsFaults = false
    
    
    do {
        let arrUsrObj = try context.fetch(requestDel)
        let usrObj = arrUsrObj as! [NSManagedObject]
        usrObj[index].setValue(dicionario["2"] as! Int, forKey: "atualPagina")
        usrObj[index].setValue(dicionario["6"] as! Int, forKey: "time")
        livros[index] = usrObj[index]
        NotificationCenter.default.post(name: notificacaoDeCadastroDeLivro, object: nil, userInfo: nil)
        
    } catch {
        print("Failed")
    }
    
    // Saving the Delete operation
    do {
        try context.save()
    } catch {
        print("Failed saving")
    }
}
