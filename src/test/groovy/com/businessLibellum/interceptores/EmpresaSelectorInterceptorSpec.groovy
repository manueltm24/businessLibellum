package com.businessLibellum.interceptores

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class EmpresaSelectorInterceptorSpec extends Specification implements InterceptorUnitTest<EmpresaSelectorInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test empresaSelector interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"empresaSelector")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
