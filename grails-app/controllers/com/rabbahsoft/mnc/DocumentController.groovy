package com.rabbahsoft.mnc


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import com.macrobit.grails.plugins.attachmentable.domains.Attachment
import com.macrobit.grails.plugins.attachmentable.domains.AttachmentLink
import com.macrobit.grails.plugins.attachmentable.util.AttachmentableUtil
/**
 * DocumentController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class DocumentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def index() {
        respond new Document(params)
    }
    def Kitdocument() {
        respond new Document(params)
    }
    def Kitporteur() {
        respond new Document(params)
    }
    def Kitevaluateur() {
        respond new Document(params)
    }
    
    @Transactional
    def uploadfiles() {
        def genre=""
        if(params.type=="fichesignaletique")
        {
          genre=params.fichesignaletique 
        }
        if(params.type=="dossierlabellisation")
        {
          genre=params.dossierlabellisation 
        }
        if(params.type=="business_model_canevas")
        {
          genre=params.business_model_canevas 
        }
        if(params.type=="grilleAnalyse")
        {
          genre=params.grilleAnalyse 
        }
        if(params.type=="lettreConfidentialite")
        {
          genre=params.lettreConfidentialite 
        }
        def size=genre.size
         if (size > 1048576)// checks the file more than 1 MB
           {  
            render false
           } 
           else
           {
        def documentInstance=Document.findByCode(params.type)
        if(documentInstance==null){
            documentInstance = new Document(code:params.type)
            documentInstance.save(failOnError:true,flush:true)
        }        
        attachUploadedFilesTo(documentInstance) 
        render true
           }
        
       
//        def ficheTechnique='ficheTechnique'
//        def grilleAnalyse='grilleAnalyse'
//        def lettreConfidentialite='lettreConfidentialite'
//        def FicheSignalétique='FicheSignalétique'
//        if(params.type=='ficheTechnique')
//        {
//            def attc=AttachmentLink.findByReferenceId(documentInstance.id)
//                                long idlink=attc.id
//                                def att=Attachment.findByLnkAndInputName(attc,'ficheTechnique')
//          session.ficheTechnique="${request.contextPath}/attachmentable/download/${att.id}"
//          servletContext.setAttribute("ficheTechnique",session.ficheTechnique)
//          
//        }
//       else if(params.type=='grilleAnalyse')
//        {
//            def attc=AttachmentLink.findByReferenceId(documentInstance.id)
//                                long idlink=attc.id
//                                def att=Attachment.findByLnkAndInputName(attc,'grilleAnalyse')
//                                
//          session.grilleAnalyse="${request.contextPath}/attachmentable/download/${att.id}"  
//          servletContext.setAttribute("grilleAnalyse",session.grilleAnalyse)
//        }
//        else if(params.type=='lettreConfidentialite')
//        {
//             def attc=AttachmentLink.findByReferenceId(documentInstance.id)
//                                long idlink=attc.id
//                                def att=Attachment.findByLnkAndInputName(attc,'lettreConfidentialite')
//                                
//          session.lettreConfidentialite="${request.contextPath}/attachmentable/download/${att.id}"  
//          servletContext.setAttribute("lettreConfidentialite",session.lettreConfidentialite)
//        }
//        else if(params.type=='fichesignaletique')
//        {
//             def attc=AttachmentLink.findByReferenceId(documentInstance.id)
//                                long idlink=attc.id
//                                def att=Attachment.findByLnkAndInputName(attc,'fichesignaletique')
//                                
//          session.fichesignaletique="${request.contextPath}/attachmentable/download/${att.id}"  
//          servletContext.setAttribute("fichesignaletique",session.fichesignaletique)
//        }
//        else if(params.type=='dossierlabellisation')
//        {
//             def attc=AttachmentLink.findByReferenceId(documentInstance.id)
//                                long idlink=attc.id
//                                def att=Attachment.findByLnkAndInputName(attc,'dossierlabellisation')
//                                
//          session.dossierlabellisation="${request.contextPath}/attachmentable/download/${att.id}"  
//          servletContext.setAttribute("dossierlabellisation",session.dossierlabellisation)
//        }
//        else if(params.type=='business_model_canevas')
//        {
//             def attc=AttachmentLink.findByReferenceId(documentInstance.id)
//                                long idlink=attc.id
//                                def att=Attachment.findByLnkAndInputName(attc,'business_model_canevas')
//                                
//          session.business_model_canevas="${request.contextPath}/attachmentable/download/${att.id}"  
//          servletContext.setAttribute("business_model_canevas",session.business_model_canevas)
//        }
//        else
//        {
//            servletContext.setAttribute("grilleAnalyse","")
//            servletContext.setAttribute("ficheTechnique","")
//            servletContext.setAttribute("lettreConfidentialite","")
//            servletContext.setAttribute("fichesignaletique","")
//            servletContext.setAttribute("dossierlabellisation","")
//            servletContext.setAttribute("business_model_canevas","")
//        }
        
    }
    
    @Transactional
    def deletefile() {
        def documentInstance = Document.get(Integer.parseInt(params.id))
        documentInstance.removeAttachment(Integer.parseInt(params.idfile))
        render true
    }
     def indexfichetechnique() {
        respond new Document(params)
    }
     def indexgrilleanalyse() {
        respond new Document(params)
    }
    def index_fichetechnique() {
        
        respond new Document(params)
    }
    def index_grilleanalyse() {
       respond new Document(params) 
    }
     @Transactional
    def save_fichetechnique() {
        def documentInstance=Document.findByCode('ficheTechnique')
        if(documentInstance==null){
            documentInstance = new Document(code:'ficheTechnique')
            documentInstance.save(failOnError:true,flush:true)
        }    
        attachUploadedFilesTo(documentInstance)
        def ficheTechnique='ficheTechnique'
        if(params.ficheTechnique!=null && params.ficheTechnique!='null' && params.ficheTechnique!='')
        {
            def attc=AttachmentLink.findByReferenceId(documentInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'ficheTechnique')
          session.ficheTechnique="${request.contextPath}/attachmentable/download/${att.id}" 
          
        }
        else
        {
            session.ficheTechnique=""
        }
       
       redirect(action: "index")
    }
     @Transactional
    def save_grilleanalyse() {
        def documentInstance=Document.findByCode('grilleAnalyse')
        if(documentInstance==null){
            documentInstance = new Document(code:'grilleAnalyse')
            documentInstance.save(failOnError:true,flush:true)
        }  
        attachUploadedFilesTo(documentInstance)
        documentInstance.getTotalAttachments('grilleanalyse')
        
        def grilleanalyse='grilleanalyse'
        if(params.grilleanalyse!=null && params.grilleanalyse!='null' && params.grilleanalyse!='')
        {
            def attc=AttachmentLink.findByReferenceId(documentInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'grilleanalyse')
          session.grilleAnalyse="${request.contextPath}/attachmentable/download/${att.id}" 
          
        }
        else
        {
            session.grilleAnalyse=""
        }
       
       redirect(action: "index")
    }
  
    
    @Transactional
    def uploadfilesinit() {
        def documentInstance=Document.findByCode(params.type)
        if(documentInstance==null){
            documentInstance = new Document(code:params.type)
            documentInstance.save(failOnError:true,flush:true)
        }        
        attachUploadedFilesTo(documentInstance)
        def ficheTechnique='ficheTechnique'
        def grilleAnalyse='grilleAnalyse'
        def lettreConfidentialite='lettreConfidentialite'
        def FicheSignalétique='FicheSignalétique'
        if(params.type=='ficheTechnique')
        {
            def attc=AttachmentLink.findByReferenceId(documentInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'ficheTechnique')
          session.ficheTechnique="${request.contextPath}/attachmentable/download/${att.id}"
          servletContext.setAttribute("ficheTechnique",session.ficheTechnique)
          
        }
       else if(params.type=='grilleAnalyse')
        {
            def attc=AttachmentLink.findByReferenceId(documentInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'grilleAnalyse')
                                
          session.grilleAnalyse="${request.contextPath}/attachmentable/download/${att.id}"  
          servletContext.setAttribute("grilleAnalyse",session.grilleAnalyse)
        }
        else if(params.type=='lettreConfidentialite')
        {
             def attc=AttachmentLink.findByReferenceId(documentInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'lettreConfidentialite')
                                
          session.lettreConfidentialite="${request.contextPath}/attachmentable/download/${att.id}"  
          servletContext.setAttribute("lettreConfidentialite",session.lettreConfidentialite)
        }
        else if(params.type=='fichesignaletique')
        {
             def attc=AttachmentLink.findByReferenceId(documentInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'fichesignaletique')
                                
          session.fichesignaletique="${request.contextPath}/attachmentable/download/${att.id}"  
          servletContext.setAttribute("fichesignaletique",session.fichesignaletique)
        }
        else if(params.type=='dossierlabellisation')
        {
             def attc=AttachmentLink.findByReferenceId(documentInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'dossierlabellisation')
                                
          session.dossierlabellisation="${request.contextPath}/attachmentable/download/${att.id}"  
          servletContext.setAttribute("dossierlabellisation",session.dossierlabellisation)
        }
        else if(params.type=='business_model_canevas')
        {
             def attc=AttachmentLink.findByReferenceId(documentInstance.id)
                                long idlink=attc.id
                                def att=Attachment.findByLnkAndInputName(attc,'business_model_canevas')
                                
          session.business_model_canevas="${request.contextPath}/attachmentable/download/${att.id}"  
          servletContext.setAttribute("business_model_canevas",session.business_model_canevas)
        }
        else
        {
            servletContext.setAttribute("grilleAnalyse","")
            servletContext.setAttribute("ficheTechnique","")
            servletContext.setAttribute("lettreConfidentialite","")
            servletContext.setAttribute("fichesignaletique","")
            servletContext.setAttribute("dossierlabellisation","")
            servletContext.setAttribute("business_model_canevas","")
        }
        render true
    }

}
