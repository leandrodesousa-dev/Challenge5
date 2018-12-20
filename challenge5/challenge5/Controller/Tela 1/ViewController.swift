//
//  ViewController.swift
//  challenge5
//
//  Created by Leandro de Sousa Silva on 12/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var proLeitura = 0.0
      
    override func viewDidLoad() {
        super.viewDidLoad()
  
        //navigationController?.isNavigationBarHidden = true
        initCoreData()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.notificacaoDerecebimento(_:)), name: notificacaoDeCadastroDeLivro, object: nil)
        sendContext()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCellController
//
//        cell.nomedoLivro.text = livros[indexPath.item].value(forKey: "title") as? String
//        cell.livro1.image = UIImage(data: (livros[indexPath.item].value(forKey: "image") as? Data) ?? #imageLiteral(resourceName: "background_cadastro").pngData()!)
//
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return livros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.titleBook.text = livros[indexPath.item].value(forKey: "title") as? String
        cell.imageBook.image = UIImage(data: (livros[indexPath.item].value(forKey: "image") as? Data) ?? #imageLiteral(resourceName: "background_cadastro").pngData()!)
        cell.currntPage.text = "\(livros[indexPath.item].value(forKey: "atualPagina") as? Int)"
        cell.allPages.text = "\(livros[indexPath.item].value(forKey: "pagina") as? Int)"
        
        return cell
    }
    
    @objc private func notificacaoDerecebimento(_ notification: Notification){
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
   
}

