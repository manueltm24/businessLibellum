package com.businessLibellum.controllers.REST

import com.businessLibellum.domains.Item
import grails.converters.JSON

class ItemRestController {

    def getItemNombre(long idItem) {
        def item = Item.findById(idItem)


        println(item.nombre)

        JSON.use("deep"){
            render item as JSON
        }
    }
}
