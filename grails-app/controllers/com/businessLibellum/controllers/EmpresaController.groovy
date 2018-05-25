package com.businessLibellum.controllers

import com.businessLibellum.IConstantes
import com.businessLibellum.domains.Empresa
import com.businessLibellum.domains.Foto
import com.businessLibellum.domains.seguridad.Usuario
import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN", "ROLE_SUPERADMIN","ROLE_USUARIO"])

class EmpresaController {
    def springSecurityService


    def index() {
        [empresas: Empresa.findAllByEnabled(true)]
    }

    def crearNuevaEmpresa(){

    }

    def procesarNuevaEmpresa(String nombreEmpresa, String telefono, String direccion, String pais, String ciudad, String rnc){
        Usuario usuarioLogueado = (Usuario) springSecurityService.currentUser

        //GUARDAR FOTO
        def uploadedFile = params.imagen
        //Convirtiendo file to bytes
        Foto foto = new Foto(payload: uploadedFile.getBytes(), name: uploadedFile.originalFilename,type: uploadedFile.contentType, creadoPor: usuarioLogueado.username  )
        foto.save flush:true



        new Empresa(nombre: nombreEmpresa, telefono: telefono, direccion: direccion, pais: pais, ciudad: ciudad,rnc: rnc, logoEmpresa: foto).save(flush:true,failOnError:true)
        redirect(controller:'empresa', action:'index')

    }

    def selectorEmpresa(){
        Usuario usuario = (Usuario) springSecurityService.currentUser
        List<Empresa> listadoEmpresas = new ArrayList<Empresa>()
        if(usuario?.superAdmin){
            listadoEmpresas=(Empresa.findAllByEnabled(true))
        }
        else{
            Empresa.findAllByEnabled(true).each {empresa ->
                if(empresa.usuarios.contains(usuario)){
                    listadoEmpresas.add(empresa)
                }

            }
        }
        [empresas: listadoEmpresas]
    }


    def procesarSelectorEmpresa(long idEmpresa){
        println "La empresa seleccionada: "+idEmpresa
        Empresa empresa = Empresa.get(idEmpresa)

        if(empresa) {
            session.setAttribute(IConstantes.EMPRESA_SELECCIONADA, idEmpresa);
            redirect(uri: "/")
            return;
        }
        println("No selecciono un consorcio")
        redirect(controller:'empresa', action:'selectorEmpresa')
    }
}
