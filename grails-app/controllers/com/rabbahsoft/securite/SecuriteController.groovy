package com.rabbahsoft.securite

import cr.co.arquetipos.crypto.Blowfish

class SecuriteController {

    def index() { }
    
    def login() {
        def login = params.username
        def droits=[:]
        def pwd = Blowfish.encryptBase64(params.password, "#1Ab_.com")
        def user = Utilisateur.findByLoginAndPassword(login, pwd)
        if(user) {
            session.user = user
            def profil = user.profil
//            def code=Profil.findByDescription(profil).code
//            if(code=='porteur')
//            {
//                
//                session.user1=session.user
//            }
            session.profil=profil.code
            
            for(droit in profil.droits) {
                droits[droit.code] = droit.code
            }
            session.droits=droits
            
            
             if(session.profil=='porteur')
            {
                session.user1=session.user
                def fichetechnique=servletContext.getAttribute('ficheTechnique')
                servletContext.setAttribute('ficheTechnique',fichetechnique)
                def grilleanalyse=servletContext.getAttribute('grilleAnalyse')
                servletContext.setAttribute('grilleAnalyse',grilleanalyse)
                def fichesignaletique=servletContext.getAttribute('fichesignaletique')
                servletContext.setAttribute('fichesignaletique',fichesignaletique)
                def dossierlabellisation=servletContext.getAttribute('dossierlabellisation')
                servletContext.setAttribute('dossierlabellisation',dossierlabellisation)
                def business_model_canevas=servletContext.getAttribute('business_model_canevas')
                servletContext.setAttribute('business_model_canevas',business_model_canevas)
//                redirect(controller : "labelisationProjet", action : "list_projet", params:[encours:true,fichetechnique:fichetechnique,grilleanalyse:grilleanalyse,fichesignaletique:fichesignaletique,dossierlabellisation:dossierlabellisation,business_model_canevas:business_model_canevas])
redirect(controller : "labelisationProjet", action : "list_projet", params:[encours:true])
            }
            else
            {

              redirect(controller : "labelisationProjet", action : "list_projet", params:[global:true])  
            }
        } else {
            flash.message = "Login et/ou mot de passe incorrect(s)"
            redirect(action : "index")
        }
    }
    
    def inscrir() {
        respond new Utilisateur(params)
    }
    
    def logout() {
        session.invalidate()
        redirect(action : "index")
    }
}
