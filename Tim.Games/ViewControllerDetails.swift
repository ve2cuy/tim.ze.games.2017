//
//  ViewControllerDetails.swift
//  Tim.Games
//
//  Created by Alain on 16-09-28.
//  Copyright © 2016 Production sur support. All rights reserved.
//
//  ============================================================================================
//  À l'usage exclusif des étudiants et étudiantes de
//  Techniques d'Intégration Multimédia
//  du cégep de Saint-Jérôme.
//  --------------------------------------------------------------------------------------------
//  Il est interdit de reproduire, en tout ou en partie, à des fins commerciales,
//  le code source, les scènes, les éléments graphiques, les classes et
//  tout autre contenu du présent projet sans l’autorisation écrite de l'auteur.
//
//  Pour obtenir l’autorisation de reproduire ou d’utiliser, en tout ou en partie,
//  le présent projet, veuillez communiquer avec:
//
//  Alain Boudreault, aboudrea@cstj.qc.ca, ve2cuy.wordpress.com
//
//  ============================================================================================
//  Version de départ - disponible à https://bitbucket.org/alain_boudreault/tim.ze.games-depart
//
//  ===> NOTE AUX ÉTUDIANTS ET ÉTUDIANTES DE PRODUCTION MULTIMEDIA SUR SUPPORT <=======
//
//          IL EST INTERDIT D'UTILISER LE GABARIT DE CE PROJET LORS DE LA RÉALISATION
//          DE VOTRE PROJET DE SESSION.  IL EST FOURNI À TITRE PÉDAGOGIQUE UNIQUEMENT.

import UIKit

class ViewControllerDetails: UIViewController, UICollectionViewDataSource {
 
    // MARK: - Les propriétés de la classe
    var detailsItemCourant:Dictionary<String, Any>?  // TODO
    
    private var _listeDesSuivieux = Array<Dictionary<String, String>>() // TODO

    // MARK: - Les 'Outlets' de la classe
    @IBOutlet weak var pochetteNom: UILabel!
    @IBOutlet weak var pochetteGrosse: UIImageView!
    @IBOutlet weak var pochettePetite: UIImageView!
    @IBOutlet weak var evaluationExperts: UIImageView!
    @IBOutlet weak var evaluationJoueurs: UIImageView!
    @IBOutlet weak var pochetteDescription: UITextView!
    @IBOutlet weak var collectionDeSuiveux: UICollectionView!

    // MARK: - Les 'IBActions' de la classe
    @IBAction func retournerALaScenePrincipale(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Les méthodes de la super classe
    override func viewDidLoad() {
        super.viewDidLoad()
        if let _detailsItemCourant = detailsItemCourant {
            print(_detailsItemCourant)
            
            // TODO: 1 - Renseigner le tableau _listeDesSuivieux à partir des données reçues et afficher.
            // TODO: 2 - Renseigner les éléments d'interface: titre, pochettes, suiveux, ...
        } // if let _detailsItemCourant
    } // viewDidLoad()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Gestion des suiveux
    // MARK: Méthodes de UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _listeDesSuivieux.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cellule = collectionView.dequeueReusableCell(withReuseIdentifier: "modeleAvatar", for: indexPath) as! CelluleAvatar
        // TODO: 3 - Renseigner les éléments d'interface du suiveux

        return cellule
    } // cellForItemAt
    
    // MARK: - Préparer le segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: 4 - Passer les informations du suiveux sélectionné à la scène de détailsSuiveux
    
    } // prepare(for segue)
    
 } // ViewControllerDetails
