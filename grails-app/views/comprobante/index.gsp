<g:applyLayout name="libellum_main">
    <content tag="body">
        <!-- START PAGE CONTAINER -->
        <div id="container" class="container container-boxed">
                <div class="row">

                    <div class="col-md-6">
                        <!-- IMPUESTO -->
                        <div class="block block-condensed">
                            <div class="app-heading app-heading-small">
                                <div class="title">
                                    <h2>Comprobantes</h2>
                                    <p>Registre un nuevo comprobante.</p>
                                </div>
                            </div>

                            <div class="block-content">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label>Tipo de comprobante</label>
                                            <select class="bs-select" tabindex="-98">
                                                <option>${com.businessLibellum.IConstantes.CONSUMIDOR_FINAL}</option>
                                                <option>${com.businessLibellum.IConstantes.CREDITO_FISCAL}</option>
                                                <option>${com.businessLibellum.IConstantes.ESPECIAL}</option>
                                                <option>${com.businessLibellum.IConstantes.GUBERNAMENTAL}</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label>Secuencia</label>
                                            <input maxlength="10" name="secuencia" id="secuencia" type="text" class="form-control">
                                        </div>
                                        <div class="col-md-6">
                                            <label>Contador</label>
                                            <input name="contador" id="contador" type="number" class="form-control">
                                        </div>
                                    </div>


                                </div>
                                <button type="submit" class="btn btn-success"> <span class="fa fa-floppy-o"></span> Guardar </button>

                            </div>
                        </div>

                    </div>
                    <div class="col-md-6">
                        <div class="block block-condensed">
                            <div class="app-heading app-heading-small">
                                <div class="title">
                                    <h2>Listado de comprobantes</h2>
                                    <p>Comprobantes registrados</p>
                                </div>
                            </div>

                            <div class="block-content">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <table class="table table-striped table-bordered datatable-extended">
                                                <thead>
                                                <tr>
                                                    <th>ID </th>
                                                    <th>Nombre</th>
                                                    <th>Contador</th>
                                                    <th>Estado</th>
                                                    <th>Acciones</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <g:each in="${comprobantes}" var="comprobante">
                                                    <tr>
                                                        <td>${comprobante.id}</td>
                                                        <td>${comprobante.nombre}</td>
                                                        <td>${comprobante.contador}</td>
                                                        <td>
                                                            <span class="label label-success label-bordered label-ghost">ACTIVO</span>
                                                        </td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <g:link class="btn btn-info btn-icon " action="editarComprobante" params="[idComprobante:comprobante.id]"><span class="icon-pencil"></span></g:link>
                                                                <g:link class="btn btn-danger btn-icon " action="eliminarComprobante"  params="[idComprobante:comprobante.id]"><span class="icon-trash"></span></g:link>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </g:each>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- END PAGE CONTAINER -->
        </div>
    </content>
</g:applyLayout>


