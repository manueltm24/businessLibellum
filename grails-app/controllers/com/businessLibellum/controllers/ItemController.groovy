package com.businessLibellum.controllers

import com.businessLibellum.IConstantes
import com.businessLibellum.domains.Cliente
import com.businessLibellum.domains.Empresa
import com.businessLibellum.domains.Item
import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN", "ROLE_SUPERADMIN","ROLE_USUARIO"])

class ItemController {

    def index() {
        Empresa empresa=Empresa.findById(session[IConstantes.EMPRESA_SELECCIONADA] as Long)
        [items:Item.findAllByEmpresaAndEnabled(empresa,true)]
    }

    def nuevoItem(){}

    def procesarNuevoItem(String nombre, double  precio, boolean facturarsinexistencia, int cantidad){
        Empresa empresa=Empresa.findById(session[IConstantes.EMPRESA_SELECCIONADA] as Long)
        println(facturarsinexistencia)
        new Item(empresa: empresa, nombre: nombre, precio: precio, facturarSinExistencia: facturarsinexistencia,cantidad:cantidad).save(flush:true,failOnError:true)
        redirect(controller:'item', action:'index')
    }

    def editarItem(long idItem){
        [item: Item.findById(idItem)]
    }

    def procesarEditarItem(long id,String nombre, double  precio, boolean facturarsinexistencia, int cantidad){
        Item item = Item.findById(id)
        item.nombre=nombre
        item.precio=precio
        item.facturarSinExistencia=facturarsinexistencia
        item.cantidad=cantidad
        item.save(flush:true,failOnError:true)
        redirect(controller:'item', action:'index')
    }

    def eliminarItem(long idItem){
        Item item = Item.findById(idItem)
        item.enabled=false
        item.save(flush:true,failOnError:true)
        redirect(controller:'item', action:'index')
    }
}
