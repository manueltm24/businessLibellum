<g:applyLayout name="libellum_main">
    <content tag="body">
        <!-- START PAGE CONTAINER -->
        <div id="container" class="container container-boxed">

            <div class="row">
                <g:form method="post" controller="item" action="procesarNuevoItem" class="form-horizontal">

                    <div class="col-md-12">
                        <div class="block block-condensed">
                            <div class="app-heading app-heading-small">
                                <div class="title">
                                    <h2>Nuevo Artículo</h2>
                                    <p>Llene los campos necesarios</p>
                                </div>
                            </div>

                            <div class="block-content">
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <label class="control-label">Nombre:</label>
                                        <input placeholder="Nombre" type="text" id="nombre" name="nombre" class="form-control"  data-validation="length" data-validation-length="2-25" >

                                    </div>
                                    <div class="col-md-6">
                                        <label class="control-label">Precio:</label>
                                        <input  name="precio"  type="number" id="precio" class="form-control" placeholder="RD$" data-validation="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <label class="control-label">Cantidad:</label>
                                        <input placeholder="Cantidad" name="cantidad" id="cantidad" type="text" class="form-control">
                                    </div>
                                    <div class="col-md-6">
                                        <g:checkBox name="facturarsinexistencia" id="facturarsinexistencia"/> ¿ Facturar sin existencia ?
                                    </div>
                                </div>
                            </div>



                        </div>
                        <div class="block-content">

                            <div class="heading-elements">
                                <button onclick="goBack()" type="button" class="btn btn-danger"> <span class="fa fa-reply"></span> Salir </button>
                                <button type="submit" class="btn btn-success"> <span class="fa fa-floppy-o"></span> Guardar </button>
                            </div>
                        </div>


                    </div>
                </g:form>
            %{--<div class="col-md-6">--}%
            %{----}%
            %{--</div>--}%
            </div>
            <!-- END PAGE CONTAINER -->

        </div>


        <script>
            $.validate({
                // modules : 'security',
                lang: 'es'
            });
        </script>



    </content>
</g:applyLayout>
