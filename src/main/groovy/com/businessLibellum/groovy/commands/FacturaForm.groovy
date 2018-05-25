package com.businessLibellum.groovy.commands

import grails.validation.Validateable

class FacturaForm implements Validateable {
    long cliente
    long  metodoPago
    long comprobante
    Double subtotal
    int descuento_porciento
    int impuesto_porciento
    Double total

    List<ItemForm> listadoArticulos

    static constraints = {

    }
}
