package com.rabbahsoft.mnc

import com.rabbahsoft.securite.Profil
import com.rabbahsoft.securite.Utilisateur
import com.rabbahsoft.securite.ComiteThematique

class LabelisationProjet {
    
    static attachmentable = true
    
    //Etape 1 Porteur (belongs to porteur projet)
    String interlocuteur
    String fonction
    String competenceexterne1
    String nomProjet
    String nomCompletProjet
    String website
    String motsCles
    Long aap
    Long budget
    String aide
    Integer duree
    Date dateDebut
    Date dateFin
    String resumeFrancais
    String resumeAnglais
    String lienAap
    Date dateSoumissionProjet

    //Etape 1 BP (ajouter hasmany Comite Thematique, Cluster ,conflitint{Utilisateur}, rapporteurs{Utilisateur}) + lienAap budget aide cité en haut [BP]
    boolean recevable=null
    String raisonRecevabilite
    String reglesGestion
    Date dateAuditionEtape1Bp=null
    String lieuAuditionEtape1Bp
    Date dateRedactionEtape1Bp
    
    //Etape 2 Porteur
    //le porteur du projet doit lire les informations saisie par le BP et accepter les règles de confidentialités et uploader la présentation
    boolean accepterReglesConfidentialite=null
    String reglesConfidentialite=null 
    String valideEtapePitchct=null
    String etatProjet
    Date dateAcceptionEtape3
    
    
    //Etape 2 Bp
    String decisionEtape2Bp
    Date datePreselectionEtape2Bp
    Date dateReauditionEtape2Bp
    String structureAccompagnement
    String raisonRejetEtape2Bp
    ////recement rajouter
    // Etape 4 BP  
    
    
    // Etape 5 BP (Upload de la grille d'analyse
    
    // Etape 6 BP  
    String decisionEtape6Bp
    Date dateAuditionEtape6Bp=null
    Date dateValidation=null
    Date dateReelCommex=null
    Date dateReeleffCommex=null
    String lieuAuditionEtape6Bp
    String raisonRejetEtape6Bp
    
    // Etape 7 Bp
    String decisionEtape7Bp
    String raisonRejetEtape7Bp
    
    ///fin  recement ajouter
    
    
    //Etape3
    //Dans cette partie gestion des conflits (hasMany cluster, rapporteurIntern,
    //rapporteurExterne, comite thematique
    //Enfin le redacteur doit cliquer sur recevable ou non deux bouton
    Utilisateur redacteurEtape3
    Date dateRedactionEtape3    
    Date dateDiffusionProposition
    Date datePresentation1
    String lieuPresentation1
    Utilisateur presidentComite
    String mailEtape4Porteur=null
    String mailEtape4Bp=null
    Integer nombrePassageEtape3 = 0
    
    //Etape 4 le proteur du projet upload la presentation utilisation de attachmable
    Date dateUploadPresentation1
    Integer nombrePassageEtape4 = 0
    
    //Etape 5 selection
    //soit on passe directement vers l'étape 6 soit on passe vers l'étape 5 bis
    String preselection
    String motifRejetPreselection
    Utilisateur redacteurEtape5
    Date dateActionPreselectionEtape5
    Date dateReaudition
    String mailEtape6Porteur=null
    Integer nombrePassageEtape5 = 0
    
    //Etape 5 bis reaudition
    String preselectionBis
    String motifRejetPreselectionBis
    Utilisateur redacteurEtape5Bis
    Date dateActionPreselectionEtape5bis
    Integer nombrePassageEtape5bis = 0

    //Etape 6 upload de la fiche technique par le proteur du projet > attachmable
    Date dateUploadFicheTechnique
    Integer nombrePassageEtape6 = 0
    
    //Etape 7 planification de la diffusion de la fiche technique
    Utilisateur redacteurEtape7
    Date datePlanificationDiffusion
    Date dateDiffusion
    String mailEtape8Porteur
    String mailEtape8Bp
    Integer nombrePassageEtape7 = 0
    
    //Etape 8 upload des grilles d'analyse par les membres du CT/rapporteur (hasmany grille analyse   
    Utilisateur redacteurEtape8
    Date dateFinEtape8
    Integer nombrePassageEtape8 = 0
    String mailEtape9Porteur
    String mailEtape9Bp
    
