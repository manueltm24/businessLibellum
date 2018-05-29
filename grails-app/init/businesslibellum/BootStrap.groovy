package businesslibellum

import com.businessLibellum.IConstantes
import com.businessLibellum.domains.Cliente
import com.businessLibellum.domains.Empresa
import com.businessLibellum.domains.facturacion.Comprobante
import com.businessLibellum.domains.Item
import com.businessLibellum.domains.facturacion.MetodoPago
import com.businessLibellum.domains.seguridad.Perfil
import com.businessLibellum.domains.seguridad.Requestmap
import com.businessLibellum.domains.seguridad.Usuario
import com.businessLibellum.domains.seguridad.UsuarioPerfil

import java.text.DateFormat
import java.text.SimpleDateFormat

class BootStrap {

    def init = { servletContext ->

        println "Inicializando la Aplicación"

        Usuario usuario =Usuario.findByUsername("admin") ? null :new Usuario(email: "N/A",username: "admin", password: "admin", nombre: "SuperAdmin",telefono: "N/A",superAdmin: true).save(flush: true, failOnError: true)

        if(usuario) {
            Perfil perfil = new Perfil(authority: "ROLE_SUPERADMIN").save(flush: true, failOnError: true)

            UsuarioPerfil.create(usuario, perfil)

            new Perfil(authority: "ROLE_USUARIO").save(flush: true, failOnError: true)
            new Perfil(authority: "ROLE_ADMIN").save(flush: true, failOnError: true)
            for (String url in [
                    '/', '/error', '/index', '/index.gsp', '/**/favicon.ico', '/shutdown',
                    '/assets/**', '/**/js/**', '/**/css/**', '/**/images/**',
                    '/login', '/login.*', '/login/*',
                    '/logout', '/logout.*', '/logout/*', '/dbconsole/**']) {
                new Requestmap(url: url, configAttribute: 'permitAll,ROLE_ANONYMOUS').save(flush: true, failOnError: true)
            }

            new Requestmap(url: '/console/**', configAttribute: 'ROLE_ADMIN').save(flush: true, failOnError: true)
            new Requestmap(url: '/plugins/console*/**', configAttribute: 'ROLE_ADMIN').save(flush: true, failOnError: true)
            new Requestmap(url: '/static/console/**', configAttribute: 'ROLE_ADMIN').save(flush: true, failOnError: true)
            new Requestmap(url: '/profile/**', configAttribute: 'ROLE_USER').save(flush: true, failOnError: true)
            new Requestmap(url: '/admin/**', configAttribute: 'ROLE_ADMIN').save(flush: true, failOnError: true)
            new Requestmap(url: '/admin/role/**', configAttribute: 'ROLE_ADMIN').save(flush: true, failOnError: true)
            new Requestmap(url: '/admin/user/**', configAttribute: 'ROLE_ADMIN').save(flush: true, failOnError: true)
            new Requestmap(url: '/login/impersonate', configAttribute: 'ROLE_SWITCH_USER,isFullyAuthenticated()').save(flush: true, failOnError: true)

        }


        //PARA PRUEBAS DEL SISTEMA!
        Empresa empresa =Empresa.findByNombre("Vegatec Dominicana") ? null : new Empresa(nombre: 'Vegatec Dominicana', telefono: '809-431-1428', direccion: 'Jardines del Este, C/1 #2A', ciudad: 'Santiago',pais: 'Republica Dominicana', rnc: "402-2268628-5").save(flush: true, failOnError: true)
        Cliente.findByNombre("Vanessa Valenzuela") ? null : new Cliente(nombre: 'Vanessa Valenzuela', telefono: '809-555-5555', direccion: 'Cerros de Gurabo', ciudad: 'Santiago',pais: 'Republica Dominicana', empresa: empresa,rnc: "402-2168457-1").save(flush: true, failOnError: true)
        Item.findByNombre("Coca Cola") ? null : new Item(nombre: 'Coca Cola', precio: '30'.toDouble(), cantidad: 10).save(flush: true, failOnError: true)
        MetodoPago.findByNombre(IConstantes.EFECTIVO) ? null : new MetodoPago(nombre: IConstantes.EFECTIVO).save(flush: true, failOnError: true)
        MetodoPago.findByNombre(IConstantes.CREDITO) ? null : new MetodoPago(nombre: IConstantes.CREDITO).save(flush: true, failOnError: true)
        MetodoPago.findByNombre(IConstantes.TARJETA_CREDITO) ? null : new MetodoPago(nombre: IConstantes.TARJETA_CREDITO).save(flush: true, failOnError: true)

        DateFormat format = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
        Date fecha = format.parse("10/08/2018");
        Comprobante.findByNombreAndEmpresa(IConstantes.CREDITO_FISCAL, empresa) ? null : new Comprobante(vencimientoSecuencia: fecha, nombre: IConstantes.CREDITO_FISCAL, empresa: empresa, secuencia: "B010000000", contador: 1).save(flush: true, failOnError: true)

    }
    def destroy = {
    }
}
