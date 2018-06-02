<g:applyLayout name="libellum_main">
    <content tag="body">
        <!-- START PAGE CONTAINER -->
        <div id="container" class="container container-boxed">

            <div class="row">

                %{--<div class="col-md-6">--}%
                %{----}%
                %{--</div>--}%

                <div class="col-md-12">
                    <g:link class="btn btn-success col-lg-12 margin-bottom-10" action="nuevoItem"><span class="icon-plus-circle"></span> Crear nuevo artículo</g:link>


                <!-- TABLA DE FACTURAS -->
                    <div class="block block-condensed block-highlight">

                        <div class="app-heading app-heading-small">
                            <div class="title">
                                <p>Artículos registrados.</p>
                            </div>
                        </div>
                        <div class="block-content">

                            <table class="table table-striped table-bordered datatable-extended">
                                <thead>
                                <tr>
                                    <th>ID </th>
                                    <th>Nombre</th>
                                    <th>Cantidad</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${items}" var="item">
                                    <tr>
                                        <td>${item.id}</td>
                                        <td>${item.nombre}</td>
                                        <td>${item.cantidad}</td>
                                        <td>
                                            <span class="label label-success label-bordered label-ghost">ACTIVO</span>
                                        </td>
                                        <td>
                                            <div class="btn-group">
                                                <g:link class="btn btn-info btn-icon " action="editarItem" params="[idItem:item.id]"><span class="icon-pencil"></span></g:link>
                                                <g:link class="btn btn-danger btn-icon " action="eliminarItem"  params="[idItem:item.id]"><span class="icon-trash"></span></g:link>
                                            </div>
                                        </td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>

                        </div>
                        <!-- END TABLA ARTICULOS -->

                    </div>
                    <div class="block-content">

                        <div class="heading-elements">
                            <a href="/" class="btn btn-danger"> <span class="fa fa-reply"></span> Salir</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END PAGE CONTAINER -->

        </div>
    </content>
</g:applyLayout>
