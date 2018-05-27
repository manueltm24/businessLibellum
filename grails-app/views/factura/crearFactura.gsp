<%@ page import="java.text.SimpleDateFormat" %>
<g:applyLayout name="libellumMain">
    <content tag="header">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>

        <asset:javascript src="js/vendor/bootstrap-select/bootstrap-select.js"/>
        <asset:javascript src="js/vendor/sweetalert/sweetalert.min.js"/>



    </content>
    <content tag="body">
        <div class="block">

            <div class="app-heading app-heading-small">
                <div class="title">
                    <h2>Crear factura</h2>
                    <p>Los campos necesarios se encuentran marcados con *</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-1 control-label">Cliente: *</label>
                <div class="col-md-6">
                    <g:select  from="${clientes}"  noSelection="['':'Seleccione un cliente']"  class="bs-select" data-live-search="true" id="cliente" name="cliente" optionKey="id" optionValue="nombre" data-validation="required"/>
                </div>
                <div class="col-md-1">
                    <div class="input-group-btn">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Opciones <span class="caret"></span></button>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li><a href="#">Crear nuevo cliente</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="block">
                <div class="form-group">
                    <div class="col-md-4">
                        <label>Pago: *</label>
                        <g:select from="${metodosPago}"  noSelection="['':'Seleccione un metodo de pago']"  class="bs-select" id="metodoPago" name="metodoPago" optionKey="id" optionValue="nombre" data-validation="required"/>
                    </div>
                    <div class="col-md-3">
                        <label>Fecha:</label>
                        <div class="input-group bs-datepicker">
                            <input placeholder="${new java.text.SimpleDateFormat("dd/MM/yyyy").format(new Date())}" date name="fecha" id="fecha" type="text" class="form-control">
                            <span class="input-group-addon">
                                <span class="icon-calendar-full"/>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label>Comprobante:</label>
                        <g:select from="${comprobantes}"  noSelection="['':'Seleccione un tipo de comprobante']"  class="bs-select" id="comprobante" name="comprobante" optionKey="id" optionValue="nombre" data-validation="required"/>
                    </div>

                </div>


            </div>
            <div class="block" style="background: papayawhip ">
                <div class="form-group">
                    <div class="col-md-4">
                        <label>Item</label>
                        <g:select onchange="getItemNombre()"  from="${items}"  noSelection="['':'Seleccione un item']"  class="bs-select" data-live-search="true" id="item" name="item" optionKey="id" optionValue="nombre"/>
                        <input name="nombreItem" id="nombreItem" hidden="hidden">

                    </div>
                    <div class="col-md-1">
                        <label>Cantidad</label>
                        <input onchange="getSubTotal_item()" name="cantidad" id="cantidad" type="number" class="form-control">
                    </div>
                    <div class="col-md-2">
                        <label>Precio Unidad</label>
                        <input onchange="getSubTotal_item()" step=".01" name="preciounidad" id="preciounidad" placeholder="RD$" type="number" class="form-control">
                    </div>
                    <div class="col-md-2">
                        <label>Subtotal</label>
                        <input disabled="disabled" name="subtotal_item" id="subtotal_item" placeholder="RD$" type="text" class="form-control">
                    </div>
                    <div class="col-md-2">
                        <br>
                        <a id="add_row" class="btn btn-default pull-left">Añadir item</a>
                        %{--<a id='delete_row' class="pull-right btn btn-default">Delete Row</a>--}%
                    </div>

                </div>

            </div>
            <div class="container">
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <p>Debe existir almenos un articulo en la factura.</p>

                        <table class="table table-bordered" id="tab_logic">
                            <thead>
                            <tr >
                                <th class="text-center">

                                </th>
                                <th class="text-center">
                                    #
                                </th>
                                <th class="text-center">
                                    Item
                                </th>
                                <th class="text-center">
                                    Cantidad
                                </th>
                                <th class="text-center">
                                    Precio Unidad
                                </th>
                                <th id="subtotal_row" class="text-center">
                                    Subtotal
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr id='addr0'>
                                %{--<td>--}%
                                    %{--1--}%
                                %{--</td>--}%
                                %{--<td>--}%
                                    %{--<input type="text" name='user0'  placeholder='User' class="form-control"/>--}%
                                %{--</td>--}%
                                %{--<td>--}%
                                    %{--<input type="text" name='pass0' placeholder='Password' class="form-control"/>--}%
                                %{--</td>--}%
                                %{--<td>--}%
                                    %{--<input type="text" name='ip0' placeholder='IP' class="form-control"/>--}%
                                %{--</td>--}%
                                %{--<td>--}%
                                    %{--<input type="text" name='country0' placeholder='Country' class="form-control"/>--}%
                                %{--</td>--}%
                                %{--<td>--}%
                                    %{--<input type="text" name='ipDisp0' placeholder='IP Details' class="form-control"/>--}%
                                %{--</td>--}%
                            </tr>
                            <tr id='addr1'></tr>
                            </tbody>
                        </table>
                        %{--<form id="myform">--}%
                        <button class="btn btn-danger btn-icon " id="remove" type="button"><span class="icon-trash"></span></button>
                        <small>Seleccione el artículo que desea eliminar de la factura.</small>

                        %{--</form>--}%
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="form-group">
                    <label class="col-md-1 control-label">Subtotal</label>
                    <div class="col-md-2">
                        <input id="subtotal_Factura" onchange="updateDescuentoImpuesto()" name="subtotal_Factura" type="number" disabled="disabled" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-1 control-label">Descuento</label>
                    <div class="col-md-1">
                        <div class="input-group">
                            <span class="input-group-addon">%</span>
                            <input onchange="getDescuento()" id="descuentoporciento" name="descuentoporciento" value="0" type="text" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-1">
                        <input name="descuento" id="descuento" type="number" disabled="disabled" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-1 control-label">Impuesto</label>
                    <div class="col-md-1">
                        <div class="input-group">
                            <span class="input-group-addon">%</span>
                            <input onchange="getImpuesto()" name="impuestoporciento" id="impuestoporciento" value="0" type="text" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-1">
                        <input id="impuesto" name="impuesto" type="number" disabled="disabled" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <h3 class="col-md-1"><b>Total</b></h3>
                    <div class="col-md-2">
                        <input id="total" name="total" type="number" disabled="disabled" class="form-control">
                    </div>
                </div>
            </div>
            <div class="left-container">
                <button onclick="procesarNuevaFactura()"  style="margin-top: 5px" type="submit" class="btn btn-info btn-block">FACTURAR</button>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><b>Advertencia!</b></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Verifique los campos necesarios!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <g:link action="downloadInvoice">Download invoice</g:link>


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
                $('#tab_logic').append('<tr id="addr' + (i + 1) + '"></tr>');
                i++;


            });

            $('#remove').click( function(){
                $("input[type=checkbox]:checked").closest("tr").remove();

            });

            function getItemNombre() {
                var itemId = document.getElementById("item");
                $.ajax({
                    type: "post",
                    url: "/API/getItemNombre?idItem="+itemId.value,
                    dataType: "json",
                    contentType: "application/json",
                    success: function (data) {
                        // window.alert(data.nombre);
                        document.getElementById('nombreItem').value=data.nombre
                    }
                });
            }
            function getSubTotal_item() {
                var cantidad = parseFloat(document.getElementById("cantidad").value);
                var precioUnidad = parseFloat(document.getElementById("preciounidad").value);
                if(cantidad && precioUnidad){
                    var total = cantidad * precioUnidad;
                    var total_1 = total.toFixed(2);
                    document.getElementById('subtotal_item').value=parseFloat(total_1);
                }

            }
            function subTotalAndTotal(){
                var sum = 0;
                // use querySelector to find all second table cells
                var cells = document.querySelectorAll("td:nth-of-type(6)");

                for (var i = 0; i < cells.length; i++)
                    sum+=parseFloat(cells[i].firstChild.data);
                document.getElementById('subtotal_Factura').value=sum;

                var total = document.getElementById('subtotal_Factura').value-document.getElementById('impuesto').value;
                total -=document.getElementById('descuento').value;
                document.getElementById('total').value= total;


            }

            function getDescuento() {
                var subtotal = document.getElementById('subtotal_Factura').value;
                var descuentoPorciento = (document.getElementById('descuentoporciento').value)/100;
                document.getElementById('descuento').value=subtotal*descuentoPorciento;

            }

            function getImpuesto(){
                var subtotal = document.getElementById('subtotal_Factura').value;
                var impuesto = (document.getElementById('impuestoporciento').value)/100;
                document.getElementById('impuesto').value=subtotal*impuesto;

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

                if(document.getElementById("cliente").value.length===0 || document.getElementById("metodoPago").value.length===0 || articulos<=2){
                    $("#exampleModal").modal()

                }
                else{
                    var objeto = {};
                    objeto.cliente = document.getElementById("cliente").value;
                    objeto.metodoPago=document.getElementById("metodoPago").value;
                    objeto.comprobante=document.getElementById("comprobante").value;
                    objeto.fecha=document.getElementById("fecha").value ? document.getElementById("fecha").value : new Date();
                    objeto.subtotal=document.getElementById("subtotal_Factura").value;
                    objeto.descuento_porciento=document.getElementById("descuentoporciento").value
                    objeto.impuesto_porciento=document.getElementById("impuestoporciento").value;
                    objeto.total=document.getElementById("total").value;

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
                        // console.log(""+JSON.stringify(listadoArticulos));

                    });
                    objeto.listadoArticulos = listadoArticulos;
                    console.log(objeto);

                    $.ajax({
                        type: "post",
                        url:"/factura/procesarCrearFactura",
                        dataType: "json",
                        contentType: "application/json",
                        data: JSON.stringify(objeto),
                        success: function (data) {
                            window.location = "/factura/modeloFactura?idFactura="+data.id
                        }
                    });

                }



            }

        </script>

    </content>
</g:applyLayout>
