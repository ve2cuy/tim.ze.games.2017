//
//  ViewController+ObtenirDonnées.swift
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

import Foundation

extension ViewController {
    
    // ================================================================
    func  obtenirDonnéesVersionBloquante(unFiltre:String, données:inout APITim?) {
        // Note: inout = réception du paramètre en lecture/écriture
        print("Exécution de obtenirDonnéesVersionBloquante() avec \(unFiltre)")

        let strURL = "http://prof-tim.cstj.qc.ca/cours/xcode/sources/timgames/api.timgames.php?apikey=\(Globales.CLE_API)&q=\(unFiltre)&format=json&quant=\(tailleRequete.text!)"

        if let _data = NSData(contentsOf: URL(string: strURL)!) as Data? {
            // Note: YahooFinance veut dire "de type YahooFinance"
            données = try! JSONDecoder().decode(type(of: données), from: _data)
            #if DEBUG
                // print(données)
                if let _données = données {
                    for jeu in _données.resultats {
                        let pochette = jeu.pochettes.grande ?? "Pas de pochette"
                        print(jeu.titre, jeu.annee, pochette)
                    }
                }
            #endif
        } // if let
    } // obtenirDonnéesVersionBloquante

    
    // ================================================================
    // obtenirDonnéesVersionNonBloquante
    func  obtenirDonnées(uneURL:String, données:inout APITim? ) {
        print("Exécution de obtenirDonnéesVersionBloquante() avec \(uneURL)")
        if let _data = NSData(contentsOf: URL(string: uneURL)!) as Data? {
            // Note: YahooFinance veut dire "de type YahooFinance"
            données = try! JSONDecoder().decode(type(of: données), from: _data)
            #if DEBUG
                // print(données)
                if let _données = données {
                    for jeu in _données.resultats {
                        let pochette = jeu.pochettes.couverture ?? "Pas de pochette"
                        print(jeu.titre, jeu.annee, pochette)
                    }
                }
            #endif
        } // if let
    } // obtenirDonnéesVersionBloquante
} // extenxion
