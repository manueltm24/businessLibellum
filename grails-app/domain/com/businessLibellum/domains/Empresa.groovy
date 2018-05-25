package com.businessLibellum.domains

import com.businessLibellum.domains.facturacion.Comprobante
import com.businessLibellum.domains.seguridad.Usuario

class Empresa {

    String nombre
    String telefono
    String rnc
    Foto logoEmpresa

    //TODO ESTANDARIZAR LA DIRECCION (CREAR OBJETOS PAIS, CIUDAD, ETC)
    String direccion
    String ciudad
    String pais

    Double secuenciaFacturacion = 1;


    Inventario inventario

    static hasMany = [usuarios:Usuario, clientes:Cliente]


    //Datos genericos del dominio.
    boolean expired = false
    boolean enabled = true;
    String creadoPor = "sistemas";
    String modificadoPor = "sistemas";
    Date dateCreated;
    Date lastUpdated;

    static constraints = {
        inventario(nullable: true)
        usuarios(nullable: true)
        clientes(nullable: true)
        logoEmpresa(nullable: true)
        rnc(nullable: true)


        direccion(nullable: true)
        pais(nullable: true)
        ciudad(nullable: true)

    }
}
