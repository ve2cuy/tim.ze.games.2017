<?php
    /*
     Projet:   TIMGames
     Fichier:  api.timgames.php
     Auteur:   Alain Boudreault
     Date:     2016.10.01
     ------------------------------------------------------------------------------
     Description:
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
     ------------------------------------------------------------------------------
     M-A-J:
     
     2016.10.10 - A.B Ajout de la liste des suiveux
     
     ------------------------------------------------------------------------------
     */
    
    // Les Constantes de l'app
    $nbAvatars          = 44;
    $nbPochettes        = 50;
    $anneeMin           = 1980;
    $anneeMax           = 2018;
    $rangSemaineMin     = 1;
    $rangSemaineMax     = 100;
    $socialLikeMin      = 0;
    $socialLikeMax      = 10000;
    $noteCritiquesMin   = 1;
    $noteCritiquesMax   = 5;
    $nbPochettes        = 40;
    
    
    //******************************************************************************
    function generateRandomString($length = 10) {
        //******************************************************************************
        $characters = ' abcdefghijklmnopqrstuvwxyz';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return ucfirst($randomString);  // Transformer le premier car en majuscule.
    } // function generateRandomString()
    
    //******************************************************************************
    function suiveux() {
        //******************************************************************************
        $resultat   = array();
        $proverbe   = array("Quand tout va bien on peut compter sur les autres, quand tout va mal on ne peut compter que sur sa famille.",
                            "Il vaut mieux se disputer avec quelqu'un d'intelligent que parler à un imbécile.",
                            "Mieux vaut vivre un jour comme un lion que cent ans comme un mouton.",
                            "On ne peut pas peindre du blanc sur du blanc, du noir sur du noir. Chacun a besoin de l'autre pour se révéler.",
                            "Si vous voulez savoir la vérité, écoutez les fous.",
                            "Si l'on vient vous dire qu'une montagne a changé de place, permis à vous de le croire ; mais si l'on vous dit qu'un homme a changé de caractère, n'en croyez rien.",
                            "Les larmes qui coulent sont amères mais plus amères encore sont celles qui ne coulent pas.",
                            "La patience est un arbre dont la racine est amère, et dont les fruits sont très doux.",
                            "Quand on suit quelqu'un de bon, on apprend à devenir bon ; quand on suit un tigre, on apprend à mordre.",
                            "J'étais furieux de n'avoir pas de souliers ; alors j'ai rencontré un homme qui n'avait pas de pieds, et je me suis trouvé content de mon sort.",
                            "Celui qui croit qu'il peut se passer des autres se trompe, et celui qui croit que les autres ne peuvent pas se passer de lui se trompe encore plus."
                            );
        
        for ($i = 0; $i < mt_rand(0,12); $i++) {
            $unProverbe = $proverbe[mt_rand(0,count($proverbe) - 1)];
            $unNombre   = mt_rand(1, $GLOBALS['nbAvatars']);
            $resultat[] = array("nom" => generateRandomString(mt_rand(5,10)),
                                "avatar" => "avatar-$unNombre.png", "description" => $unProverbe);
        }
        return $resultat;
    } // function suiveux()
    
    if ($_GET["apikey"] != "ceciEstUltraSecret") {
        $resultat = array("erreur"   => "Erreur de la requête, clé invalide",
                          "api_key"  => $_GET["apikey"],
                          "usage"    => "Usage: http://.../?apikey=ceciEstUltraSecret&q=\(chaine)&format=json&quant=\(quant)"
                          );
        echo json_encode($resultat, JSON_PRETTY_PRINT);
        exit;
    }
    
    // En format json
    if ($_GET["format"] == "json") {
        // tableau du résultat final
        $nbResultats  =  isset($_GET["quant"]) ? $_GET["quant"] : 50;
        $query        =  isset($_GET["q"]) ? $_GET["q"] : "";
        $description  = "Il fit de la sorte un assez long chemin, regardant, appelant, criant, mais il ne rencontra plus personne. Deux ou trois fois il courut dans la plaine vers quelque chose qui lui faisait l’effet d’un être couché ou accroupi ; ce n’étaient que des broussailles ou des roches à fleur de terre. Enfin, à un endroit où trois sentiers se croisaient, il s’arrêta. La lune s’était levée. Il promena sa vue au loin et appela une dernière fois : « Petit-Gervais ! Petit-Gervais ! Petit-Gervais ! » Son cri s’éteignit dans la brume, sans même éveiller un écho. Il murmura encore : « Petit-Gervais ! » mais d’une voix faible et presque inarticulée. Ce fut là son dernier effort ; ses jarrets fléchirent brusquement sous lui comme si une puissance invisible l’accablait tout à coup du poids de sa mauvaise conscience ; il tomba épuisé sur une grosse pierre, les poings dans ses cheveux et le visage dans ses genoux, et il cria : « Je suis un misérable ! »";
        //$description = generateRandomString(mt_rand(10,20));
        $resultat = array();
        $resultat['info'] = array("api.TIMGames"    => "version 2016.10.01",
                                  "Auteur_API"      => "Alain Boudreault, AKA Puyansude, AKA ve2cuy",
                                  "type_requete"    => "json",
                                  "recherche"       => $_GET["q"],
                                  "apikey"          => $_GET["apikey"],
                                  "droit_auteur"    => "Cette API est à l'usage exclusif des étudiantes et étudiants de 'Production Multimédia sur Support' de tim.cstj.qc.ca'",
                                  "site_web"        => 'http://prof-tim.cstj.qc.ca/cours/xcode/wp/index.php/contenu/',
                                  "nombre"          => $nbResultats,
                                  "adresse_IP"      => $_SERVER['REMOTE_ADDR'],
                                  "date"            => getdate()
                                  );
        $tablo = array();
        for ($i = 0; $i < $nbResultats; $i++) {
            $indicePochette = mt_rand(1,$nbPochettes);
            $pochettes      = array("petite" => "small-".$indicePochette.".jpg", "grande" => $indicePochette.".jpg", "couverture" => "petite/p-".$indicePochette.".jpg");
            $tablo[] =  $element1 = array("titre"         => $query." the ".generateRandomString(mt_rand(10,20)),
                                          "editeur"       => "TIMGames",
                                          "annee"         => mt_rand($anneeMin, $anneeMax),
                                          "rang_semaine"  => mt_rand($rangSemaineMin,$rangSemaineMax),
                                          "pochettes"     => $pochettes,
                                          "description"   => $description,
                                          "like_facebook" => mt_rand($socialLikeMin, $socialLikeMax),
                                          "like_twitter"  => mt_rand($socialLikeMin, $socialLikeMax),
                                          "cotes"         => array("critiques" => mt_rand($noteCritiquesMin, $noteCritiquesMax), "joueurs" => mt_rand($noteCritiquesMin, $noteCritiquesMax)),
                                          "suiveux"       => suiveux()
                                          );
        }
        $resultat['resultats'] =  $tablo;
        
        echo json_encode($resultat, JSON_PRETTY_PRINT);
    } // if format == json
    
    ?>
