//
//  DetailsSuiveux.swift
//  Tim.Games
//
//  Created by Alain on 16-10-21.
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

class DetailsSuiveux: UIViewController {

    // MARK: - Les propriétés de la classe
    var suiveux   = Dictionary<String, Any>()

    // MARK: - Les 'Outlets' de la classe
    @IBOutlet weak var descriptionSuiveux: UITextView!
    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    // MARK: - Les méthodes de la super classe
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: 350, height: 400)
        
        // TODO: 1 - Renseigner les éléments d'interface du suiveux: nom, image, description
        // nom.text = "Je suis \(suiveux["nom"] as! String)"

    } // viewDidLoad

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // didReceiveMemoryWarning()
    
} // class DetailsSuiveux
