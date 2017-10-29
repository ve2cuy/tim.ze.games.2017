//
//  ViewController+TextFieldDelegate.swift
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

extension ViewController: UITextFieldDelegate {
    
    // MARK: - Méthodes de UITextFieldDelegate
    // *************************************************************************************************
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // print("textFieldDidBeginEditing")
        progression.startAnimating()
    }  // textFieldDidBeginEditing
    
    
    // *************************************************************************************************
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // print("textFieldShouldReturn")
        
        /* *********************************
         À compléter ....
         ********************************* */
        // TODO: Convertir la chaine en format 'escaped' pour le web. Par exemple, ' '= %20
        let escapedText = textField.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics)!
        
        print("escapedText = \(escapedText)")
        
        // TODO: Relancer la requete vers l'API
        obtenirDonnéesVersionBloquante(unFiltre: escapedText, données: &donnéesAPITim)
        collectionDesItems.reloadData()
        //----------------------------------
        textField.resignFirstResponder()
        progression.stopAnimating()
        
        return true
    } // textFieldShouldReturn
    
} // extension ViewController: UITextFieldDelegate
