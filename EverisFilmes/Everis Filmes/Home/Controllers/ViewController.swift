//
//  ViewController.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/4/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit
import Alamofire

    
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    
  
    //MARK - Atributos
    var listaGenerosIds:Array<Genre_ids> = []
    var listaPopulada: Array<Filmes> = []
    //MARK - Outlets
    @IBOutlet weak var colecaoFilmes: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FilmesAPI().consultaFilmes { (lista) in
            self.setaLista(lista: lista)
            self.colecaoFilmes.reloadData()
        }
        
        DetalhesFilmesAPI().consultaDetalheFilmes { (lista) in
            self.setaListaGenero(lista: lista)
        }
        self.colecaoFilmes.dataSource = self
        self.colecaoFilmes.delegate = self
    }
    
   
    //MARK - Metodos
    func setaLista (lista: Array<Filmes>){
        listaPopulada = lista
    }
    
    func setaListaGenero (lista: Array<Genre_ids>){
        listaGenerosIds = lista
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaPopulada.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilmes", for: indexPath) as! FilmesControllerCollectionViewCell
        
        let lista = listaPopulada[indexPath.row]
            celula.formataCollection(lista)
        
        return celula
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let Detalhefilme = listaPopulada[indexPath.item]
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "DetalheFilmes") as! DetalhesViewController
        controller.listaDetalhesFilme = Detalhefilme
        controller.listaGeneros = listaGenerosIds
        self.present(controller, animated: true, completion: nil)
    }
}

