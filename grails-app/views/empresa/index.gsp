<g:applyLayout name="libellumMain">
    <content tag="body">
        <g:link class="btn btn-success col-lg-12 margin-bottom-10" action="crearNuevaEmpresa"><span class="icon-plus-circle"></span> Crear nueva empresa</g:link>

        <div class="block block-condensed">
            <!-- START HEADING -->
            <div class="app-heading app-heading-small">
                <div class="title">
                    <h5>Listado de empresas en el sistema:</h5>
                </div>
            </div>
            <!-- END HEADING -->

            <div class="block-content">

                <table class="table table-striped table-bordered datatable-extended">
                    <thead>
                    <tr>
                        <th>ID </th>
                        <th>Nombre</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${empresas}" var="empresa">
                        <tr>
                            <td>${empresa.id}</td>
                            <td>${empresa.nombre}</td>
                            <td>
                                <div class="btn-group">
                                    <g:link class="btn btn-info btn-icon " action="editarEmpresa" params="[idEmpresa:empresa.id]"><span class="icon-pencil"></span></g:link>
                                    <g:link class="btn btn-danger btn-icon " action="eliminarEmpresa"  params="[idEmpresa:empresa.id]"><span class="icon-trash"></span></g:link>
                                </div>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>

            </div>

        </div>
    </content>
</g:applyLayout>


