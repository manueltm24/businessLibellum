package com.businessLibellum.domains


class Cliente {

    String nombre
    String telefono
    String rnc

    //TODO ESTANDARIZAR LA DIRECCION (CREAR OBJETOS PAIS, CIUDAD, ETC)
    String direccion
    String ciudad
    String pais

    Empresa empresa

    //Datos genericos del dominio.
    boolean expired = false
    boolean enabled = true;
    String creadoPor = "sistemas";
    String modificadoPor = "sistemas";
    Date dateCreated;
    Date lastUpdated;

    static constraints = {

        direccion(nullable: true)
        pais(nullable: true)
        ciudad(nullable: true)
        rnc(nullable: true)

    }

}
