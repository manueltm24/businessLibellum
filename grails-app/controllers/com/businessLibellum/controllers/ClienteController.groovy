package com.businessLibellum.controllers

import com.businessLibellum.IConstantes
import com.businessLibellum.domains.Cliente
import com.businessLibellum.domains.Empresa
import com.businessLibellum.domains.seguridad.Usuario
import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN", "ROLE_SUPERADMIN","ROLE_USUARIO"])

class ClienteController {
    def springSecurityService

    /**
     * VISTA QUE PRESENTA LA LISTA DE CLIENTES
     * @return
     */
    def index() {
        Empresa empresa=Empresa.findById(session[IConstantes.EMPRESA_SELECCIONADA] as Long)
        [clientes: Cliente.findAllByEmpresaAndEnabled(empresa,true)]
    }

    def nuevoCliente(){}

    def procesarNuevoCliente(String nombre, String telefono, String rnc, String direccion, String ciudad, String pais){
        Usuario usuarioLogueado = (Usuario) springSecurityService.currentUser
        Empresa empresa=Empresa.findById(session[IConstantes.EMPRESA_SELECCIONADA] as Long)
        new Cliente(creadoPor: usuarioLogueado.username, empresa: empresa, nombre:nombre, telefono: telefono,rnc: rnc,direccion:direccion,ciudad: ciudad,pais: pais).save(flush:true,failOnError:true)
        redirect(controller:'cliente', action:'index')

    }

    def editarCliente(long idCliente){
        Cliente cliente = Cliente.findById(idCliente)
        [cliente: cliente]
    }

    def procesarEditarCliente(long id,String nombre, String telefono, String rnc, String direccion, String ciudad, String pais) {
        Usuario usuarioLogueado = (Usuario) springSecurityService.currentUser
        Cliente cliente = Cliente.findById(id)
        cliente.nombre=nombre
        cliente.telefono=telefono
        cliente.rnc=rnc
        cliente.direccion=direccion
        cliente.ciudad=ciudad
        cliente.pais=pais
        cliente.modificadoPor=usuarioLogueado.username
        cliente.save(flush:true,failOnError:true)
        redirect(controller:'cliente', action:'index')
    }

    def eliminarCliente(long idCliente){
        Cliente cliente = Cliente.findById(idCliente)
        cliente.enabled=false
        cliente.save(flush:true,failOnError:true)
        redirect(controller:'cliente', action:'index')

    }
}
