//
//  DetalhesViewController.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/7/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController{

    

   
    @IBOutlet weak var buttonVoltar: UIButton!
    var listaDetalhesFilme: Filmes? = nil
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var DetalhesFilmeImage: UIImageView!
    @IBOutlet weak var labelSinopse: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelDataLanacamento: UILabel!
    @IBOutlet weak var labelClassificao: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        populaCampos()
        self.formataButton()
        NotificationCenter.default.addObserver(self, selector: #selector (aumentaScroll(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    
    @objc func aumentaScroll(notification: Notification){
        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width, height: self.scrollView.frame.height + 450)
    }
    
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
    
    func heightForView(text:String, font:UIFont, width:CGFloat) {
       let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        //labelSinopse.heightAnchor(label.frame.height)
    }

    
    @IBOutlet var Collction: [UIView]!
    func populaCampos (){
        if let lista = listaDetalhesFilme{
            
            guard let titulo = lista.title else {return}
            self.labelTitulo.text = titulo

            guard let sinopse = lista.overview else {return}
            
            
            self.labelSinopse.text = sinopse
            
            self.formatLabelAdult(listaFilmes: lista)
         
            guard let votos = lista.voteCount else {return}
            
            guard let mediavotos = lista.voteAverage else {return}
            
            guard let data = lista.release_date else {return}
            let dataFormatada = self.formatData(data)
            labelDataLanacamento.text = dataFormatada
            
            guard let imagem = lista.backdropPath else {return}
            let urlImagem = "https://image.tmdb.org/t/p/original\(imagem)"
            guard let imageUrl = URL(string: urlImagem) else {return}
            self.DetalhesFilmeImage.af_setImage(withURL: imageUrl)
        }
         
    }

    func formataButton (){
        self.buttonVoltar.layer.cornerRadius = self.buttonVoltar.frame.width / 4
        self.buttonVoltar.layer.borderWidth = 1
        self.buttonVoltar.layer.borderColor = UIColor.lightGray.cgColor
        
        self.buttonVoltar.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func buttonVoltar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
