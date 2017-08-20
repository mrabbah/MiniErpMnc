package com.rabbahsoft.mnc



import grails.test.mixin.*
import spock.lang.*

@TestFor(FormationController)
@Mock(Formation)
class FormationControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.formationInstanceList
            model.formationInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.formationInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def formation = new Formation()
            formation.validate()
            controller.save(formation)

        then:"The create view is rendered again with the correct model"
            model.formationInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            formation = new Formation(params)

            controller.save(formation)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/formation/show/1'
            controller.flash.message != null
            Formation.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def formation = new Formation(params)
            controller.show(formation)

        then:"A model is populated containing the domain instance"
            model.formationInstance == formation
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def formation = new Formation(params)
            controller.edit(formation)

        then:"A model is populated containing the domain instance"
            model.formationInstance == formation
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/formation/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def formation = new Formation()
            formation.validate()
            controller.update(formation)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.formationInstance == formation

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            formation = new Formation(params).save(flush: true)
            controller.update(formation)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/formation/show/$formation.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/formation/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def formation = new Formation(params).save(flush: true)

        then:"It exists"
            Formation.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(formation)

        then:"The instance is deleted"
            Formation.count() == 0
            response.redirectedUrl == '/formation/index'
            flash.message != null
    }
}
