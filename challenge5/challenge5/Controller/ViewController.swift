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
    
    
    let liv = ["Killing Comendatore","Ensaio sobre a cegueira","Outsider"]
    
    let livImage: [UIImage] = [
    UIImage(named: "livro_exemplo_1")!,
    UIImage(named: "livro_exemplo_2")!,
    UIImage(named: "livro_exemplo_3")!,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    //  setupNavigationBarItem()
        
        initCoreData()
        WCSession.default.transferUserInfo(["":liv])
    }
    
    
    
//    private func setupNavigationBarItem(){
//    let addLivros = UIButton(type: .system)
//        addLivros.setImage(UIImage(named: "botao_adicionar_imagem"), for: .normal)
//        addLivros.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addLivros)
//
//    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return liv.count
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCellController
        
        cell.nomedoLivro.text = liv[indexPath.item]
        cell.livro1.image = livImage[indexPath.item]
        
        return cell
    }
   
}

