package com.rabbahsoft.securite

import com.rabbahsoft.mnc.*

class Utilisateur {

    String nom
    String prenom
    String email
    String login
    String password
    String gsm
    Boolean active
    Boolean comex
    Boolean bp
    Boolean ca
    Profil profil
    
    static hasMany = [comitesThematiques :ComiteThematique]
//        ,labelisationProjets:LabelisationProjet]
            
    
    static belongsTo = [Profil]
//    static mapping = {
//        labelisationProjets cascade: "all-delete-orphan"
//    }
    static constraints = {
        nom blank: false
        prenom blank: false
        gsm blank: true, nullable : true
        email blank : false, email : true
        login blank: false, unique: true
        password blank: false
        active nullable : true
        comex nullable : true
        bp nullable : true
        ca nullable : true
        comitesThematiques nullable : true
    }
    
    @Override	
    public String toString() {
        return "${nom} ${prenom}";
    }
}
