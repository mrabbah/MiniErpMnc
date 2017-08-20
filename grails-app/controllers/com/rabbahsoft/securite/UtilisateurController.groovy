package com.rabbahsoft.securite

//import com.rabbahsoft.securite.LabelisationProjet
import grails.converters.*
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import cr.co.arquetipos.crypto.Blowfish
import com.rabbahsoft.mnc.*

@Transactional(readOnly = true)
class UtilisateurController {
  def mailService
    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        session.utilisateursSelectedList=[]
        //respond Utilisateur.list()
        redirect(action: "list_utilisateur")
    }

    def show(Utilisateur utilisateurInstance) {
        respond utilisateurInstance
    }

    def create() {
        respond new Utilisateur(params)
    }

    def listAgents() {
        def p = Profil.findByCode("AGENT")
        def result = Utilisateur.findAllByProfilAndLatLngIsNotNull(p)
        render result as JSON
    }
    
    @Transactional
    def save(Utilisateur utilisateurInstance) {
        if (utilisateurInstance == null) {
            notFound()
            return
        }

        if (utilisateurInstance.hasErrors()) {
            flash.message="Veuillez vérifier vos informations(le login existe deja ...) "
            respond utilisateurInstance.errors, view:'create'
            return
        }
        params.password = Blowfish.encryptBase64(params.password, "#1Ab_.com")
        utilisateurInstance.properties = params
        utilisateurInstance.active=true


        utilisateurInstance.save(failOnError: true)
        def template="Votre compte a été créé avec comme login :"+utilisateurInstance.login+" est password :"+utilisateurInstance.password+ ""
        def description='creation de compte'
//        mailService.sendMail {
//            bcc utilisateurInstance.email
//            from "allaliyoussefemsi@gmail.com"
//            to utilisateurInstance.email
//            subject description
//            html template
//        }
        flash.message="L'objet a été crée"
        redirect(action : 'index')
    }

    def edit(Utilisateur utilisateurInstance) {
        utilisateurInstance.password=Blowfish.decryptBase64(utilisateurInstance.password,"#1Ab_.com")
        respond utilisateurInstance
    }
    
    def edit_1(Utilisateur utilisateurInstance) {
        utilisateurInstance.password=Blowfish.decryptBase64(utilisateurInstance.password,"#1Ab_.com")
        respond utilisateurInstance
    }

    @Transactional
    def update(Utilisateur utilisateurInstance) {
        if (utilisateurInstance == null) {
            notFound()
            return
        }

        if (utilisateurInstance.hasErrors()) {
            respond utilisateurInstance.errors, view:'edit'
            return
        }
        params.password = Blowfish.encryptBase64(params.password, "#1Ab_.com")
        utilisateurInstance.properties = params
        if(session.droits.AFFECTER_SOCIETE_UTILISATEUR != null){
            utilisateurInstance.comitesThematiques.clear()
            def comitesThematiques=[]
            if(params.comitesThematiques !=null){
                if(params.comitesThematiques instanceof String){
                    comitesThematiques.add(ComiteThematique.get(params.comitesThematiques))
                }
                else {
                    for(comiteThematique in params.comitesThematiques){
                        comitesThematiques.add(ComiteThematique.get(comiteThematique))   
                    }   
                }
            }
            utilisateurInstance.comitesThematiques=comitesThematiques
        }
        utilisateurInstance.save flush:true
        flash.message="L'objet a été modifié"
        if(session.user.profil.code== 'porteur')
        {

            redirect(action : "edit_1",id:utilisateurInstance.id)  
            
        }
        else
        {
          redirect(action : "index")  
        }
       
    }

    @Transactional
    def delete(Utilisateur utilisateurInstance) {

        if (utilisateurInstance == null) {
            notFound()
            return
        }

        utilisateurInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Utilisateur.label', default: 'Utilisateur'), utilisateurInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'utilisateurInstance.label', default: 'Utilisateur'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
     def userbycomite() {
        def comites=params.comites.split(",")
        def criteria = Utilisateur.createCriteria()
        def result = criteria.list {
            comitesThematiques {
                or {
                    for(comite in comites) {          
                        eq('id', new Long(comite))
                    }  
                }  
            }     
        }
        render result as JSON    
    }
     def testcheck(){
         def listutilisateurdelete=session.utilisateursSelectedList
        if(params.state=="checked"){ 
            //def utilisateur=Utilisateur.get(Long.parseLong(params.value))
            session.utilisateursSelectedList.add(params.value)
            //session.candidatsSelectedList.add(params.value)
            //session.candidatsSelectedMap[params.value] = true 
        }
        else {
            def utilisateur=Utilisateur.get(Long.parseLong(params.value))
            session.utilisateursSelectedList.remove(params.value)
            //session.candidatsSelectedMap[params.value] = false
           }
           session.utilisateursSelectedList=listutilisateurdelete
    }
    
    @Transactional
    def supprimermultiutilisateur() {
def listuti=session.utilisateursSelectedList
        if (session.utilisateursSelectedList == null) {
            notFound()
            return
        }
        for(id in session.utilisateursSelectedList)
        {
           def utilisateurInstance=Utilisateur.get(Long.parseLong(id))
           
            def connections1 = LabelisationProjet.createCriteria().list
                     {
                     porteurProjet
                     {
                          eq("id",utilisateurInstance.id)
                     }
                     }
            
           if(connections1!=null)
           {
               
           }
           
            //utilisateurInstance.delete flush:true
        }


if(listuti.size()==0)
{
   flash.message="aucun objet n'a été selectionné" 
}
else
{
  flash.message="Les objets ont été supprimés"  
}
 
        redirect(action : 'index')
    }
    
    
     @Transactional
    def supprimermultiutilisateur1() {
        
def listuti=session.utilisateursSelectedList
        if (session.utilisateursSelectedList == null) {
            notFound()
            return
        }
        for(id in session.utilisateursSelectedList)
        {
           def utilisateurInstance=Utilisateur.get(Long.parseLong(id))
            def connections1 = LabelisationProjet.createCriteria().list
                     {
                     porteurProjet
                     {
                          eq("id",utilisateurInstance.id)
                     }
                     }
            
           if(connections1.size()==0)
           {
               render "false"
           }
           else
           {
                render "true"
               
           }
           
        }


    }
    
      @Transactional
    def test1() {
        
      for(id in session.utilisateursSelectedList)
        {
           def utilisateurInstance=Utilisateur.get(Long.parseLong(id))
            def connections1 = LabelisationProjet.createCriteria().list
                     {
                     porteurProjet
                     {
                          eq("id",utilisateurInstance.id)
                     }
                     }
            
           if(connections1.size()!=0)
           {
               for(projet in connections1)
               {
                   projet.porteurProjet=null
                   projet.merge()
                   utilisateurInstance.delete(flush: true) 
               }
           }
           else
           {
                
              utilisateurInstance.delete(flush: true) 
           }
           
        }

  render "allo"

    }
    
    
     def verificationprofil() 
    {
        
             long l = Long.parseLong(params.profil)
        def connections1 = Profil.createCriteria().list
        {
             
              eq("id",l)
            
        }
        if(connections1[0].description=='BUREAU PERMANENT' && connections1[0].code=='BP')
        {
         render true   
        }
        else
        { 
            render false
        }
    } 

    
    def checkemail1() {
        render "true"
    }
    def list_utilisateur(Integer max) {
        params.max = Math.min(max ?: 20, 100)
//        respond Utilisateur.list()
        respond Utilisateur.list(params), model:[utilisateurInstanceCount: Utilisateur.count()]
    }
    @Transactional
     def delete_user() {
        def utilisateur=Utilisateur.get(Long.parseLong(params.id))
        def connections1 = LabelisationProjet.createCriteria().list
                     {
                     porteurProjet
                     {
                          eq("id",utilisateur.id)
                     }
                     }

                      def connections2 = LabelisationProjet.createCriteria().list
                     {
                     evaluateurs
                     {
                          eq("id",utilisateur.id)
                     }
                     }

                      def connections3 = LabelisationProjet.createCriteria().list
                     {
                     rapporteurs
                     {
                          eq("id",utilisateur.id)
                     }
                     }

                      def connections4 = LabelisationProjet.createCriteria().list
                     {
                     rapporteursconfirmes
                     {
                          eq("id",utilisateur.id)
                     }
                     }

           if(connections1.size()!=0)
           {
               for(projet in connections1)
               {
                   projet.porteurProjet=null
                   projet.merge()
                   //utilisateur.delete(flush: true) 
               }
           }
 
           ////////////evaluateurs
            if(connections2.size()!=0)
           {
               
               for(projet in connections2)
               {
                   if(projet.evaluateurs.contains(utilisateur))
                   {
                       projet.evaluateurs.remove(utilisateur)
                   }
                   projet.merge()
                   //utilisateur.delete(flush: true) 
               }
           }

        ///////////rapporteurs
            if(connections3.size()!=0)
           {
               for(projet in connections3)
               {
                  if(projet.rapporteurs.contains(utilisateur))
                   {
                       projet.rapporteurs.remove(utilisateur)
                   }
                   projet.merge()
               }
           }

        ///////////////rapporteurs confiremes
            if(connections4.size()!=0)
           {
               for(projet in connections4)
               {
                  
                  if(projet.rapporteursconfirmes.contains(utilisateur))
                   {
                       projet.rapporteursconfirmes.remove(utilisateur)
                   }
                   projet.merge()
                
                
                
                
               }
           }

           utilisateur.delete(flush: true)

       render true
    }
}
