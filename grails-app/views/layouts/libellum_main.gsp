<!DOCTYPE html>
<html lang="en">
<head>
    <title>Boooya - Bank - Main</title>

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


    <!-- IMPORTANT SCRIPTS -->

    <asset:javascript src="js/vendor/jquery/jquery.min.js"/>
    <asset:javascript src="js/vendor/jquery/jquery-ui.min.js"/>
    <asset:javascript src="js/vendor/bootstrap/bootstrap.min.js"/>
    <asset:javascript src="js/vendor/moment/moment.min.js"/>
    <asset:javascript src="js/vendor/jquery/jquery-migrate.min.js"/>
    <asset:javascript src="js/vendor/customscrollbar/jquery.mCustomScrollbar.min.js"/>
    <!-- END IMPORTANT SCRIPTS -->

    <!-- HOME_INDEX PAGE SCRIPTS -->
    <asset:javascript src="js/vendor/bootstrap-datetimepicker/bootstrap-datetimepicker.js"/>

    <asset:javascript src="js/vendor/jvectormap/jquery-jvectormap.min.js"/>
    <asset:javascript src="js/vendor/jvectormap/jquery-jvectormap-world-mill-en.js"/>
    <asset:javascript src="js/vendor/jvectormap/jquery-jvectormap-us-aea-en.js"/>

    <asset:javascript src="js/vendor/rickshaw/d3.v3.js"/>
    <asset:javascript src="js/vendor/rickshaw/rickshaw.min.js"/>
    <!-- END HOME_INDEX PAGE SCRIPTS -->

    <!-- THIS PAGE SCRIPTS -->
    <asset:javascript src="js/vendor/bootstrap-select/bootstrap-select.js"/>
    <asset:javascript src="js/vendor/select2/select2.full.min.js"/>
    <asset:javascript src="js/vendor/bootstrap-datetimepicker/bootstrap-datetimepicker.js"/>
    <asset:javascript src="js/vendor/bootstrap-daterange/daterangepicker.js"/>
    <asset:javascript src="js/vendor/multiselect/jquery.multi-select.js"/>

    <!-- END THIS PAGE SCRIPTS -->


    <!-- APP SCRIPTS -->
    <asset:javascript src="js/app.js"/>
    <asset:javascript src="js/app_plugins.js"/>
    %{--<asset:javascript src="js/app_demo.js"/>      <!-- OPCION DE CAMBIAR EL TEMA DE LA PLANTILLAS-->--}%
    <!-- END APP SCRIPTS -->
    <asset:javascript src="js/app_demo_dashboard.js"/>


    <script type="text/javascript">
        $(function(){
            $(".block-refresh-example").on("click",function(){
                var block = $(this).data("block");
                app.block.loading.start("#"+block);
                setTimeout(function(){
                    app.block.loading.finish("#"+block);
                },3000);
            });
        });
    </script>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>


    <g:pageProperty name="page.header"/>
</head>
<body>

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
                %{--<a href="index.html" class="app-header-logo app-header-logo-light app-header-logo-condensed">Project</a>--}%

                <ul class="app-header-buttons pull-right">
                    <li>
                        <a href="/home/settings" class="btn btn-link btn-icon"><span class="icon-cog"></span></a>
                    </li>
                    <li>
                        <g:form controller="logout" method="post">
                            <button type="submit" class="btn btn-default">Log Out</button>
                        </g:form>
                    </li>
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
                                <a href="/"><span class="icon-earth"></span>Inicio</a>
                            </li>
                            <li>
                                <a href="#"><span class="fa fa-usd"></span> Ingresos</a>
                                <ul>
                                    <li><a href="/factura/nuevaFactura">Facturar</a></li>
                                    <li><a href="/factura/listadoFacturas">Lista facturas</a></li>
                                    <li><a href="/home/error404">Cuentas por cobrar</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><span class="icon-store"></span> Inventario</a>
                                <ul>
                                    <li><a href="/home/error404">Nuevo producto</a></li>
                                    <li><a href="/factura/listadoFacturas">Listado productos</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="/cliente/index"><span class="fa fa-users"></span> Clientes</a>
                            </li>
                            <li>
                                <a href="#"><span class="icon-cog"></span>Configuraciones</a>
                                <ul>
                                    <li><a href="/factura/configuraciones">Factura</a></li>
                                    <li><a href="/comprobante/index">Comprobantes</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>

            <!-- START PAGE CONTAINER -->
            <div class="container">
                <g:pageProperty name="page.body"/>
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
</body>
</html>