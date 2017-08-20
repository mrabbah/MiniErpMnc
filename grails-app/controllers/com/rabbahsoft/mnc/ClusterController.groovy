package com.rabbahsoft.mnc


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ClusterController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ClusterController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cluster.list(params), model:[clusterInstanceCount: Cluster.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cluster.list(params), model:[clusterInstanceCount: Cluster.count()]
    }

    def show(Cluster clusterInstance) {
        respond clusterInstance
    }

    def create() {
        respond new Cluster(params)
    }

    @Transactional
    def save(Cluster clusterInstance) {
        if (clusterInstance == null) {
            notFound()
            return
        }

        if (clusterInstance.hasErrors()) {
            respond clusterInstance.errors, view:'create'
            return
        }

        clusterInstance.save flush:true
        flash.message="L'oject a été crée"
        redirect(action: "index")
    }

    def edit(Cluster clusterInstance) {
        respond clusterInstance
    }

    @Transactional
    def update(Cluster clusterInstance) {
        if (clusterInstance == null) {
            notFound()
            return
        }

        if (clusterInstance.hasErrors()) {
            respond clusterInstance.errors, view:'edit'
            return
        }

        clusterInstance.save flush:true
        flash.message="L'oject a été modifée"
        redirect(action: "index")
    }

    @Transactional
    def delete(Cluster clusterInstance) {

        if (clusterInstance == null) {
            notFound()
            return
        }

        clusterInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Cluster.label', default: 'Cluster'), clusterInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clusterInstance.label', default: 'Cluster'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
