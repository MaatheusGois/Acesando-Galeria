//
//  EscolherImagem.swift
//  AcessandoGaleria
//
//  Created by Matheus Gois on 22/06/19.
//  Copyright © 2019 Matheus Gois. All rights reserved.
//

import UIKit

class ImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    //Instancia o Controle de Seletor de Imagens
    var picker = UIImagePickerController();
    //Cria um alerta
    var alerta = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    //Cria uma variável do tipo UIViewController
    var viewController: UIViewController?
    //Cria um callback @escaping
    var pickImageCallback : ((UIImage) -> ())?;
    
    
    
    //Função principal
    func pickImagem(_ viewController: UIViewController, _ callback: @escaping ((UIImage) -> ())) {
        
        //Declara o callback dessa funcao como sendo a variavel externa pickImageCallback, isso serve para o retorno dessa funcao estar em outro metodo, no caso, apos a escolha da imagem
        pickImageCallback = callback;
        
        //Declara o viewController como o passado como parametro, isso serve para as transicoes de tela.
        self.viewController = viewController;
        
        //Cria uma acao que chama o metodo "abrirGaleria"
        let galeria = UIAlertAction(title: "Galeria", style: .default){
            UIAlertAction in
            self.abrirGaleria()
        }
        
        //Cria uma outra acao
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel){
            UIAlertAction in
        }
        
        //Declara que o novo delegate do piker são os métodos abaixo
        picker.delegate = self
        
        
        // Adiciona acoes ao alerta
        alerta.addAction(galeria)
        alerta.addAction(cancelar)
        
        //Exibe o alerta na tela
        alerta.popoverPresentationController?.sourceView = self.viewController!.view
        viewController.present(alerta, animated: true, completion: nil)
    }
    
    //Abre a galeria
    func abrirGaleria(){
        
        //Desfaz o alerta gerado
        alerta.dismiss(animated: true, completion: nil)
        
        //Por default o tipo de abertura do piker em cena é a Galeria
        
        //Vai para a tela da Galeria
        self.viewController!.present(picker, animated: true, completion: nil)
    }
    
    //Metodo chamado quando a pessoa cancela a escolha
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Desfaz a tela da Galeria que foi gerada
        picker.dismiss(animated: true, completion: nil)
    }
    
    //Metodo chamado quando a pessoa escolhe uma imagem
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //Desfaz a tela da Galeria que foi gerada
        picker.dismiss(animated: true, completion: nil)
        
        //Verifica o arquivo averto é realmente uma imagem
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Esperava-se uma imagem, mas foi dado o seguinte: \(info)")
        }
        
        //Retorna o callback da função pikeImagem
        pickImageCallback?(image)
    }
}
