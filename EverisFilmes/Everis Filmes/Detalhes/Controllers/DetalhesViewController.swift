//
//  DetalhesViewController.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/7/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController, UICollectionViewDataSource {

    

    @IBOutlet weak var buttonVoltar: UIButton!
    var filmeSelecionado: Filmes? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.arredondarButton()
    }
    
    func arredondarButton (){
        self.buttonVoltar.layer.cornerRadius = self.buttonVoltar.frame.width / 4
        self.buttonVoltar.layer.borderWidth = 1
        self.buttonVoltar.layer.borderColor = UIColor.lightGray.cgColor
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "DelathesCelula", for: indexPath) as! DetalhesFilmeCollectionViewCell
        
        return celula
    }
    
    @IBAction func buttonVoltar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
