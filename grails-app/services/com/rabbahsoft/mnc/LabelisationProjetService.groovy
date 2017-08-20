package com.rabbahsoft.mnc

import grails.transaction.Transactional
import com.rabbahsoft.mnc.LabelisationProjet
import java.util.HashMap
/**
 * LabelisationProjetService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class LabelisationProjetService {

    @Transactional
    def EnregistrerEtape1PorteurProjet(LabelisationProjet labelisationProjetInstance,HashMap params) {
        println params
        if(labelisationProjetInstance==null){
            def etape1=[numero:1,code:"etape1",libelle:'Etape 1']
            def etapeInstance=new Etape(etape1)
            def objet=[id:params.id,dateFin:new Date(params.dateFin), budget:params.budget, nomCompletProjet:params.nomCompletProjet, aap:params.aap, lienAap:params.lienAap, motsCles:params.motsCles, website:params.website, dateDebut:new Date(params.dateDebut), fonction:params.fonction, duree:params.duree, nomProjet:params.nomProjet, interlocuteur:params.interlocuteur,resumeAnglais:params.resumeAnglais,resumeFrancais:params.resumeFrancais,aide:params.aide,etape:etapeInstance]
            def labelisationProjetInstance1= new LabelisationProjet(objet)
            labelisationProjetInstance1.etape=etapeInstance
            labelisationProjetInstance1.etapePorteur=1
            labelisationProjetInstance1.etapeBp=2
            labelisationProjetInstance1.dateSoumissionProjet=new Date()
            labelisationProjetInstance1.nombrePassageEtape0++
            labelisationProjetInstance1.save(failOnError:true,flush:true)
            flash.message = "Votre demande a été soumise"
            redirect(action: "create", id :labelisationProjetInstance1.id)
        }
        else{
            def etape1=[dateFin:new Date(params.dateFin), budget:params.budget, nomCompletProjet:params.nomCompletProjet, aap:params.aap, lienAap:params.lienAap, motsCles:params.motsCles, website:params.website, dateDebut:new Date(params.dateDebut), fonction:params.fonction, duree:params.duree, nomProjet:params.nomProjet, interlocuteur:params.interlocuteur,resumeAnglais:params.resumeAnglais,resumeFrancais:params.resumeFrancais,aide:params.aide]
            labelisationProjetInstance.properties=etape1
            labelisationProjetInstance.save(failOnError:true,flush:true)
            flash.message = "Votre demande a été modifié"
            redirect(action: "create", id :labelisationProjetInstance.id)
        }
    }
}
