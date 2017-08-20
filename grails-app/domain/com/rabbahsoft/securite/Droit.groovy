package com.rabbahsoft.securite

class Droit {

    String code
    
    static constraints = {
        code blank: false, unique: true
    }
    
    @Override	
    public String toString() {
        return "${code}";
    }
}
