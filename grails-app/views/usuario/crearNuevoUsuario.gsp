<g:applyLayout name="libellumMain">
    <content tag="header">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>

        %{--VALIDADOR DE TELEFONO--}%
        <script type="text/javascript">
            $(document).ready(function () {
                document.getElementById('telefono').addEventListener('input', function (e) {
                    var x = e.target.value.replace(/\D/g, '').match(/(\d{0,3})(\d{0,3})(\d{0,4})/);
                    e.target.value = !x[2] ? x[1] : '(' + x[1] + ') ' + x[2] + (x[3] ? '-' + x[3] : '');
                });
            })


        </script>

        <asset:javascript src="multiselect.js"/>


        <script type="text/javascript">
            jQuery(document).ready(function($) {
                $('.multiselect').multiselect();
            });
        </script>


    </content>

    <content tag="body">
        <g:form method="post" controller="usuario" action="procesarNuevoUsuario" class="form-horizontal">
            <div class="block">
                <div class="block">

                    <div class="app-heading app-heading-small">
                        <div class="title">
                            <h2>Crear usuario</h2>
                            <p>Llene los campos necesarios</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-6">
                            <label class="control-label">Nombre:</label>
                            <input placeholder="Nombre" type="text" id="nombre" name="nombre" class="form-control"  data-validation="length" data-validation-length="2-25" >

                        </div>
                        <div class="col-md-6">
                            <label class="col-md-2 control-label">Apellido:</label>
                            <input  placeholder="Apellido" type="text" id="apellido" name="apellido" class="form-control" data-validation-optional="true" data-validation="length" data-validation-length="2-25">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6">
                            <label class="control-label">Username:</label>
                            <input placeholder="Usuario" name="username" id="username" type="text" class="form-control" data-validation="length" data-validation-length="2-25">
                        </div>
                        <div class="col-md-6">
                            <label class="control-label">Contraseña:</label>
                            <input placeholder="Contreseña" name="password" id="password" type="password" class="form-control" data-validation="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6">
                            <label class="control-label">Teléfono:</label>
                            <input  name="telefono"  type="text" id="telefono" class="form-control" placeholder="(XXX) XXX-XXXX" data-validation="required">
                        </div>
                        <div class="col-md-6">
                            <label class="control-label">Correo electrónico:</label>
                            <input  name="email"  type="text" id="email" class="form-control" placeholder="E-mail"  data-validation="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6">
                            <div class="app-checkbox">
                                <label>
                                    <g:checkBox name="admin" id="admin"/> ¿ Administrador ?
                                </label>
                            </div>
                        </div>
                    </div>
                    %{--<div class="left-container">--}%
                    %{--<button style="margin-top: 5px" type="submit" class="btn btn-info btn-block">Guardar</button>--}%
                    %{--</div>--}%


                    %{--</g:form>--}%

                </div>

                <div class="block">
                    <div class="app-heading app-heading-small">
                        <div class="title">
                            <h2>Empresas que el usuario accederá</h2>
                            <p>Elija las empresas</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-5">
                            <label class="control-label">Listado de empresas en el sistema:</label>
                            <g:select from="${empresas}"  class="multiselect form-control"  name="empresas" optionKey="id" optionValue="nombre" multiple="multiple" data-right="#multiselect_to_1" data-right-all="#right_All_1" data-right-selected="#right_Selected_1" data-left-all="#left_All_1" data-left-selected="#left_Selected_1"/>
                        </div>

                        <div class="col-xs-2">
                            <br><br>
                            <button type="button" id="right_Selected_1" class="btn btn-block btn-success"><i class="icon-chevron-right"></i></button>
                            <button type="button" id="left_Selected_1" class="btn btn-block btn-danger"><i class="icon-chevron-left"></i></button>
                        </div>

                        <div class="col-xs-5">
                            <label class="control-label">Listado de empresas seleccionadas:</label>
                            <select name="empresasSeleccionadas" id="multiselect_to_1" class="form-control" size="8" multiple="multiple"></select>
                        </div>
                    </div>
                </div>

                <div class="left-container">
                    <button style="margin-top: 5px" type="submit" class="btn btn-info btn-block">Guardar</button>
                </div>

            </div>
        </g:form>


        <script>
            $.validate({
                // modules : 'security',
                lang: 'es'
            });
        </script>

    </content>
</g:applyLayout>


