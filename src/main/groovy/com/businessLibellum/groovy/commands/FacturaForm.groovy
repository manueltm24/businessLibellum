package com.businessLibellum.groovy.commands

import grails.validation.Validateable

class FacturaForm implements Validateable {
    long cliente
    long  metodoPago
    long comprobante
    String fecha
    String notas

    //Datos dinero
    BigDecimal porcientoImpuesto
    BigDecimal porcientoDescuento
    BigDecimal montoBruto
    BigDecimal montoDescuento
    BigDecimal montoImpuesto
    BigDecimal montoNeto

    List<ItemForm> listadoArticulos

    static constraints = {

    }
}
