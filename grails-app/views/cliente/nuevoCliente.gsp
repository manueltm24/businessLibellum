<g:applyLayout name="libellum_main">
    <content tag="body">
        <!-- START PAGE CONTAINER -->
        <div id="container" class="container container-boxed">

            <div class="row">
                <g:form method="post" controller="cliente" action="procesarNuevoCliente" class="form-horizontal">

                    <div class="col-md-12">
                        <div class="block block-condensed">
                            <div class="app-heading app-heading-small">
                                <div class="title">
                                    <h2>Nuevo cliente</h2>
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
                                        <label class="control-label">Teléfono:</label>
                                        <input  name="telefono"  type="text" id="telefono" class="form-control" placeholder="(XXX) XXX-XXXX" data-validation="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <label class="control-label">RNC:</label>
                                        <input placeholder="RNC" name="rnc" id="rnc" type="text" class="form-control" data-validation="length" data-validation-length="2-25">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <label class="control-label">Dirección:</label>
                                        <textarea rows="5"  name="direccion"  type="text" id="direccion" class="form-control" placeholder="Dirección" data-validation="required"></textarea>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="control-label">Ciudad:</label>
                                        <input  name="ciudad"  type="text" id="ciudad" class="form-control" placeholder="Ciudad"  data-validation="required">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="control-label">País:</label>
                                        <input  name="pais"  type="text" id="pais" class="form-control" placeholder="Pais"  data-validation="required">
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
