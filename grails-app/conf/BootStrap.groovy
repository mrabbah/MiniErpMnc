import cr.co.arquetipos.crypto.Blowfish
import com.rabbahsoft.securite.*
import com.rabbahsoft.mnc.*


class BootStrap {
    //def searchableService

    def init = { servletContext ->
        environments {
            development {
                //searchableService.stopMirroring()
                //                def d1 = new Droit(code : 'DROIT1').save(failOnError: true)
                //                def d2 = new Droit(code : 'COMITE THEMATIQUE 1').save(failOnError: true)
                //                def d3 = new Droit(code : 'COMITE THEMATIQUE 2').save(failOnError: true)
                //                def d4 = new Droit(code : 'COMEX').save(failOnError: true)
                //                def d5 = new Droit(code : 'PORTEUR PROJET').save(failOnError: true)
                //                def d6 = new Droit(code : 'EXPERT').save(failOnError: true)

                // Utilisateur
                def  du1= new Droit(code : 'AJOUTER_UTILISATEUR').save(failOnError: true)
                def  du2= new Droit(code : 'MODIFIER_UTILISATEUR').save(failOnError: true)
                def  du3= new Droit(code : 'SUPPRIMER_UTILISATEUR').save(failOnError: true)
                def  du4= new Droit(code : 'VISUALISER_UTILISATEUR').save(failOnError: true)
                def  du5= new Droit(code : 'LISTE_UTILISATEUR').save(failOnError: true)
                def  du6= new Droit(code : 'AFFECTER_SOCIETE_UTILISATEUR').save(failOnError: true)
                
                def  ds1= new Droit(code : 'AJOUTER_SOCIETE').save(failOnError: true)
                def  ds2= new Droit(code : 'MODIFIER_SOCIETE').save(failOnError: true)
                def  ds3= new Droit(code : 'SUPPRIMER_SOCIETE').save(failOnError: true)
                def  ds4= new Droit(code : 'VISUALISER_SOCIETE').save(failOnError: true)
                def  ds5= new Droit(code : 'LISTE_SOCIETE').save(failOnError: true)
                
                def  p1= new Droit(code : 'AJOUTER_PROFIL').save(failOnError: true)
                def  p2= new Droit(code : 'MODIFIER_PROFIL').save(failOnError: true)
                def  p3= new Droit(code : 'SUPPRIMER_PROFIL').save(failOnError: true)
                def  p4= new Droit(code : 'VISUALISER_PROFIL').save(failOnError: true)
                def  p5= new Droit(code : 'LISTE_PROFIL').save(failOnError: true)
                
                def  t1= new Droit(code : 'AJOUTER_TACHE').save(failOnError: true)
                def  t2= new Droit(code : 'MODIFIER_TACHE').save(failOnError: true)
                def  t3= new Droit(code : 'SUPPRIMER_TACHE').save(failOnError: true)
                def  t4= new Droit(code : 'VISUALISER_TACHE').save(failOnError: true)
                def  t5= new Droit(code : 'LISTE_TACHE').save(failOnError: true)
                def  t6= new Droit(code : 'AFFECTER_TACHE').save(failOnError: true)
                def  t7= new Droit(code : 'CLOTUREE_TACHE').save(failOnError: true)
                def  t8= new Droit(code : 'ENCOURS_TACHE').save(failOnError: true)
                
                def  f1= new Droit(code : 'AJOUTER_FORMATION',description:'AJOUTER_FORMATION').save(failOnError: true)
                def  f2= new Droit(code : 'MODIFIER_FORMATION',description:'MODIFIER_FORMATION').save(failOnError: true)
                def  f3= new Droit(code : 'AFFICHER_FORMATION',description:'AFFICHER_FORMATION').save(failOnError: true)
                def  f4= new Droit(code : 'AFFECTERCOMITETHEMATIQUE_FORMATION',description:'AFFECTERCOMITETHEMATIQUE_FORMATION').save(failOnError: true)
                
                def profilBp = new Profil(code : 'BP', description : 'BUREAU PERMANENT')
                .addToDroits(p1)
                .addToDroits(p2)
                .addToDroits(p3)
                .addToDroits(p4)
                .addToDroits(p5)
                .addToDroits(du1)
                .addToDroits(du2)
                .addToDroits(du3)
                .addToDroits(du4)
                .addToDroits(du5)
                .addToDroits(du6)
                .save(failOnError: true)
                
                def porteur = new Profil(code : 'porteur', description : 'Porteur du projet')
                .save(failOnError: true)
                
                def profilCt1 = new Profil(code : 'CT1', description : 'COMITE THEMATIQUE 1')
                .save(failOnError: true)
                
                def profilCt2 =new Profil(code : 'CT2', description : 'COMITE THEMATIQUE 2')
                .save(failOnError: true)
                
                def profilComex = new Profil(code : 'COMEX', description : 'COMEX')
                .save(failOnError: true)
                
                def profilCa = new Profil(code : 'CA', description : 'Conseil d\'administration')
                .save(failOnError: true)
                
                def profilExpert = new Profil(code : 'EXPERT', description : 'EXPERT')
                .save(failOnError: true)
                
                
                def ct1 = new ComiteThematique(code : 'Comité thématique 1', description : 'Comité thématique 1',president:null)
                .save(failOnError: true)
                
                def ct2 = new ComiteThematique(code : 'Comité thématique 2', description : 'Comité thématique 2',president:null)
                .save(failOnError: true)
                
                def ct3 = new ComiteThematique(code : 'Comité thématique 3', description : 'Comité thématique 3',president:null)
                .save(failOnError: true)
                
                def ct4 = new ComiteThematique(code : 'Comité thématique 4', description : 'Comité thématique 4',president:null)
                .save(failOnError: true)
                
                def admin = new Utilisateur(nom : 'RABBAH', prenom : 'Mahmoud'
                    , email : 'mrabbah@gmail.com', login : 'admin'
                    , password : Blowfish.encryptBase64("admin", "#1Ab_.com")
                    , gsm : '06 68 85 89 05', active : true, profil : profilBp)
                //.addToComitesThematiques(ct1)
                .save(failOnError: true)
                def membre1ct1 = new Utilisateur(nom : 'Hamdi', prenom : 'Ouchayan'
                    , email : 'hamid@gmail.com', login : 'm1ct1'
                    , password : Blowfish.encryptBase64("m1ct1", "#1Ab_.com")
                    , gsm : '05 22 88 77 99', active : true, profil : profilCt1)
                .addToComitesThematiques(ct2)
                .save(failOnError: true)
                new Utilisateur(nom : 'RABIA', prenom : 'ELAZIZ'
                    , email : 'rabia@dodo.cm', login : 'm2ct1'
                    , password : Blowfish.encryptBase64("m2ct1", "#1Ab_.com")
                    , gsm : '06 66 95 97 91', active : true, profil : profilCt1).save(failOnError: true)
                new Utilisateur(nom : 'KAMAL', prenom : 'ABERTOUN'
                    , email : 'abertoun@dodo.cm', login : 'm1ct2'
                    , password : Blowfish.encryptBase64("m1ct2", "#1Ab_.com")
                    , gsm : '05 22 22 22 22', active : true, profil : profilCt2)
                .addToComitesThematiques(ct3)
                .save(failOnError: true)
                new Utilisateur(nom : 'Président', prenom : 'ALAA'
                    , email : 'president@dodo.cm', login : 'presidentct1'
                    , password : Blowfish.encryptBase64("presidentct1", "#1Ab_.com")
                    , gsm : '05 22 22 22 22', active : true, profil : profilCt1)
                .addToComitesThematiques(ct4)
                .save(failOnError: true)
                new Utilisateur(nom : 'JAWAD', prenom : 'ZOUGAR'
                    , email : 'jawad@dodo.cm', login : 'comex'
                    , password : Blowfish.encryptBase64("comex", "#1Ab_.com")
                    , gsm : '05 22 22 22 22', active : true, profil : profilComex)
                .addToComitesThematiques(ct1)
                .save(failOnError: true)
                new Utilisateur(nom : 'KHADIJA', prenom : 'BENHAIM'
                    , email : 'benhaima@dodo.cm', login : 'expert'
                    , password : Blowfish.encryptBase64("expert", "#1Ab_.com")
                    , gsm : '05 22 22 22 22', active : true, profil : profilExpert)
                .addToComitesThematiques(ct4)
                .save(failOnError: true)
                new Utilisateur(nom : 'toto', prenom : 'toto'
                    , email : 'yacine@dodo.cm', login : 'porteur'
                    , password : Blowfish.encryptBase64("123456", "#1Ab_.com")
                    , gsm : '05 22 22 22 22', active : true, profil : porteur)
                .addToComitesThematiques(ct4)
                .save(failOnError: true)
                new Utilisateur(nom : 'Ahmed', prenom : 'Kebbaj'
                    , email : 'ca@gmail.com', login : 'ca'
                    , password : Blowfish.encryptBase64("ca", "#1Ab_.com")
                    , gsm : '05 22 22 22 22', active : true, profil : profilCa)
                .addToComitesThematiques(ct1)
                .save(failOnError: true)
                
                new Cluster(code : 'MNC', description : 'MAROC NUMERIC CLUSTER').save(failOnError: true)
                

                
                new MailTemplate(code:"1_RECEVABILITE_KO",description:"LABELLISATION MNC - Projet non labellisable",template:"Bonjour, Nous sommes au regret de vous annoncer qu'au vu des éléments de votre projet, ce dernier ne pourra pas être examiné pour l'obtention du label MNC.").save(failOnError: true)
                
                new MailTemplate(code:"1_RECEVABILITE_OK",description:"LABELLISATION MNC - Présentation à l'équipe permamente",template:"Bonjour, Nous avons le plaisir de vous annoncer que nous avons bien reçu votre projet, et serions heureux de vous rencontrer le XXXX à XXh pour nous le présenter . Adresse : Technopark Casablanca (bureau #256)").save(failOnError: true)
                
                new MailTemplate(code:"2_PITCHCT_PRESELECTION",description:"LABELLISATION MNC - RDV pour Pitch à la commission thématique",template:"Bonjour, Nous avons le plaisir de vous annoncer que votre projet à été pré-sélectionné par l'équipe permanente suite à notre dernière rencontre. Aussi, pour poursuivre le processus de labellisation, vous êtes cordialement convié pour Picher devant la commission thématique le XXXX a XXXh").save(failOnError: true)
                
                new MailTemplate(code:"2_PITCHCT_REDIRECTION",description:"LABELLISATION MNC - Orientation vers un partenaire",template:"Bonjour, Suite à l'examen de votre projet par l'équipe permanente MNC, il s'avère qu'il vous sera plus profitable de prendre attache avec XXX qui vous offira un accompagnement plus adapté à vos besoins.").save(failOnError: true)
                
                new MailTemplate(code:"2_PITCHCT_REJET",description:"LABELLISATION MNC - Rejet du projet par la commission thématique",template:"Bonjour, Nous sommes au regret de vous annoncer que la commission permanente s'est prononcée négativement sur la labellisation de votre projet suite au Pitch que vos avez présenté.").save(failOnError: true)
                
                new MailTemplate(code:"3_AR_DOSSIER_DE_LABELLISATION",description:"LABELLISATION MNC - Accusé de réception du dossier de labellisation",template:"Bonjour, Nous vous informons que suite au Pitch devant la commission thématique, le dossier de labellisation du projet XXXX à été soumis pour évaluation le XXXX.").save(failOnError: true)
                
                new MailTemplate(code:"4_EVAL_CT_KO",description:"LABELLISATION MNC - Projet non retenu par le CT",template:"Bonjour, Nous sommes au regret de vous informer que suite à l'examen du dossier de labellisation par le jury MNC, la commission s'est prononcée négativement quant à la labellisation de votre projet. Parmi les remarques soulevées figurent les raisons suivantes : - XXXX - XXXX - XXXX").save(failOnError: true)
                
                new MailTemplate(code:"4_EVALCT_OK",description:"LABELLISATION MNC - RDV avec le COMEX MNC pour labellisation de votre projet",template:"Bonjour, Suite à l'examen de votre dossier de labellisation par le jury de la commission MNC, nous avons l'honneur de vous convier à la présentation finale de votre projet au COMEX. lieu : XXX date : XXX heure : XXXX").save(failOnError: true)
                
                new MailTemplate(code:"5_COMEX_REJET",description:"LABELLISATION MNC - Projet non retenu par le COMEX",template:"Bonjour, Nous sommes au regret de vous informer que suite au Pitch de votre projet devant le COMEX MNC, ce dernier s'est prononcé négativement quant à la labellisation de votre projet.").save(failOnError: true)
                
                new MailTemplate(code:"5_COMEX_OK",description:"FELICITATIONS ! votre projet a obtenu le label MNC",template:"Bonjour, Nous sommes heureux de vous informer que suite au Pitch de votre projet devant le COMEX MNC, ce dernier s'est prononcé positivement quant à la labellisation de votre projet. PS: votre attestation en PJ XXXX").save(failOnError: true)
                
                new MailTemplate(code:"2-mailAccepterReglesConfidentialite(porteur+evaluateur)",description:"affirmation de la recevabilité du projet nomprojet et notification de la date audition :dateaudition pour Lieu:lieu",template:"veuiilez telecharger la lettre de confidentialité signer et l'apporter au moment du PitchCT pour la date dateaudition à lieu").save(failOnError: true)
                new MailTemplate(code:"mailReglesConfidentialite",description:"toto 6",template:"mailReglesConfidentialite template").save(failOnError: true)
                
                
                
                
                new MailTemplate(code:"2-mailAccepterReglesConfidentialite(porteur+CT)",description:"affirmation de la recevabilité du projet nomprojet et notification de la date audition :dateaudition pour Lieu:lieu",template:"veuiilez telecharger la lettre de confidentialité signer et l'apporter au moment du PitchCT pour la date dateaudition à lieu").save(failOnError: true)
                
                
                new MailTemplate(code:"5-mailAccepterReglesConfidentialite(porteur+CT)",description:"assignement et verification des informations concernant le projet:nomprojet et notification de la date audition:dateaudition pour Lieu:lieu",template:"vous etes assigner au nom projet veuillez  verifier ces informations").save(failOnError: true)
                new MailTemplate(code:"3-acceptation+fichepresentation",description:"acceptation et envoi de fiche presentation du projet:nomprojet",template:"le porteur viens d\'accepter et vous envoi la fiche presentation comme piece jointe concernant le projet:nomprojet").save(failOnError: true)
                new MailTemplate(code:"3-projet preselectionne",description:"preselection du projet :nomprojet",template:" le projet:nomprojet a été preselectionne veuillez envoyer la fiche technique et la fiche detaille").save(failOnError: true)
                new MailTemplate(code:"fichetechnique+fichedetaille",description:"remplissage fichetechnique+fichedetaille",template:"envoi du fichetechnique+fichedetaille du projet:nomprojet").save(failOnError: true)
                new MailTemplate(code:"8-validation etape Decision Commex",description:"decision commex:avis favorable",template:"Felication votre projet nomprojet viens d'etre labeliser par le committe executif de la part de MNC").save(failOnError: true)
                new MailTemplate(code:"1-validation etape info projet",description:"validation etape info projet",template:"<b>le porteur viens de valider la partie info projet:  nomprojet</b>").save(failOnError: true)
                
                new Mailresult(code:"rempissage info projet porteur",description:"remplissage info projet porteur",template:"<b>le porteur viens de remplir les informations concernant le projet:  nomprojet</b>").save(failOnError: true)
                new Mailresult(code:"validation etape info projet",description:"validation etape info projet",template:"<b>le porteur viens de valider la partie info projet:  nomprojet</b>").save(failOnError: true)
                new Mailresult(code:"validation etape recevabilite Bp",description:"validation etape recevabilite",template:"<b>le Bp viens de valider étape revevabilité:  nomprojet</b>").save(failOnError: true)
                new Mailresult(code:"validation étape recevabilité porteur",description:"validation étape recevabilité porteur",template:"<b>le porteur viens d\'accepter les régles dans étape recevabilité pour passer à PitchCT:  nomprojet</b>").save(failOnError: true)
                new Mailresult(code:"validation etape PITCHCT",description:"passer de étape PitchCT Bp à PD + FT",template:"<b>le Bp veins de valider étape PitchCT pour passer à PD + FT:  nomprojet</b>").save(failOnError: true)
                new Mailresult(code:"validation etape PD+FT",description:"de étape PD+FT à Appel compétence Bp",template:"<b>le Bp viens de passer de PD+FT à Appel compétence:  nomprojet</b>").save(failOnError: true)
                new Mailresult(code:"validation etape Appel compétence",description:"de étape Appel compétence à Résultat d'évaluation",template:"<b>le Bp viens de passer de PD+FT à Appel compétence:  nomprojet</b>").save(failOnError: true)
                new Mailresult(code:"validation etape Résultat d'évaluation",description:"passer de étape Résultat d'évaluation à Validation VGA",template:"<b>le Bp viens de passer de Résultat d'évaluation à Validation VGA:  nomprojet</b>").save(failOnError: true)
                new Mailresult(code:"validation etape Validation VGA",description:"passer de étape Validation VGA à Decision Commex",template:"<b>le Bp viens de passer de Validation VGA à Decision Commex:  nomprojet</b>").save(failOnError: true)
                new Mailresult(code:"validation etape Decision Commex",description:"passer de étape Validation VGA à Decision Commex",template:"<b>le Bp viens de  Valider  Decision Commex:  nomprojet</b>").save(failOnError: true)
                new Mailresult(code:"validation etape partie administration",description:"passer de étape Validation VGA à Decision Commex",template:"<b>le Bp viens de  Valider  Decision Commex:  nomprojet</b>").save(failOnError: true)
                new Mailresult(code:"validation étape PitchCT porteur",description:"validation étape PitchCT porteur",template:"<b>le porteur viens de valider l'étape PitchCT:  nomprojet</b>").save(failOnError: true)
                new Mailresult(code:"validation étape Evaluation CT porteur",description:"validation étape Evaluation CT porteur",template:"<b>le porteur viens de valider l'étape Evaluation CT pour passer à Decision Commex:  nomprojet</b>").save(failOnError: true)
                new Mailresult(code:"validation étape Decision Commex",description:"validation étape Decision Commex est passer à Post_label porteur",template:"<b>le porteur viens de valider l'étape Decision Commex pour passer à Post_label:  nomprojet</b>").save(failOnError: true)
                new Mailresult(code:"validation étape final administration",description:"validation étape final administration",template:"<b>le porteur viens de valider l\'étape final administration:  nomprojet</b>").save(failOnError: true)
                
                new Document(code:"ficheTechnique").save(failOnError: true)
                new Document(code:"grilleAnalyse").save(failOnError: true)
                new Document(code:"lettreConfidentialite").save(failOnError: true)
            }   
           
            test {
                
            }
            production {
                 
                new Document(code:"ficheTechnique").save(failOnError: true)
                new Document(code:"grilleAnalyse").save(failOnError: true)
                new Document(code:"lettreConfidentialite").save(failOnError: true)
                new Document(code:"fichesignaletique").save(failOnError: true)
                new Document(code:"dossierlabellisation").save(failOnError: true)
                new Document(code:"business_model_canevas").save(failOnError: true)
                
            }
        }
    }
    def destroy = {
    }
}
