package com.rabbahsoft.securite

class Profil {

    String code
    String description
    
    static hasMany = [droits : Droit, utilisateurs : Utilisateur]
    
    static constraints = {
        code blank: false, unique: true
        description nullable : true
    }
    
    @Override	
    public String toString() {
        return "${description}";
    }
}
