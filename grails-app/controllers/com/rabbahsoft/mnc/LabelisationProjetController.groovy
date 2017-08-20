package com.rabbahsoft.mnc


import grails.util.Holders

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.*;
import java.text.*;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import com.rabbahsoft.securite.Profil
import com.rabbahsoft.securite.ComiteThematique
import com.rabbahsoft.securite.Utilisateur
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import java.util.List
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH
import com.macrobit.grails.plugins.attachmentable.domains.Attachment
import com.macrobit.grails.plugins.attachmentable.domains.AttachmentLink
import com.macrobit.grails.plugins.attachmentable.util.AttachmentableUtil
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream
import java.text.SimpleDateFormat
import java.text.SimpleDateFormat
import org.springframework.web.multipart.commons.CommonsMultipartFile
import com.macrobit.grails.plugins.attachmentable.services.AttachmentableService
import org.springframework.web.multipart.MultipartFile
import org.apache.commons.fileupload.disk.DiskFileItem
import org.apache.commons.fileupload.disk.DiskFileItemFactory
import org.apache.commons.fileupload.FileItem
import org.apache.commons.io.FilenameUtils
import com.macrobit.grails.plugins.attachmentable.core.exceptions.EmptyFileException
import java.lang.reflect.UndeclaredThrowableException
import grails.converters.JSON
import grails.converters.deep.JSON

import grails.orm.PagedResultList
import javax.servlet.http.HttpServletResponse
import org.compass.core.engine.SearchEngineQueryParseException
import cr.co.arquetipos.password.PasswordTools
import org.hibernate.Criteria;

@Transactional(readOnly = true)
class LabelisationProjetController 
{

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
 
    def attachmentableService
    def mailService
//  def userHome="C:/Users/YALLALI"
//  def urlserver="http://localhost:8098"
    def userHome="/usr/share/tomcat7/"
   def urlserver="http://labelisation.rabbahsoft.com"

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LabelisationProjet.list(params), model:[labelisationProjetInstanceCount: LabelisationProjet.count()]
    }
    
    def list() {
        if(session.profil=="porteur"){
            def listeprojet=LabelisationProjet.findAllByPorteurProjet(session.user)
            respond listeprojet
        }
        else{
            
            if(params.global==null)
            {
                def global
             global=true   
             respond LabelisationProjet.list(),model:[global:true]
            }
            else
            {
             respond LabelisationProjet.list()   
            }
               
        }
        
    } 

    def show(LabelisationProjet labelisationProjetInstance) {
        respond labelisationProjetInstance
    }
@Transactional
    def create(LabelisationProjet labelisationProjetInstance) {

        def profilBp=Profil.findByCode("BP")
        def bpliste=Utilisateur.findAllByProfil(profilBp)
        if(params.id) {
            if(session.profil=='porteur' && labelisationProjetInstance.etapePorteur==4 && labelisationProjetInstance.etapeBp==7)
        {
            def label=LabelisationProjet.get(params.id)
            label.etapeBp=8
           label.save(failOnError:true,flush:true)
        }
            
            
            respond LabelisationProjet.get(params.id),model:[etapePorteur:labelisationProjetInstance.etapePorteur,etapeBp:labelisationProjetInstance.etapeBp,etape:labelisationProjetInstance.etape]
        } else {
            respond new LabelisationProjet(params),model:[etapePorteur:0,etapeBp:1,etape:new Etape()]
        }  
    }
    
    // Porteur Actions
    @Transactional
    def saveEtape1Porteur(LabelisationProjet labelisationProjetInstance) {
        if(labelisationProjetInstance==null){
            def etape1=[numero:1,code:"info projet",libelle:'Info projet']
            def etapeInstance=new Etape(etape1)
            def etapeProjet="info Projet"
            def datefin=params.city
            def objet=[id:params.id,dateFin:Date.parse("dd/MM/yyyy",datefin), budget:params.budget, nomCompletProjet:params.nomCompletProjet, aap:params.aap, lienAap:params.lienAap, motsCles:params.motsCles, website:params.website, dateDebut:Date.parse("dd/MM/yyyy",params.dateDebut), fonction:params.fonction, duree:params.duree, nomProjet:params.nomProjet, interlocuteur:params.interlocuteur,resumeAnglais:params.resumeAnglais,resumeFrancais:params.resumeFrancais,aide:params.aide,etape:etapeInstance,etatProjet:"En cours"]
            def labelisationProjetInstance1= new LabelisationProjet(objet)
            labelisationProjetInstance1.etape=etapeInstance
            labelisationProjetInstance1.dateSoumissionProjet=new Date()
            
            labelisationProjetInstance1.porteurProjet=session.user
            labelisationProjetInstance1.etapeProjet=etapeProjet
            SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy HH:mm");//dd/MM/yyyy
            Date now = new Date();
          String strDate = sdfDate.format(now);
    
            
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm"); 

            // Convert from String to Date
            Date startDate = df.parse(strDate);
            
            labelisationProjetInstance1.raisonNonConformiteEtape10=strDate
            
            labelisationProjetInstance1.save(failOnError:true,flush:true)
            
            redirect(action: "create", id :labelisationProjetInstance1.id)
        }
        else{
def datefin=params.city
def etape1=[:]
            if(params.city==null || params.city=='null' || params.city=='')
            {
                datefin=labelisationProjetInstance.dateFin
                 etape1=[dateFin:datefin, budget:params.budget, nomCompletProjet:params.nomCompletProjet, aap:params.aap, lienAap:params.lienAap, motsCles:params.motsCles, website:params.website, dateDebut:Date.parse("dd/MM/yyyy",params.dateDebut), fonction:params.fonction, duree:params.duree, nomProjet:params.nomProjet, interlocuteur:params.interlocuteur,resumeAnglais:params.resumeAnglais,resumeFrancais:params.resumeFrancais,aide:params.aide,etatProjet:"En cours"]
            }
            else
            {
             etape1=[dateFin:Date.parse("dd/MM/yyyy",datefin), budget:params.budget, nomCompletProjet:params.nomCompletProjet, aap:params.aap, lienAap:params.lienAap, motsCles:params.motsCles, website:params.website, dateDebut:Date.parse("dd/MM/yyyy",params.dateDebut), fonction:params.fonction, duree:params.duree, nomProjet:params.nomProjet, interlocuteur:params.interlocuteur,resumeAnglais:params.resumeAnglais,resumeFrancais:params.resumeFrancais,aide:params.aide,etatProjet:"En cours"]   
            }
            
            SimpleDateFormat sdfDate = new SimpleDateFormat("MM/dd/yyyy HH:mm");//dd/MM/yyyy
            Date now = new Date();
          String strDate = sdfDate.format(now);
    
            
            DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm"); 

            // Convert from String to Date
            Date startDate = df.parse(strDate);
            
            labelisationProjetInstance.raisonNonConformiteEtape10=strDate
            
            labelisationProjetInstance.properties=etape1
            def etapeProjet="Info Projet"
            labelisationProjetInstance.etatProjet="En cours"
            def etape1bis=[numero:1,code:"info projet",libelle:'Info projet']
            def etapeInstancebis=new Etape(etape1bis)
            labelisationProjetInstance.etape=etapeInstancebis
            labelisationProjetInstance.etapeProjet=etapeProjet
            labelisationProjetInstance.save(failOnError:true,flush:true)
            //flash.message="Le projet pour Etape Infos Projet a été bien enristrer"
            redirect(action: "create", id :labelisationProjetInstance.id)
        }
    }
    
    @Transactional
    def SubmitEtape1Porteur(LabelisationProjet labelisationProjetInstance) {
        def listemails=[]
        if(labelisationProjetInstance==null){
            def etape1=[numero:1,code:"info projet",libelle:'Info projet']
            def etapeInstance=new Etape(etape1)
            def etapeProjet="Info Projet"
            def dateFin1=params.datefi
            def datefin=params.city
            if(params.city==null || params.city=='null' || params.city=='')
            {
                datefin=labelisationProjetInstance.dateFin
            }
            def objet=[id:params.id,dateFin:Date.parse("dd/MM/yyyy",datefin), budget:params.budget1, nomCompletProjet:params.nomCompletProjet, aap:params.aap, lienAap:params.lienAap, motsCles:params.motsCles, website:params.website, dateDebut:Date.parse("dd/MM/yyyy",params.dateDebut), fonction:params.fonction, duree:params.duree, nomProjet:params.nomProjet, interlocuteur:params.interlocuteur,resumeAnglais:params.resumeAnglais,resumeFrancais:params.resumeFrancais,aide:params.aide,etape:etapeInstance,etatProjet:"En cours"]
            labelisationProjetInstance= new LabelisationProjet(objet)
            labelisationProjetInstance.etape=etapeInstance
            labelisationProjetInstance.dateSoumissionProjet=new Date()
            
            SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy HH:mm");//dd/MM/yyyy
    Date now = new Date();
    String strDate = sdfDate.format(now);
    
            
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm"); 

            // Convert from String to Date
            Date startDate = df.parse(strDate);
            
            labelisationProjetInstance.raisonNonConformiteEtape10=strDate
            labelisationProjetInstance.porteurProjet=session.user
        }
        def etapeProjet="Info Projet"
        labelisationProjetInstance.etapeProjet=etapeProjet
        def datefin1=params.city
        if(params.city==null || params.city=='null' || params.city=='')
            {
                datefin1=labelisationProjetInstance.dateFin
            }
//         def etape1=[dateFin:Date.parse("dd/MM/yyyy",datefin1), budget:params.budget, nomCompletProjet:params.nomCompletProjet, aap:params.aap, lienAap:params.lienAap, motsCles:params.motsCles, website:params.website, dateDebut:Date.parse("dd/MM/yyyy",params.dateDebut), fonction:params.fonction, duree:params.duree, nomProjet:params.nomProjet, interlocuteur:params.interlocuteur,resumeAnglais:params.resumeAnglais,resumeFrancais:params.resumeFrancais,aide:params.aide,etatProjet:"encours"]
        def etape1=[budget:params.budget, nomCompletProjet:params.nomCompletProjet, aap:params.aap, lienAap:params.lienAap, motsCles:params.motsCles, website:params.website, dateDebut:Date.parse("dd/MM/yyyy",params.dateDebut), fonction:params.fonction, duree:params.duree, nomProjet:params.nomProjet, interlocuteur:params.interlocuteur,resumeAnglais:params.resumeAnglais,resumeFrancais:params.resumeFrancais,aide:params.aide,etatProjet:"En cours"]
        labelisationProjetInstance.properties=etape1
        labelisationProjetInstance.etapePorteur=1
        labelisationProjetInstance.etapeBp=2
        labelisationProjetInstance.etatProjet="En cours"
        
        labelisationProjetInstance.infoprojet=new Date()
SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy HH:mm");//dd/MM/yyyy
          Date now = new Date();
          String strDate = sdfDate.format(now);
    
            
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm"); 

            // Convert from String to Date
            Date startDate = df.parse(strDate);
            
            labelisationProjetInstance.raisonNonConformiteEtape10=strDate

        labelisationProjetInstance.save(failOnError:true,flush:true)
        def profilBp=Profil.findByCode("BP")
        def userByprofil=Utilisateur.findAllByProfil(profilBp)
        for(user in userByprofil){
            listemails.add(user.email)    
        }
        def templatemail=MailTemplate.findByCode("1-validation etape info projet")
        def template=templatemail.template.replace("nomprojet",labelisationProjetInstance.nomProjet)
        
        redirect(action: "list_projet",params:[encours:true])
    }
    
    @Transactional
    def saveEtape2Porteur() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        //labelisationProjetInstance.properties['rapporteurs'] = params.rapporteurs
        if(params.rapporteurs instanceof java.lang.String )
        {
            def conf=Utilisateur.get(params.rapporteurs)
            labelisationProjetInstance.addToRapporteurs(conf)
        }
        else
        {
            for(id in params.rapporteurs)
            {
                def conf=Utilisateur.get(id)
            labelisationProjetInstance.addToRapporteurs(conf)
            }
        }
            labelisationProjetInstance.accepterReglesConfidentialite=true
            labelisationProjetInstance.etapeBp=3
        labelisationProjetInstance.etatProjet="En cours"
        labelisationProjetInstance.save(failOnError:true,flush:true)
        attachUploadedFilesTo(labelisationProjetInstance)
  
        
        
        
        
        
        def presentation='presentation'
    
        if(params.presentation!='' && params.presentation!='null' && params.presentation!=null)
        {
            def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'presentation')
//          session.presentation="${urlserver}${request.contextPath}/attachmentable/download/${att.id}"
           session.presentation="${urlserver}/attachmentable/download/${att.id}" 
        }
        else
        {
            session.presentation=""
        }

        
        
        
        
        def profilBp=Profil.findByCode("BP")
            def listemails=[]
        def userByprofil=Utilisateur.findAllByProfil(profilBp)
        for(user in userByprofil){
            listemails.add(user.email)    
        }
        def evaluateurs=labelisationProjetInstance.evaluateurs
        def emailporteur=labelisationProjetInstance.porteurProjet.email
       def templatemail=MailTemplate.findByCode("3-acceptation+fichepresentation")
        def template=templatemail.template.replace("nomprojet",labelisationProjetInstance.nomProjet)
        def descri=templatemail.description.replace("nomprojet",labelisationProjetInstance.nomProjet)
       
        redirect(action: "list_projet",params:[encours:true])
    }
    
    @Transactional
    def saveEtape3Porteur() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        labelisationProjetInstance.etapeBp=4
        labelisationProjetInstance.save(failOnError:true,flush:true)
        attachUploadedFilesTo(labelisationProjetInstance)
        
        def presentation='presentation'
    
        if(params.presentationdetaillee!='' && params.presentationdetaillee!='null' && params.presentationdetaillee!=null)
        {
            def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'presentationdetaillee')
          session.presentationdetaillee="${request.contextPath}/attachmentable/download/${att.id}"
        }
        else
        {
            session.presentationdetaillee=""
        }
        
        if(params.ficheTechnique!='' && params.ficheTechnique!='null' && params.ficheTechnique!=null)
        {
            def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'ficheTechnique')
          session.ficheTechnique="${request.contextPath}/attachmentable/download/${att.id}"
        }
        else
        {
            session.ficheTechnique=""
        }
        
        
        def profilBp=Profil.findByCode("BP")
        def utilisateur1=Utilisateur.findAllByProfil(profilBp)
            def listemails=[]
            listemails.add(utilisateur1.email)
        
        def templatemail=MailTemplate.findByCode("fichetechnique+fichedetaille")
        def template=templatemail.template.replace("nomprojet",labelisationProjetInstance.nomProjet)
        def description=templatemail.description.replace("nomprojet",labelisationProjetInstance.nomProjet)
        
        
