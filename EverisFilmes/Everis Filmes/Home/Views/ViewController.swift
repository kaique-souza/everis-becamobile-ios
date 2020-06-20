//
//  ViewController.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/4/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit
import Alamofire

    
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate{
    
  
    //MARK - Atributos
    var listaComTodosFilmes: Array<Filmes> = []
    var listaPopulada: Array<Filmes> = []
    
    //MARK - Outlets
    @IBOutlet weak var colecaoFilmes: UICollectionView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FilmesAPI().consultaFilmes { (lista) in
            self.setaLista(lista: lista)
            self.colecaoFilmes.reloadData()
        }
        self.colecaoFilmes.dataSource = self
        self.colecaoFilmes.delegate = self
        self.searchBar.delegate = self
    }
    
    //MARK - Metodos
    func setaLista (lista: Array<Filmes>){
        listaPopulada = lista
        listaComTodosFilmes = lista
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
        guard let id = Detalhefilme.id else {return}
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "DetalheFilmes") as! DetalhesViewController
        controller.idDetalheFilme = id
        self.present(controller, animated: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != ""{
            let listaFiltrada = listaPopulada.filter{$0.title!.contains(searchText)}
            listaPopulada = listaFiltrada
            self.colecaoFilmes.reloadData()
        }else{
            listaPopulada = listaComTodosFilmes
            self.colecaoFilmes.reloadData()
        }
    }
}

