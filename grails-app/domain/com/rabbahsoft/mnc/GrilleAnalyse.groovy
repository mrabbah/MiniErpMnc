package com.rabbahsoft.mnc
import com.rabbahsoft.securite.Utilisateur
/**
 * GrilleAnalyse
 * A domain class describes the data object and it's mapping to the database
 */
class GrilleAnalyse {

    static attachmentable = true
    static belongsTo = [rapporteur : Utilisateur, projet : LabelisationProjet,formation :Formation]
	
	/* Automatic timestamping of GORM */
	Date	dateCreated
	
    static	mapping = {
    }
    
	static	constraints = {
        projet nullable : true  
        formation nullable : true  
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
