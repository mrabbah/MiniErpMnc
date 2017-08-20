package com.rabbahsoft.mnc

/**
 * Cluster
 * A domain class describes the data object and it's mapping to the database
 */
class Cluster {

    String code
    String description

    static	mapping = {
    }
    
    static	constraints = {
            code nullable : false, blank : false
            description nullbale : false, blank : false
    }
	

    	@Override	// Override toString for a nicer / more descriptive UI 
    	public String toString() {
    		return "${description}";
    	}
}
