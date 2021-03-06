<g:applyLayout name="libellum_main">
    <content tag="body">
        <!-- START PAGE CONTAINER -->
        <div id="container" class="container container-boxed">

            <div class="row">

                %{--<div class="col-md-6">--}%
                    %{----}%
                %{--</div>--}%
                <div class="col-md-12">


                    <!-- TABLA DE FACTURAS -->
                    <div class="block block-condensed block-highlight">
                        <div class="app-heading app-heading-small">
                            <div class="title">
                                <p>Artículos presente en la factura.</p>
                            </div>
                        </div>
                        <div class="block-content">

                            <table class="table table-striped table-bordered datatable-extended">
                                <thead>
                                <tr>
                                    <th>ID </th>
                                    <th>Nombre</th>
                                    <th>Monto</th>
                                    <th>Fecha</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${facturas}" var="factura">
                                    <tr>
                                        <td>${factura.codigo}</td>
                                        <td>${factura.cliente.nombre}</td>
                                        <td>$${factura.montoNeto}</td>
                                        <td>${(new java.text.SimpleDateFormat("dd/MM/yyyy",new Locale("es", "ES"))).format(factura.fecha).toString()}</td>
                                        <td>
                                            <g:if test="${factura.facturaSaldada}">
                                                <span class="label label-success label-bordered label-ghost">SALDADA</span>
                                            </g:if>
                                            <g:else>
                                                <span class="label label-danger label-bordered label-ghost">PAGO PEDIENTE</span>
                                            </g:else>
                                        </td>
                                        <td>
                                            <div class="btn-group">
                                                <g:link class="btn btn-default btn-icon " action="modeloFactura" params="[idFactura:factura.id]"><span class="icon-printer"></span></g:link>
                                                <g:link class="btn btn-info btn-icon " action="editarFactura" params="[idFactura:factura.id]"><span class="icon-pencil"></span></g:link>
                                                <g:link class="btn btn-danger btn-icon " action="eliminarFactura"  params="[idFactura:factura.id]"><span class="icon-trash"></span></g:link>
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
