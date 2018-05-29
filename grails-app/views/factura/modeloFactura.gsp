<!DOCTYPE html>
<html lang="en">
<head>
    <title>Boooya - Payment - Invoice</title>

    <!-- META SECTION -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <!-- END META SECTION -->
    <!-- CSS INCLUDE -->
    <asset:link rel="stylesheet" href="css/styles.css"/>
    <!-- EOF CSS INCLUDE -->


    <script type="text/javascript">
        function zoom() {
            var div = document.getElementById ("invoice");
            div.style.zoom = "80%";

            // document.body.style.zoom = "80%"
        }
    </script>
</head>
<body onload="zoom()">

<!-- APP WRAPPER -->
<div class="app">

    <!-- START APP CONTAINER -->
    <div class="app-container">
        <!-- START APP HEADER -->
        <div class="app-header">
            <div class="container container-boxed">
                <ul class="app-header-buttons visible-mobile">
                    <li><a href="#" class="btn btn-link btn-icon" data-navigation-horizontal-toggle="true"><span class="icon-menu"></span></a></li>
                </ul>
                <a href="index.html" class="app-header-logo app-header-logo-light app-header-logo-condensed">Project</a>

                <ul class="app-header-buttons pull-right">
                    <li><a href="#" class="btn btn-link btn-icon"><span class="icon-cog"></span></a></li>
                    <li><a href="#" class="btn btn-default">Log Out</a></li>
                </ul>
            </div>
        </div>
        <!-- END APP HEADER  -->

        <!-- START APP CONTENT -->
        <div class="app-content">
            <div class="app-navigation-horizontal margin-bottom-15">
                <div class="container container-boxed">
                    <nav>
                        <ul>
                            <li>
                                <a href="#"><span class="icon-earth"></span> My Account</a>
                                <ul>
                                    <li><a href="pages-bank-main.html">Main</a></li>
                                    <li><a href="pages-bank-cards.html">My Cards</a></li>
                                    <li><a href="pages-bank-deposits.html">My Deposits</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><span class="fa fa-usd"></span> Ingresos</a>
                                <ul>
                                    <li><a href="/factura/crearFactura">Facturación</a></li>
                                    <li><a href="#">Swift Activity</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><span class="icon-cog"></span> Settings</a>
                                <ul>
                                    <li><a href="pages-bank-settings.html">Account</a></li>
                                    <li><a href="pages-bank-security.html">Security</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- START PAGE CONTAINER -->
            <div class="heading-elements col-lg-offset-10">
                <a href="/" class="btn btn-danger"> <span class="fa fa-reply"></span> Salir</a>
                <a href="/factura/jasperReport_GenerarFacturaPDF?idFactura=${factura.id}" class="btn btn-info"> <span class="fa fa-print"></span> Imprimir</a>
            </div>
            <div class="container">



                <div id='invoice'  class="invoice">

                    <div class="invoice-container">

                        <div class="row">

                            <div class="col-lg-7 col-lg-offset-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="invoice-company">
                                            %{--<img src="img/boooya.png" alt="Boooya - Revolution Admin Template">--}%
                                            <h1><b>${factura.empresa.nombre}</b></h1>
                                            <p>${factura.empresa.direccion}<br>
                                                ${factura.empresa.ciudad}, ${factura.empresa.pais}<br>
                                                Tel.:${factura.empresa.telefono}<br>
                                                RNC: ${factura.empresa.rnc}
                                            </>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="invoice-number text-right">
                                            <p>Fecha: ${(new java.text.SimpleDateFormat("dd/MM/yyyy",new Locale("es", "ES"))).format(factura.fecha).toString()}</p>
                                            <h3>Factura #${factura.codigo}</h3>
                                            <h3><b>Factura ${factura.comprobante.nombre}</b></h3>
                                            <p>
                                                NCF: ${factura.ncf}<br>
                                                <g:if test="${factura.vencimientoSecuencia_NCF}">
                                                    Vencimiento secuencia: ${(new java.text.SimpleDateFormat("dd/MM/yyyy",new Locale("es", "ES"))).format(factura.vencimientoSecuencia_NCF).toString()}
                                                </g:if>
                                            </p>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="invoice-container invoice-container-highlight">
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-2">
                                <div class="row">
                                    <div class="col-md-6    ">
                                        <div class="invoice-address">
                                            <h3><b>Vendido a:</b></h3>
                                            <p>
                                                RNC: ${factura.cliente.rnc}<br>
                                                <b>${factura.cliente.nombre}</b><br>
                                                ${factura.cliente.direccion}<br>
                                                ${factura.cliente.ciudad}, ${factura.cliente.pais}<br>
                                                Tel.:${factura.cliente.telefono}<br>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="invoice-address text-right">
                                            <h3><b>Metodo de pago:</b></h3>
                                            <p>
                                                ${factura.metodoPago.nombre}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="invoice-container">
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-2">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>COD.</th>
                                            <th colspan="2">NOMBRE PROD.</th>
                                            <th>CANTIDAD</th>
                                            <th width="150">PRECIO UNID.</th>
                                            <th width="150">SUBTOTAL</th>
                                        </tr>
                                        </thead>
                                        <tbody class="text-thin">
                                            <g:each in="${items}" var="item">
                                                <tr>

                                                    <td width="40" class="text-center">${item.id}</td>
                                                    <td colspan="2" class="text-bold">${item.nombre_Item}</td>
                                                    <td>${item.cantidad}</td>
                                                    <td>${item.preciounidad}</td>
                                                    <td class="text-bold">${item.cantidad*item.preciounidad}</td>
                                                </tr>
                                            </g:each>

                                        </tbody>
                                    </table>
                                </div>

                                <div class="row">
                                    <div class="col-md-4 col-md-offset-8">
                                        <table class="table table-bordered invoice-table-total">
                                            <tbody>
                                            <tr>
                                                <td class="text-muted text-thin">Subtotal:</td>
                                                <td width="150" class="text-muted">$${factura.montoBruto}</td>
                                            </tr>
                                            <tr>
                                                <td class="text-muted text-thin">Impuesto (${factura.porcientoImpuesto}%):</td>
                                                <td width="150" class="text-muted">$${factura.montoImpuesto}</td>
                                            </tr>
                                            <tr>
                                                <td class="text-muted text-thin">Descuento (${factura.porcientoDescuento}%):</td>
                                                <td width="150" class="text-muted">$${factura.montoDescuento}</td>
                                            </tr>
                                            <tr class="invoice-table-highlight">
                                                <td class="text-bold">Total:</td>
                                                <td width="150" class="text-bold">$${factura.montoNeto}</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <label>Notas:</label>
                                    <textarea  id="notas" name="notas" class="form-control" disabled="disabled" rows="5">${factura.notas}</textarea>
                                </div>

                                <div class="invoice-thanks">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="title">Gracias por preferirnos!</div>
                                            <p>${factura.empresa.nombre}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>


            </div>
            <!-- END PAGE CONTAINER -->

        </div>
        <!-- END APP CONTENT -->

    </div>
    <!-- END APP CONTAINER -->

    <!-- START APP FOOTER -->
    <div class="app-footer app-footer-default" id="footer">

        <div class="container container-boxed">
            <div class="app-footer-line">
                <div class="copyright">&copy; 2016 Boooya. All right reserved in the Ukraine and other countries.</div>
                <div class="pull-right">
                    <ul class="list-inline">
                        <li><a href="#">About</a></li>
                        <li><a href="#">Help</a></li>
                        <li><a href="#">API</a></li>
                        <li><a href="#">Contacts</a></li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
    <!-- END APP FOOTER -->
