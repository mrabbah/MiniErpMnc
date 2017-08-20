package com.rabbahsoft.securite



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProfilController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        respond Profil.list()
    }

    def show(Profil profilInstance) {
        respond profilInstance
    }

    def create() {
        respond new Profil(params)
    }

    @Transactional
    def save(Profil profilInstance) {

        if(params.enabled==null)
        {
            flash.message = message(code: 'default.droitprofil.message',default: "Veuillez séléctionner au minimum un seul droit à ce profil")
            render(view:"create",model:[profilInstance:profilInstance])
            return
        }
        else
        {
            if(params.enabled instanceof String)
            {
                profilInstance.addToDroits(Droit.findByCode(params.enabled)) 

            }
            else
            {
                ArrayList droitsId=params.enabled 
                for(int i=0;i<droitsId.size();i++)
                {
                    if(Droit.findByCode(droitsId.get(i))!=null){
                        profilInstance.addToDroits(Droit.findByCode(droitsId.get(i)))

                    }
                }
            }
            profilInstance.save flush:true
            flash.message = message(code: 'default.createdmessage.message',default: "L'objet a été crée")
            redirect(action: "edit", id :profilInstance.id)
        }
    }

    def edit() {
        def profilInstance=Profil.get(params.id)
        def droits=[:]
        for(droit in profilInstance.droits){
            droits[droit.code]=droit.code
        }
        respond profilInstance,model:[droits:droits]
    }

    @Transactional
    def update(Profil profilInstance) {
//        if(params.enabled==null)
//        {
//            flash.message = message(code: 'default.droitprofil.message',default: "Vous devriez changer au moins un droit")
//            render(view:"edit")
//            return
//        }
//        else
//        {
//            profilInstance.droits.clear()
//            if(params.enabled instanceof String)
//            {
//               profilInstance.addToDroits(Droit.findByCode(params.enabled)) 
//            }
//            else
//            {
//                ArrayList droitsId=params.enabled 
//            for(int i=0;i<droitsId.size();i++)
//            {
//                profilInstance.addToDroits(Droit.findByCode(droitsId.get(i)))
//            
//            }
//            }
            profilInstance.save flush:true
            flash.message = message(code: 'default.createdmessage.message',default: "L'objet a été crée")
            redirect(action: "edit", id :profilInstance.id)
//        }
    }

    @Transactional
    def delete(Profil profilInstance) {

        if (profilInstance == null) {
            notFound()
            return
        }
        
        def connections1 = Utilisateur.createCriteria().list
        {
           profil
              {
                  eq("id",profilInstance.id)
              }
        }
if(connections1!=null)
{
    flash.message = message(code: 'default.createdmessage.message',default: "ce profil est deja lie a un utilisateur veuillez le detache")
                redirect action:"index", method:"GET"
}
else
{
//   profilInstance.delete flush:true

        request.withFormat {
            form {
                //flash.message = message(code: 'default.deleted.message', args: [message(code: 'Profil.label', default: 'Profil'), profilInstance.id])
                 flash.message = message(code: 'default.createdmessage.message',default: "L'objet a été supprimé")
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }  
}
       
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'profilInstance.label', default: 'Profil'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