    //Etape 9 Transmission de la synthèse d'évalution faite par le président du CT
    //aur porteur projet de cette étape soit on revient vers étape 6 pour une nouvelle version
    //soit on passe vers l'étape 10
    boolean conformeEtape9
    String syntheseEvaluations
    String recommandations
    String raisonNonConformiteEtape9
    Date dateLimiteRemiseNouvelleVersion
    Utilisateur redacteurEtape9
    Date dateFinEtape9
    Integer nombrePassageEtape9 = 0
    String mailEtape10
    
    //Etape 10 Décision des Comités de Pilotage des Commissions Thématiques 
    //les rapporteurs peuvent changer les upload d'évalution (grille d'évalutaion attachemable)
    //Par la suite decisionConformite (deux boutons soit conforme soit non)
    Utilisateur redacteurEtape10
    Date dateFinEtape10
    Date dateReunionComiteThematique
    String avisSynthese
    String opinionComitePilotage
    String raisonNonConformiteEtape10
    Integer nombrePassageEtape10 = 0
    
    //Etape 11 Bureau permanent transmis le dossier au comex et decision au porteur projet
    Utilisateur redacteurEtape11
    Date dateFinEtape11
    Date dateEnvoiDecisionPorteur
    Date datePrevuAuditionComex
    Integer nombrePassageEtape11 = 0
    
    //Etape 12 Decision comex (avis favorable oui/non)
    Utilisateur redacteurEtape12
    Date dateFinEtape12
    Date dateAuditionComex
    String decisionComex
    boolean decisionfinale
    Integer nombrePassageEtape12 = 0
    
    
    //Etape 13 Decision conseil d'administration (2 boutons avis favorable oui/non)
    Utilisateur redacteurEtape13
    Date dateFinEtape13
    Integer nombrePassageEtape13 = 0
    
    //Etape administration (2 boutons avis favorable oui/non)
    boolean administration=true
    String commentaire
    String commentaireftfd
    boolean competenceexternesollicite
    String autre
    String notificationrecevabilite=null 
    String affirmationCT=null
    
    Integer etapePorteur=0
    Integer etapeBp=1
    Etape etape
    Date dateCreated
    Date lastUpdated
    
  String etapeProjet="info Projet"
  Date infoprojet
  Date recevabilite
  Date pitchct
  Date evaluationct
  Date labelisationcommex
  Date pdft
  Date appelcompe
  Date resultaevaluat
  Date validationvga
  Date decisioncommex
    static hasMany = [comitesThematiques4 : ComiteThematique,
        clusters : Cluster,
        comitesThematiques : ComiteThematique,
        rapporteurs : Utilisateur,
        conflitint : Utilisateur,
        rapporteursconfirmes : Utilisateur,
        evaluateurs : Utilisateur,
        ///ajouter  
        competenceexterne : Utilisateur,
        membresComiteValides : Utilisateur, 
        rapporteursInternes : Utilisateur,
        rapporteursExternes : Utilisateur,
        grillesAnalyse : GrilleAnalyse]
            
    static belongsTo = [porteurProjet : Utilisateur]
    
