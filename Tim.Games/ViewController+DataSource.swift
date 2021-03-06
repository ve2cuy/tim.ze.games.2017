//
//  ViewController+DataSource.swift
//  Tim.Games-depart
//
//  Created by Alain on 17-10-29.
//  Copyright © 2017 Production sur support. All rights reserved.
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
//  -------------------------------------------------------------
//
//  ===> NOTE AUX ÉTUDIANTS ET ÉTUDIANTES DE PRODUCTION MULTIMEDIA SUR SUPPORT <=======
//
//          IL EST INTERDIT D'UTILISER LE GABARIT DE CE PROJET LORS DE LA RÉALISATION
//          DE VOTRE PROJET DE SESSION.  IL EST FOURNI À TITRE PÉDAGOGIQUE UNIQUEMENT.

import UIKit
import SDWebImage

extension ViewController: UICollectionViewDataSource {
    // MARK:- Méthodes de UICollectionViewDataSource
    // =========================================================================
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO:  4 - Retourner le nombre d'items reçus suite à la requête de l'API
        guard let nbItems = donnéesAPITim?.resultats.count else { return 1  }
        return nbItems
    } // numberOfItemsInSection
    
    // =========================================================================
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellule = collectionView.dequeueReusableCell(withReuseIdentifier: "modeleCellule1", for: indexPath) as! CollectionViewCellPerso1
        let indice = indexPath.row
        cellule.contentView.tag = indice  // À utiliser dans le prepare for segue
        
        // TODO: 5 - Préparer les données de la cellule courante: titre, image, ...
        let nomJeu = donnéesAPITim?.resultats[indice].titre ?? "Titre non disponible"
        let nomFichierCouverture = donnéesAPITim?.resultats[indice].pochettes.grande ?? Globales.NA_IMAGE
        let URLFichierImage = "\(Globales.URLDonnées)\(nomFichierCouverture)"
        print(URLFichierImage)

        cellule.pochetteTitre.text = nomJeu
        
        // ****************************
        // Exemple d'utilisation de SDWebImage
        // https://github.com/rs/SDWebImage
        cellule.pochetteImage.sd_setImage(with: URL(string: URLFichierImage), placeholderImage: UIImage(named: Globales.LOADING_IMAGE))
        
        // Renseigner la couleur de l'entête indexPath.row modulo 2
        let couleur1 = UIColor.init(red: 140 / 255.0, green: 188 / 255.0, blue: 220 / 255.0, alpha: 1)
        let couleur2 = UIColor.init(red: 108 / 255.0, green: 145 / 255.0, blue: 168 / 255.0, alpha: 1)
        let couleur = indice % 2 == 0 ? couleur1 : couleur2
        cellule.entete.backgroundColor = couleur
        
        return cellule
    } // collectionView: cellForItemAt

    
}
