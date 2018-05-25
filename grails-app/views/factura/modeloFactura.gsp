<%@ page import="com.businessLibellum.domains.facturacion.Factura" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Simple example</title>

    <link rel="icon" href="/images/favicon.png" type="image/x-icon">
    <style>body{font-family:'Helvetica Neue','Helvetica',Helvetica,Arial,sans-serif;text-align:center;color:#777;}body h1{font-weight:300;margin-bottom:0px;padding-bottom:0px;color:#000;}body h3{font-weight:300;margin-top:10px;margin-bottom:20px;font-style:italic;color:#555;}body a{color:#06F;}.invoice-box{max-width:800px;margin:auto;padding:30px;border:1px solid #eee;box-shadow:0 0 10px rgba(0,0,0,.15);font-size:16px;line-height:24px;font-family:'Helvetica Neue','Helvetica',Helvetica,Arial,sans-serif;color:#555;}.invoice-box table{width:100%;line-height:inherit;text-align:left;}.invoice-box table td{padding:5px;vertical-align:top;}.invoice-box table tr td:nth-child(2){text-align:right;}.invoice-box table tr.top table td{padding-bottom:20px;}.invoice-box table tr.top table td.title{font-size:45px;line-height:45px;color:#333;}.invoice-box table tr.information table td{padding-bottom:40px;}.invoice-box table tr.heading td{background:#eee;border-bottom:1px solid #ddd;font-weight:bold;}.invoice-box table tr.details td{padding-bottom:20px;}.invoice-box table tr.item td{border-bottom:1px solid #eee;}.invoice-box table tr.item.last td{border-bottom:none;}.invoice-box table tr.total td:nth-child(2){border-top:2px solid #eee;font-weight:bold;}@media only screen and (max-width: 600px) {.invoice-box table tr.top table td{width:100%;display:block;text-align:center;}.invoice-box table tr.information table td{width:100%;display:block;text-align:center;}}
    </style>

</head>

<body>
<div class="invoice-box">
    <table cellpadding="0" cellspacing="0">
        <tbody><tr class="top">
            <td colspan="2">
                <table>
                    <tbody><tr>
                        <td class="title">
                            <img src="http://plavatvornica.com/wp-content/themes/plavatvornica/images/logo.png" style="width:100%; max-width:300px;">
                        </td>
                        <td>
                            Factura #: 123<br>
                            Fecha: January 1, 2015<br>
                            NCF:
                        </td>
                    </tr>
                    </tbody></table>
            </td>
        </tr>
        <tr class="information">
            <td colspan="2">
                <table>
                    <tbody>
                    <tr>
                        <td>
                            <b>Vendido por:</b><br>
                            ${factura.empresa.nombre}<br>
                            Tel.: <br>
                            ${factura.empresa.direccion}<br>
                            ${factura.empresa.ciudad}, ${factura.empresa.pais}<br>
                            RNC:

                        </td>
                        <td>
                            <b>Vendido a:</b><br>
                            ${factura.cliente.nombre}<br>
                            Tel.: <br>
                            ${factura.cliente.direccion}<br>
                            ${factura.cliente.ciudad}, ${factura.cliente.pais}
                        </td>
                        <td></td>
                        <td></td>

                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                Metodo de pago
            </td>
            <td>
                Vendedor:
            </td>

            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>
                ${factura.metodoPago.nombre}
            </td>
            <td>
                -
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>
                Item
            </td>
            <td>
                Cantidad
            </td>
            <td>
                Precio Uni.
            </td>
            <td>
                Subtotal
            </td>
        </tr>

        <g:each in="${com.businessLibellum.domains.facturacion.ItemFactura.findAllByFactura(com.businessLibellum.domains.facturacion.Factura.findById(factura.id))}" var="item">
            <tr>
                <td c>${item.item.nombre}</td>
                <td >${item.cantidad}</td>
                <td>${item.preciounidad}</td>
                <td>${item.cantidad * item.preciounidad}</td>
            </tr>
        </g:each>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td></td>
            %{--<td></td>--}%
            <td colspan="2">
                ------------------------------------<br>
                <b>
                    Subtotal:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$${factura.subTotal}<br>
                    Descuento(%${factura.porciertoDescuento}):&nbsp;&nbsp;$${factura.porciertoDescuento * factura.subTotal}<br>
                    Impuesto(%${factura.porcientoImpuesto}):&nbsp;&nbsp;&nbsp;&nbsp;$${factura.porcientoImpuesto * factura.subTotal}<br>
                    Total:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$${factura.total}
                </b>
            </td>
        </tr>
        </tbody></table>
    <g:link params="[idFactura: factura.id]" controller="factura" action="jasperReport_GenerarFacturaPDF">Generar Factura</g:link>
</div>


</body>
</html>