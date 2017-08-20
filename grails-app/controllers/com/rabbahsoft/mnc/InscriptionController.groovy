package com.rabbahsoft.mnc

import com.rabbahsoft.securite.*
import cr.co.arquetipos.crypto.Blowfish
import grails.converters.JSON
import grails.converters.deep.JSON
import grails.transaction.Transactional
//import grails.transaction.Transactional
class InscriptionController {

    def index(){ 
        respond new Utilisateur(params)
    }
    
        
    def inscrir(){
        def profil=Profil.findByCode("porteur")
        def user=[login:params.login,nom:params.nom,prenom:params.prenom,email:params.email,gsm:params.gsm,password:Blowfish.encryptBase64(params.password, "#1Ab_.com"),profil:profil,active:true]
        def utilisateurInstance=new Utilisateur(user)
        
        
        def util=Utilisateur.findByLogin(params.login)
        
        if(util!=null)
        {
            flash.message = "Ce login existe déjà veuillez vous  réinscrire avec un autre login"
redirect(controller:'securite',action:"index",params: [state:true]) 
        }
        else
        {
            utilisateurInstance.save flush:true

        flash.message="votre compte  a été créé" 
       // , merci de consulter votre boite mail pour activer votre compte"
        //redirect(controller:'inscription',action:"index",params: [state:true])
         redirect(controller:'securite',action:"index",params: [state:true])  
       //render(view:'index')
        }
      
        
    }

     def checkemail11() {
         println "alllo-----------------------------" + params + "---------------------------------"
         def hhh=[:]
         hhh.msg=true
         render hhh as JSON
    }
}
