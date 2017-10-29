//
//  ViewController.swift
//  Tim.Games
//
//  Created by Alain on 16-09-27.
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
//  -------------------------------------------------------------
//
//  ===> NOTE AUX ÉTUDIANTS ET ÉTUDIANTES DE PRODUCTION MULTIMEDIA SUR SUPPORT <=======
//
//          IL EST INTERDIT D'UTILISER LE GABARIT DE CE PROJET LORS DE LA RÉALISATION
//          DE VOTRE PROJET DE SESSION.  IL EST FOURNI À TITRE PÉDAGOGIQUE UNIQUEMENT.
//  ============================================================================================


import UIKit

/// =====================================================================
class ViewController: UIViewController {

    /// =====================================================================
    // MARK: - Les 'Outlets' de la classe
    @IBOutlet weak var tailleRequete: UILabel!
    @IBOutlet weak var progression: UIActivityIndicatorView!
    @IBOutlet weak var collectionDesItems: UICollectionView!

    /// =====================================================================
    // MARK: - Les 'IBActions' de la classe
    @IBAction func modifierTailleRequete(_ sender: UIStepper) {
        tailleRequete.text = String(format:"%2.0f", sender.value)
    } // modifierTailleRequete
    
    /// =====================================================================
    // MARK: - Les propriétés de la classe
    var donnéesAPITim: APITim?

    // MARK: - Méthodes de la super classe
    /// =====================================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: 1 - Obtenir les données initiales de l'API web
        /// obtenirDonnées("")
        obtenirDonnéesVersionBloquante(unFiltre:"rts", données: &donnéesAPITim)  // & = passer l'adresse de l'Objet
    } // viewDidLoad()

    /// =====================================================================
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // didReceiveMemoryWarning()
    
    // MARK:- Préparer les données pour le segue vers la scène Détails:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Passer l'item courant à la scène détails
    } // prepare(for segue:
   
} // ViewController

