package com.rabbahsoft.mnc

import com.rabbahsoft.securite.Profil
import com.rabbahsoft.securite.Utilisateur

class Formation {

    static attachmentable = true
    
    String acronymeFormation
    String nomformation
    Date dateCreationFormation
    String etablissementFormation
    String statutAdhesion
    String accredidationEtat
    String entite
    String nomContact
    String telephone
    String email
    String descriptionFormation
    String diplome
    String etatArt
    String programmeFormation
    String stages
    String reseaux
    String interactionFormationEntreprise
    String interactionActiviteEntreprise
    Etape etape
    Integer nombrePassageEtape1=0
    Integer nombrePassageEtape2=0
    Integer nombrePassageEtape3=0
    Integer nombrePassageEtape4=0
    
    static hasMany = [comitesThematiques : Profil,grillesAnalyse : GrilleAnalyse]
      
    static belongsTo = [porteurProjet : Utilisateur]
	
    static	mapping = {
    }
    
	static	constraints = {
        acronymeFormation nullable : true    
        nomformation nullable : true     
        dateCreationFormation nullable : true     
        etablissementFormation nullable : true 
        statutAdhesion nullable : true, inList: ['Membre MNC', 'Nom membre MNC']    
        accredidationEtat nullable : true, inList: ['Oui', 'Non','En cours']  
        entite nullable : true     
        nomContact nullable : true     
        telephone nullable : true     
        email nullable : true           
        descriptionFormation nullable : true , maxSize: 65535      
        diplome nullable : true , maxSize: 65535      
        etatArt nullable : true , maxSize: 65535      
        programmeFormation nullable : true , maxSize: 65535      
        stages nullable : true , maxSize: 65535      
        reseaux nullable : true , maxSize: 65535      
        interactionFormationEntreprise nullable : true , maxSize: 65535      
        interactionActiviteEntreprise nullable : true , maxSize: 65535      
        etape nullable : true
    }
	

}
