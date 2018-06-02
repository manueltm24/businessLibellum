package com.businessLibellum.domains

class Item {

    String nombre
    double precio
    boolean facturarSinExistencia = true
    int cantidad
    Empresa empresa

    //Datos genericos del dominio.
    boolean expired = false
    boolean enabled = true;
    String creadoPor = "sistemas";
    String modificadoPor = "sistemas";
    Date dateCreated;
    Date lastUpdated;

    static constraints = {
        cantidad(nullable: true)
    }
}
