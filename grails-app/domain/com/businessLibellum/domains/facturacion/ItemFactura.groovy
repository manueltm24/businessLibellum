package com.businessLibellum.domains.facturacion

import com.businessLibellum.domains.Item

class ItemFactura {

    Item item
    int cantidad
    Double preciounidad
    Factura factura

    //Datos para facturacion, JASPERREPORT
    String nombre_Item

    static constraints = {
    }

}