labelisationProjetInstance.etatProjet="En cours"
            def etape1bis=[numero:3,code:"Pitch CT",libelle:'Pitch CT']
            def etapeInstancebis=new Etape(etape1bis)
            labelisationProjetInstance.etape=etapeInstancebis
        redirect(action: "list_projet",params:[encours:true])
    }
    
    @Transactional
    def saveEtape4Porteur() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        labelisationProjetInstance.save(failOnError:true,flush:true)
       redirect(action: "list_projet",params:[encours:true])
    }
    
    
    // BP Actions
    @Transactional
    def saveEtape1Bp() {
        def evaluateurs=params.evaluateurs
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        //labelisationProjetInstance.etatProjet="encours"
        def etape1bis=[numero:2,code:"recevabilite",libelle:'Recevabilite']
        def etapeProjet="Recevabilité"
        labelisationProjetInstance.etapeProjet=etapeProjet
            def etapeInstancebis=new Etape(etape1bis)
            labelisationProjetInstance.etape=etapeInstancebis
        if(params.recevable=="true"){
            labelisationProjetInstance.etatProjet="En cours"
            labelisationProjetInstance.recevable=true
            labelisationProjetInstance.raisonRecevabilite=params.raisonRecevabilite
            labelisationProjetInstance.reglesGestion=params.reglesGestion
            labelisationProjetInstance.lieuAuditionEtape1Bp=params.lieuAuditionEtape1Bp
            labelisationProjetInstance.dateAuditionEtape1Bp=Date.parse("dd/MM/yyyy hh:mm:ss",params.dateAuditionEtape1Bp)
            labelisationProjetInstance.clusters=getHasmany("clusters","com.rabbahsoft.mnc.Cluster")
            def listevaluateurs=[]
            def commithematique=[]

            def profilBp=Profil.findByCode("BP")
            
            
            if(evaluateurs!=null && evaluateurs!='null' && evaluateurs!='')
            {
               if(evaluateurs instanceof String)
            {
                def ev=Utilisateur.get(Long.parseLong(evaluateurs))
                listevaluateurs.add(ev.email)
               labelisationProjetInstance.addToEvaluateurs(ev)
            }
            else
            {
                for(evaluateur in evaluateurs)
                {
                    def ev=Utilisateur.get(Long.parseLong(evaluateur))
                    listevaluateurs.add(ev.email)
                    labelisationProjetInstance.addToEvaluateurs(ev)
                }
            } 
            }
            if(params.autre!=null && params.autre!='null' && params.autre!='')
            {
                def autre=params.autre 
                def list=[]
                list=autre.split(";")
                if(list!=null)
                {
                    for(aut in list)
                    {
                      listevaluateurs.add(aut)  
                    }
                }
            labelisationProjetInstance.autre=params.autre  
            }
          labelisationProjetInstance.etapePorteur=2
            labelisationProjetInstance.comitesThematiques=getHasmany("comitesThematiques","com.rabbahsoft.securite.ComiteThematique")
            labelisationProjetInstance.reglesConfidentialite=params.reglesConfidentialite
            def path1=null
            def lien=""
//            if(params.notificationrecevabilite!=null && params.notificationrecevabilite!='null' && params.notificationrecevabilite!='')
            if(params.recevable=="true")
            {

                labelisationProjetInstance.notificationrecevabilite=params.notificationrecevabilite
def documentInstance1=Document.findByCode("lettreConfidentialite")
                if(documentInstance1.getTotalAttachments('lettreConfidentialite')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(documentInstance1.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'lettreConfidentialite')
                                def ext=att.id
        path1="${userHome}/mncupload/com.rabbahsoft.mnc.Document/${documentInstance1.id}/${ext}.${att.ext}"
        
     }
        def templatemail=MailTemplate.findByCode("1_RECEVABILITE_OK")
        def templateintial=templatemail.template
        def mailporteur=labelisationProjetInstance.porteurProjet.email
        def descr=templatemail.description
        def dt=params.dateAuditionEtape1Bp
        def template=templatemail.template.replace("XXXX",dt.substring(0,10))
         template=template.replace("XX",dt.substring(11,16))

//def gg="<a href='${urlserver}${request.contextPath}/labelisationProjet/downloadLettreConfidentialite1bp?id=${labelisationProjetInstance.id}'>lettre confidentialite</a>" 
def gg="<a href='${urlserver}/labelisationProjet/downloadLettreConfidentialite1bp?id=${labelisationProjetInstance.id}'>lettre confidentialite</a>"
                
         lien=template+" est veuillez telecharger les documents a partir du lien suivant "+gg
        try
        {
                sendMail {

            bcc mailporteur
from "labellisation@mnc.ma"
            subject descr
html lien
        }
        }
        catch(Exception e)
                {
                    
                    e.getMessage()
//  println("11111 catch "+e.getMessage())
                }
    
            }

            labelisationProjetInstance.affirmationCT=params.affirmationCT
def documentInstance=Document.findByCode("lettreConfidentialite")
                if(documentInstance.getTotalAttachments('lettreConfidentialite')!=0)
                {

                   def attc=AttachmentLink.findByReferenceId(documentInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'lettreConfidentialite')
                                def ext=att.id
                               
        def path="${userHome}/mncupload/com.rabbahsoft.mnc.Document/${documentInstance.id}/${ext}.${att.ext}"
        def templatemail=MailTemplate.findByCode("1_RECEVABILITE_OK")
        def templateintial=templatemail.template
        
        def descr=templatemail.description
        def dt=params.dateAuditionEtape1Bp
        def template=templatemail.template.replace("XXXX",dt.substring(0,10))
         template=template.replace("XX",dt.substring(11,16))
                
        def gg1="<a href='${urlserver}/labelisationProjet/downloadLettreConfidentialite1bp?id=${labelisationProjetInstance.id}'>lettre confidentialite</a>"
        lien=""
         lien=template+" est veuillez telecharger les documents a partir du lien suivant "+gg1
               
                
                try
                {

                          sendMail {
             to listevaluateurs.toArray()
            from "labellisation@mnc.ma"
            subject descr
            html lien
        }  
                }
                catch(Exception e)
                {
                    
                    e.getMessage()
//println("2222 catch "+e.getMessage())
                }
 
                }
               

         } 
        if(params.recevable=="false"){
            //labelisationProjetInstance.etatProjet="rejete"
            def etape1bis1=[numero:2,code:"recevabilite",libelle:'recevabilite']
            def etapeInstancebis1=new Etape(etape1bis1)
            labelisationProjetInstance.etape=etapeInstancebis1
            labelisationProjetInstance.etatProjet="rejet"
            labelisationProjetInstance.recevable=false
            labelisationProjetInstance.raisonRecevabilite=params.raisonRecevabilite
            labelisationProjetInstance.etapeBp=2
            def mailporteur=labelisationProjetInstance.porteurProjet.email
        def profilBp=Profil.findByCode("BP")
            def utilisateuradmin=Utilisateur.findAllByProfil(profilBp)
//            def emailutilisateuradmin=utilisateuradmin.email
            def description="recevabilite du  projet :"+labelisationProjetInstance.nomProjet
            def temp="desole votre projet :"+labelisationProjetInstance.nomProjet+" n'est recevable pour la raison :"+params.raisonRecevabilite

            
            
            def templatemail=MailTemplate.findByCode("1_RECEVABILITE_KO")
        def templateintial=templatemail.template
        
        def descr=templatemail.description
        
                try
                {

                          sendMail {
             to listevaluateurs.toArray()
            from "labellisation@mnc.ma"
            subject descr
            html templateintial
        }  
                }
                catch(Exception e)
                {
                   
                    e.getMessage()
//println("33333 catch "+e.getMessage())
                }
            
            
            
            
            
        }
       
     if(params.dateAuditionEtape1Bp!=null && params.dateAuditionEtape1Bp!='null' && params.dateAuditionEtape1Bp!="")
        {
        def date1=Date.parse("dd/MM/yyyy",params.dateAuditionEtape1Bp)
        labelisationProjetInstance.dateAuditionEtape1Bp=date1 
        String dateString = null;
   SimpleDateFormat sdfr = new SimpleDateFormat("dd/MMM/yyyy");
   try{
	dateString = sdfr.format( labelisationProjetInstance.dateAuditionEtape1Bp );
   }catch (Exception ex ){
	System.out.println(ex);
   }       
        if(params.recevable=="true")
        {
            labelisationProjetInstance.commentaire="1-Date audition proposée:"+dateString+" lieu audition:"+params.lieuAuditionEtape1Bp+"</br>" 
        }
   
                }
                
        
        SimpleDateFormat sdfDate = new SimpleDateFormat("MM/dd/yyyy HH:mm");//dd/MM/yyyy
            Date now = new Date();
          String strDate = sdfDate.format(now);
    
            
            DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm"); 

            // Convert from String to Date
            Date startDate = df.parse(strDate);
            
          labelisationProjetInstance.recevabilite=startDate
          
        labelisationProjetInstance.save(failOnError:true,flush:true)
        servletContext.setAttribute("validation recevabilite",new Date())

       redirect(controller : "labelisationProjet", action : "list_projet", params:[global:true]) 
    }
    

    
    @Transactional
    def saveEtape2Bp() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        bindData(labelisationProjetInstance, params, [include:['rapporteursconfirmes']])
        labelisationProjetInstance.properties = params.rapporteursconfirmes
        def listevaluateurs=[]
        if(params.decisionEtape2Bp=="preselection")
        {
            attachUploadedFilesTo(labelisationProjetInstance)
            labelisationProjetInstance.etatProjet="En cours"
            def etape1bis=[numero:3,code:"Pitch CT",libelle:'Pitch CT']
            def etapeInstancebis=new Etape(etape1bis)
            labelisationProjetInstance.etape=etapeInstancebis
            def etapeProjet="Pitch CT"
        labelisationProjetInstance.etapeProjet=etapeProjet
            
            labelisationProjetInstance.etapePorteur=3
            labelisationProjetInstance.decisionEtape2Bp=params.decisionEtape2Bp
            
            
            if(params.datePreselectionEtape2Bp)
        {
        def date1=Date.parse("dd/MM/yyyy",params.datePreselectionEtape2Bp)
        labelisationProjetInstance.datePreselectionEtape2Bp=date1 
        String dateString = null;
   SimpleDateFormat sdfr = new SimpleDateFormat("dd/MMM/yyyy");
   try{
	dateString = sdfr.format( labelisationProjetInstance.datePreselectionEtape2Bp );
   }catch (Exception ex ){
	System.out.println(ex);
   }
            
            
        labelisationProjetInstance.commentaire+="2-Date présélection réelle :"+dateString+"</br>"
        }
            
            
             if(params.autre!=null && params.autre!='null' && params.autre!='')
            {
            labelisationProjetInstance.autre=params.autre  
            }
            
            
            def templatemail=MailTemplate.findByCode("2_PITCHCT_PRESELECTION")
        def templateintial=templatemail.template
        def mailporteur=labelisationProjetInstance.porteurProjet.email
        def descr=templatemail.description
        
            def dt=params.datePreselectionEtape2Bp
        def template=templatemail.template.replace("XXXX",dt.substring(0,10))
//         template=template.replace("XXX",dt.substring(11,16))
                
        def lien=template
        try
        {
                sendMail {

            bcc mailporteur
from "labellisation@mnc.ma"
            subject descr
html lien
        }

        }
        catch(Exception e)
                {
//                    println("44444 catch ")
                    e.getMessage()

                }
            
            
            
        } 
        if(params.decisionEtape2Bp=="reaudition"){
            labelisationProjetInstance.etatProjet="encours pour reaudition"
            def etape1bis=[numero:3,code:"Pitch CT",libelle:'Pitch CT']
            def etapeInstancebis=new Etape(etape1bis)
            def etapeProjet="Pitch CT"
        labelisationProjetInstance.etapeProjet=etapeProjet
            labelisationProjetInstance.etapeBp=3
            labelisationProjetInstance.etape=etapeInstancebis
            labelisationProjetInstance.decisionEtape2Bp=params.decisionEtape2Bp
            
           
               if(params.dateReauditionEtape2Bp)
        {
        def date1=Date.parse("dd/MM/yyyy",params.dateReauditionEtape2Bp)
        labelisationProjetInstance.dateReauditionEtape2Bp=date1 
        String dateString = null;
   SimpleDateFormat sdfr = new SimpleDateFormat("dd/MMM/yyyy");
   try{
	dateString = sdfr.format( labelisationProjetInstance.dateReauditionEtape2Bp );
   }catch (Exception ex ){
	System.out.println(ex);
   }
            
        labelisationProjetInstance.commentaire+="Date reaudition proposée:"+dateString+"</br>"
        }
            
        }
        if(params.decisionEtape2Bp=="redirection"){
            labelisationProjetInstance.etatProjet="redirection"
            def etape1bis=[numero:3,code:"Pitch CT",libelle:'Pitch CT']
            def etapeProjet="Pitch CT"
        labelisationProjetInstance.etapeProjet=etapeProjet
            def etapeInstancebis=new Etape(etape1bis)
            labelisationProjetInstance.etapeBp=3
            labelisationProjetInstance.etape=etapeInstancebis
            labelisationProjetInstance.decisionEtape2Bp=params.decisionEtape2Bp
            
             def templatemail=MailTemplate.findByCode("2_PITCHCT_REDIRECTION")
        def templateintial=templatemail.template
        def mailporteur=labelisationProjetInstance.porteurProjet.email
        def descr=templatemail.description
        def template=templatemail.template.replace("XXX",params.structureAccompagnement)
                
        def lien=template
        
        try
        {
                sendMail {

            bcc mailporteur
from "labellisation@mnc.ma"
            subject descr
html lien
        }

        }
        catch(Exception e)
                {
//                    println("55555 catch ")
                    e.getMessage()

                }
        }
        if(params.decisionEtape2Bp=="rejete"){
            labelisationProjetInstance.etatProjet="rejet"
            def etape1bis=[numero:3,code:"Pitch CT",libelle:'Pitch CT']
            def etapeProjet="Pitch CT"
        labelisationProjetInstance.etapeProjet=etapeProjet
            labelisationProjetInstance.etapeBp=3
            def etapeInstancebis=new Etape(etape1bis)
            labelisationProjetInstance.etape=etapeInstancebis
            labelisationProjetInstance.decisionEtape2Bp=params.decisionEtape2Bp
            labelisationProjetInstance.commentaire+="Projet rejeté pour les raisons :"+params.raisonRejetEtape2Bp+"</br>"
          def templatemail=MailTemplate.findByCode("2_PITCHCT_REJET")
        def templateintial=templatemail.template
        def mailporteur=labelisationProjetInstance.porteurProjet.email
        def descr=templatemail.description
        def template=templatemail.template
                
        def lien=template
        
        try
        {
                sendMail {

            bcc mailporteur
from "labellisation@mnc.ma"
            subject descr
html lien
        }

        }
        catch(Exception e)
                {
//                    println("6666 catch ")
                    e.getMessage()

                }  
            
        }
        //        labelisationProjetInstance.etapePorteur=2
        def pictures = labelisationProjetInstance.getAttachments('preselection')
        
        
        labelisationProjetInstance.structureAccompagnement=params.structureAccompagnement
        labelisationProjetInstance.raisonRejetEtape2Bp=params.raisonRejetEtape2Bp
