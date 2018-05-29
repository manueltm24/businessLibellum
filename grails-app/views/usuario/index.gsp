<%@ page import="com.businessLibellum.domains.seguridad.Usuario; com.businessLibellum.domains.seguridad.Perfil" %>
<g:applyLayout name="libellum_main">
    <content tag="header">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css"/>
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                var table = $('#listadoUsuarios').DataTable({
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                    }
                } );



                $('#listadoUsuarios tbody').on( 'click', 'tr', function () {
                    if ( $(this).hasClass('selected') ) {
                        $(this).removeClass('selected');
                    }
                    else {
                        table.$('tr.selected').removeClass('selected');
                        $(this).addClass('selected');
                        document.getElementById("usuarioSeleccionado_eliminar").value = this.cells[0].innerHTML;
                        document.getElementById("usuarioSeleccionado_editar").value = this.cells[0].innerHTML;
                    }
                } );

                $('#button').click( function () {
                    table.row('.selected').remove().draw( false );
                } );
            } );
        </script>




    </content>

    <content tag="body">


        <g:link class="btn btn-success col-lg-12 margin-bottom-10" action="crearNuevoUsuario"><span class="icon-plus-circle"></span> Crear nuevo usuario</g:link>

        <div class="block block-condensed">
            <!-- START HEADING -->
            <div class="app-heading app-heading-small">
                <div class="title">
                    <h5>Listado de usuarios en el consorcio:</h5>
                </div>
            </div>
            <!-- END HEADING -->

            <div class="block-content">
                <table class="table table-striped table-bordered datatable-extended">
                    <thead>
                    <tr>
                        <th>ID </th>
                        <th>Nombre</th>
                        <th>Usuario</th>
                        <th>¿Administrador y/o SuperAdministrador?</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${usuarios}" var="usuario">
                        <tr>
                            <td>${usuario.id}</td>
                            <td>${usuario.nombreCompleto()}</td>
                            <td>${usuario.username}</td>
                            <g:if test="${com.businessLibellum.domains.seguridad.UsuarioPerfil.findByUsuarioAndPerfil(usuario,com.businessLibellum.domains.seguridad.Perfil.findByAuthority("ROLE_ADMIN")) || com.businessLibellum.domains.seguridad.UsuarioPerfil.findByUsuarioAndPerfil(usuario,com.businessLibellum.domains.seguridad.Perfil.findByAuthority("ROLE_SUPERADMIN"))}">

                                <td>
                                    <span class="label label-success label-bordered label-ghost">TRUE</span>
                                </td>

                            </g:if>
                            <g:else>
                                <td>
                                    <span class="label label-danger label-bordered label-ghost">FALSE</span>
                                </td>
                            </g:else>
                            <td>
                                <div class="btn-group">
                                    <g:link class="btn btn-info btn-icon " action="editarUsuario" params="[idUsuario:usuario.id]"><span class="icon-pencil"></span></g:link>
                                    <g:if test="${!com.businessLibellum.domains.seguridad.Usuario.isSuperAdmin(usuario)}">
                                        <g:link class="btn btn-danger btn-icon " action="eliminarUsuario" params="[idUsuario:usuario.id]"><span class="icon-trash"></span></g:link>

                                    </g:if>

                                </div>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>

            </div>

        </div>


        <script>
            $.validate({
                // modules : 'security',
                lang: 'es'
            });
        </script>

    </content>
</g:applyLayout>


