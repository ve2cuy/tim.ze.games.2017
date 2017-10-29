//
//  ViewController+PrepareSegue.swift
//  Tim.Games-depart
//
//  Created by Alain on 17-10-29.
//  Copyright © 2017 Production sur support. All rights reserved.
//

import UIKit

extension ViewController {
    
    // MARK:- Préparer les données pour le segue vers la scène Détails:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Passer l'item courant à la scène détails
        let indice = (sender as! UICollectionViewCell).contentView.tag
        
        let destination = segue.destination as! ViewControllerDetails
        destination.detailsItemCourant = donnéesAPITim?.resultats[indice]
        
    } // prepare(for segue:
    
}