</div>
<!-- END APP WRAPPER -->

<!--
        <div class="modal fade" id="modal-thanks" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-sm" role="document">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="icon-cross"></span></button>
                <div class="modal-content">
                    <div class="modal-body">
                        <p class="text-center margin-bottom-20">
                            <img src="assets/images/smile.png" alt="Thank you" style="width: 100px;">
                        </p>
                        <h3 id="modal-thanks-heading" class="text-uppercase text-bold text-lg heading-line-below heading-line-below-short text-center"></h3>
                        <p class="text-muted text-center margin-bottom-10">Thank you so much for likes</p>
                        <p class="text-muted text-center">We will do our best to make<br> Boooya template perfect</p>
                        <p class="text-center"><button class="btn btn-success btn-clean" data-dismiss="modal">Continue</button></p>
                    </div>
                </div>
            </div>
        </div>-->

<!-- IMPORTANT SCRIPTS -->
<asset:javascript src="js/vendor/jquery/jquery.min.js"/>
<asset:javascript src="js/vendor/jquery/jquery-migrate.min.js"/>
<asset:javascript src="js/vendor/jquery/jquery-ui.min.js"/>
<asset:javascript src="js/vendor/bootstrap/bootstrap.min.js"/>
<asset:javascript src="js/vendor/moment/moment.min.js"/>
<asset:javascript src="js/vendor/customscrollbar/jquery.mCustomScrollbar.min.js"/>
<!-- END IMPORTANT SCRIPTS -->
<!-- APP SCRIPTS -->
<asset:javascript src="js/app.js"/>
<asset:javascript src="js/app_plugins.js"/>
<asset:javascript src="js/app_demo.js"/>      <!-- OPCION DE CAMBIAR EL TEMA DE LA PLANTILLAS-->
<!-- END APP SCRIPTS -->

</body>
</html>