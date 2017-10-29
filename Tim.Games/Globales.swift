//
//  Globales.swift
//  Tim.Games
//
//  Created by Alain on 16-10-22.
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

import Foundation
import UIKit

struct Globales {
    static let CLE_API                  = "ceciEstUltraSecret"
    static let LOADING_IMAGE            = "loading.gif"
    static let NA_IMAGE                 = "Chameleon-1.png"
    static let DUREE_PRESENTATION_INTRO = 1.0
    static let SON_OUVERTURE            = "sonOuverture"
    static let DUREE_SEGUE_INTO         = 1.2
    static let URLDonnées               = "http://prof-tim.cstj.qc.ca/cours/xcode/sources/timgames/"
} // struct Globales

class ImageViaURL {
    static func yo() {print("yo")}

    /// **********************************************
    static func obtenirImageBloquante(urlStr:String) -> UIImage?{
        let URLFichierImage = "\(Globales.URLDonnées)\(urlStr)"
        
        if let _url = URL(string: URLFichierImage) {
            do {
                let _data = try Data(contentsOf: _url, options: Data.ReadingOptions.alwaysMapped)
                return UIImage(data: _data)
            }
            catch  {
                print("Ligne \(#line), \(error), ### Exeption: Problème avec URL: \(URLFichierImage)")
            }
        } // if let _url
        return UIImage(named:Globales.NA_IMAGE)
    } // obtenirImageBloquante
    
    /// **********************************************
    static func obtenirImage(urlStr:String, uneimage: UIImageView){
        // Préparer et lancer la requête
        let request = URLRequest(url: URL(string:urlStr )! /*as! URL*/)
        let session = URLSession.shared
        
        let task = session.dataTask(with: request,
                                    completionHandler: {data, response, error -> Void in
                                        
                                        if (error == nil) {
                                            DispatchQueue.main.async ( execute:
                                                {
                                                    if let _data = data {
                                                        uneimage.image = UIImage(data: _data)
                                                    } else
                                                    {
                                                        uneimage.image = UIImage(named: Globales.NA_IMAGE)
                                                    }
                                                }
                                            )  // DispatchQueue.main.async()
                                            
                                        } else { // erreur d'URL
                                            uneimage.image = UIImage(named: Globales.NA_IMAGE)
                                        }
        })
        task.resume()  // Reprendre le traitement de la session pour qu'elle puisse se terminer.
    } // obtenirImage
    
} // class ImageViaURL 
