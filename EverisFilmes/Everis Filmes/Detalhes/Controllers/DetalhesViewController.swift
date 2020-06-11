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
    
    //MARK - Outlet
    @IBOutlet weak var buttonVoltar: UIButton!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var DetalhesFilmeImage: UIImageView!
    @IBOutlet weak var labelSinopse: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelDataLanacamento: UILabel!
    @IBOutlet weak var labelClassificao: UILabel!
    @IBOutlet weak var labelGenero: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populaCampos()
        self.formataButton()
    }
    
    
    @objc func aumentaScroll(notification: Notification){
        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width, height: self.scrollView.frame.height + 450)
    }
    
    //MARK - Metodos
    func formatData(_ data: String)-> String{
        let dataEntrada = data
        let dateFormatterSaida = DateFormatter()
        dateFormatterSaida.dateFormat = "yyyy-MM-dd"
        let date = dateFormatterSaida.date(from: dataEntrada)
        dateFormatterSaida.dateFormat = "dd/MM/yyyy"
        let dataSaida = dateFormatterSaida.string(from: date!)
        return dataSaida
    }
    
    func formatLabelAdult(listaFilmes: Filmes){
        if let adulto = listaFilmes.adult {
            if adulto{
                labelClassificao.text = "Adulto"
                labelClassificao.textColor = UIColor.red
            }else{
                labelClassificao.text = "Livre"
                labelClassificao.textColor = UIColor(displayP3Red: 0.0/255, green: 128.0/255, blue: 0.0/255, alpha: 1.0)
            }
        }
    }
    
    
    //Resolvi adicionar so o primeiro genero que retorna na lista pois iria ficar muito poluida a tela
    func formataLabelGenero(_ lista: Filmes)-> String{
        guard let idsGenero = lista.genreIDS else {return ""}
        guard let id = idsGenero.first else {return ""}
        for lista in listaGeneros{
            if id == lista.id{
                guard let genero = lista.name else {return ""}
                return genero
            }
        }
        return ""
    }
    
    
    @IBOutlet var Collction: [UIView]!
    func populaCampos (){
        if let lista = listaDetalhesFilme{
            
            guard let titulo = lista.title else {return}
            self.labelTitulo.text = titulo

            guard let sinopse = lista.overview else {return}
            self.labelSinopse.text = sinopse

            self.formatLabelAdult(listaFilmes: lista)

            guard let data = lista.release_date else {return}
            let dataFormatada = self.formatData(data)
            labelDataLanacamento.text = dataFormatada

            guard let imagem = lista.backdropPath else {return}
            let urlImagem = "https://image.tmdb.org/t/p/original\(imagem)"
            guard let imageUrl = URL(string: urlImagem) else {return}
            self.DetalhesFilmeImage.af_setImage(withURL: imageUrl)

            labelGenero.text = formataLabelGenero(lista)
        }
         
    }

    func formataButton (){
//        self.buttonVoltar.layer.cornerRadius = self.buttonVoltar.frame.width / 4
//        self.buttonVoltar.layer.borderWidth = 1
        self.buttonVoltar.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func buttonVoltar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
