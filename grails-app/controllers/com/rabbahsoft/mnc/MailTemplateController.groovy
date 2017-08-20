package com.rabbahsoft.mnc


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import org.json.*
import grails.converters.*
/**
 * MailTemplateController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class MailTemplateController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        redirect(action: "list_template")
        
    }

	def list(Integer max) {
        }
    

    def show(MailTemplate mailTemplateInstance) {
        respond mailTemplateInstance
    }

    def create() {
        respond new MailTemplate(params)
    }

    @Transactional
    def save(MailTemplate mailTemplateInstance) {
        if (mailTemplateInstance == null) {
            notFound()
            return
        }

        if (mailTemplateInstance.hasErrors()) {
            respond mailTemplateInstance.errors, view:'create'
            return
        }
        mailTemplateInstance.save flush:true
        request.withFormat {
            form {
                flash.message = message(code: 'default.createdmessage.message',default: "L'objet a été créé")
                //redirect mailTemplateInstance
                redirect(action: "list_template")
            }
            '*' { respond mailTemplateInstance, [status: CREATED] }
        }
    }

    def edit(MailTemplate mailTemplateInstance) {
        respond mailTemplateInstance
    }

    @Transactional
    def update(MailTemplate mailTemplateInstance) {
        if (mailTemplateInstance == null) {
            notFound()
            return
        }

        if (mailTemplateInstance.hasErrors()) {
            respond mailTemplateInstance.errors, view:'edit'
            return
        }

        mailTemplateInstance.save flush:true
        request.withFormat {
            form {
            flash.message = message(code: 'default.updatedmessage.message',default: "L'objet a été modifié")
//                flash.message = "L'objet a été modifié"
//                 flash.message = "modification d'objet avec succées"
//                redirect mailTemplateInstance
                redirect(action: "list_template")
            }
            '*'{ respond mailTemplateInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MailTemplate mailTemplateInstance) {

        if (mailTemplateInstance == null) {
            notFound()
            return
        }

        mailTemplateInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deletedmessage.message',default: "L'objet a été supprimé")
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'mailTemplateInstance.label', default: 'MailTemplate'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
//    def getTemplate(){
//    def templatemail=MailTemplate.findByCode(params.state)
//    render templatemail as JSON
//    }
    
    def index1(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MailTemplate.list(params), model:[mailTemplateInstanceCount: MailTemplate.count()]
    }
    def  showData(){
def mailList=[]
for(mail in MailTemplate.list())
{
    def mail1=[code:mail.code,description:mail.description]
    mailList.add(mail1)
}
//def serverData = ["iTotalRecords" : MailTemplate.count(),"iTotalDisplayRecords" : 10,"aaData": mailList]
def serverData = ["sEcho": 1,"iDisplayStart" : 0,"iTotalDisplayRecords" : 10,"mData": mailList]
render serverData as JSON
        
}
 def list_template(Integer max) {
      params.max = Math.min(max ?: 30, 100)
        respond MailTemplate.list(params), model:[mailTemplateInstanceCount: MailTemplate.count()]
    }
}
