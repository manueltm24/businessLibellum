package com.businessLibellum.domains.facturacion

import com.businessLibellum.domains.Cliente
import com.businessLibellum.domains.Empresa
import com.businessLibellum.domains.Item

class Factura {

    String tipoFactura
    Date fecha
    Empresa empresa
    Double subTotal
    Double total
    int porciertoDescuento
    int porcientoImpuesto
    MetodoPago metodoPago
    Comprobante comprobante
    Cliente cliente


    //Datos para facturacion, JASPERREPORT
    //Cliente
    String nombre_Cliente
    String direccion_Cliente
    String ciudad_Cliente
    String pais_Cliente
    String telefono_Cliente

    String metodoPago_String
    String comprobante_String


    //Datos genericos del dominio.
    boolean expired = false
    boolean enabled = true;
    String creadoPor = "sistemas";
    String modificadoPor = "sistemas";
    Date dateCreated;
    Date lastUpdated;

    String detalles_Factura


//    static hasMany = [articulos:ItemFactura]

    static constraints = {
        porcientoImpuesto(nullable:true)
        porciertoDescuento(nullable:true)
        fecha(nullable:true)

        nombre_Cliente(nullable:true)
        direccion_Cliente(nullable:true)
        ciudad_Cliente(nullable:true)
        pais_Cliente(nullable:true)
        telefono_Cliente(nullable:true)

        detalles_Factura(nullable:true)
    }
}
