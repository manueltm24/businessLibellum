<g:applyLayout name="libellum_main">
    <content tag="body">
        <!-- START PAGE CONTAINER -->
        <div id="container" class="container container-boxed">

            <div class="row">
                <g:form method="post" controller="cliente" action="procesarEditarCliente" class="form-horizontal">

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
                                    <input value="${cliente.id}" id="id" name="id" hidden="hidden">
                                    <div class="col-md-6">
                                        <label class="control-label">Nombre:</label>
                                        <input value="${cliente.nombre}" placeholder="Nombre" type="text" id="nombre" name="nombre" class="form-control"  data-validation="length" data-validation-length="2-25" >

                                    </div>
                                    <div class="col-md-6">
                                        <label class="control-label">Teléfono:</label>
                                        <input value="${cliente.telefono}"  name="telefono"  type="text" id="telefono" class="form-control" placeholder="(XXX) XXX-XXXX" data-validation="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <label class="control-label">RNC:</label>
                                        <input value="${cliente.rnc}" placeholder="RNC" name="rnc" id="rnc" type="text" class="form-control" data-validation="length" data-validation-length="2-25">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <label class="control-label">Dirección:</label>
                                        <textarea rows="5"  name="direccion"  type="text" id="direccion" class="form-control" placeholder="Dirección" data-validation="required">${cliente.direccion}</textarea>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="control-label">Ciudad:</label>
                                        <input  name="ciudad"  type="text" id="ciudad" class="form-control" value="${cliente.ciudad}" placeholder="Ciudad"  data-validation="required">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="control-label">País:</label>
                                        <input value="${cliente.pais}"  name="pais"  type="text" id="pais" class="form-control" placeholder="Pais"  data-validation="required">
                                    </div>
                                </div>
                            </div>



                        </div>
                        <div class="block-content">

                            <div class="heading-elements">
                                <a href="/" class="btn btn-danger"> <span class="fa fa-reply"></span> Salir</a>
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
        <script>
            var i=1;
            $("#add_row").click(function(){
                if ((document.getElementById('cantidad').value.length === 0 || document.getElementById('preciounidad').value.length === 0 || document.getElementById('nombreItem').value.length === 0)) {
                    return;
                }
                var item = document.getElementById('item').value;
                $('#addr' + i).html("" +
                    "<td><input type=\"checkbox\"></td>" +
                    "<td>" + (item) + "</td>" +
                    "<td>" + (document.getElementById('nombreItem').value) + "</td>" +
                    "<td>" + (document.getElementById('cantidad').value) + "</td>" +
                    "<td>" + (document.getElementById('preciounidad').value) + "</td>" +
                    "<td>" + (document.getElementById('subtotal_item').value) + "</td>" +
                    "");
                document.getElementById('cantidad').value = '';
                document.getElementById('preciounidad').value = '';
                document.getElementById('subtotal_item').value = '';

                $('#tab_logic').append('<tr id="addr' + (i + 1) + '"></tr>');
                i++;
            });

            //ELIMINAR ARTICULO DE LA TABLA
            $('#remove').click( function(){
                $("input[type=checkbox]:checked").closest("tr").remove();
            });
        </script>


        <script>
            function getItemNombre() {
                var itemId = document.getElementById("item");
                $.ajax({
                    type: "post",
                    url: "/API/getItemNombre?idItem="+itemId.value,
                    dataType: "json",
                    contentType: "application/json",
                    success: function (data) {
                        document.getElementById('nombreItem').value=data.nombre
                    }
                });
            }
        </script>


        <script>
            function getSubTotal_item() {
                var cantidad = parseFloat(document.getElementById("cantidad").value);
                var precioUnidad = parseFloat(document.getElementById("preciounidad").value);
                if(cantidad && precioUnidad){
                    var total = cantidad * precioUnidad;
                    var total_1 = total.toFixed(2);
                    document.getElementById('subtotal_item').value=parseFloat(total_1);
                }
            }
        </script>
        <script>
            function subTotalAndTotal(){
                var sum = 0;
                // use querySelector to find all second table cells
                var cells = document.querySelectorAll("td:nth-of-type(6)");
                for (var i = 0; i < cells.length; i++)
                    sum+=parseFloat(cells[i].firstChild.data);
                document.getElementById('subtotal_Factura').value=sum.toFixed(2);

                var total = parseFloat(document.getElementById('subtotal_Factura').value) + parseFloat(document.getElementById('impuesto').value);
                total -=document.getElementById('descuento').value;
                document.getElementById('total').value= total.toFixed(2);
            }

            function getDescuento() {
                var subtotal = document.getElementById('subtotal_Factura').value;
                var descuentoPorciento = (document.getElementById('porcientoDescuento').value)/100;
                document.getElementById('descuento').value=(subtotal*descuentoPorciento).toFixed(2);

            }
            function getImpuesto(){
                var subtotal = document.getElementById('subtotal_Factura').value;
                var impuesto = (document.getElementById('porcientoImpuesto').value)/100;
                document.getElementById('impuesto').value=(subtotal*impuesto).toFixed(2);

            }
            function updateDescuentoImpuesto() {
                getDescuento();
                getImpuesto()
            }

            window.setInterval(function(){
                updateDescuentoImpuesto();
                subTotalAndTotal();
            }, 500);

        </script>


        <script>
            function procesarNuevaFactura() {
                var items_tabla = document.getElementById('tab_logic');
                var articulos =$(items_tabla).find('> tbody > tr').length;

                if(document.getElementById("cliente_id").value.length===0 || document.getElementById("metodopago_id").value.length===0 || articulos<=2){
                    $("#exampleModal").modal()
                }
                else{
                    var objeto = {};
                    objeto.cliente = document.getElementById("cliente_id").value;
                    objeto.metodoPago=document.getElementById("metodopago_id").value;
                    objeto.comprobante=document.getElementById("comprobante_id").value;
                    objeto.fecha = document.getElementById("fecha").value;
                    objeto.montoBruto=parseFloat(document.getElementById("subtotal_Factura").value);
                    objeto.porcientoDescuento=parseFloat(document.getElementById("porcientoDescuento").value);
                    objeto.montoDescuento=parseFloat(document.getElementById("descuento").value);
                    objeto.porcientoImpuesto=parseFloat(document.getElementById("porcientoImpuesto").value);
                    objeto.montoImpuesto=parseFloat(document.getElementById("impuesto").value);
                    objeto.notas=document.getElementById("notas").value;

                    objeto.montoNeto=parseFloat(document.getElementById("total").value);

                    var listadoArticulos = [];

                    var T = document.getElementById('tab_logic');
                    var rows =$(T).find('> tbody > tr').length;

                    var contadorFila=0; //TODO: mejorar...
                    $(T).find('> tbody > tr').each(function (index,value) {
                        if(index!=0 && index!=rows-1){   //TODO:// mejorar...
                            listadoArticulos[contadorFila]= {};
                            listadoArticulos[contadorFila].idItem=parseInt($(this).find("td").eq(1).text());
                            listadoArticulos[contadorFila].cantidad=parseInt($(this).find("td").eq(3).text());
                            listadoArticulos[contadorFila].preciounidad=parseInt($(this).find("td").eq(4).text());
                            contadorFila++;
                        }
                    });
                    objeto.listadoArticulos = listadoArticulos;
                    $.ajax({
                        type: "post",
                        url:"/factura/procesarCrearFactura",
                        dataType: "json",
                        contentType: "application/json",
                        data: JSON.stringify(objeto),
                        success: function (data) {
                            // window.location = "/factura/nuevaFactura";
                            window.location = "/factura/modeloFactura?idFactura="+data.id
                        }
                    });

                }
            }
        </script>


    </content>
</g:applyLayout>
