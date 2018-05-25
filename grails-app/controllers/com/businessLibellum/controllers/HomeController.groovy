package com.businessLibellum.controllers

import com.businessLibellum.IConstantes
import com.businessLibellum.domains.Empresa
import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN", "ROLE_SUPERADMIN","ROLE_USUARIO"])

class HomeController {

    def index() {
        Empresa empresa=Empresa.findById(session[IConstantes.EMPRESA_SELECCIONADA] as Long)

        [empresa: empresa]
    }
}
