//
//  Intro.swift
//  Tim.Games
//
//  Created by Alain on 16-10-19.
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
import AVFoundation

class Intro: UIViewController {

    @IBOutlet weak var logoTIM: UIImageView!
    @IBOutlet weak var titre1: UILabel!
    @IBOutlet weak var titre2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Plusieurs méthodes pour passer à la prochaine scène
        // Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(Intro.passerAuMenuPrincipal), userInfo: nil, repeats: false)
        // Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: {_ in Intro.passerAuMenuPrincipal()})
        //  DispatchQueue.main.asyncAfter(deadline: .now() + Globales.DUREE_PRESENTATION_INTRO) { self.passerAuMenuPrincipal() }
    
        logoTIM.alpha = 0
        titre1.alpha  = 0
        titre2.alpha  = 0
        
        jouerIntro()
        
        UIView.animate(withDuration: 3.0,
                                   delay: 0.0,
                                   options: UIViewAnimationOptions.curveEaseInOut,
                                   animations: { self.titre1.alpha = 1.0
                                                },
                                   completion: nil)

        UIView.animate(withDuration: 3.0,
                       delay: 2.9,
                       options: UIViewAnimationOptions.curveEaseInOut,
                       animations: { self.titre2.alpha = 1.0
                                     self.logoTIM.alpha = 1.0
                                    },
                       completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Globales.DUREE_PRESENTATION_INTRO) {
                self.passerAuMenuPrincipal()
            }
    } // viewDidLoad()
    
    func passerAuMenuPrincipal(){
        performSegue(withIdentifier: "scenePrincipale", sender: self)
    } // passerAuMenuPrincipal
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // didReceiveMemoryWarning
    
    var player: AVAudioPlayer?
    func jouerIntro() {
        let url = Bundle.main.url(forResource: Globales.SON_OUVERTURE, withExtension: "mp3")!
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error)
        } // do/try/catch
    } // func jouerIntro()
 
} // class Intro
