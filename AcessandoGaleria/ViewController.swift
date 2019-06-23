//
//  ViewController.swift
//  AcessandoGaleria
//
//  Created by Matheus Gois on 22/06/19.
//  Copyright © 2019 Matheus Gois. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imagem: UIImageView!
    @IBAction func botaoEscolher(_ sender: Any) {

        EscolherImagem().selecionadorImagem(self){ imagem in
            self.imagem.image = imagem
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

