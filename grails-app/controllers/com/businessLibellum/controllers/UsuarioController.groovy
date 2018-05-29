package com.businessLibellum.controllers

import com.businessLibellum.domains.Empresa
import com.businessLibellum.domains.seguridad.Perfil
import com.businessLibellum.domains.seguridad.Usuario
import com.businessLibellum.domains.seguridad.UsuarioPerfil
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.access.method.P

@Secured(["ROLE_ADMIN", "ROLE_SUPERADMIN","ROLE_USUARIO"])

class UsuarioController {
    def springSecurityService


    def index() {
        [usuarios:Usuario.findAllByEnabled(true)]
    }

    def crearNuevoUsuario(){
        [usuarios:Usuario.findAllByEnabled(true),empresas:Empresa.findAllByEnabled(true)]
    }

    def procesarNuevoUsuario(String nombre, String apellido, String username, String password, String telefono, String email, boolean admin){

        Usuario usuarioLogueado = (Usuario) springSecurityService.currentUser
        Usuario usuario=new Usuario(username: username, password: password, nombre: nombre, apellido: apellido,telefono: telefono,email:email, creadoPor: usuarioLogueado.username).save(flush:true, failOneError:true)


        def listadoEmpresasSeleccionadas = params.empresasSeleccionadas
        listadoEmpresasSeleccionadas.each {
            Empresa empresa = Empresa.findById(Long.parseLong(it))
            empresa.usuarios.add(usuario)
            empresa.save(flush:true,failOnError:true)
        }
        if(admin){
            new UsuarioPerfil(usuario: usuario, perfil: Perfil.findByAuthority("ROLE_ADMIN")).save(flush:true, failOneError:true)
        }
        else{
            new UsuarioPerfil(usuario: usuario, perfil: Perfil.findByAuthority("ROLE_USUARIO")).save(flush:true, failOneError:true)
        }





        redirect(controller:'usuario', action:'index')

    }

    def eliminarUsuario(Long idUsuario){
        println(idUsuario)
        redirect(controller:'usuario', action:'index')

    }


}
