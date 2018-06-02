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
                                <p>Cuentas por cobrar.</p>
                            </div>
                        </div>
                        <div class="block-content">

                            <table class="table table-striped table-bordered datatable-extended">
                                <thead>
                                <tr>
                                    <th>ID </th>
                                    <th>Cliente</th>
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
                                            <span class="label label-danger label-bordered label-ghost">PAGO PEDIENTE</span>
                                        </td>
                                        <td>
                                            <div class="btn-group">
                                                <g:link title="Pagar" class="btn btn-success btn-icon " action="procesarPagoFactura" params="[idFactura:factura.id]"><span class="icon-enter"></span></g:link>
                                                <g:link title="Imprimir" class="btn btn-default btn-icon " action="modeloFactura" params="[idFactura:factura.id]"><span class="icon-printer"></span></g:link>
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
