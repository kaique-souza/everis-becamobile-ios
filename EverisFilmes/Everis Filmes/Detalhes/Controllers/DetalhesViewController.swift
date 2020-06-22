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
//    var listaGeneros: Array<Genre_ids> = [] ------ Lista da API de generos que estava consultando antes
//    var listaDetalhesFilme: Filmes? = nil  ---------  lista da pagina principal que eu estava usando antes
    
    var DetalheDoFilme: DetalhesFilmes?
    var idDetalheFilme: Int = 0
    
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
        ConsultaDetalhesAPI().consultaApiDetalhesFilmes(idDetalheFilme) { (Detalhe) in
            self.setDetalheFilme(Detalhe)
            self.populaCampos()
        }
        self.formataButton()
    }
    
    //MARK- Metodos
    func setDetalheFilme(_ detalheFilme: DetalhesFilmes){
        DetalheDoFilme =  detalheFilme
    }
    
    @IBOutlet var Collction: [UIView]!
    func populaCampos (){
        if let Detalhe = DetalheDoFilme{
            
            guard let titulo = Detalhe.title else {return}
            self.labelTitulo.text = titulo

            guard let sinopse = Detalhe.overview else {return}
            self.labelSinopse.text = sinopse
            labelSinopse.numberOfLines = 0
            labelSinopse.sizeToFit()
           
            labelClassificao = DetalhesViewModel().formatLabelAdult(Detalhe, labelAdult: labelClassificao!)

            guard let data = Detalhe.releaseDate else {return}
            let dataFormatada = DetalhesViewModel().formatData(data)
            labelDataLanacamento.text = dataFormatada

            guard let imagem = Detalhe.backdropPath else {return}
            
            let urlImagem = "https://image.tmdb.org/t/p/original\(imagem)"
            guard let imageUrl = URL(string: urlImagem) else {return}
            self.DetalhesFilmeImage.af_setImage(withURL: imageUrl)
            
            labelGenero.text = DetalhesViewModel().formataLabelGenero(Detalhe)
            
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
