//
//  CronogramaViewController.swift
//  challenge5
//
//  Created by Leandro de Sousa Silva on 18/12/18.
//  Copyright © 2018 AcademyMistic. All rights reserved.
//

import UIKit

class CronogramaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return livros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celula", for: indexPath) as! LivrosTableViewCell
        
        cell.tituloText.text = livros[indexPath.item].value(forKey: "title") as? String
        cell.imagemLivro.image = UIImage(data: (livros[indexPath.item].value(forKey: "image") as? Data) ?? #imageLiteral(resourceName: "background_cadastro").pngData()!)
        cell.horarioLabel.text = livros[indexPath.item].value(forKey: "horario") as? String ?? ""
        let dias = livros[indexPath.item].value(forKey: "diasAlarme") as? String ?? ""
        let listaDias = dias.split(separator: "|")
        cell.diasLabel.text = trocarTextoDias(listAtivados: listaDias)

        return cell
    }
    
    func trocarTextoDias(listAtivados: [Substring])-> String {
        if listAtivados.count == 1{
            return "Todo(a) \(listAtivados[0])"
        }
        else if listAtivados == ["Domingo","Sábado"]{
            return "Todo fins de semana"
        }
        else if listAtivados == ["Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira"]{
            return "Todos os dias da semana"
        }
        else if listAtivados.count == 0{
            return ""
        }
        else{
            var title = "Toda "
            for i in listAtivados{
                title += "\(i), "
            }
            title = String(title.dropLast())
            return title
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

         self.tabBarController?.tabBar.isHidden = false
        
        // Do any additional setup after loading the view.
         NotificationCenter.default.addObserver(self, selector: #selector(CronogramaViewController.notificacaoDerecebimento(_:)), name: notificacaoDeCadastroDeLivro, object: nil)
    }
    
  
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func notificacaoDerecebimento(_ notification: Notification){
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
   

}
