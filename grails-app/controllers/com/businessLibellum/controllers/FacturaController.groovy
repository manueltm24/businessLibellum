package com.businessLibellum.controllers

import com.businessLibellum.IConstantes
import com.businessLibellum.domains.Cliente
import com.businessLibellum.domains.Empresa
import com.businessLibellum.domains.facturacion.Comprobante
import com.businessLibellum.domains.facturacion.Factura
import com.businessLibellum.domains.Item
import com.businessLibellum.domains.facturacion.ItemFactura
import com.businessLibellum.domains.facturacion.MetodoPago
import com.businessLibellum.groovy.commands.FacturaForm
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import net.sf.jasperreports.engine.JRException
import net.sf.jasperreports.engine.JRParameter
import net.sf.jasperreports.engine.JasperCompileManager
import net.sf.jasperreports.engine.JasperExportManager
import net.sf.jasperreports.engine.JasperFillManager
import net.sf.jasperreports.engine.JasperPrint
import net.sf.jasperreports.engine.JasperReport
import net.sf.jasperreports.engine.design.JasperDesign
import net.sf.jasperreports.engine.util.JRLoader
import net.sf.jasperreports.engine.util.SimpleFileResolver
import net.sf.jasperreports.engine.xml.JRXmlLoader

import java.sql.Connection
import java.sql.DriverManager

@Secured(["ROLE_ADMIN", "ROLE_SUPERADMIN","ROLE_USUARIO"])

class FacturaController {

    def crearFactura(){
        Empresa empresa=Empresa.findById(session[IConstantes.EMPRESA_SELECCIONADA] as Long)

        [clientes: Cliente.findAllByEmpresa(empresa), items: Item.list(), metodosPago: MetodoPago.findAllByEnabled(true), comprobantes: Comprobante.findAllByEnabledAndEmpresa(true,empresa), fecha: new Date()]

    }

    def procesarCrearFactura(FacturaForm form){
        Empresa empresa=Empresa.findById(session[IConstantes.EMPRESA_SELECCIONADA] as Long)

        Factura factura = new Factura(tipoFactura: "FACTURA "+Comprobante.findById(form.comprobante).nombre,notas: "Ninguna.", comprobante: Comprobante.findById(form.comprobante), cliente: Cliente.findById(form.cliente), metodoPago: MetodoPago.findById(form.metodoPago), empresa: empresa, subTotal: form.subtotal, total: form.total, porciertoDescuento: form.descuento_porciento, porcientoImpuesto: form.impuesto_porciento, comprobante_String: Comprobante.findById(form.comprobante).numeracion_Inicio+Comprobante.findById(form.comprobante).numeracion_Fin, nombreCliente:Cliente.findById(form.cliente).nombre, direccion: Cliente.findById(form.cliente).direccion, ciudad: Cliente.findById(form.cliente).ciudad, pais: Cliente.findById(form.cliente).pais,telefono: Cliente.findById(form.cliente).telefono, metodoPago_String: MetodoPago.findById(form.metodoPago).nombre, nombre_Cliente: Cliente.findById(form.cliente).nombre, direccion_Cliente: Cliente.findById(form.cliente).direccion, pais_Cliente: Cliente.findById(form.cliente).pais, ciudad_Cliente: Cliente.findById(form.cliente).ciudad,telefono_Cliente:Cliente.findById(form.cliente).telefono  ).save(flush:true, failOnError:true)

        form.listadoArticulos.each {
            new ItemFactura(item: Item.findById(it.idItem),nombre_Item: Item.findById(it.idItem).nombre,cantidad: it.cantidad, preciounidad: it.preciounidad, factura: factura).save(flush:true, failOnError:true)
        }
        println("Nueva factura creada!")

        render factura as JSON



    }

    def modeloFactura(long idFactura){
        [factura: Factura.findById(idFactura)]
    }

    def downloadInvoice = {
        def invoice = Factura.findById(1)

        renderPdf(template: '/templates/pdf/invoice', model: [invoice: invoice], filename: "yourTitle")
    }

    def jasperReport(){

        String proyectPath = System.getProperty("user.dir")+"\\JasperReports\\"

        String hostName = "localhost"
        String dbName = "libellumdev"
        String userName = "libellum"
        String password = "123456"

        Connection conn = null;

        Class.forName("com.mysql.jdbc.Driver")
        String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName
        conn = DriverManager.getConnection(connectionURL, userName, password)


        //Prefiero usar el .jrxml a la aplicacion que el .jasper por que es mas facil de versionar
        String sourceFileName = proyectPath + "Invoice_main_2.jrxml";
//        String sourceFileName = proyectPath + "prueba.jrxml";
        File theFile = new File(sourceFileName);
        JasperDesign jasperDesign = JRXmlLoader.load(theFile);//Se carga el archivo

//Si el reporte va a tener un query fijo, puedes omitir este paso
//        JRDesignQuery newQuery = new JRDesignQuery();
//        newQuery.setText("SELECT * FROM miTabla WHERE X = Y");
//        jasperDesign.setQuery(newQuery);

        Map parameters = new HashMap();//Parametros que usa el jasperreports
//Se compila el archivo a .jasper
        JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);

//Aqui se llena el reporte (se ejecuta la consulta)
        JasperPrint print = new JasperPrint();
        print = JasperFillManager.fillReport(jasperReport, parameters, conn);
        byte[] pdfBytes = JasperExportManager.exportReportToPdf(print);
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline;filename=" + "out" + ".pdf");
        response.getOutputStream().write(pdfBytes);
        response.flushBuffer();

    }
    def jasperReport_GenerarFacturaPDF(long idFactura){
        println(idFactura)

        String proyectPath = System.getProperty("user.dir")+"\\JasperReports\\"

        String hostName = "localhost"
        String dbName = "libellumdev"
        String userName = "libellum"
        String password = "123456"

        Connection conn = null;
        Class.forName("com.mysql.jdbc.Driver")
        String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName
        conn = DriverManager.getConnection(connectionURL, userName, password)

        File reportsDir = new File(proyectPath);
        if (!reportsDir.exists()) {
            throw new FileNotFoundException(String.valueOf(reportsDir));
        }
        Map<String, Object> parameters = new HashMap<String, Object>();
        parameters.put(JRParameter.REPORT_FILE_RESOLVER, new SimpleFileResolver(reportsDir));

        parameters.put("IDFACTURA",idFactura)

        String sourceFileName = proyectPath + "FACTURA.jrxml";
        File theFile = new File(sourceFileName);
        JasperDesign jasperDesign = JRXmlLoader.load(theFile);//Se carga el archivo
        JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);

        JasperPrint print = new JasperPrint();
        print = JasperFillManager.fillReport(jasperReport, parameters, conn);
        byte[] pdfBytes = JasperExportManager.exportReportToPdf(print);
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline;filename=" + "out" + ".pdf");
        response.getOutputStream().write(pdfBytes);
        response.flushBuffer();

    }

}
