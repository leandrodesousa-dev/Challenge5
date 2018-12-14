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
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Livro")
    
    do {
        livros = try managedContext.fetch(fetchRequest)
    } catch let error as NSError{
        print("Não fez o fetch. \(error),\(error.userInfo)")
    }
}

func saveCoreData(image: UIImage?, titulo: String, paginas: Int){
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let entidade = NSEntityDescription.entity(forEntityName: "Livro", in: managedContext)!
    
    let objetosSupermercados = NSManagedObject(entity: entidade, insertInto: managedContext)
    
    objetosSupermercados.setValue(titulo, forKey: "title")
    
    do{
        try managedContext.save()
        livros.append(objetosSupermercados)
    } catch let error as NSError {
        print("Não consegui salvar. \(error), \(error.userInfo)")
    }
}
