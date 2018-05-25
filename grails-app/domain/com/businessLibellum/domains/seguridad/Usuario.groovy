package com.businessLibellum.domains.seguridad

import com.businessLibellum.domains.Empresa

class Usuario {

    String username
    String password
    String nombre
    String apellido
    String telefono
    String email


    //Autoridad
    boolean superAdmin=false

    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    //Datos genericos del dominio.
    boolean enabled = true;
    String creadoPor = "sistemas";
    String modificadoPor = "sistemas";
    Date dateCreated;
    Date lastUpdated;

    Set<Perfil> getAuthorities() {
        (UsuarioPerfil.findAllByUsuario(this) as List<UsuarioPerfil>)*.perfil as Set<Perfil>
    }

    static constraints = {
        password blank: false, password: true
        username blank: false, unique: true
        telefono nullable: true
        email nullable: true
        apellido nullable: true
    }

    static mapping = {
        table 'seg_usuario'
        password column: '`password`'
    }


    String nombreCompleto(){
        if(apellido!=null)
            return nombre +" "+apellido
        else
            return nombre
    }

    static boolean isSuperAdmin(Usuario usuario){

        if(UsuarioPerfil.findByUsuarioAndPerfil(usuario,Perfil.findByAuthority("ROLE_ADMIN"))){
            return true
        }
        else
            return false
    }

}
