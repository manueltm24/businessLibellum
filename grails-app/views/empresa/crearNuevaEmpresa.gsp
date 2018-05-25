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
    </content>
    <content tag="body">
        <div class="block">

            <div class="app-heading app-heading-small">
                <div class="title">
                    <h2>Crear empresa</h2>
                    <p>Llene los campos necesarios</p>
                </div>
            </div>

            <g:form enctype="multipart/form-data" method="post" controller="empresa" action="procesarNuevaEmpresa" class="form-horizontal">
                <div class="form-group">
                    <div class="col-md-6">
                        <label class="control-label">Nombre empresa:</label>
                        <input placeholder="Nombre de la empresa" type="text" id="nombreEmpresa" name="nombreEmpresa" class="form-control"  data-validation="length" data-validation-length="2-35" >

                    </div>
                    <div class="col-md-6">
                        <label class="control-label">Teléfono:</label>
                        <input  name="telefono"  type="text" id="telefono" class="form-control" placeholder="(XXX) XXX-XXXX" data-validation="required">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-4">
                        <label class="control-label">Dirección:</label>
                        <input placeholder="Dirección" type="text" id="direccion" name="direccion" class="form-control"  data-validation-optional="true" data-validation="length" data-validation-length="2-35" >

                    </div>
                    <div class="col-md-4">
                        <label class="control-label">Pais:</label>
                        <input placeholder="País" type="text" id="pais" name="pais" class="form-control"  data-validation-optional="true" data-validation="length" data-validation-length="2-25" >
                    </div>
                    <div class="col-md-4">
                        <label class="control-label">Ciudad:</label>
                        <input placeholder="Ciudad" type="text" id="ciudad" name="ciudad" class="form-control"  data-validation-optional="true" data-validation="length" data-validation-length="2-25" >
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-4">
                        <label class="control-label">RNC:</label>
                        <input placeholder="RNC" type="text" id="rnc" name="rnc" class="form-control"  data-validation-optional="true" data-validation="length" data-validation-length="2-35" >

                    </div>
                    <div class="col-md-6">
                        <label for="imagen">Image: </label>
                        <input type="file" accept="image/*" class="form-control" name="imagen" id="imagen" />
                    </div>
                </div>
                <div class="left-container">
                    <button style="margin-top: 5px" type="submit" class="btn btn-info btn-block">Guardar</button>
                </div>

            </g:form>

        </div>
        <script>
            $.validate({
                // modules : 'security',
                lang: 'es'
            });
        </script>

    </content>
</g:applyLayout>


