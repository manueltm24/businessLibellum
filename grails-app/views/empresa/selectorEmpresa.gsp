<!DOCTYPE html>
<html lang="en">
<head>
    <title>Libellum</title>

    <!-- META SECTION -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <!-- END META SECTION -->
    <!-- CSS INCLUDE -->
    <asset:link rel="stylesheet" href="css/styles.css"></asset:link>

    <!-- START SCRIPTS -->
    <asset:javascript src="js/vendor/jquery/jquery.min.js"/>
    <asset:javascript src="js/vendor/jquery/jquery-ui.min.js"/>
    <!-- EOF CSS INCLUDE -->
</head>
<body>

<!-- APP WRAPPER -->
<div class="app">

    <!-- START APP CONTAINER -->
    <div class="app-container">

        <sec:ifAnyGranted roles="ROLE_SUPERADMIN">
            <!-- START SIDEBAR -->
            <div class="app-sidebar app-navigation app-navigation-fixed scroll app-navigation-style-default app-navigation-open-hover dir-left" data-type="close-other">
                <nav>
                    <ul>
                        <li class="title">MENU SUPERADMIN</li>
                        <li><a href="/usuario/index"><span class="icon-users"></span> Usuario</a></li>
                        <li><a href="/empresa/index"><span class="icon-apartment"></span> Empresa</a></li>
                    </ul>
                </nav>
            </div>
            <!-- END SIDEBAR -->
        </sec:ifAnyGranted>


    <!-- START APP CONTENT -->
        <div class="app-content app-sidebar-left-closed">
            <!-- START APP HEADER -->
            <div class="app-header app-header-design-default">
                <ul class="app-header-buttons pull-right">
                    <li>
                        <div class="contact contact-rounded contact-bordered contact-lg contact-ps-controls hidden-xs">
                            <asset:image src="assets/images/users/user.png" alt="John Doe"/>
                            <div class="contact-container">
                                <a href="#">Administrador</a>
                                <span>admin</span>
                            </div>

                        </div>
                    </li>

                    <li>
                        <g:form controller="logout" method="post">
                            <button type="submit" class="btn btn-default btn-icon"><span class="icon-power-switch"></span></button>
                        </g:form>
                    </li>
                </ul>
            </div>
            <!-- END APP HEADER  -->

            <!-- START PAGE HEADING -->
            <div class="app-heading-container app-heading-bordered bottom">
                <ul class="breadcrumb">
                    %{--<li><a href="/logout">Logout</a></li>--}%
                    <li class="active">Selección Empresa</li>
                </ul>
            </div>
            <!-- END PAGE HEADING -->

            <!-- START PAGE CONTAINER -->
            <div class="container">

                <!-- BOOTSTRAP SELECT -->

                <div class="col-lg-offset-4 col-md-4">
                    <div class="block">
                        <div class="app-heading app-heading-small">
                            <div class="title">
                                <h2><b>Listado de Empresas</b></h2>
                                <p><small>Seleccione la empresa a la que desea acceder.</small></p>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <g:form action="procesarSelectorEmpresa" controller="empresa">
                                    <g:select onChange="activarBoton();" from="${empresas}"  noSelection="['':'Seleccione una empresa']"  class="s2-select" id="idEmpresa" name="idEmpresa" optionKey="id" optionValue="nombre" data-validation="required"/>
                                    <button disabled="disabled" style="margin-top: 5px" type="submit" id="btnSeleccioneConsorcio" class="btn btn-success btn-block">Continuar</button>
                                </g:form>

                            </div>
                        </div>

                    </div>

                </div>
                <!-- END BOOTSTRAP SELECT -->


            </div>

        </div>
        <!-- END APP CONTENT -->

    </div>
    <!-- END APP CONTAINER -->

    <!-- APP OVERLAY -->
    <div class="app-overlay"></div>
    <!-- END APP OVERLAY -->
</div>
<!-- END APP WRAPPER -->

<script>
    function activarBoton() {
        var myselect = document.getElementById("idEmpresa");

        if(myselect.value.length <= 0){
            document.getElementById("btnSeleccioneConsorcio").disabled = true

        }
        else{
            document.getElementById("btnSeleccioneConsorcio").disabled = false

        }
    }
</script>

<!-- IMPORTANT SCRIPTS -->
<asset:javascript src="js/vendor/jquery/jquery.min.js"/>
<asset:javascript src="js/vendor/jquery/jquery-migrate.min.js"/>
<asset:javascript src="js/vendor/jquery/jquery-ui.min.js"/>
<asset:javascript src="js/vendor/bootstrap/bootstrap.min.js"/>
<asset:javascript src="js/vendor/moment/moment.min.js"/>
<asset:javascript src="js/vendor/customscrollbar/jquery.mCustomScrollbar.min.js"/>

<!-- END IMPORTANT SCRIPTS -->
<!-- THIS PAGE SCRIPTS -->

<asset:javascript src="js/vendor/bootstrap-select/bootstrap-select.js"/>
<asset:javascript src="js/vendor/select2/select2.full.min.js"/>
<asset:javascript src="js/vendor/bootstrap-datetimepicker/bootstrap-datetimepicker.jss"/>
<asset:javascript src="js/vendor/bootstrap-daterange/daterangepicker.js"/>
<asset:javascript src="js/vendor/multiselect/jquery.multi-select.js"/>

<!-- END THIS PAGE SCRIPTS -->
<!-- APP SCRIPTS -->
<asset:javascript src="js/app.js"/>
<asset:javascript src="js/app_plugins.js"/>
<asset:javascript src="js/app_demo.js"/>


<!-- END APP SCRIPTS -->
</body>
</html>