//        labelisationProjetInstance.etapePorteur=3
        labelisationProjetInstance.valideEtapePitchct=params.valideEtapePitchct
        labelisationProjetInstance.save(failOnError:true,flush:true)
        def listemails=[]
        //def utlisateur1=Utilisateur.get(servletContext.getAttribute("porteur"))
       if(params.rapporteursconfirmes!=null && params.rapporteursconfirmes!='null' && params.rapporteursconfirmes!='')
       {
           for(rappconf in labelisationProjetInstance.rapporteursconfirmes)
           {
            listemails.add(rappconf.email)   
           }
       }
       
        listemails.add(labelisationProjetInstance.porteurProjet.email)        
        def presentation='rapportCT'
        
        
        
        
        if(params.rapportCT!='' && params.rapportCT!='null' && params.rapportCT!=null)
        {
            def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'rapportCT')
                                if(att!='' && att!='null' && att!=null)
                                {
                                   session.rapportCT="${request.contextPath}/attachmentable/download/${att.id}"  
                                }
                                else
                                {
                                    session.rapportCT=""
                                }
        }
        else
        {
            session.rapportCT=""
        }

        
        
        
        
        
        def pict = labelisationProjetInstance.getAttachments('rapportCT')[0]
        if(pict=='null' || pict=='' || pict==null)
        {
            
        redirect(controller : "labelisationProjet", action : "list_projet", params:[global:true]) 
        }
        else
        {
            def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'rapportCT')
                                def ext=att.id
        def path="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
        def templatemail=MailTemplate.findByCode("3-projet preselectionne")
        def template=templatemail.template.replace("nomprojet",labelisationProjetInstance.nomProjet)
        def profilBp=Profil.findByCode("BP")
            def utilisateuradmin=Utilisateur.findAllByProfil(profilBp)
            def emailutilisateuradmin=utilisateuradmin.email
           if(params.autre!=null && params.autre!='null' && params.autre!='')
            {
                def autre=params.autre 
                def list=[]
                list=autre.split(";")
                if(list!=null)
                {
                    for(aut in list)
                    {
                      listemails.add(aut)  
                    }
                }
            labelisationProjetInstance.autre=params.autre  
            }
    
        redirect(controller : "labelisationProjet", action : "list_projet", params:[global:true]) 
        } 
        
                        
    }
     @Transactional
    def saveEtape3Bp() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        labelisationProjetInstance.commentaireftfd=params.commentaireftfd
        labelisationProjetInstance.etapeBp=5
        labelisationProjetInstance.etatProjet="En cours"
            def etape1bis=[numero:4,code:"PD+FT",libelle:'PD+FT']
            def etapeProjet="PD+FT"
        labelisationProjetInstance.etapeProjet=etapeProjet
            def etapeInstancebis=new Etape(etape1bis)
            labelisationProjetInstance.etape=etapeInstancebis
//            debut  recement modifier
//        def evaluateurs=params.rapporteurs 
        def evaluateurs=labelisationProjetInstance.rapporteursconfirmes
//        fin recement modifier
 
        
        
        def listevaluateurs=[]
        if(evaluateurs!=null && evaluateurs!='null' && evaluateurs!='')
            {
               if((evaluateurs instanceof String) ||(evaluateurs instanceof Long))
            {
                def ev=Utilisateur.get(Long.parseLong(evaluateurs.id))
//                def ev=Utilisateur.get(Long.parseLong(evaluateurs))
                listevaluateurs.add(ev.email)
               labelisationProjetInstance.addToRapporteurs(ev)
            }
            else
            {
                for(evaluateur in evaluateurs)
                {
//                    def ev=Utilisateur.get(Long.parseLong(evaluateur.id))
                    def ev=Utilisateur.get(evaluateur.id)
                    listevaluateurs.add(ev.email)
                    labelisationProjetInstance.addToRapporteurs(ev)
                }
            } 
            }
       if(params.autre!=null && params.autre!='null' && params.autre!='')
            {
                def autre=params.autre 
                def list=[]
                list=autre.split(";")
                if(list!=null)
                {
                    for(aut in list)
                    {
                      listevaluateurs.add(aut)  
                    }
                }
            labelisationProjetInstance.autre=params.autre  
            }
        
        
        labelisationProjetInstance.save(failOnError:true,flush:true)
         def profilporteur=Profil.findByCode("porteur")
         def listemails=[]
        def userByprofil=Utilisateur.findAllByProfil(profilporteur)
        for(user in userByprofil){
            listemails.add(user.email)    
        }
         def profilBp=Profil.findByCode("BP")
            def emailutilisateuradmin
            
//            emailutilisateuradmin=utilisateuradmin[0].email

        
        def templatemail="confirmation de la bonne réception de la  fiche technique et de la  fiche détaillé concernant le projet :nomprojet"
        def template=templatemail.replace("nomprojet",labelisationProjetInstance.nomProjet)
        def description="la bonne reception du fiche technique et fiche detaille"
        
        
        def mailporteur=labelisationProjetInstance.porteurProjet.email
//        def gg="<a href='${urlserver}${request.contextPath}/labelisationProjet/downloadfichetechniquepresentationdetaille?id=${labelisationProjetInstance.id}'>documents</a>"
        def gg="<a href='${urlserver}/labelisationProjet/downloadfichetechniquepresentationdetaille?id=${labelisationProjetInstance.id}'>documents</a>"
        def lien=template+" veuillez telecharger les documents a partir du lien suivant "+gg

        try
        {
                  sendMail {
            to listevaluateurs.toArray()
             from "labellisation@mnc.ma"
            subject description
            html lien 
        }
        }
        catch(Exception e)
        {
            e.getMessage()
        }
        

        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    
    @Transactional
    def saveEtape4Bp() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        labelisationProjetInstance.etatProjet="En cours"
            def etape1bis=[numero:5,code:"Appel a competence",libelle:'Appel a competence']
            def etapeProjet="Appel a competence"
        labelisationProjetInstance.etapeProjet=etapeProjet
            def etapeInstancebis=new Etape(etape1bis)
            labelisationProjetInstance.etape=etapeInstancebis
            def listevaluateurs=[]
            
         def profilBp=Profil.findByCode("BP")
            def emailutilisateuradmin
            
        
//            emailutilisateuradmin=utilisateuradmin[0].email

        
        if(params.competenceexternesollicite=="true"){
            
                     if(params.competenceexterne1!=null && params.competenceexterne1!='null' && params.competenceexterne1!='')
            {
                def autre=params.competenceexterne1
                def list=[]
                list=autre.split(";")
                if(list!=null)
                {
                    for(aut in list)
                    {
                      listevaluateurs.add(aut)  
                    }
                }
            labelisationProjetInstance.competenceexterne1=params.competenceexterne1 
            }
            
            
            
//            labelisationProjetInstance.etapePorteur=4
labelisationProjetInstance.etapeBp=6 
            labelisationProjetInstance.recevable=true
        }
        else{
            labelisationProjetInstance.etapeBp=6 
            labelisationProjetInstance.recevable=false
        }
        labelisationProjetInstance.save(failOnError:true,flush:true)
         def profilporteur=Profil.findByCode("porteur")
         def listemails=[]
        def userByprofil=Utilisateur.findAllByProfil(profilporteur)
        for(user in userByprofil){
            listevaluateurs.add(user.email)    
        }
        def path1=null
        def nomexacte=null
        def nomexacte1=null
 String zipFile = "${userHome}/mncupload/projetdocs.zip";
          if(labelisationProjetInstance.getTotalAttachments('ficheTechnique')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'ficheTechnique')
                                def ext=att.id
        path1="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
        
        nomexacte="${ext}.${att.ext}"
        nomexacte1=nomexacte.replace("${ext}","ficheTechnique")
        
            try {

            byte[] buffer = new byte[1024];
            FileOutputStream fos = new FileOutputStream(zipFile);

            ZipOutputStream zos = new ZipOutputStream(fos);
                File srcFile = new File(path1);
                FileInputStream fis = new FileInputStream(srcFile);
                zos.putNextEntry(new ZipEntry("${nomexacte1}"));
                int length;
                while ((length = fis.read(buffer)) > 0) {

                    zos.write(buffer, 0, length);

                }
                zos.closeEntry();

                fis.close();
            zos.close();
        }

        catch (IOException ioe) {

            System.out.println("Error creating zip file: " + ioe);

        }
            
            
            
            
            
        }
        
             def path2=null   
             def nomexactepresen=null
        def nomexactepresen1=null
        if(labelisationProjetInstance.getTotalAttachments('presentationdetaillee')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'presentationdetaillee')
                                def ext=att.id
        path2="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"   
        nomexactepresen="${ext}.${att.ext}"
        nomexactepresen1=nomexactepresen.replace("${ext}","presentationdetaillee")
        
             try {

            byte[] buffer = new byte[1024];
            FileOutputStream fos = new FileOutputStream(zipFile);

            ZipOutputStream zos = new ZipOutputStream(fos);
                File srcFile = new File(path2);
                FileInputStream fis = new FileInputStream(srcFile);
                zos.putNextEntry(new ZipEntry("${nomexactepresen1}"));
                int length;
                while ((length = fis.read(buffer)) > 0) {

                    zos.write(buffer, 0, length);

                }
                zos.closeEntry();

                fis.close();
            zos.close();
        }

        catch (IOException ioe) {

            System.out.println("Error creating zip file: " + ioe);

        }
            
            
            
            
        }
                
        def path3=null   
        def nomexactelettre=null
        def nomexactelettre1=null
        if(labelisationProjetInstance.getTotalAttachments('lettreConfidentialite')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'lettreConfidentialite')
                                def ext=att.id
        path3="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
