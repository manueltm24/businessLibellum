package com.businessLibellum.domains

class Item {

    String nombre
    double precio
    boolean facturarSinExistencia = true
    int cantidad

    static constraints = {
        cantidad(nullable: true)
    }
}
