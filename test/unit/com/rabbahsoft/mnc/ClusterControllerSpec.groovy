package com.rabbahsoft.mnc



import grails.test.mixin.*
import spock.lang.*

@TestFor(ClusterController)
@Mock(Cluster)
class ClusterControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.clusterInstanceList
            model.clusterInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.clusterInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def cluster = new Cluster()
            cluster.validate()
            controller.save(cluster)

        then:"The create view is rendered again with the correct model"
            model.clusterInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            cluster = new Cluster(params)

            controller.save(cluster)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/cluster/show/1'
            controller.flash.message != null
            Cluster.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def cluster = new Cluster(params)
            controller.show(cluster)

        then:"A model is populated containing the domain instance"
            model.clusterInstance == cluster
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def cluster = new Cluster(params)
            controller.edit(cluster)

        then:"A model is populated containing the domain instance"
            model.clusterInstance == cluster
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/cluster/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def cluster = new Cluster()
            cluster.validate()
            controller.update(cluster)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.clusterInstance == cluster

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            cluster = new Cluster(params).save(flush: true)
            controller.update(cluster)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/cluster/show/$cluster.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/cluster/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def cluster = new Cluster(params).save(flush: true)

        then:"It exists"
            Cluster.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(cluster)

        then:"The instance is deleted"
            Cluster.count() == 0
            response.redirectedUrl == '/cluster/index'
            flash.message != null
    }
}
