//
//  ViewController+obtenirImage.swift
//  Tim.Games-depart
//
//  Created by Alain on 17-10-29.
//  Copyright © 2017 Production sur support. All rights reserved.
//

import UIKit

extension ViewController {
    
    /// **********************************************
    func obtenirImageBloquante(urlStr:String) -> UIImage?{
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
    func obtenirImage(urlStr:String, completion: @escaping (UIImage?) -> ()){
        // Note: @escaping = la fonction de bloc '()->()' sera exécutée à la sortie
        // Préparer et lancer la requête
        let request = URLRequest(url: URL(string:urlStr )! /*as! URL*/)
        let session = URLSession.shared
        var uneImage:UIImage!
        
        DispatchQueue.global().async{
            
        let task = session.dataTask(with: request )
        {
            data, response, error -> Void in
            
            if (error == nil) {
                DispatchQueue.main.async{
                    if let _data = data {
                        uneImage = UIImage(data: _data)
                    } else
                    {
                        uneImage = UIImage(named: Globales.NA_IMAGE)
                    }
                    completion(uneImage)
                }   // DispatchQueue.main.async()
                
            }
        }
        task.resume()  // Reprendre le traitement de la session pour qu'elle puisse se terminer.
        } // dispatch
        
    } // obtenirImage

    
    /// **********************************************
  /*
    func obtenirImage(urlStr:String, uneimage: UIImageView){
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
*/
    
}
