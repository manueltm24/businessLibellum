package com.businessLibellum.controllers

import com.businessLibellum.IConstantes
import com.businessLibellum.domains.Empresa
import com.businessLibellum.domains.facturacion.Comprobante
import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN", "ROLE_SUPERADMIN","ROLE_USUARIO"])

class ComprobanteController {

    def index() {
        Empresa empresa=Empresa.findById(session[IConstantes.EMPRESA_SELECCIONADA] as Long)
        println(empresa.id)

        [comprobantes:Comprobante.findAllByEmpresa(empresa)]
    }
}
