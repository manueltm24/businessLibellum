package com.businessLibellum.domains.facturacion

import com.businessLibellum.domains.Empresa

class Comprobante {

    String nombre
    String numeracion_Inicio
    Long numeracion_Fin
    Empresa empresa
    Double secuencia =1

    //Datos genericos del dominio.
    boolean expired = false
    boolean enabled = true;
    String creadoPor = "sistemas";
    String modificadoPor = "sistemas";
    Date dateCreated;
    Date lastUpdated;

    static constraints = {
//        numeracion_Inicio maxSize: 3
//        numeracion_Fin maxSize: 8
    }
}