nomexactelettre="${ext}.${att.ext}"
        nomexactelettre1=nomexactelettre.replace("${ext}","lettreConfidentialite")    
        
             try {

            byte[] buffer = new byte[1024];
            FileOutputStream fos = new FileOutputStream(zipFile);

            ZipOutputStream zos = new ZipOutputStream(fos);
                File srcFile = new File(path3);
                FileInputStream fis = new FileInputStream(srcFile);
                zos.putNextEntry(new ZipEntry("${nomexactelettre1}"));
                int length;
                while ((length = fis.read(buffer)) > 0) {

                    zos.write(buffer, 0, length);

                }
                zos.closeEntry();

                fis.close();
            zos.close();
        }

        catch (IOException ioe) {

            System.out.println("Error creating zip file: " + ioe);

        }
            
        }
                
        def nomexacterapport=null
        def nomexacterapport1=null
        def path4=null   
        if(labelisationProjetInstance.getTotalAttachments('rapportCT')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'rapportCT')
                                def ext=att.id
        path4="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
           nomexacterapport="${ext}.${att.ext}"
        nomexacterapport1=nomexacterapport.replace("${ext}","rapportCT")  
         try {

            byte[] buffer = new byte[1024];
            FileOutputStream fos = new FileOutputStream(zipFile);

            ZipOutputStream zos = new ZipOutputStream(fos);
                File srcFile = new File(path4);
                FileInputStream fis = new FileInputStream(srcFile);
                zos.putNextEntry(new ZipEntry("${nomexacterapport1}"));
                int length;
                while ((length = fis.read(buffer)) > 0) {

                    zos.write(buffer, 0, length);

                }
                zos.closeEntry();

                fis.close();
            zos.close();
        }

        catch (IOException ioe) {

            System.out.println("Error creating zip file: " + ioe);

        }
        }
        def path5=null   
        def nomexactegrille=null
        def nomexactegrille1=null
        if(labelisationProjetInstance.getTotalAttachments('grilleAnalyse')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'grilleAnalyse')
                                def ext=att.id
        path5="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
        nomexactegrille="${ext}.${att.ext}"
        nomexactegrille1=nomexactegrille.replace("${ext}","grilleAnalyse")
         try {

            byte[] buffer = new byte[1024];
            FileOutputStream fos = new FileOutputStream(zipFile);

            ZipOutputStream zos = new ZipOutputStream(fos);
                File srcFile = new File(path5);
                FileInputStream fis = new FileInputStream(srcFile);
                zos.putNextEntry(new ZipEntry("${nomexactegrille1}"));
                int length;
                while ((length = fis.read(buffer)) > 0) {

                    zos.write(buffer, 0, length);

                }
                zos.closeEntry();

                fis.close();
            zos.close();
        }

        catch (IOException ioe) {

            System.out.println("Error creating zip file: " + ioe);

        }
        }
        def path6=null   
        def nomexactepresent=null
        def nomexactepresent1=null
        if(labelisationProjetInstance.getTotalAttachments('presentation')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'presentation')
                                def ext=att.id
        path6="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"        
        nomexactepresent="${ext}.${att.ext}"
        nomexactepresent1=nomexactepresent.replace("${ext}","presentation")
         try {

            byte[] buffer = new byte[1024];
            FileOutputStream fos = new FileOutputStream(zipFile);

            ZipOutputStream zos = new ZipOutputStream(fos);
                File srcFile = new File(path6);
                FileInputStream fis = new FileInputStream(srcFile);
                zos.putNextEntry(new ZipEntry("${nomexacte1}"));
                int length;
                while ((length = fis.read(buffer)) > 0) {

                    zos.write(buffer, 0, length);

                }
                zos.closeEntry();

                fis.close();
            zos.close();
        }

        catch (IOException ioe) {

            System.out.println("Error creating zip file: " + ioe);

        }
        }        
            def templatemail=MailTemplate.findByCode("5-mailAccepterReglesConfidentialite(porteur+CT)")
        def templateintial=templatemail.template
        def template=templatemail.template.replace("nom projet",labelisationProjetInstance.nomProjet)
         def templatemail1=MailTemplate.findByCode("5-mailAccepterReglesConfidentialite(porteur+CT)")
        def templateintial1=templatemail.template
        def template1=templatemail.template.replace("nom projet",labelisationProjetInstance.nomProjet)

        def mailporteur=labelisationProjetInstance.porteurProjet.email
      
        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    
    @Transactional
    def saveEtape5Bp() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        labelisationProjetInstance.etapeBp=7
        
         def profilBp=Profil.findByCode("BP")
            def emailutilisateuradmin
            
            //emailutilisateuradmin=utilisateuradmin[0].email

            labelisationProjetInstance.etatProjet="En cours"
            def etapeProjet="Resultat evaluation"
        labelisationProjetInstance.etapeProjet=etapeProjet
            def etape1bis=[numero:6,code:"Resultat evaluation",libelle:'Resultat evaluation']
            def etapeInstancebis=new Etape(etape1bis)
            labelisationProjetInstance.etape=etapeInstancebis
        labelisationProjetInstance.save(failOnError:true,flush:true)
        attachUploadedFilesTo(labelisationProjetInstance)
         def profilporteur=Profil.findByCode("porteur")
         def listemails=[]
        def userByprofil=Utilisateur.findAllByProfil(profilporteur)
        for(user in userByprofil){
            listemails.add(user.email)    
        }
        def templatemail="le projet:nomprojet a été noter"
        def template=templatemail.replace("nomprojet",labelisationProjetInstance.nomProjet)
        def description="notation du projet"
        def mailporteur=labelisationProjetInstance.porteurProjet.email
        
        try
        {
                   sendMail {
            to mailporteur
            from "labellisation@mnc.ma"
            subject description
            html template
        } 
        }
        catch(Exception e)
        {
            e.getMessage()
        }

        
        def path2=null
         if(labelisationProjetInstance.getTotalAttachments('presentation1')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'presentation1')
                                def ext=att.id
        path2="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
        session.grilleAnalyse="${request.contextPath}/attachmentable/download/${att.id}"
            def listevaluateurs=[]
            for(ev in labelisationProjetInstance.evaluateurs) 
            {
              listevaluateurs.add(ev.email)  
            }
      def templatemail1="la notation du  projet:nomprojet"
        def template1=templatemail.replace("nomprojet",labelisationProjetInstance.nomProjet)
//        def gg="<a href='${urlserver}${request.contextPath}/labelisationProjet/downloadgrilleanalyse?id=${labelisationProjetInstance.id}'>grille analyse</a>"
        def gg="<a href='${urlserver}/labelisationProjet/downloadgrilleanalyse?id=${labelisationProjetInstance.id}'>grille analyse</a>"
            template1=template1+" veuillez  telecharger le doc a partir du lien suivant:"+gg
            def description1="notation du projet"
        try
        {
                   sendMail {
            to listevaluateurs.toArray()
            from "labellisation@mnc.ma"
            subject description1
            html template1
            
        }  
        }
        catch(Exception e)
        {
            e.getMessage()

        }
            

        
        
        }
        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    
    @Transactional
    def saveEtape6Bp() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        if(params.decisionEtape6Bp=="avisFavorable"){
            
            labelisationProjetInstance.etatProjet="En cours"
            def etape1bis=[numero:7,code:"Validation VGA",libelle:'Validation VGA']
def etapeProjet="Validation VGA"
        labelisationProjetInstance.etapeProjet=etapeProjet
            def etapeInstancebis=new Etape(etape1bis)
            labelisationProjetInstance.etape=etapeInstancebis
            labelisationProjetInstance.decisionEtape6Bp="avisFavorable"
            
            labelisationProjetInstance.etapePorteur=4
            labelisationProjetInstance.etapeBp=8
            
            labelisationProjetInstance.lieuAuditionEtape6Bp=params.lieuAuditionEtape6Bp
             if(params.dateValidation!=null && params.dateValidation!='null' && params.dateValidation!='')
            {
                
            labelisationProjetInstance.dateValidation=Date.parse("dd/MM/yyyy hh:mm:ss",params.dateValidation) 
            String dateString = null;
   SimpleDateFormat sdfr = new SimpleDateFormat("dd/MMM/yyyy");
   try{
	dateString = sdfr.format( labelisationProjetInstance.dateValidation );
   }catch (Exception ex ){
	System.out.println(ex);
   }
            labelisationProjetInstance.commentaire+="3-La date de validation réelle:"+dateString+"</br>"
            }
            if(params.dateAuditionEtape6Bp!=null && params.dateAuditionEtape6Bp!='null' && params.dateAuditionEtape6Bp!='')
            {
                
            labelisationProjetInstance.dateAuditionEtape6Bp=Date.parse("dd/MM/yyyy hh:mm:ss",params.dateAuditionEtape6Bp) 
             String dateString = null;
   SimpleDateFormat sdfr = new SimpleDateFormat("dd/MMM/yyyy");
   try{
	dateString = sdfr.format( labelisationProjetInstance.dateAuditionEtape6Bp );
   }catch (Exception ex ){
	System.out.println(ex);
   }
            labelisationProjetInstance.commentaire+="4-La date rendez-vous commex proposée:"+dateString+" "
            }
            labelisationProjetInstance.commentaire+=",  lieu  :"+params.lieuAuditionEtape6Bp+"</br>"
           
            
            def profilporteur=Profil.findByCode("porteur")
         def listemails=[]
        def userByprofil=Utilisateur.findAllByProfil(profilporteur)
        for(user in userByprofil){
            listemails.add(user.email)    
        }
        def templatemail="Invitation au Commex pour le projet :nomprojet"
        def template=templatemail.replace("nomprojet",labelisationProjetInstance.nomProjet)
        def description="invitation Commex"
            
             def profilBp=Profil.findByCode("BP")
            def emailutilisateuradmin
            
            //emailutilisateuradmin=utilisateuradmin[0].email
            
            def path5=null   
        if(labelisationProjetInstance.getTotalAttachments('grilleAnalyse')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'grilleAnalyse')
                                def ext=att.id
        path5="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"        
        }
        def mailporteur=labelisationProjetInstance.porteurProjet.email
           
            
            def templatemail1=MailTemplate.findByCode("4_EVALCT_OK")
        def templateintial=templatemail1.template
        def descr1=templatemail1.description
        
            def dt=params.dateAuditionEtape6Bp
        def template1=templatemail1.template.replace("XXX",dt.substring(0,10))
         template1=template1.replace("XXXX",dt.substring(11,16))
          template1=template1.replace("XX",params.lieuAuditionEtape6Bp)  
                
        try
        {
   
                sendMail {
             to mailporteur
            from "labellisation@mnc.ma"
            subject descr1
            html template1
        }  
        }
        catch(Exception e)
                {
                    
                    e.getMessage()
                }
            
            
            
            
            
            
            
        }
        if(params.decisionEtape6Bp=="rejete"){
            labelisationProjetInstance.etatProjet="rejet"
            def etape1bis=[numero:7,code:"Validation VGA",libelle:'Validation VGA']
            def etapeInstancebis=new Etape(etape1bis)
            labelisationProjetInstance.etape=etapeInstancebis
            labelisationProjetInstance.decisionEtape6Bp="rejete"
            labelisationProjetInstance.etapePorteur=5
            labelisationProjetInstance.raisonRejetEtape6Bp=params.raisonRejetEtape6Bp
            
            
            labelisationProjetInstance.commentaire+="Projet rejeté  :</br>"
            
           def templatemail1=MailTemplate.findByCode("4_EVAL_CT_KO")
        def templateintial=templatemail1.template
        def descr1=templatemail1.description
        def template1=templatemail1.template.replace("XXXX - XXXX - XXXX",params.raisonRejetEtape6Bp)
                
        try
        {
                sendMail {
             to mailporteur
            from "labellisation@mnc.ma"
            subject descr1
            html template1
        }  

        }
        catch(Exception e)
                {
                    e.getMessage()

                }
            
            
            
        }
        if(params.decisionEtape6Bp=="nouvelleVersion"){
            labelisationProjetInstance.decisionEtape6Bp="nouvelleVersion"
            labelisationProjetInstance.etapePorteur=4    
        }
        
        
        
        
        if(params.decisionEtape6Bp=="rejete"){
            labelisationProjetInstance.save(failOnError:true,flush:true)
        
        redirect(controller : "labelisationProjet", action : "list_projet", params:[global:true]) 
        }
        else
        {
           labelisationProjetInstance.save(failOnError:true,flush:true)
        
       redirect(action: "create", id :labelisationProjetInstance.id)
        }
        
        
