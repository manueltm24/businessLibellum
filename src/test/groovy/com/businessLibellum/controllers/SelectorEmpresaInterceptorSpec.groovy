package com.businessLibellum.controllers

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class SelectorEmpresaInterceptorSpec extends Specification implements InterceptorUnitTest<SelectorEmpresaInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test selectorEmpresa interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"selectorEmpresa")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
