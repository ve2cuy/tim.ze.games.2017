//
//  APITim.swift
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

import Foundation

// ==============================================
class APITim: Codable {
    
    var information:Info
    var resultats:Array<Resultat>
    
    // Redéfinition des clés
    enum CodingKeys : String, CodingKey {
        case information = "info"
        case resultats
    } // Redéfinition des clés
    
} // APITim

// ==============================================
struct Info: Codable {
    var auteur:String
    var cléAPI:String
    var droit_auteur:String
    
    // Redéfinition des clés
    enum CodingKeys : String, CodingKey {
        case auteur = "Auteur_API"
        case cléAPI = "apikey"
        case droit_auteur
    } // Redéfinition des clés

} // info

// ==============================================
struct Resultat:Codable {
    var titre:String
    var annee:Int
    var pochettes:Pochettes
    var like_facebook:Int
    var like_twitter:Int
} // Resultat

// ==============================================
struct Pochettes:Codable {
    var petite:String?
    var grande:String?
    var couverture:String?
} // Pochette