//        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    
    @Transactional
    def saveEtape7Bp() {
        
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        if(params.decisionEtape7Bp=="avisFavorable"){
            labelisationProjetInstance.decisionEtape7Bp="avisFavorable"
            labelisationProjetInstance.etatProjet="confirmation"
            def etape1bis=[numero:9,code:"Decision Commex",libelle:'Decision Commex']
            def etapeProjet="Decision Commex"
        labelisationProjetInstance.etapeProjet=etapeProjet
            def etapeInstancebis=new Etape(etape1bis)
            labelisationProjetInstance.etape=etapeInstancebis
            //labelisationProjetInstance.etapePorteur=6
            labelisationProjetInstance.etapePorteur=5
         def profilporteur=Profil.findByCode("porteur")
         def listemails=[]
        def userByprofil=Utilisateur.findAllByProfil(profilporteur)
        for(user in userByprofil){
            listemails.add(user.email)    
        }
        def templatemail=MailTemplate.findByCode("8-validation etape Decision Commex")
        def template=templatemail.template.replace("nomprojet",labelisationProjetInstance.nomProjet)
        def description="Validation  Decision Commex"
         def mailporteur=labelisationProjetInstance.porteurProjet.email
         
            def templatemail1=MailTemplate.findByCode("5_COMEX_OK")
        def templateintial=templatemail1.template
        def descr1=templatemail1.description
        def template1=templatemail1.template    
        
        try
        {
                sendMail {
             to mailporteur
            from "labellisation@mnc.ma"
            subject descr1
            html template1
        }  

        }
        catch(Exception e)
                {
                    e.getMessage()

                }
            
            
            

        }
        if(params.dateReeleffCommex!=null && params.dateReeleffCommex!='null' && params.dateReeleffCommex!='')
            {
            labelisationProjetInstance.dateReeleffCommex=Date.parse("dd/MM/yyyy hh:mm:ss",params.dateReeleffCommex) 
             String dateString = null;
   SimpleDateFormat sdfr = new SimpleDateFormat("dd/MMM/yyyy");
   try{
	dateString = sdfr.format( labelisationProjetInstance.dateReeleffCommex );
   }catch (Exception ex ){
	System.out.println(ex);
   }
            labelisationProjetInstance.commentaire+="5-La date commex réelle:"+dateString+"</br>"
            }
        if(params.decisionEtape7Bp=="rejete"){
            labelisationProjetInstance.decisionEtape7Bp="rejet"
            labelisationProjetInstance.etatProjet="rejet"
            def etape1bis=[numero:9,code:"Decision Commex",libelle:'Decision Commex']
            labelisationProjetInstance.etapeBp=8
            def etapeInstancebis=new Etape(etape1bis)
            labelisationProjetInstance.etape=etapeInstancebis
            labelisationProjetInstance.decisionEtape7Bp="rejete"
            labelisationProjetInstance.raisonRejetEtape7Bp=params.raisonRejetEtape7Bp
            labelisationProjetInstance.commentaire+="Projet rejeté pour les raisons  :"+labelisationProjetInstance.raisonRejetEtape7Bp+"</br>"
            def profilporteur=Profil.findByCode("porteur")
         def listemails=[]
        def userByprofil=Utilisateur.findAllByProfil(profilporteur)
        for(user in userByprofil){
            listemails.add(user.email)    
        }
        def templatemail=MailTemplate.findByCode("validation etape Decision Commex")
        def template="desole le projet:"+labelisationProjetInstance.nomProjet+"viens d'etre rejeter"
        def description="Decision Commex:rejet du projet"+labelisationProjetInstance.nomProjet
        def mailporteur1=labelisationProjetInstance.porteurProjet.email
            def templatemail1=MailTemplate.findByCode("5_COMEX_REJET")
        def templateintial=templatemail1.template
        def descr1=templatemail1.description
        def template1=templatemail1.template
                
        
        try
        {
                sendMail {
             to mailporteur1
            from "labellisation@mnc.ma"
            subject descr1
            html template1
        }  

        }
        catch(Exception e)
                {
                    e.getMessage()

                }

            
            
        }
       
        redirect(controller : "labelisationProjet", action : "list_projet", params:[global:true]) 
    }
    
    @Transactional
    def saveEtape4() {
        def rapporteursInternes=[]
        def clusters=[]
        def rapporteursExternes=[]
        def comitesThematiques4=[]
        def membresComiteValides=[]
        if(params.rapporteursInternes instanceof String)
        {
            rapporteursInternes.add(Utilisateur.get(params.rapporteursInternes)) 
        }
        else{
            for(element in params.rapporteursInternes){
                rapporteursInternes.add(Utilisateur.get(element))
            }   
        }
        
        if(params.clusters instanceof String)
        {
            clusters.add(Cluster.get(params.clusters)) 
        }
        else{
            for(element in params.clusters){
                clusters.add(Cluster.get(element))
            }
        }
        
        if(params.rapporteursExternes instanceof String)
        {
            rapporteursExternes.add(Utilisateur.get(params.rapporteursExternes)) 
        }
        else{
            for(element in params.rapporteursExternes){
                rapporteursExternes.add(Utilisateur.get(element))
            }
        }
        
        if(params.comitesThematiques4 instanceof String)
        {
            comitesThematiques4.add(ComiteThematique.get(params.comitesThematiques4)) 
        }
        else{
            for(element in params.comitesThematiques4){
                comitesThematiques4.add(ComiteThematique.get(element))
            }
        }
        if(params.membresComiteValides instanceof String)
        {
            membresComiteValides.add(Utilisateur.get(params.membresComiteValides)) 
        }
        else{
            for(element in params.membresComiteValides){
                membresComiteValides.add(Utilisateur.get(element))
            }
        }
        
        def etape4=[numero:4,code:"etape4",libelle:'Etape 4']
        def etapeInstance=new Etape(etape4)
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        labelisationProjetInstance.etape=etapeInstance
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm")
        String dateInString = params.datePresentation1 + " " + params.heurepresentation1;
        Date dpresentation1 = new Date();
        try {
            dpresentation1 = sdf.parse(dateInString);
        } catch(Exception ex) {
            
        }
        labelisationProjetInstance.datePresentation1= dpresentation1
        labelisationProjetInstance.dateDiffusionProposition=Date.parse("dd/MM/yyyy",params.dateDiffusionProposition)
        labelisationProjetInstance.lieuPresentation1=params.lieuPresentation1
        labelisationProjetInstance.dateRedactionEtape3= new Date()
        labelisationProjetInstance.redacteurEtape3= session.user
        labelisationProjetInstance.rapporteursInternes=rapporteursInternes
        labelisationProjetInstance.rapporteursExternes=rapporteursExternes
        labelisationProjetInstance.comitesThematiques4=comitesThematiques4
        labelisationProjetInstance.membresComiteValides=membresComiteValides
        labelisationProjetInstance.mailEtape4Porteur=params.mailEtape4Porteur
        labelisationProjetInstance.mailEtape4Bp=params.mailEtape4Bp
        labelisationProjetInstance.clusters=clusters
        labelisationProjetInstance.etapePorteur=3
        labelisationProjetInstance.nombrePassageEtape3++
        labelisationProjetInstance.save(failOnError:true,flush:true)
        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    
    @Transactional
    def saveEtape5() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        
        labelisationProjetInstance.etapeBp=6
        labelisationProjetInstance.save(failOnError:true,flush:true)
        attachUploadedFilesTo(labelisationProjetInstance)
        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    
    @Transactional
    def saveEtape5Porteur() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        labelisationProjetInstance.etapePorteur=6
        labelisationProjetInstance.save(failOnError:true,flush:true)
        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    
    @Transactional
    def saveEtape6() { 
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        labelisationProjetInstance.etapePorteur=3
        labelisationProjetInstance.save(failOnError:true,flush:true)
        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    
    @Transactional
    def saveEtape7() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        labelisationProjetInstance.etapeBp=7
        labelisationProjetInstance.save(failOnError:true,flush:true)
        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    
    @Transactional
    def saveEtape6porteur() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        
        labelisationProjetInstance.etapePorteur=6
        labelisationProjetInstance.etapeBp=12
        labelisationProjetInstance.save(failOnError:true,flush:true)
         def profilBp=Profil.findByCode("BP")
redirect(action: "list_projet",params:[encours:true])
    }
    @Transactional
    def saveEtapefinalporteur() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        
        labelisationProjetInstance.etapePorteur=100
        labelisationProjetInstance.etapeBp=100
        labelisationProjetInstance.save(failOnError:true,flush:true)
         def profilBp=Profil.findByCode("BP")
            def listemails=[]
        def userByprofil=Utilisateur.findAllByProfil(profilBp)
        for(user in userByprofil){
            listemails.add(user.email)    
        }
        def templatemail=Mailresult.findByCode("validation étape final administration")
        def template=templatemail.template.replace("nomprojet",labelisationProjetInstance.nomProjet)
        def description="validation étape final administration"
        

        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    @Transactional
    def saveEtape7porteur() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        labelisationProjetInstance.etapeBp=9
        labelisationProjetInstance.save(failOnError:true,flush:true)
        attachUploadedFilesTo(labelisationProjetInstance)
         def profilBp=Profil.findByCode("BP")
            def listemails=[]
        def userByprofil=Utilisateur.findAllByProfil(profilBp)
        for(user in userByprofil){
            listemails.add(user.email)    
        }
        def templatemail=MailTemplate.findByCode("mailEtape1")
        def template=templatemail.template.replace("nomprojet",labelisationProjetInstance.nomProjet)
        def description="validation étape Post_label  porteur"
//        sendMail {
//            bcc listemails.toArray()
//            from "allaliyoussefemsi@gmail.com"
//            subject description
//            html template
//        }
        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    @Transactional
    def saveEtape8() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        if(params.competenceexternesollicite=="true"){
            labelisationProjetInstance.etapePorteur=4   
        }
        else{
            labelisationProjetInstance.etapeBp=8    
        }
        labelisationProjetInstance.save(failOnError:true,flush:true)
        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    
    @Transactional
    def saveEtape9() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        labelisationProjetInstance.etapeBp=9
        labelisationProjetInstance.save(failOnError:true,flush:true)
        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    
    @Transactional
    def saveEtape10() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        if(params.decisionAchanger=="avisFavorable"){
            labelisationProjetInstance.etapePorteur=5   
        }
        if(params.decisionAchanger=="rejete"){
            labelisationProjetInstance.etapePorteur=5
        }
        if(params.decisionAchanger=="nouvelleVersion"){
            labelisationProjetInstance.etapePorteur=4    
        }
        labelisationProjetInstance.save(failOnError:true,flush:true)
        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    
    @Transactional
    def saveEtape11() {
        def etape11=[numero:11,code:"etape11",libelle:'Etape 11']
        def etapeInstance=new Etape(etape11)
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        labelisationProjetInstance.etape=etapeInstance
        labelisationProjetInstance.redacteurEtape10=session.user
        labelisationProjetInstance.dateReunionComiteThematique=new Date(params.dateReunionComiteThematique)
        labelisationProjetInstance.dateFinEtape10=new Date()
        labelisationProjetInstance.nombrePassageEtape10++
        labelisationProjetInstance.etapeBp=12
        labelisationProjetInstance.avisSynthese=params.avisSynthese
        labelisationProjetInstance.opinionComitePilotage=params.opinionComitePilotage
        labelisationProjetInstance.raisonNonConformiteEtape10=params.raisonNonConformiteEtape10
        labelisationProjetInstance.save(failOnError:true,flush:true)
        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    
    @Transactional
    def saveEtape12() {
        def etape12=[numero:12,code:"etape12",libelle:'Etape 12']
        def etapeInstance=new Etape(etape12)
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        labelisationProjetInstance.etape=etapeInstance
        labelisationProjetInstance.redacteurEtape11=session.user
        
        labelisationProjetInstance.dateFinEtape11=new Date()
        labelisationProjetInstance.nombrePassageEtape11++
        labelisationProjetInstance.etapeBp=13
        labelisationProjetInstance.save(failOnError:true,flush:true)
        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    
    @Transactional
    def saveEtape13() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        labelisationProjetInstance.etapePorteur=5
        labelisationProjetInstance.save(failOnError:true,flush:true)
        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    
    @Transactional
    def saveEtape13Bp() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        labelisationProjetInstance.etapePorteur=6
        labelisationProjetInstance.save(failOnError:true,flush:true)
         def profilporteur=Profil.findByCode("porteur")
         def listemails=[]
        def userByprofil=Utilisateur.findAllByProfil(profilporteur)
        for(user in userByprofil){
            listemails.add(user.email)    
        }
        def templatemail=MailTemplate.findByCode("mailEtape1")
        def template=templatemail.template.replace("nomprojet",labelisationProjetInstance.nomProjet)
        def description="Validation  Post_Label"
//        sendMail {
//            bcc listemails.toArray()
//            from "allaliyoussefemsi@gmail.com"
//            subject description
//            html template
//        }
        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    
    @Transactional
    def saveEtapeAdministration() {
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        if(params.administration=="true")
        {
          labelisationProjetInstance.administration=true  
        }
        else
        if(params.administration=="false")
        {
          labelisationProjetInstance.administration=false
        }
        labelisationProjetInstance.etapePorteur=10
        labelisationProjetInstance.save(failOnError:true,flush:true)
         def profilporteur=Profil.findByCode("porteur")
         def listemails=[]
        def userByprofil=Utilisateur.findAllByProfil(profilporteur)
        for(user in userByprofil){
            listemails.add(user.email)    
        }
        def templatemail=Mailresult.findByCode("validation etape partie administration")
        def template=templatemail.template.replace("nomprojet",labelisationProjetInstance.nomProjet)
//        sendMail {
//            bcc listemails.toArray()
//            from "allaliyoussefemsi@gmail.com"
//            subject templatemail.description
//            html template
//        }
        redirect(action: "create", id :labelisationProjetInstance.id)
    }
    
    @Transactional
    def edit(LabelisationProjet labelisationProjetInstance) {
        respond labelisationProjetInstance
    }

    @Transactional
    def update(LabelisationProjet labelisationProjetInstance) {
        if (labelisationProjetInstance == null) {
            notFound()
            return
        }

        if (labelisationProjetInstance.hasErrors()) {
            respond labelisationProjetInstance.errors, view:'edit'
            return
        }

        labelisationProjetInstance.save flush:true

        request.withFormat {
            form {
                redirect labelisationProjetInstance
            }
            '*'{ respond labelisationProjetInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LabelisationProjet labelisationProjetInstance) {

        if (labelisationProjetInstance == null) {
            notFound()
            return
        }

        labelisationProjetInstance.delete flush:true

        request.withFormat {
            form {
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    @Transactional
    def deletefile() {
        def lp = LabelisationProjet.get(Integer.parseInt(params.id))
        lp.removeAttachment(Integer.parseInt(params.idfile))
        render true
    }
    
    @Transactional
    def uploadfile() {
        def labelisationProjetInstance = LabelisationProjet.get(Integer.parseInt(params.idprojet))
        attachUploadedFilesTo(labelisationProjetInstance)
        render true
    }
    
  
    def listeEmailsByLp(LabelisationProjet labelisationProjetInstance){
        def listemails=[]
        def profilBp=Profil.findByCode("BP")
        def userByprofil=Utilisateur.findAllByProfil(profilBp)
        for(user in userByprofil){
            listemails.add(user.email)    
        }
        for(user in labelisationProjetInstance.membresComiteValides){
            listemails.add(user.email)    
        } 
        for(user in labelisationProjetInstance.rapporteursInternes){
            listemails.add(user.email)    
        } 
        for(user in labelisationProjetInstance.rapporteursExternes){
            listemails.add(user.email)    
        } 
        return listemails
    }
    
    @Transactional
    def downloadZip(){
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
              
        try{
            response.setContentType('APPLICATION/ZIP')
            response.setHeader('Content-Disposition', 'Attachment;Filename="labelisationProjet.zip"')
            ZipOutputStream zos = new ZipOutputStream(response.outputStream);
            for(int i=0;i<labelisationProjetInstance.getTotalAttachments('presentationetape5');i++)
            {
                Attachment attachment = Attachment.get(labelisationProjetInstance.getAttachments('presentationetape5')[i].id as Long)
                File file = AttachmentableUtil.getFile(CH.config, attachment)
                addfile(zos,file)
            }
            for(int i=0;i<labelisationProjetInstance.getTotalAttachments('ficheTechnique');i++)
            {
                Attachment attachment = Attachment.get(labelisationProjetInstance.getAttachments('ficheTechnique')[i].id as Long)
                File file = AttachmentableUtil.getFile(CH.config, attachment)
                addfile(zos,file)
            }
            for(int i=0;i<labelisationProjetInstance.getTotalAttachments('grilleAnalyse');i++)
            {
                Attachment attachment = Attachment.get(labelisationProjetInstance.getAttachments('grilleAnalyse')[i].id as Long)
                File file = AttachmentableUtil.getFile(CH.config, attachment)
                addfile(zos,file)
            }
            zos.close();
        }
        catch(Exception e){
            println e   
        }
    }
      
    public  static void addfile(ZipOutputStream zos,File file) throws Exception {
        FileInputStream fis = new FileInputStream(file);
        ZipEntry zipEntry = new ZipEntry(file.getName());
        zos.putNextEntry(zipEntry);
        byte[] bytes = new byte[1024];
        int length;
        while ((length = fis.read(bytes)) >= 0) {
            zos.write(bytes, 0, length);
        }
        zos.closeEntry();
        fis.close();
    }
 
    def getHasmany(String variable,String classe){
        def  Liste=[]
        if(params."${variable}" instanceof String)
        {
            Liste.add(Class.forName(classe).get(params."${variable}")) 
        }
        else{
            for(element in params."${variable}"){
                Liste.add(Class.forName(classe).get(element))
            }   
        }
        return Liste
    }
    def enCours(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LabelisationProjet.list(params), model:[labelisationProjetInstanceCount: LabelisationProjet.count()]
    }
    def synthese(LabelisationProjet labelisationProjetInstance) { 
        labelisationProjetInstance.etapePorteur+" bp "+labelisationProjetInstance.etapeBp
       render(view:"synthese",model:[labelisationProjetInstance:labelisationProjetInstance])
    } 
    def telechargerdocs(LabelisationProjet labelisationProjetInstance) {    
       render(view:"telechargerdocs",model:[labelisationProjetInstance:labelisationProjetInstance])
    } 
    def getUtilisateurscommitethematiqueinitial() 
    {
        
        session.utilisateur1=null
def listcommites=[]
        def listcommite1=params.commites
            listcommites= listcommite1.split(",")
            def listcom=[]
            for(com in listcommites)
            {
              listcom.add(Long.parseLong(com))  
            }
             long l = Long.parseLong(listcommites[0])
        def connections1 = Utilisateur.createCriteria().list
        {
            comitesThematiques
            {
             'in'("id",listcom)  
//                eq("id",l)
            }
        }
        def tabmap=[]
        def myMap=[:]
        connections1.each {
        tabmap.add("${it.id}":it.nom+" "+it.prenom)
        }
        session.utilisateur1=connections1
            render connections1 as JSON
    } 
     def getUtilisateurscommitethematique() 
    {
        session.utilisateur1=null
def listcommites=[]
        def listcommite1=params.commites
            listcommites= listcommite1.split(",")
            def listcom=[]
            if(params.commites!='' && params.commites!='null' && params.commites!=null)
            {
                 for(com in listcommites)
            {
              listcom.add(Long.parseLong(com))  
            }
            }
         if(listcom.size()!=0)
            {
             def connections1 = Utilisateur.createCriteria().list
        {
            comitesThematiques
            {
             'in'("id",listcom)  
            }
        }
            render connections1 as JSON   
            }
            else
            {
                def  connections1=true
                render connections1 
            }
    } 
    
     def downloadSampleZip() {
        response.setContentType('APPLICATION/OCTET-STREAM')
        response.setHeader('Content-Disposition', 'Attachment;Filename="example.zip"')
        ZipOutputStream zip = new ZipOutputStream(response.outputStream);
        
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        def path=null
        def nomexacte=null
        def nomexacte1=null
           if(labelisationProjetInstance.getTotalAttachments('presentation')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'presentation')
                                def ext=att.id
                                
        path="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
           
        nomexacte="${ext}.${att.ext}"
        nomexacte1=nomexacte.replace("${ext}","presentation")
                }
         if(nomexacte1!=null)
                {
                 def file1Entry111 = new ZipEntry(nomexacte1);
        zip.putNextEntry(file1Entry111);
        zip.write("This is the content of the first file".bytes);   
                }        
                def pathrapportct=null
        def nomexactepresentationdetaillee=null
        def nomexactepresentationdetaillee1=null
           if(labelisationProjetInstance.getTotalAttachments('presentationdetaillee')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'presentationdetaillee')
                                def ext=att.id
       nomexactepresentationdetaillee="${ext}.${att.ext}"
        nomexactepresentationdetaillee1=nomexactepresentationdetaillee.replace("${ext}","presentationdetaillee")
                }
                
        if(nomexactepresentationdetaillee1!=null)
                {
                 def file1Entry111 = new ZipEntry(nomexactepresentationdetaillee1);
        zip.putNextEntry(file1Entry111);
        zip.write("This is the content of the first file".bytes);   
                }

                def pathficheTechnique=null
        def nomexacteficheTechnique=null
        def nomexacteficheTechnique1=null
           if(labelisationProjetInstance.getTotalAttachments('ficheTechnique')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'ficheTechnique')
                                def ext=att.id
        pathrapportct="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
        nomexacteficheTechnique="${ext}.${att.ext}"
        nomexacteficheTechnique1=nomexacteficheTechnique.replace("${ext}","ficheTechnique")
                }
                
        if(nomexacteficheTechnique!=null)
                {
                 def file1Entry111 = new ZipEntry(nomexacteficheTechnique1);
        zip.putNextEntry(file1Entry111);
        zip.write("This is the content of the first file".bytes);   
                }
def pathgrilleAnalyse=null
        def nomexactegrilleAnalyse=null
           if(labelisationProjetInstance.getTotalAttachments('grilleAnalyse')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'grilleAnalyse')
                                def ext=att.id
        pathrapportct="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
         nomexactegrilleAnalyse="${ext}.${att.ext}"
         nomexactegrilleAnalyse=nomexactegrilleAnalyse.replace("${ext}","grilleAnalyse")
                }
                
        if(nomexactegrilleAnalyse!=null)
                {
                 def file1Entry111 = new ZipEntry(nomexactegrilleAnalyse);
        zip.putNextEntry(file1Entry111);
        zip.write("This is the content of the first file".bytes);   
                }
                
        def pathrapportCT=null
        def nomexacterapportCT=null
        def nomexacterapportCT1=null
           if(labelisationProjetInstance.getTotalAttachments('rapportCT')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'rapportCT')
                                def ext=att.id
        pathrapportct="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
        nomexacterapportCT="${ext}.${att.ext}"
         nomexacterapportCT1=nomexacterapportCT.replace("${ext}","rapportCT")
                }
                
        if(nomexacterapportCT1!=null)
                {
                 def file1Entry111 = new ZipEntry(nomexacterapportCT1);
        zip.putNextEntry(file1Entry111);
        zip.write("This is the content of the first file".bytes);   
                }
                
         def pathlettreConfidentialite=null
        def nomexactelettreConfidentialite=null
        def documentInstance=Document.findByCode("lettreConfidentialite")
           if(documentInstance.getTotalAttachments('lettreConfidentialite')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(documentInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'lettreConfidentialite')
                                def ext=att.id
        pathlettreConfidentialite="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${documentInstance.id}/${ext}.${att.ext}"
         nomexactelettreConfidentialite="${ext}.${att.ext}"
         nomexactelettreConfidentialite=nomexactelettreConfidentialite.replace("${ext}","lettreConfidentialite")
                }
                
        if(nomexactelettreConfidentialite!=null)
                {
                 def file1Entry111 = new ZipEntry(nomexactelettreConfidentialite);
        zip.putNextEntry(file1Entry111);
        zip.write("This is the content of the first file".bytes);   
                }
        
        zip.close();
    }


    def downloadSampleZip1() {
        
        ByteArrayOutputStream baos = new ByteArrayOutputStream()
    ZipOutputStream zipFile = new ZipOutputStream(baos)
    
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        def path=null
        def nomexacte=null
        def nomexacte1=null
           if(labelisationProjetInstance.getTotalAttachments('presentation')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'presentation')
                                def ext=att.id
                                
        path="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
           
        nomexacte="${ext}.${att.ext}"
        nomexacte1=nomexacte.replace("${ext}","business_model_canevas")
                }
         if(nomexacte1!=null)
                {
                    
             File file1 = new File("${path}")
         zipFile.putNextEntry(new ZipEntry("${nomexacte1}"))
          file1.withInputStream { i ->

            zipFile << i
                
                }        
                }

                def pathficheTechnique=null
        def nomexacteficheTechnique=null
        def nomexacteficheTechnique1=null
           if(labelisationProjetInstance.getTotalAttachments('ficheTechnique')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'ficheTechnique')
                                def ext=att.id
        pathficheTechnique="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
        nomexacteficheTechnique="${ext}.${att.ext}"
        nomexacteficheTechnique1=nomexacteficheTechnique.replace("${ext}","dossierlabellisation")
                }
                
        if(nomexacteficheTechnique!=null)
                {
                def file1 = new File("${pathficheTechnique}")
         zipFile.putNextEntry(new ZipEntry("${nomexacteficheTechnique1}"))
          file1.withInputStream { i ->

            zipFile << i
          }
                }
                
        
        def pathpresentationdetaillee=null
        def nomexactepresentationdetaillee=null
        def nomexactepresentationdetaillee1=null
           if(labelisationProjetInstance.getTotalAttachments('presentationdetaillee')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'presentationdetaillee')
                                def ext=att.id
        pathpresentationdetaillee="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
        nomexactepresentationdetaillee="${ext}.${att.ext}"
        nomexactepresentationdetaillee1=nomexactepresentationdetaillee.replace("${ext}","ficheprojet")
                }
                
        if(nomexactepresentationdetaillee!=null)
                {
                def file1 = new File("${pathpresentationdetaillee}")
         zipFile.putNextEntry(new ZipEntry("${nomexactepresentationdetaillee1}"))
          file1.withInputStream { i ->

            zipFile << i
          }
                }
                
        
def pathgrilleAnalyse=null
        def nomexactegrilleAnalyse=null
           if(labelisationProjetInstance.getTotalAttachments('presentation1')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'presentation1')
                                def ext=att.id
        pathgrilleAnalyse="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
         nomexactegrilleAnalyse="${ext}.${att.ext}"
         nomexactegrilleAnalyse=nomexactegrilleAnalyse.replace("${ext}","grilleAnalyse")
                }
                
        if(nomexactegrilleAnalyse!=null)
                {
                 def file1 = new File("${pathgrilleAnalyse}")
         zipFile.putNextEntry(new ZipEntry("${nomexactegrilleAnalyse}"))
          file1.withInputStream { i ->

            zipFile << i
                }
                }
        def pathrapportCT=null
        def nomexacterapportCT=null
        def nomexacterapportCT1=null
           if(labelisationProjetInstance.getTotalAttachments('rapportCT')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'rapportCT')
                                def ext=att.id
        pathrapportCT="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
        nomexacterapportCT="${ext}.${att.ext}"
         nomexacterapportCT1=nomexacterapportCT.replace("${ext}","rapportCT")
                }
                
        if(nomexacterapportCT1!=null)
                {
                           def file1 = new File("${pathrapportCT}")
         zipFile.putNextEntry(new ZipEntry("${nomexacterapportCT1}"))
          file1.withInputStream { i ->

            zipFile << i
                }
                
                }
                
        
        zipFile.closeEntry()
         
        zipFile.finish()
        def nomprojet=labelisationProjetInstance.nomProjet
        def nomzip="Zip_Projet_"+nomprojet+".zip"
