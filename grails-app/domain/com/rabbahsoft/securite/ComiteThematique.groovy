package com.rabbahsoft.securite

/**
 * ComiteThematique
 * A domain class describes the data object and it's mapping to the database
 */
class ComiteThematique {
    String code
    String description
    Long president
    
    static constraints = {
        code blank: false, unique: true
        description nullable : true
        president nullable : true
    }
    
    @Override	
    public String toString() {
        return "${description}";
    }
}