    static constraints = {
        infoprojet nullable :true
        recevabilite nullable :true
        pitchct nullable :true
        evaluationct nullable :true
        labelisationcommex nullable :true
        pdft nullable :true
        appelcompe nullable :true
        resultaevaluat nullable :true
        validationvga nullable :true
        decisioncommex nullable :true
        
        
        interlocuteur blank: false 
        fonction blank: false
        nomProjet blank: false
        nomCompletProjet nullable: true
        website nullable: true
        aap nullable: true
        budget nullable: true
        duree nullable: true
        etatProjet nullable: true
        dateDebut nullable: true
        dateFin nullable: true
        resumeFrancais nullable: true, maxSize: 65535
        resumeAnglais nullable: true, maxSize: 65535
        mailEtape4Porteur nullable: true, maxSize: 65535
        mailEtape4Bp nullable: true, maxSize: 65535
        mailEtape6Porteur nullable: true, maxSize: 65535
        mailEtape8Porteur nullable: true, maxSize: 65535
        mailEtape8Bp nullable: true, maxSize: 65535
        mailEtape9Porteur nullable: true, maxSize: 65535
        mailEtape9Bp nullable: true, maxSize: 65535
        mailEtape10 nullable: true, maxSize: 65535
        lienAap nullable: true
        valideEtapePitchct nullable: true
        preselection nullable: true, inList: ['preselection', 're-audition', 'rejet']
        motifRejetPreselection nullable: true
        decisionComex nullable: true, maxSize: 65535
        raisonNonConformiteEtape9 nullable: true  
        dateCreated blank:false
        lastUpdated nullable:true	
        dateSoumissionProjet nullable : true
        aide nullable : true
        redacteurEtape3 nullable : true
        dateRedactionEtape3 nullable : true
        redacteurEtape5 nullable : true
        dateActionPreselectionEtape5 nullable : true
        dateReaudition nullable : true
        preselectionBis nullable : true, inList: ['Préselection', 'Rejet']
        conformeEtape9 nullable : true
        motifRejetPreselectionBis nullable : true
        redacteurEtape5Bis nullable : true
        dateActionPreselectionEtape5bis nullable : true
        dateUploadPresentation1 nullable : true
        dateUploadFicheTechnique nullable : true
        redacteurEtape7 nullable : true
        datePlanificationDiffusion nullable : true
        dateDiffusion nullable : true
        syntheseEvaluations nullable : true
        recommandations nullable : true
        presidentComite nullable : true
        redacteurEtape8 nullable : true
        dateFinEtape8 nullable : true
        dateLimiteRemiseNouvelleVersion nullable : true
        redacteurEtape9 nullable : true
        dateFinEtape9 nullable : true
        redacteurEtape10 nullable : true
        dateFinEtape10 nullable : true
        dateReunionComiteThematique nullable : true
        avisSynthese nullable : true
        opinionComitePilotage nullable : true
        raisonNonConformiteEtape10 nullable : true
        redacteurEtape11 nullable : true
        dateFinEtape11 nullable : true
        dateEnvoiDecisionPorteur nullable : true
        datePrevuAuditionComex nullable : true
        redacteurEtape12 nullable : true
        dateFinEtape12 nullable : true
        dateAuditionComex nullable : true
        decisionComex nullable : true
        redacteurEtape13 nullable : true
        dateFinEtape13 nullable : true  
        dateDiffusionProposition nullable : true  
        datePresentation1 nullable : true  
        etape nullable : true  
        porteurProjet nullable : true   
        membresComiteValides nullable : true  
        rapporteursInternes nullable : true  
        rapporteursExternes nullable : true  
        decisionfinale nullable : true  
        lieuPresentation1 nullable : true  
        
        // Etape 1 (BP)
        recevable nullable :true
        raisonRecevabilite nullable :true,maxSize: 65535
        reglesGestion nullable :true,maxSize: 65535
        dateAuditionEtape1Bp nullable :true
        lieuAuditionEtape1Bp nullable :true
        dateRedactionEtape1Bp nullable :true
        conflitint nullable :true
        comitesThematiques nullable :true
        clusters nullable :true
        rapporteurs nullable :true
        evaluateurs nullable :true
        //etape 2 Porteur
        accepterReglesConfidentialite nullable : true
        reglesConfidentialite nullable: true, maxSize: 65535
        dateAcceptionEtape3 nullable :true 
        
        // Etape 2 Bp
        decisionEtape2Bp nullable :true
        rapporteursconfirmes nullable :true
        datePreselectionEtape2Bp nullable :true
        dateReauditionEtape2Bp nullable :true
        structureAccompagnement nullable :true, maxSize: 65535
        raisonRejetEtape2Bp nullable :true, maxSize: 65535
        
        ///recement ajouter 
        // Etape 4 Bp
        competenceexterne nullable :true
        competenceexternesollicite nullable :true
        
        // Etape 6 Bp
        decisionEtape6Bp nullable :true
        dateAuditionEtape6Bp nullable :true
        dateValidation nullable :true
        dateReelCommex nullable :true
        dateReeleffCommex nullable :true
        lieuAuditionEtape6Bp nullable :true
        raisonRejetEtape6Bp nullable :true,maxSize: 65535
        
        // Etape 7 Bp
        decisionEtape7Bp nullable :true
        raisonRejetEtape7Bp nullable :true, maxSize: 65535
    ////fin rajouter
        commentaire nullable :true, maxSize: 65535
        commentaireftfd nullable :true, maxSize: 65535
        competenceexterne1 nullable :true, maxSize: 65535
        autre nullable :true
        notificationrecevabilite nullable :true
        affirmationCT nullable :true
    }
    @Override	
    public String toString() {
        return "${interlocuteur}";
    }
}
