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
    <!-- EOF CSS INCLUDE -->


    <!-- START SCRIPTS -->
    <asset:javascript src="js/vendor/jquery/jquery.min.js"/>
    <asset:javascript src="js/vendor/jquery/jquery-ui.min.js"/>
    <asset:javascript src="js/vendor/bootstrap/bootstrap.min.js"/>
    <asset:javascript src="js/vendor/moment/moment.min.js"/>

    <asset:javascript src="js/vendor/customscrollbar/jquery.mCustomScrollbar.min.js"/>
    <asset:javascript src="js/vendor/bootstrap-select/bootstrap-select.js"/>
    <asset:javascript src="js/vendor/select2/select2.full.min.js"/>
    <asset:javascript src="js/vendor/bootstrap-datetimepicker/bootstrap-datetimepicker.js"/>

    <asset:javascript src="js/vendor/maskedinput/jquery.maskedinput.min.js"/>
    <asset:javascript src="js/vendor/form-validator/jquery.form-validator.min.js"/>

    <asset:javascript src="js/vendor/noty/jquery.noty.packaged.js"/>

    <asset:javascript src="js/vendor/datatables/jquery.dataTables.min.js"/>
    <asset:javascript src="js/vendor/datatables/dataTables.bootstrap.min.js"/>

    <asset:javascript src="js/vendor/sweetalert/sweetalert.min.js"/>
    <asset:javascript src="js/vendor/knob/jquery.knob.min.js"/>



    <asset:javascript src="js/vendor/jvectormap/jquery-jvectormap.min.js"/>
    <asset:javascript src="js/vendor/jvectormap/jquery-jvectormap-world-mill-en.js"/>
    <asset:javascript src="js/vendor/jvectormap/jquery-jvectormap-us-aea-en.js"/>

    <asset:javascript src="js/vendor/sparkline/jquery.sparkline.min.js"/>
    <asset:javascript src="js/vendor/morris/raphael.min.js"/>
    <asset:javascript src="js/vendor/morris/morris.min.js"/>
    <asset:javascript src="js/vendor/rickshaw/d3.v3.js"/>
    <asset:javascript src="js/vendor/rickshaw/rickshaw.min.js"/>

    <asset:javascript src="js/vendor/isotope/isotope.pkgd.min.js"/>

    <asset:javascript src="js/vendor/dropzone/dropzone.js"/>
    <asset:javascript src="js/vendor/nestable/jquery.nestable.js"/>
    <asset:javascript src="js/vendor/cropper/cropper.min.js"/>

    <asset:javascript src="js/vendor/tableexport/tableExport.js"/>
    <asset:javascript src="js/vendor/tableexport/jquery.base64.js"/>
    <asset:javascript src="js/vendor/tableexport/html2canvas.js"/>
    <asset:javascript src="js/vendor/tableexport/jspdf/libs/sprintf.js"/>
    <asset:javascript src="js/vendor/tableexport/jspdf/jspdf.js"/>
    <asset:javascript src="js/vendor/tableexport/jspdf/libs/base64.js"/>

    <asset:javascript src="js/vendor/bootstrap-daterange/daterangepicker.js"/>
    <asset:javascript src="js/vendor/bootstrap-tour/bootstrap-tour.min.js"/>
    <asset:javascript src="js/vendor/bootstrap-tagsinput/bootstrap-tagsinput.js"/>
    <asset:javascript src="js/vendor/fullcalendar/fullcalendar.js"/>
    <asset:javascript src="js/vendor/smartwizard/jquery.smartWizard.js"/>

    <asset:javascript src="js/app.js"/>
    <asset:javascript src="js/app_plugins.js"/>
    %{--<asset:javascript src="js/app_demo.js"/>--}%
    <!-- END SCRIPTS -->
</head>
<body>

<!-- APP WRAPPER -->
<div class="app app-fh">

    <!-- START APP CONTAINER -->
    <div class="app-container">

        <div class="app-login-box">
            <div class="app-login-box-user"><asset:image src="img/user/no-image.png"/></div>
            <div class="app-login-box-title">
                <div class="title">Sistema Business Libellum</div>
                <div class="subtitle">Inicia sesión con tu cuenta</div>
            </div>
            <div class="app-login-box-container">
                <g:if test='${flash.message}'>
                    <div class="login_message">${flash.message}</div>
                </g:if>


                <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm">
                    <div class="form-group">
                        <input type="text" class="form-control" name="${usernameParameter ?: 'username'}" id="username" placeholder="Usuario">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Contraseña" name="${passwordParameter ?: 'password'}" id="password">
                    </div>
                    <div class="form-group">

                        <div class="row">
                            <div class="col-md-6 col-xs-6">
                                <div class="app-checkbox">
                                    <label><input type="checkbox" name="app-checkbox-1" value="0"> Recuerdame</label>
                                </div>
                            </div>
                            <div class="col-md-6 col-xs-6">
                                <button class="btn btn-success btn-block">Loguearme</button>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
            <div class="app-login-box-footer">&copy; 2017-${new java.util.Date().format("yyyy")} Business Libellum. Todos los Derechos Reservados.</div>
        </div>

    </div>
    <!-- END APP CONTAINER -->

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