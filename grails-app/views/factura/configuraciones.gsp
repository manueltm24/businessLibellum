<g:applyLayout name="libellum_main">
    <content tag="body">
        <!-- START PAGE CONTAINER -->
        <div id="container" class="container container-boxed">
            <g:form controller="factura" action="procesarConfiguraciones" class="form-horizontal">

                    <div class="row">

                        <div class="col-md-6">
                            <!-- IMPUESTO -->
                            <div class="block block-condensed">
                                <div class="app-heading app-heading-small">
                                    <div class="title">
                                        <h2>Impuesto</h2>
                                        <p>Impuesto por defecto para facturar.</p>
                                    </div>
                                </div>

                                <div class="block-content">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-1 col-lg-offset-1">
                                                <label>%</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input value="${empresa.impuesto_default}" name="impuesto" id="impuesto" type="number" class="form-control">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- END IMPUESTO -->
                            <div class="block block-condensed">
                                <div class="app-heading app-heading-small">
                                    <div class="title">
                                        <h2>Notas</h2>
                                        <p>Notas por defecto para facturar.</p>
                                    </div>
                                </div>

                                <div class="block-content">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-6 col-lg-offset-1">
                                                <textarea id="notas" name="notas" class="form-control" rows="5">${empresa.notas_default}</textarea>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="block-content">

                                <div class="heading-elements">
                                    <a href="/" class="btn btn-danger"> <span class="fa fa-reply"></span> Salir</a>
                                    <button type="submit" class="btn btn-success"> <span class="fa fa-floppy-o"></span> Guardar </button>
                                </div>
                            </div>

                        </div>
                        %{--<div class="col-md-6">--}%

                        %{--</div>--}%
                    </div>
                    <!-- END PAGE CONTAINER -->
            </g:form>

        </div>
    </content>
</g:applyLayout>


