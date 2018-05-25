package com.businessLibellum.domains.facturacion

class MetodoPago {

    String nombre

    //Datos genericos del dominio.
    boolean expired = false
    boolean enabled = true;
    String creadoPor = "sistemas";
    String modificadoPor = "sistemas";
    Date dateCreated;
    Date lastUpdated;


    static constraints = {
    }
}