//        response.setHeader("Content-disposition", "filename=\"projet_zip.zip\"")
        response.setHeader("Content-disposition", "filename=\"Zip_Projet_"+nomprojet+".zip\"")
        response.contentType = "application/zip"
        response.outputStream << baos.toByteArray()
        response.outputStream.flush()   
        
    }
    
def downloadAlbum(){

    ByteArrayOutputStream baos = new ByteArrayOutputStream()
    ZipOutputStream zipFile = new ZipOutputStream(baos)
    
        
        
        
     def fichesignaletique='fichesignaletique'
        def documentfichetech=Document.findByCode(fichesignaletique)
        
        if(documentfichetech!=null)
        {
                def pathficheTechnique=null
                def pathrapportct=null
        def nomexacteficheTechnique=null
        def nomexacteficheTechnique1=null
           if(documentfichetech.getTotalAttachments('fichesignaletique')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(documentfichetech.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'fichesignaletique')
                                def ext=att.id
        pathrapportct="${userHome}/mncupload/com.rabbahsoft.mnc.Document/${documentfichetech.id}/${ext}.${att.ext}"
            nomexacteficheTechnique="${ext}.${att.ext}"
        nomexacteficheTechnique1=nomexacteficheTechnique.replace("${ext}","fichesignaletique")
                }
         File file = new File("${pathrapportct}")
         zipFile.putNextEntry(new ZipEntry("${nomexacteficheTechnique1}"))
          file.withInputStream { i ->

            zipFile << i

          }
          
        }
        
        
          
        def pathdossierlabellisation=null
        def nomexactegrilleAnalyse=null
        def documentgrilleana=Document.findByCode("dossierlabellisation")
        if(documentgrilleana)
        {
           if(documentgrilleana.getTotalAttachments('dossierlabellisation')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(documentgrilleana.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'dossierlabellisation')
                                def ext=att.id
        pathdossierlabellisation="${userHome}/mncupload/com.rabbahsoft.mnc.Document/${documentgrilleana.id}/${ext}.${att.ext}"
         nomexactegrilleAnalyse="${ext}.${att.ext}"
         nomexactegrilleAnalyse=nomexactegrilleAnalyse.replace("${ext}","dossierlabellisation")
                }
                
        if(nomexactegrilleAnalyse!=null)
                {
                  File file1 = new File("${pathdossierlabellisation}")
         zipFile.putNextEntry(new ZipEntry("${nomexactegrilleAnalyse}"))
          file1.withInputStream { i ->

            zipFile << i

          }  
                }
        }
        
        
        def pathlettreConfidentialite=null
        def nomexactelettreConfidentialite=null
        def documentInstance=Document.findByCode("business_model_canevas")
        if(documentInstance!=null)
        {
           if(documentInstance.getTotalAttachments('business_model_canevas')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(documentInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'business_model_canevas')
                                def ext=att.id
        pathlettreConfidentialite="${userHome}/mncupload/com.rabbahsoft.mnc.Document/${documentInstance.id}/${ext}.${att.ext}"
         nomexactelettreConfidentialite="${ext}.${att.ext}"
         nomexactelettreConfidentialite=nomexactelettreConfidentialite.replace("${ext}","business_model_canevas")
                }
                
        if(nomexactelettreConfidentialite!=null)
                {
                         File file1 = new File("${pathlettreConfidentialite}")
         zipFile.putNextEntry(new ZipEntry("${nomexactelettreConfidentialite}"))
          file1.withInputStream { i ->

            zipFile << i

          }  
                }
        
        }
        
        
          zipFile.closeEntry()
         
        zipFile.finish()
        response.setHeader("Content-disposition", "filename=\"kit_labellisation.zip\"")
        response.contentType = "application/zip"
        response.outputStream << baos.toByteArray()
        response.outputStream.flush()   

}
  
    def downloadSampleZipbukup() 
    {
        ByteArrayOutputStream baos = new ByteArrayOutputStream()
    ZipOutputStream zipFile = new ZipOutputStream(baos)
     def fichesignaletique='fichesignaletique'
        def documentfichetech=Document.findByCode(fichesignaletique)
        
                def pathficheTechnique=null
                def pathrapportct=null
        def nomexacteficheTechnique=null
        def nomexacteficheTechnique1=null
           if(documentfichetech.getTotalAttachments('fichesignaletique')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(documentfichetech.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'fichesignaletique')
                                def ext=att.id
        pathrapportct="${userHome}/mncupload/com.rabbahsoft.mnc.Document/${documentfichetech.id}/${ext}.${att.ext}"
            nomexacteficheTechnique="${ext}.${att.ext}"
        nomexacteficheTechnique1=nomexacteficheTechnique.replace("${ext}","fichesignaletique")
                }
                
             if(nomexacteficheTechnique!=null)
                {
                 File file = new File("${pathrapportct}")
          zipFile.putNextEntry(new ZipEntry("${nomexacteficheTechnique}"))
          file.withInputStream { i ->

            zipFile << i

          } 
                
                }
            
        
          zipFile.closeEntry()
         
        zipFile.finish()
        response.setHeader("Content-disposition", "filename=\"download.zip\"")
        response.contentType = "application/zip"
        response.outputStream << baos.toByteArray()
        response.outputStream.flush()   
   
         
        response.setContentType('APPLICATION/OCTET-STREAM')
        response.setHeader('Content-Disposition', 'Attachment;Filename="examplezip.zip"')
        ZipOutputStream zip = new ZipOutputStream(response.outputStream);
        zip.close();
    }
    
    
    
        def downloadKitLabelisation() {
        response.setContentType('APPLICATION/OCTET-STREAM')
        response.setHeader('Content-Disposition', 'Attachment;Filename="examplezip.zip"')
        ZipOutputStream zip = new ZipOutputStream(response.outputStream);
         def fichesignaletique='fichesignaletique'
        def dossierlabellisation='dossierlabellisation'
        def business_model_canevas='business_model_canevas'
        def documentfichetech=Document.findByCode(fichesignaletique)
        
                def pathficheTechnique=null
                def pathrapportct=null
        def nomexacteficheTechnique=null
        def nomexacteficheTechnique1=null
           if(documentfichetech.getTotalAttachments('fichesignaletique')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(documentfichetech.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'fichesignaletique')
                                def ext=att.id
        pathrapportct="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${documentfichetech.id}/${ext}.${att.ext}"
        nomexacteficheTechnique="${ext}.${att.ext}"
        nomexacteficheTechnique1=nomexacteficheTechnique.replace("${ext}","fichesignaletique")
                }
                
        if(nomexacteficheTechnique!=null)
                {
                 def file1Entry111 = new ZipEntry(nomexacteficheTechnique1);
        zip.putNextEntry(file1Entry111);
        zip.write("This is the content of the first file".bytes);   
                }
def pathgrilleAnalyse=null
        def nomexactegrilleAnalyse=null
        def documentgrilleana=Document.findByCode(dossierlabellisation)
           if(documentgrilleana.getTotalAttachments('dossierlabellisation')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(documentgrilleana.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'dossierlabellisation')
                                def ext=att.id
        pathrapportct="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${documentgrilleana.id}/${ext}.${att.ext}"
         nomexactegrilleAnalyse="${ext}.${att.ext}"
         nomexactegrilleAnalyse=nomexactegrilleAnalyse.replace("${ext}","dossierlabellisation")
                }
                
        if(nomexactegrilleAnalyse!=null)
                {
                 def file1Entry111 = new ZipEntry(nomexactegrilleAnalyse);
        zip.putNextEntry(file1Entry111);
        zip.write("This is the content of the first file".bytes);   
                }
                
                
         def pathlettreConfidentialite=null
        def nomexactelettreConfidentialite=null
        def documentInstance=Document.findByCode("business_model_canevas")
           if(documentInstance.getTotalAttachments('business_model_canevas')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(documentInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'business_model_canevas')
                                def ext=att.id
        pathlettreConfidentialite="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${documentInstance.id}/${ext}.${att.ext}"
         nomexactelettreConfidentialite="${ext}.${att.ext}"
         nomexactelettreConfidentialite=nomexactelettreConfidentialite.replace("${ext}","business_model_canevas")
                }
                
        if(nomexactelettreConfidentialite!=null)
                {
                 def file1Entry111 = new ZipEntry(nomexactelettreConfidentialite);
        zip.putNextEntry(file1Entry111);
        zip.write("This is the content of the first file".bytes);  
                }
        
        zip.close();
    }
   
    
    
    
    
    
    
    
    @Transactional
     def checkemail() {

    render"true1"   
    }
     @Transactional
     def delete_projet() {
        def projet=LabelisationProjet.get(Long.parseLong(params.id))
          try
          {
            projet.delete(flush: true) 
            render "true"
          }
          catch(Exception)
          {
           render "false"   
          }
          
          
       
    }
    @Transactional
     def recherche_projet() {       
    }
     def list_projet() 
    {
        def mm=MailTemplate.findByCode("2-mailAccepterReglesConfidentialite(porteur+evaluateur)")
        def mm1=MailTemplate.findByCode("2-mailAccepterReglesConfidentialite(porteur+CT)")
        def fichetechnique
            def grilleanalyse
            def fichesignaletique
            def dossierlabellisation
            def business_model_canevas
            session.fichetechnique=servletContext.getAttribute('ficheTechnique')
                 session.grilleanalyse=servletContext.getAttribute('grilleAnalyse')
                 session.business_model_canevas=servletContext.getAttribute('business_model_canevas')
                 session.dossierlabellisation=servletContext.getAttribute('dossierlabellisation')
                 session.fichesignaletique=servletContext.getAttribute('fichesignaletique')
                 session.dossierlabellisation=servletContext.getAttribute('dossierlabellisation')
                 session.business_model_canevas=servletContext.getAttribute('business_model_canevas')
                 
        def user=session.user
        
        if(session.profil=="porteur")
        {
            if(params.labelise=='true')
            {
                    def connections1 = LabelisationProjet.createCriteria().list
        {
             
              eq("etatProjet","confirmation")
              porteurProjet
              {
                  eq("id",user.id)
              }
              if(params.order) {
                order(params.sort, params.order)
            }
            else
            {
               order("dateSoumissionProjet", "desc") 
            }
            resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
            
        }  
            respond connections1,model:[labelise:true,fichetechnique:fichetechnique,grilleanalyse:grilleanalyse,fichesignaletique:fichesignaletique,dossierlabellisation:dossierlabellisation,business_model_canevas:business_model_canevas]   
            }
            else 
            {
            if(params.rejete=="true")
            {
                def connections2 = LabelisationProjet.createCriteria().list
        {
              eq("etatProjet","rejet")
              porteurProjet
              {
                  eq("id",user.id)
              }
              if(params.order) {
                order(params.sort, params.order)
            }
            else
            {
               order("dateSoumissionProjet", "desc") 
            }
            resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
            
        }
              respond connections2,model:[rejete:true]  
                
            }
            
            else
             {
//             if(params.encours=="true")
//             {
                    def connections3 = LabelisationProjet.createCriteria().list
        {
             
              eq("etatProjet","En cours")
              porteurProjet
              {
                  eq("id",user.id)
              }
              if(params.order) {
                order(params.sort, params.order)
            }
            else
            {
               order("dateSoumissionProjet", "desc") 
            }
            resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
            
        }
//                respond connections3,model:[encours:true,fichetechnique:fichetechnique,grilleanalyse:grilleanalyse,fichesignaletique:fichesignaletique,dossierlabellisation:dossierlabellisation,business_model_canevas:business_model_canevas] 
                respond connections3,model:[encours:true] 
             //}
               
                          }
            }
        }
        else{
            if(params.global==null)
            {
                def global
             global=true 
             respond LabelisationProjet.list(params),model:[global:true]
            }
            else
            {  
             respond LabelisationProjet.list(order:"desc",sort:"dateSoumissionProjet")   
            }
               
        }
        
    } 
    
    
    
    
    def list_projet_reauditionne() 
    {
        def mm=MailTemplate.findByCode("2-mailAccepterReglesConfidentialite(porteur+evaluateur)")
        def mm1=MailTemplate.findByCode("2-mailAccepterReglesConfidentialite(porteur+CT)")
        def fichetechnique
            def grilleanalyse
            def fichesignaletique
            def dossierlabellisation
            def business_model_canevas
            session.fichetechnique=servletContext.getAttribute('ficheTechnique')
                 session.grilleanalyse=servletContext.getAttribute('grilleAnalyse')
                 session.business_model_canevas=servletContext.getAttribute('business_model_canevas')
                 session.dossierlabellisation=servletContext.getAttribute('dossierlabellisation')
                 session.fichesignaletique=servletContext.getAttribute('fichesignaletique')
                 session.dossierlabellisation=servletContext.getAttribute('dossierlabellisation')
                 session.business_model_canevas=servletContext.getAttribute('business_model_canevas')
                 
        def user=session.user
        
        if(session.profil=="porteur")
        {
           
                    def connections1 = LabelisationProjet.createCriteria().list
        {
             
              eq("etatProjet","encours pour reaudition")
              porteurProjet
              {
                  eq("id",user.id)
              }
              if(params.order) {
                order(params.sort, params.order)
            }
            else
            {
               order("dateSoumissionProjet", "desc") 
            }
            resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
            
        }  
            respond connections1,model:[reauditionne:true]   
            
          
        }
        
        
    } 
    
    
    def list_projet_redireger() 
    {
        def mm=MailTemplate.findByCode("2-mailAccepterReglesConfidentialite(porteur+evaluateur)")
        def mm1=MailTemplate.findByCode("2-mailAccepterReglesConfidentialite(porteur+CT)")
        def fichetechnique
            def grilleanalyse
            def fichesignaletique
            def dossierlabellisation
            def business_model_canevas
            session.fichetechnique=servletContext.getAttribute('ficheTechnique')
                 session.grilleanalyse=servletContext.getAttribute('grilleAnalyse')
                 session.business_model_canevas=servletContext.getAttribute('business_model_canevas')
                 session.dossierlabellisation=servletContext.getAttribute('dossierlabellisation')
                 session.fichesignaletique=servletContext.getAttribute('fichesignaletique')
                 session.dossierlabellisation=servletContext.getAttribute('dossierlabellisation')
                 session.business_model_canevas=servletContext.getAttribute('business_model_canevas')
                 
        def user=session.user
        
        if(session.profil=="porteur")
        {
          
           
           
                def connections2 = LabelisationProjet.createCriteria().list
        {
              eq("etatProjet","redirection")
              porteurProjet
              {
                  eq("id",user.id)
              }
              if(params.order) {
                order(params.sort, params.order)
            }
            else
            {
               order("dateSoumissionProjet", "desc") 
            }
            resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
            
        }
              respond connections2,model:[redirection:true]  
                
            
          
            
            
        }
        
        
    } 
    
    
    
    
    
    @Transactional
     def verificationnomprojet() {    
         if(params.idprojet!=null && params.idprojet!='null' && params.idprojet!='')
         {
           long idprojet1=Long.parseLong(params.idprojet)  
          def connections3 = LabelisationProjet.createCriteria().list
        {
             
              eq("nomProjet",params.projet)
              ne("id",idprojet1)
              
         
            resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
            
        }
    if(connections3)
    {
        render true
    }
    else
    {
       render false 
    }
         }
         else
         {
             def connections3 = LabelisationProjet.createCriteria().list
        {
             
              eq("nomProjet",params.projet)
              
         
            resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
            
        }
    if(connections3)
    {
        render true
    }
    else
    {
       render false 
    }
         }
//            def connections3 = LabelisationProjet.createCriteria().list
//        {
//             
//              eq("nomProjet",params.projet)
//              
//              
//         
//            resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
//            
//        }
//    if(connections3)
//    {
//        render true
//    }
//    else
//    {
//       render false 
//    }
    }
    @Transactional
     def verificationautresevaluateurs() {
         //def pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/);
        String mydomain = "javahungry@blogspot.com";          
         String stricterFilterString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    //String laxString = ".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
//    String emailRegex = stricterFilter ? stricterFilterString : laxString;
    String emailRegex = stricterFilterString;
    java.util.regex.Pattern p = java.util.regex.Pattern.compile(emailRegex);
    java.util.regex.Matcher m = p.matcher(mydomain);
    def kk=m.matches();          
                        def verifica=false
        
         Pattern pattern = Pattern.compile("[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}");
                                           "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";

  
        Matcher matcher = pattern.matcher(mydomain);
            Boolean b = matcher.matches();
         try
         {
                 if(params.autreeva!=null && params.autreeva!='null' && params.autreeva!='')
            {
                def autre=params.autreeva 
                def list=[]
                list=autre.split(";")
                for(mail in list)
                {
                    
                    java.util.regex.Pattern p1 = java.util.regex.Pattern.compile(emailRegex);
    java.util.regex.Matcher m1 = p1.matcher(mail);
    def kk1=m1.matches();          
        
                  if (m1.matches()==false)
                  {  
                  
                verifica=true
                   break;     
                 }
                    
                }
                
          
               
            }
         }
         catch(Exception ex)
         {
             verifica=true
         }
         if(verifica==true)
         {
             render true
         }
         else
         {
             render false
         }
    }
    
    @Transactional
     def list_projet_1(Integer max) {

         if(params.nomprojet!=null)
         {
             session.nomprojet=params.nomprojet
         }
        if(params.nomporteur!=null)
         {
             session.nomporteur=params.nomporteur
         }
         if(params.datesoumissionini!=null)
         {
             session.datesoumissionini=params.datesoumissionini
         }
         if(params.datesoumissionfinal!=null)
         {
             session.datesoumissionfinal=params.datesoumissionfinal
         }
         def nomprojet=session.nomprojet 
         def nomporteur=session.nomporteur
         def datesoumissionini=session.datesoumissionini
         def datesoumissionfinal=params.datesoumissionfinal
         Date datedebut=null
         Date datefin=null
         def map=[:]
         if((datesoumissionini!=null)&&(!(datesoumissionini.equals("")))&& (datesoumissionini!='null')&&(datesoumissionfinal!=null)&&(!(datesoumissionfinal.equals("")))&& (datesoumissionfinal!='null'))
         {
            map=[dateDebut:Date.parse("dd/MM/yyyy",datesoumissionini),dateFin:Date.parse("dd/MM/yyyy",datesoumissionfinal)]  
         }
         else
         {
              map=[dateDebut:null,dateFin:null]
         }
         
//         
//if((datesoumissionini!=null)&&(!(datesoumissionini.equals("")))&& (datesoumissionini!='null')&&(datesoumissionfinal!=null)&&(!(datesoumissionfinal.equals("")))&& (datesoumissionfinal!='null'))
//        {
//            
//            SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
//            datedebut = formatter.parse(datesoumissionini);
//            datefin = formatter.parse(datesoumissionfinal);
//        }
        
        
       params.max = Math.min(max ?: 10, 100)
       if(params.offset==null)
       {
           params.offset=0
       }

       def c=LabelisationProjet.createCriteria()
        def connections1 = LabelisationProjet.createCriteria().list
        {
         
            if((nomprojet!=null)&&(!(nomprojet.equals("")))&& (nomprojet!='null'))
            {
                ilike("nomProjet",nomprojet + "%")
            }
            if((nomporteur!=null)&&(!(nomporteur.equals("")))&& (nomporteur!='null'))
            {
                porteurProjet
            {
               ilike("nom",nomporteur + "%") 
            }
                
            }
            
            if((datesoumissionini!=null)&&(!(datesoumissionini.equals("")))&& (datesoumissionini!='null')&&(datesoumissionfinal!=null)&&(!(datesoumissionfinal.equals("")))&& (datesoumissionfinal!='null'))
            {
             between("dateSoumissionProjet",map.dateDebut,map.dateFin)   
            }
            
            
            
            def goffset
           if(params.offset instanceof String)
            {
                goffset=Integer.parseInt(params.offset)
            }
            else
            {
                goffset=params.offset
            }
            def maxset
            if(params.max instanceof String)
            {
                maxset=Integer.parseInt(params.max)
            }
            else
            {
                maxset=params.max
            }
            firstResult(goffset) 
            maxResults(maxset)
            if(params.order) {
                order(params.sort, params.order)
            }
            resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
            
        }
//        respond Utilisateur.list()
        //respond LabelisationProjet.list(params), model:[labelisationProjetInstanceList:LabelisationProjet.list(params),labelisationProjetInstanceCount: LabelisationProjet.count(),global:true]
        
         //respond Utilisateur.list(params), model:[utilisateurInstanceCount: Utilisateur.count()]
         //render(view:"list_projet_1",model:[labelisationProjetInstanceList:connections1,utilisateurInstanceCount: connections1.size(),global:true])
        
        respond connections1, model:[labelisationProjetInstanceList:connections1,utilisateurInstanceCount: connections1.size(),global:true,nomprojet:params.nomprojet,nomporteur:params.nomporteur,datedebut:params.datesoumissionini,datefin:params.datesoumissionfinal]  
            
            
        
        //render(view:"list_projet_1",model:[labelisationProjetInstanceList:labelisationProjetInstanceList,labelisationProjetInstanceCount: LabelisationProjet.count(),global:true])
    }
    
    
    def list_projet_rejete() 
    {
        def mm=MailTemplate.findByCode("2-mailAccepterReglesConfidentialite(porteur+evaluateur)")
        def mm1=MailTemplate.findByCode("2-mailAccepterReglesConfidentialite(porteur+CT)")
        def fichetechnique
            def grilleanalyse
            def fichesignaletique
            def dossierlabellisation
            def business_model_canevas
            session.fichetechnique=servletContext.getAttribute('ficheTechnique')
                 session.grilleanalyse=servletContext.getAttribute('grilleAnalyse')
                 session.business_model_canevas=servletContext.getAttribute('business_model_canevas')
                 session.dossierlabellisation=servletContext.getAttribute('dossierlabellisation')
                 session.fichesignaletique=servletContext.getAttribute('fichesignaletique')
                 session.dossierlabellisation=servletContext.getAttribute('dossierlabellisation')
                 session.business_model_canevas=servletContext.getAttribute('business_model_canevas')
                 
        def user=session.user
        
        if(session.profil=="porteur")
        {
     
                def connections2 = LabelisationProjet.createCriteria().list
        {
              eq("etatProjet","rejet")
              porteurProjet
              {
                  eq("id",user.id)
              }
              if(params.order) {
                order(params.sort, params.order)
            }
            else
            {
               order("dateSoumissionProjet", "desc") 
            }
            resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
            
        }
              respond connections2,model:[rejete:true]  
                
            
            
        }
      
        
    }
    
    
    def list_projet_labelise() 
    {
        def mm=MailTemplate.findByCode("2-mailAccepterReglesConfidentialite(porteur+evaluateur)")
        def mm1=MailTemplate.findByCode("2-mailAccepterReglesConfidentialite(porteur+CT)")
        def fichetechnique
            def grilleanalyse
            def fichesignaletique
            def dossierlabellisation
            def business_model_canevas
            session.fichetechnique=servletContext.getAttribute('ficheTechnique')
                 session.grilleanalyse=servletContext.getAttribute('grilleAnalyse')
                 session.business_model_canevas=servletContext.getAttribute('business_model_canevas')
                 session.dossierlabellisation=servletContext.getAttribute('dossierlabellisation')
                 session.fichesignaletique=servletContext.getAttribute('fichesignaletique')
                 session.dossierlabellisation=servletContext.getAttribute('dossierlabellisation')
                 session.business_model_canevas=servletContext.getAttribute('business_model_canevas')
                 
        def user=session.user
        
        if(session.profil=="porteur")
        {
                    def connections1 = LabelisationProjet.createCriteria().list
        {
             
              eq("etatProjet","confirmation")
              porteurProjet
              {
                  eq("id",user.id)
              }
              if(params.order) {
                order(params.sort, params.order)
            }
            else
            {
               order("dateSoumissionProjet", "desc") 
            }
            resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
            
        }  
            respond connections1,model:[labelise:true,fichetechnique:fichetechnique,grilleanalyse:grilleanalyse,fichesignaletique:fichesignaletique,dossierlabellisation:dossierlabellisation,business_model_canevas:business_model_canevas]   
            
        }
      
        
    } 
    
    
    
    
    def list_projet_encours() 
    {
        def mm=MailTemplate.findByCode("2-mailAccepterReglesConfidentialite(porteur+evaluateur)")
        def mm1=MailTemplate.findByCode("2-mailAccepterReglesConfidentialite(porteur+CT)")
        def fichetechnique
            def grilleanalyse
            def fichesignaletique
            def dossierlabellisation
            def business_model_canevas
            session.fichetechnique=servletContext.getAttribute('ficheTechnique')
                 session.grilleanalyse=servletContext.getAttribute('grilleAnalyse')
                 session.business_model_canevas=servletContext.getAttribute('business_model_canevas')
                 session.dossierlabellisation=servletContext.getAttribute('dossierlabellisation')
                 session.fichesignaletique=servletContext.getAttribute('fichesignaletique')
                 session.dossierlabellisation=servletContext.getAttribute('dossierlabellisation')
                 session.business_model_canevas=servletContext.getAttribute('business_model_canevas')
                 
        def user=session.user
        
        if(session.profil=="porteur")
        {
            
            
 
                    def connections3 = LabelisationProjet.createCriteria().list
        {
             
              eq("etatProjet","En cours")
              porteurProjet
              {
                  eq("id",user.id)
              }
              if(params.order) {
                order(params.sort, params.order)
            }
            else
            {
               order("dateSoumissionProjet", "desc") 
            }
            resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
            
        }
                respond connections3,model:[encours:true,fichetechnique:fichetechnique,grilleanalyse:grilleanalyse,fichesignaletique:fichesignaletique,dossierlabellisation:dossierlabellisation,business_model_canevas:business_model_canevas] 
             //}
               
                          
            }
     
        
    } 
    
    
    
    
    
    
    
     def downloadLettreConfidentialite1bp() {
        
        ByteArrayOutputStream baos = new ByteArrayOutputStream()
    ZipOutputStream zipFile = new ZipOutputStream(baos)
    
        def path=null
        def nomexacte=null
        def nomexacte1=null
        
        
        
        def documentInstance1=Document.findByCode("lettreConfidentialite")
                if(documentInstance1.getTotalAttachments('lettreConfidentialite')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(documentInstance1.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'lettreConfidentialite')
                                def ext=att.id
        path="${userHome}/mncupload/com.rabbahsoft.mnc.Document/${documentInstance1.id}/${ext}.${att.ext}"
//        path="${userHome}/mncupload/com.rabbahsoft.mnc.Document/${documentInstance1.id}/85.${att.ext}"
       
        nomexacte="${ext}.${att.ext}"
        nomexacte1=nomexacte.replace("${ext}","lettreconfidentialite")
                }
         if(nomexacte1!=null)
                {
                    
             File file1 = new File("${path}")
         zipFile.putNextEntry(new ZipEntry("${nomexacte1}"))
          file1.withInputStream { i ->

            zipFile << i
                
                }        
                }

              
                
        
        zipFile.closeEntry()
         
        zipFile.finish()
        response.setHeader("Content-disposition", "filename=\"lettreConfidentialite.zip\"")
        response.contentType = "application/zip"
        response.outputStream << baos.toByteArray()
        response.outputStream.flush()   
        
    }
    
    
    
    
    
    def downloadfichetechniquepresentationdetaille() {
        ByteArrayOutputStream baos = new ByteArrayOutputStream()
    ZipOutputStream zipFile = new ZipOutputStream(baos)
    
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        if(labelisationProjetInstance!=null)
        {
                def pathficheTechnique=null
        def nomexacteficheTechnique=null
        def nomexacteficheTechnique1=null
           if(labelisationProjetInstance.getTotalAttachments('ficheTechnique')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'ficheTechnique')
                                def ext=att.id
        pathficheTechnique="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
                nomexacteficheTechnique="${ext}.${att.ext}"
        nomexacteficheTechnique1=nomexacteficheTechnique.replace("${ext}","dossierlabellisation")
                }
                
        if(nomexacteficheTechnique!=null)
                {
                def file1 = new File("${pathficheTechnique}")
         zipFile.putNextEntry(new ZipEntry("${nomexacteficheTechnique1}"))
          file1.withInputStream { i ->

            zipFile << i
          }
                }
                
        
        def pathpresentationdetaillee=null
        def nomexactepresentationdetaillee=null
        def nomexactepresentationdetaillee1=null
           if(labelisationProjetInstance.getTotalAttachments('presentationdetaillee')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'presentationdetaillee')
                                def ext=att.id
        pathpresentationdetaillee="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
                nomexactepresentationdetaillee="${ext}.${att.ext}"
        nomexactepresentationdetaillee1=nomexactepresentationdetaillee.replace("${ext}","ficheprojet")
                }
                
        if(nomexactepresentationdetaillee!=null)
                {
                def file1 = new File("${pathpresentationdetaillee}")
         zipFile.putNextEntry(new ZipEntry("${nomexactepresentationdetaillee1}"))
          file1.withInputStream { i ->

            zipFile << i
          }
                }
                
