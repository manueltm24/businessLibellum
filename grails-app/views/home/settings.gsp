<g:applyLayout name="libellum_main">
    <content tag="body">
        <!-- START PAGE CONTAINER -->
        <div id="container" class="container container-boxed">

            <div class="row">

                <div class="col-md-12">

                    <!-- ADMIN -->
                    <div class="block block-condensed">
                        <div class="app-heading app-heading-small">
                            <div class="title">
                                <p>Funcionalidades de super administrador.</p>
                            </div>
                            %{--<div class="heading-elements">--}%
                                %{--<a href="#" class="btn btn-default btn-clean"> <span class="fa fa-user-plus"></span> Cliente</a>--}%
                            %{--</div>--}%
                        </div>

                        <div class="block-content">
                            <a href="/usuario/index" class="app-widget-button app-widget-button-lg">
                                <span class="icon-users"></span>
                            </a>
                            <a href="/empresa/index" class="app-widget-button app-widget-button-lg">
                                <span class="icon-apartment"></span>
                            </a>
                        </div>
                    </div>

                </div>
                <div class="col-md-6">
                    <div class="block-content">

                        <div class="heading-elements">
                            <a href="/" class="btn btn-danger"> <span class="fa fa-reply"></span> Salir</a>
                            <a href="#" onclick="procesarNuevaFactura()" class="btn btn-success"> <span class="fa fa-floppy-o"></span> Guardar </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END PAGE CONTAINER -->

        </div>


    </content>
</g:applyLayout>
