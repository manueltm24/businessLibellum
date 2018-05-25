package com.businessLibellum.domains

class Foto {

    String name
    String type
    byte[] payload

    //Datos genericos del dominio.
    boolean habilitado = true;
    String creadoPor = "sistemas";
    String modificadoPor = "sistemas";
    Date dateCreated;
    Date lastUpdated;

    static constraints = {
        payload(nullable:true, maxSize:1073741824) // max of 4GB
        type(blank:true, nullable:true)
        name(blank:true, nullable:true)
    }
}
