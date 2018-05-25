package com.businessLibellum.groovy.commands

import grails.validation.Validateable

class ItemForm implements Validateable{
    long idItem
    int cantidad
    Double preciounidad

    static constraints = {

    }
}
