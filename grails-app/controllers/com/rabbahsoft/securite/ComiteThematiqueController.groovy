package com.rabbahsoft.securite

import com.rabbahsoft.mnc.*
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ComiteThematiqueController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ComiteThematiqueController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        //respond ComiteThematique.list(params), model:[comiteThematiqueInstanceCount: ComiteThematique.count()]
    redirect(action:"list_commithematique")
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ComiteThematique.list(params), model:[comiteThematiqueInstanceCount: ComiteThematique.count()]
    }

    def show(ComiteThematique comiteThematiqueInstance) {
        def criteria = Utilisateur.createCriteria()
        def result = criteria.list {
            comitesThematiques {
                eq("id",comiteThematiqueInstance.id)    
            }     
        }
        respond comiteThematiqueInstance,model:[listeutilisateurs:result]
    }

    def create() {
        respond new ComiteThematique(params)
    }

    @Transactional
    def save(ComiteThematique comiteThematiqueInstance) {
        if (comiteThematiqueInstance == null) {
            notFound()
            return
        }

        if (comiteThematiqueInstance.hasErrors()) {
            respond comiteThematiqueInstance.errors, view:'create'
            return
        }
        comiteThematiqueInstance.save flush:true
        flash.message="L'abjet a été crée"
        redirect(action: "index")
    }

    def edit(ComiteThematique comiteThematiqueInstance) {
        respond comiteThematiqueInstance
    }

    @Transactional
    def update(ComiteThematique comiteThematiqueInstance) {
        if (comiteThematiqueInstance == null) {
            notFound()
            return
        }

        if (comiteThematiqueInstance.hasErrors()) {
            respond comiteThematiqueInstance.errors, view:'edit'
            return
        }

        comiteThematiqueInstance.save flush:true
        flash.message="L'objet a été modifié"
        redirect(action: "index")
    }

    @Transactional
    def delete(ComiteThematique comiteThematiqueInstance) {

        if (comiteThematiqueInstance == null) {
            notFound()
            return
        }

        comiteThematiqueInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ComiteThematique.label', default: 'ComiteThematique'), comiteThematiqueInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'comiteThematiqueInstance.label', default: 'ComiteThematique'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    @Transactional
    def selectpresident(){
        def list=params.value.split(",")
        def comitethematique=ComiteThematique.get(list[1])
        def president=Utilisateur.get(list[0])
        comitethematique.president=president.id
        comitethematique.save flush:true
        render (0)
 
    }
    def list_commithematique(Integer max) {
        params.max = Math.min(max ?: 10, 100)
         render(view:"list_commithematique", model:[ComiteThematiqueList:ComiteThematique.list(params),comiteThematiqueInstanceCount: ComiteThematique.count()])
    }
      @Transactional
     def delete_committhematique() {
        def comiteThematique=ComiteThematique.get(Long.parseLong(params.id))
        def connections1 = LabelisationProjet.createCriteria().list
                     {
                     comitesThematiques
                     {
                          eq("id",comiteThematique.id)
                     }
                     }
            def connections2 = Utilisateur.createCriteria().list
                     {
                     comitesThematiques
                     {
                          eq("id",comiteThematique.id)
                     }
                     }
           if(connections1.size()!=0)
           {
               for(projet in connections1)
               {
                   projet.comitesThematiques=null
                   projet.merge()
               }
           }
           if(connections2.size()!=0)
           {
               for(utilisateur in connections2)
               {
                   utilisateur.comitesThematiques=null
                   utilisateur.merge()
//                   utilisateur.delete(flush: true) 
               }
           }
          comiteThematique.delete(flush: true) 
       render true
    }
}
