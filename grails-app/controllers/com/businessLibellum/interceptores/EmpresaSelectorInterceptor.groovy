package com.businessLibellum.interceptores

import com.businessLibellum.IConstantes


class EmpresaSelectorInterceptor {
    int order = 100

    EmpresaSelectorInterceptor(){
        matchAll()
                .excludes(uri: "/login/**")
                .excludes(uri: "/error/**")
                .excludes(uri: "/logout/**")
                .excludes(uri: "/API/**")
                .excludes(controller: 'empresa', action: 'selectorEmpresa|index|procesarNuevaEmpresa|procesarSelectorEmpresa|crearNuevaEmpresa')
                .excludes(controller: 'usuario', action: 'index|procesarNuevoUsuario|procesarEmpresas|eliminarUsuario|crearNuevoUsuario')
                .excludes(controller: 'factura', action: 'modeloFactura')

    }

    boolean before() {
        println(session[IConstantes.EMPRESA_SELECCIONADA])

        println "capturando el uri: ${request.requestURL} request: ${request.remoteHost} - Controlador: ${controllerName} - Action: ${actionName}"

        if(session[IConstantes.EMPRESA_SELECCIONADA]==null){
            redirect(controller:'empresa',action:'selectorEmpresa')
            return false
        }
        true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
