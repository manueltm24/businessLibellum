package com.businessLibellum.domains.facturacion

import com.businessLibellum.domains.Empresa

class Comprobante {

    String nombre
    String secuencia
    Empresa empresa
    Long contador =1
    Date vencimientoSecuencia


    //Datos genericos del dominio.
    boolean expired = false
    boolean enabled = true;
    String creadoPor = "sistemas";
    String modificadoPor = "sistemas";
    Date dateCreated;
    Date lastUpdated;

    static constraints = {
        vencimientoSecuencia(nullable: true)

    }

    static String verificarSecuencia(Comprobante comprobante){

        if(comprobante.contador==10){
            comprobante.secuencia = comprobante.secuencia.substring(0, comprobante.secuencia.length() - 1) + ''
            comprobante.save(flush:true, failOnError:true)
            return comprobante.secuencia + comprobante.contador
        }
        else if(comprobante.contador==100){
            comprobante.secuencia = comprobante.secuencia.substring(0, comprobante.secuencia.length() - 1) + ''
            comprobante.save(flush:true, failOnError:true)
            return comprobante.secuencia + comprobante.contador
        }
        else if(comprobante.contador==1000){
            comprobante.secuencia = comprobante.secuencia.substring(0, comprobante.secuencia.length() - 1) + ''
            comprobante.save(flush:true, failOnError:true)
            return comprobante.secuencia + comprobante.contador
        }
        else{
            return comprobante.secuencia+comprobante.contador
        }


    }
}
