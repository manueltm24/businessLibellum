package com.businessLibellum.domains.facturacion

import com.businessLibellum.domains.Cliente
import com.businessLibellum.domains.Empresa
import com.businessLibellum.domains.Item

class Factura {

    Long codigo
    String ncf
    Date vencimientoSecuencia_NCF
    Cliente cliente
    MetodoPago metodoPago
    Comprobante comprobante
    Date fecha
    Empresa empresa
    boolean facturaSaldada

    //Datos dinero
    BigDecimal porcientoImpuesto
    BigDecimal porcientoDescuento
    BigDecimal montoBruto
    BigDecimal montoDescuento
    BigDecimal montoImpuesto
    BigDecimal montoNeto

    String tipoFactura
    String notas

    /**
     * CAMPOS PARA REPORTE FACTURA (JASPER REPORTS)
     */
    //Cliente
    String nombre_Cliente
    String direccion_Cliente
    String ciudad_Cliente
    String pais_Cliente
    String telefono_Cliente
    String rnc_Cliente
    //EMPRESA
    String nombre_Empresa
    String direccion_Empresa
    String ciudad_Empresa
    String pais_Empresa
    String telefono_Empresa
    String rnc_Empresa

    String metodoPago_String


    //Datos genericos del dominio.
    boolean expired = false
    boolean enabled = true;
    String creadoPor = "sistemas";
    String modificadoPor = "sistemas";
    Date dateCreated;
    Date lastUpdated;


    static constraints = {
        vencimientoSecuencia_NCF(nullable: true)
        porcientoImpuesto(nullable:true)
        porcientoDescuento(nullable:true)
        montoImpuesto(nullable: true)
        montoDescuento(nullable: true)

        nombre_Cliente(nullable:true)
        direccion_Cliente(nullable:true)
        ciudad_Cliente(nullable:true)
        pais_Cliente(nullable:true)
        telefono_Cliente(nullable:true)

    }
}
