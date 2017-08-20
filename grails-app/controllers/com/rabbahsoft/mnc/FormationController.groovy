package com.rabbahsoft.mnc
import com.rabbahsoft.securite.Profil
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import com.macrobit.grails.plugins.attachmentable.domains.Attachment
import com.macrobit.grails.plugins.attachmentable.domains.AttachmentLink
import com.macrobit.grails.plugins.attachmentable.util.AttachmentableUtil

/**
 * FormationController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class FormationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Formation.list(params), model:[formationInstanceCount: Formation.count()]
    }

    @Transactional
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Formation.list(params), model:[formationInstanceCount: Formation.count()]
    }

    def show(Formation formationInstance) {
        respond formationInstance
    }

    @Transactional
    def create(Formation formationInstance) {
        def steptoshow=[]
        def nextstep
        for(int i=1;i<5;i++)
        {
            def j=i+1    
            def var1="nombrePassageEtape"+i
            def var2="nombrePassageEtape"+j
            if(formationInstance."${var1}"!=0) steptoshow.add(i)
            if(formationInstance."${var1}"!=0 && formationInstance."${var2}"==0) nextstep=j
        }
        if(params.id) {
            respond Formation.get(params.id),model:[etape:formationInstance.etape,steptoshow:steptoshow,nextstep:nextstep]
        } else {
            respond new Formation(params),model:[etape:new Etape()]
        }
    }

    @Transactional
    def save(Formation formationInstance) {
        if (formationInstance == null) {
            notFound()
            return
        }

        if (formationInstance.hasErrors()) {
            respond formationInstance.errors, view:'create'
            return
        }

        formationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'formationInstance.label', default: 'Formation'), formationInstance.id])
                redirect formationInstance
            }
            '*' { respond formationInstance, [status: CREATED] }
        }
    }
    
    @Transactional
    def saveEtape1(Formation formationInstance){
        if(formationInstance==null){
            def etape1=[numero:1,code:"etape1",libelle:'Etape 1']
            def etapeInstance=new Etape(etape1)
            etapeInstance.save(failOnError:true,flush:true)
            def objet=[id:params.id,acronymeFormation:params.acronymeFormation, nomformation:params.nomformation, dateCreationFormation:new Date(params.dateCreationFormation), etablissementFormation:params.etablissementFormation, statutAdhesion:params.statutAdhesion, accredidationEtat:params.accredidationEtat, entite:params.entite, nomContact:params.nomContact, telephone:params.telephone, email:params.email, descriptionFormation:params.descriptionFormation, diplome:params.diplome,etatArt:params.etatArt,programmeFormation:params.programmeFormation,stages:params.stages,reseaux:params.reseaux,interactionFormationEntreprise:params.interactionFormationEntreprise,interactionActiviteEntreprise:params.interactionActiviteEntreprise]
            def formationInstance1= new Formation(objet)
            formationInstance1.porteurProjet=session.user
            formationInstance1.etape=etapeInstance
            formationInstance1.nombrePassageEtape1++
            formationInstance1.save(failOnError:true,flush:true)
            flash.message = "Votre demande a été soumise"
            redirect(action: "create", id :formationInstance1.id)
        }
        else{
            def objetupdated=[id:params.id,acronymeFormation:params.acronymeFormation, nomformation:params.nomformation, dateCreationFormation:new Date(params.dateCreationFormation), etablissementFormation:params.etablissementFormation, statutAdhesion:params.statutAdhesion, accredidationEtat:params.accredidationEtat, entite:params.entite, nomContact:params.nomContact, telephone:params.telephone, email:params.email, descriptionFormation:params.descriptionFormation, diplome:params.diplome,etatArt:params.etatArt,programmeFormation:params.programmeFormation,stages:params.stages,reseaux:params.reseaux,interactionFormationEntreprise:params.interactionFormationEntreprise,interactionActiviteEntreprise:params.interactionActiviteEntreprise]
            formationInstance.properties=objetupdated
            formationInstance.save(failOnError:true,flush:true)
            flash.message = "Votre demande a été modifié"
            redirect(action: "create", id :formationInstance.id)
        }
    }
    
    @Transactional
    def saveEtape2() {
        def etape2=[numero:2,code:"etape2",libelle:'Etape 3']
        def etapeInstance=new Etape(etape2)
        etapeInstance.save(failOnError:true,flush:true)
        def formationInstance=Formation.get(params.id)
        formationInstance.etape=etapeInstance
        formationInstance.nombrePassageEtape2++
        formationInstance.save(failOnError:true,flush:true)
        attachUploadedFilesTo(formationInstance)
        redirect(action: "create", id :formationInstance.id)
    }
    
    @Transactional
    def saveEtape4() {
        def etape4=[numero:4,code:"etape4",libelle:'Etape 4']
        def etapeInstance=new Etape(etape4)
        etapeInstance.save(failOnError:true,flush:true)
        def grilleanalyseInstance=new GrilleAnalyse(dateCreated:new Date())
        grilleanalyseInstance.rapporteur=session.user
        grilleanalyseInstance.save(failOnError:true,flush:true)
        attachUploadedFilesTo(grilleanalyseInstance)
        def formationInstance=Formation.get(params.id)
        formationInstance.etape=etapeInstance
        formationInstance.nombrePassageEtape4++
        formationInstance.addToGrillesAnalyse(grilleanalyseInstance)
        formationInstance.save(failOnError:true,flush:true)
        
        redirect(action: "create", id :params.id)
    }
    
    @Transactional
    def saveEtape3(){
        def comitesThematiques=[]
         for(element in params.comitesThematiques){
            comitesThematiques.add(Profil.get(element))
        }
        def etape3=[numero:3,code:"etape3",libelle:'Etape 3']
        def etapeInstance=new Etape(etape3)
        etapeInstance.save(failOnError:true,flush:true)
        def formationInstance=Formation.get(params.id)
        formationInstance.comitesThematiques=comitesThematiques
        formationInstance.etape=etapeInstance
        formationInstance.nombrePassageEtape3++
        formationInstance.save(failOnError:true,flush:true)
        flash.message = "Votre demande a été enregistrée"
        redirect(action: "create", id :formationInstance.id)
    }

    
    @Transactional
    def edit(Formation formationInstance) {
        respond formationInstance
    }

    @Transactional
    def update(Formation formationInstance) {
        if (formationInstance == null) {
            notFound()
            return
        }

        if (formationInstance.hasErrors()) {
            respond formationInstance.errors, view:'edit'
            return
        }

        formationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Formation.label', default: 'Formation'), formationInstance.id])
                redirect formationInstance
            }
            '*'{ respond formationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Formation formationInstance) {

        if (formationInstance == null) {
            notFound()
            return
        }

        formationInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Formation.label', default: 'Formation'), formationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'formationInstance.label', default: 'Formation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    @Transactional
    def deletefile() {
        def fr = Formation.get(Integer.parseInt(params.id))
        fr.removeAttachment(Integer.parseInt(params.idfile))
        render true
    }
}
