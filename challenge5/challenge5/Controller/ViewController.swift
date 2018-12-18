//
//  ViewController.swift
//  challenge5
//
//  Created by Leandro de Sousa Silva on 12/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return livros.count
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCellController
        
        cell.nomedoLivro.text = livros[indexPath.item].value(forKey: "title") as? String
        cell.livro1.image = UIImage(data: (livros[indexPath.item].value(forKey: "image") as? Data) ?? #imageLiteral(resourceName: "background_cadastro").pngData()!)
        
        return cell
    }
    
    @objc private func notificacaoDerecebimento(_ notification: Notification){
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
    }
   
}

