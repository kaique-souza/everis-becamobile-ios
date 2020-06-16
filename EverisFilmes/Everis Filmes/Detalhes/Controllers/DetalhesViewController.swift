//
//  DetalhesViewController.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/7/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController{

    //MARK - Atributos
    var listaGeneros: Array<Genre_ids> = []
    var listaDetalhesFilme: Filmes? = nil
    let url = "https://image.tmdb.org/t/p/original"
    
    //MARK - Outlets
    @IBOutlet weak var buttonVoltar: UIButton!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var DetalhesFilmeImage: UIImageView!
    @IBOutlet weak var labelSinopse: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelDataLanacamento: UILabel!
    @IBOutlet weak var labelClassificao: UILabel!
    @IBOutlet weak var labelGenero: UILabel!
    @IBOutlet weak var LabelDetalhes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populaCampos()
        self.formataButton()
    }
    
    //MARK- Metodos
    @IBOutlet var Collction: [UIView]!
    func populaCampos (){
        if let lista = listaDetalhesFilme{
            
            guard let titulo = lista.title else {return}
            self.labelTitulo.text = titulo

            guard let sinopse = lista.overview else {return}
            self.labelSinopse.text = sinopse

            labelClassificao = DetalhesViewModel().formatLabelAdult(listaFilmes: lista, labelAdult: labelClassificao!)

            guard let data = lista.release_date else {return}
            let dataFormatada = DetalhesViewModel().formatData(data)
            labelDataLanacamento.text = dataFormatada

            guard let imagem = lista.backdropPath else {return}
            
            let urlImagem = "\(url)\(imagem)"
            guard let imageUrl = URL(string: urlImagem) else {return}
            self.DetalhesFilmeImage.af_setImage(withURL: imageUrl)

            labelGenero.text = DetalhesViewModel().formataLabelGenero(lista, listaGeneros: listaGeneros)
            
            self.format()
        }
    }

    func formataButton (){
        self.buttonVoltar.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func buttonVoltar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension DetalhesViewController{
    func format (){
        buttonVoltar.accessibilityHint = "Voltar para lista de filmes"
        LabelDetalhes.accessibilityHint = "Cabeçalho detalhes"
        LabelDetalhes.accessibilityTraits = .header
        
        guard let titulo = labelTitulo.text else {return}
        labelTitulo.accessibilityLabel = "Titulo: \(titulo)"
        
        guard let Textosinope = labelSinopse.text else {return}
        labelSinopse.accessibilityLabel =  "Sinopse: \(Textosinope))"
        
    }
}
