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
