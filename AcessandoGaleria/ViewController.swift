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
//        PickerImagem().pickImagem(self){ image in
//            self.imagem.image = image
//        }
        EscolherImagem().pickImagem(self){ image in
            self.imagem.image = image
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