def nomexacte122=null
        def nomexacte1122=null
        def documentInstance=Document.findByCode("grilleAnalyse")
        def grilleanalyse = documentInstance.getAttachments('grilleAnalyse')[0]
        def pathgrilleanalyse=null
        if(grilleanalyse!='null' && grilleanalyse!='' && grilleanalyse!=null)
        {
            def attc=AttachmentLink.findByReferenceId(documentInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'grilleAnalyse')
                                def ext=att.id
        pathgrilleanalyse="${userHome}/mncupload/com.rabbahsoft.mnc.Document/${documentInstance.id}/${ext}.${att.ext}" 
        nomexacte122="${ext}.${att.ext}"
        nomexacte1122= nomexacte122.replace("${ext}","grilleanalyse")
                }
                
        if(nomexacte122!=null)
                {
                 def file1 = new File("${pathgrilleanalyse}")
         zipFile.putNextEntry(new ZipEntry("${nomexacte1122}"))
          file1.withInputStream { i ->

            zipFile << i
                }
                }
        
                
        
        zipFile.closeEntry()
        zipFile.finish()
        response.setHeader("Content-disposition", "filename=\"fiche+presentation+grille.zip\"")
        response.contentType = "application/zip"
        response.outputStream << baos.toByteArray()
        response.outputStream.flush()   
        }
