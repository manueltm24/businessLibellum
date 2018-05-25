package com.businessLibellum.domains

class Inventario {

    Empresa empresa

    static hasMany = [items: Item]

    static constraints = {
    }
}
