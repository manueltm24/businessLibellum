<g:applyLayout name="libellum_main">
    <content tag="body">
        <!-- START PAGE CONTAINER -->
        <div id="container" class="container container-boxed">

            <div class="row">

                <div class="col-md-6">

                    <div class="block block-condensed">
                        <div class="app-heading app-heading-small margin-bottom-15">
                            <div class="title">
                                <h2>Fecha</h2>
                                <p>Fecha de facturación.</p>
                            </div>
                            <div class="heading-elements" style="width: 150px;">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <span class="icon-calendar-full"></span>
                                    </div>
                                    <input name="fecha" id="fecha" type="text" class="form-control bs-datepicker" value="${new java.text.SimpleDateFormat("dd/MM/yyyy").format(new Date())}">
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- CLIENTE -->
                    <div class="block block-condensed">
                        <div class="app-heading app-heading-small">
                            <div class="title">
                                <h2><b>Cliente</b></h2>
                                <p>Cliente a facturar.</p>
                            </div>
                            <div class="heading-elements">
                                <a href="#" class="btn btn-default btn-clean"> <span class="fa fa-user-plus"></span> Cliente</a>
                            </div>
                        </div>

                        <div class="block-content">
                            <div class="list-group margin-bottom-15">
                                <a href="#" class="list-group-item list-group-item-highlighted">
                                    <div class="row">
                                        <g:select  from="${clientes}"  noSelection="['':'Seleccione un cliente']"  class="bs-select" data-live-search="true" id="cliente_id" name="cliente_id" optionKey="id" optionValue="nombre" data-validation="required"/>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- COMPROBANTE Y METODO DE PAGO. -->
                    <div class="block block-condensed">
                        <div class="app-heading app-heading-small">
                            <div class="title">
                                <p>Metodo de pago y tipo de factura.</p>
                            </div>
                        </div>

                        <div class="block-content">


                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <g:select from="${metodosPago}"  noSelection="['':'Metodo de pago']"  class="bs-select" id="metodopago_id" name="metodopago_id" optionKey="id" optionValue="nombre" data-validation="required"/>
                                    </div>
                                    <div class="col-md-6">
                                        <g:select from="${comprobantes}"  noSelection="['':'Tipo de comprobante']"  class="bs-select" id="comprobante_id" name="comprobante_id" optionKey="id" optionValue="nombre" data-validation="required"/>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- END ARTICULOS -->



                    </div>
                    <!-- END COMPROBANTE Y METODO DE PAGO. -->
                    <!-- COMPROBANTE Y METODO DE PAGO. -->
                    <div class="block block-condensed">
                        <div class="app-heading app-heading-small">
                            <div class="title">
                                <p>Notas:</p>
                            </div>
                        </div>

                        <div class="block-content">


                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-10">
                                        <textarea id="notas" name="notas" class="form-control" rows="5">${empresa.notas_default}</textarea>
                                    </div>
                                </div>

                            </div>
                        </div>



                    </div>
                    <!-- END COMPROBANTE Y METODO DE PAGO. -->


                </div>
                <div class="col-md-6">

                    <!-- ARTICULOS -->
                    <div class="block block-condensed">
                        <div class="app-heading app-heading-small">
                            <div class="title">
                                <h2>Artículos</h2>
                                <p>Agregue los articulos que desea facturar.</p>
                            </div>
                            <div class="heading-elements">
                                <a href="#" class="btn btn-default btn-clean"> <span class="fa fa-plus"></span> Artículo</a>
                            </div>
                        </div>

                        <div class="block-content">

                            <div class="form-group">
                                <div class="row">
                                    <g:select onchange="getItemNombre()"  from="${items}"  noSelection="['':'Seleccione un item']"  class="bs-select" data-live-search="true" id="item" name="item" optionKey="id" optionValue="nombre"/>
                                    <input name="nombreItem" id="nombreItem" hidden="hidden">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2">
                                        <label>Cantidad</label>
                                        <input onchange="getSubTotal_item()" name="cantidad" id="cantidad" type="number" class="form-control">
                                    </div>
                                    <div class="col-md-3">
                                        <label>Precio Unidad</label>
                                        <input onchange="getSubTotal_item()" step=".01" name="preciounidad" id="preciounidad" placeholder="RD$" type="number" class="form-control">
                                    </div>
                                    <div class="col-md-3">
                                        <label>Subtotal</label>
                                        <input disabled="disabled" name="subtotal_item" id="subtotal_item" placeholder="RD$" type="text" class="form-control">
                                    </div>
                                    <div class="col-md-3">

                                        <a id="add_row" class="btn btn-success btn-default btn-lg"><b>Añadir item</b></a>


                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- END ARTICULOS -->



                    </div>
                    <!-- TABLA DE ARTICULOS -->
                    <div class="block block-condensed block-highlight">
                        <div class="app-heading app-heading-small">
                            <div class="title">
                                <p>Artículos presente en la factura.</p>
                            </div>
                        </div>
                        <div class="block-content">

                            <table class="table table-bordered" id="tab_logic">
                                <thead>
                                <tr >
                                    <th class="text-center"></th>
                                    <th class="text-center">#</th>
                                    <th class="text-center">Item</th>
                                    <th class="text-center">Cantidad</th>
                                    <th class="text-center">Precio Unidad</th>
                                    <th id="subtotal_row" class="text-center">Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr id='addr0'>
                                </tr>
                                <tr id='addr1'></tr>
                                </tbody>
                            </table>
                            <button class="btn btn-danger btn-icon " id="remove" type="button"><span class="icon-trash"></span></button>
                            <small>Seleccione el artículo que desea eliminar de la factura.</small>

                        </div>
                        <!-- END TABLA ARTICULOS -->

                    </div>
                    <!-- DETALLES DINERO -->
                    <div class="block block-condensed">
                        <div class="app-heading app-heading-small">
                            <div class="title">
                                <p>Resumen de la factura.</p>
                            </div>
                        </div>

                        <div class="block-content">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th class="text-center">Subtotal</th>
                                    <th class="text-center">Descuento (%)
                                        <input placeholder="%" onchange="getDescuento()" id="porcientoDescuento" name="porcientoDescuento" value="0.00" type="number" class="form-control">
                                    </th>
                                    <th class="text-center">Impuesto (%)
                                        <input onchange="getImpuesto()" placeholder="%" name="porcientoImpuesto" id="porcientoImpuesto" value="${empresa.impuesto_default}" type="number" class="form-control">

                                    </th>
                                    <th class="text-center">Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="text-center">
                                        <input id="subtotal_Factura" onchange="updateDescuentoImpuesto()" name="subtotal_Factura" type="number" disabled="disabled" class="form-control">
                                    </td>
                                    <td class="text-center">
                                        <input name="descuento" id="descuento" type="number" disabled="disabled" class="form-control">
                                    </td>
                                    <td class="text-center">
                                        <input id="impuesto" name="impuesto" type="number" disabled="disabled" class="form-control">
                                    </td>
                                    <td class="text-center">
                                        <input id="total" name="total" type="number" disabled="disabled" class="form-control">
                                    </td>
                                </tr>
                                </tbody>
                            </table>



                        </div>
                        <!-- END DETALLES DINERO -->



                    </div>
                    <div class="block-content">

                        <div class="heading-elements">
                            <a href="/" class="btn btn-danger"> <span class="fa fa-reply"></span> Salir</a>
                            <a href="#" onclick="procesarNuevaFactura()" class="btn btn-success"> <span class="fa fa-floppy-o"></span> Guardar </a>
                            <a href="#" class="btn btn-default"> <span class="fa fa-print"></span> Imprimir</a>
                        </div>
                    </div>
                </div>
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