//        else
//        {
//            
//        }
    }
    
  def downloadgrilleanalyse() {
        
        ByteArrayOutputStream baos = new ByteArrayOutputStream()
    ZipOutputStream zipFile = new ZipOutputStream(baos)
    
        def labelisationProjetInstance=LabelisationProjet.get(params.id)
        
                def pathficheTechnique=null
        def nomexacteficheTechnique=null
        def nomexacteficheTechnique1=null
           if(labelisationProjetInstance.getTotalAttachments('presentation1')!=0)
                {
                   def attc=AttachmentLink.findByReferenceId(labelisationProjetInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'presentation1')
                                def ext=att.id
        pathficheTechnique="${userHome}/mncupload/com.rabbahsoft.mnc.LabelisationProjet/${labelisationProjetInstance.id}/${ext}.${att.ext}"
        nomexacteficheTechnique="${ext}.${att.ext}"
        nomexacteficheTechnique1=nomexacteficheTechnique.replace("${ext}","grilleAnalyse")
                }
                
        if(nomexacteficheTechnique!=null)
                {
                def file1 = new File("${pathficheTechnique}")
         zipFile.putNextEntry(new ZipEntry("${nomexacteficheTechnique1}"))
          file1.withInputStream { i ->

            zipFile << i
          }
                }
                
        
        
        
                
        
        zipFile.closeEntry()
         
        zipFile.finish()
        response.setHeader("Content-disposition", "filename=\"grilleAnalyse.zip\"")
        response.contentType = "application/zip"
        response.outputStream << baos.toByteArray()
        response.outputStream.flush()   
        
    }  
    def downloadLettreConfidentialitebp() { 
    }
    
}