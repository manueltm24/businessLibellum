package businesslibellum

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/home/index")
        "500"(view:'/error')
        "404"(view:'/notFound')


        //Parte responsable de darle acceso al servicio REST
        "/API/$action?"(controller: "itemRest")
    }
}
