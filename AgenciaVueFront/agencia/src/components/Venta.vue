<template>
    <v-layout align-start>
        <v-flex>
            <v-toolbar flat color="white">
                <v-toolbar-title>Ventas</v-toolbar-title>
                    <v-divider
                    class="mx-2"
                    inset
                    vertical
                    ></v-divider>
                    <v-spacer></v-spacer>
                    <v-text-field class="text-xs-center" v-model="search" append-icon="search" label="Búsqueda" single-line hide-details></v-text-field>
                    <v-spacer></v-spacer>
                    <v-dialog v-model="dialog" max-width="500px">
                        <v-btn slot="activator" color="primary" dark class="mb-2">Nuevo</v-btn>
                        <v-card>
                            <v-card-title>
                            <span class="headline">{{ formTitle }}</span>
                            </v-card-title>
                
                            <v-card-text>
                            <v-container grid-list-md>
                                <v-layout wrap>
                                <v-flex xs12 sm6 md6>
                                    <v-text-field v-model="nombre" label="Nombre">
                                    </v-text-field>
                                </v-flex>
                                <v-flex xs12 sm6 md6>
                                    <v-select v-model="idrol"
                                    :items="roles" label="Rol">
                                    </v-select>
                                </v-flex>
                                <v-flex xs12 sm6 md6>
                                    <v-select v-model="tipo_documento"
                                    :items="documentos" label="Tipo Documento">
                                    </v-select>
                                </v-flex>
                                <v-flex xs12 sm6 md6>
                                    <v-text-field v-model="numDocumento" label="Número Documento">
                                    </v-text-field>
                                </v-flex>
                                <v-flex xs12 sm6 md6>
                                    <v-text-field v-model="direccion" label="Dirección">
                                    </v-text-field>
                                </v-flex>
                                <v-flex xs12 sm6 md6>
                                    <v-text-field v-model="telefono" label="Teléfono">
                                    </v-text-field>
                                </v-flex>
                                <v-flex xs12 sm6 md6>
                                    <v-text-field v-model="email" label="Email">
                                    </v-text-field>
                                </v-flex>
                                <v-flex xs12 sm6 md6>
                                    <v-text-field type="password" v-model="password" label="Password">
                                    </v-text-field>
                                </v-flex>
                                <v-flex xs12 sm12 md12 v-show="valida">
                                    <div class="red--text" v-for="v in validaMensaje" :key="v" v-text="v">
                                    </div>
                                </v-flex>
                                </v-layout>
                            </v-container>
                            </v-card-text>
                
                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn color="blue darken-1" flat @click.native="close">Cancelar</v-btn>
                                <v-btn color="blue darken-1" flat @click.native="guardar">Guardar</v-btn>
                            </v-card-actions>
                        </v-card>
                    </v-dialog>
                    <v-dialog v-model="adModal" max-width="290">
                        <v-card>
                            <v-card-title class="headline" v-if="adAccion==1">¿Activar Item?</v-card-title>
                            <v-card-title class="headline" v-if="adAccion==2">¿Desactivar Item?</v-card-title>
                            <v-card-text>
                                Estás a punto de 
                                <span v-if="adAccion==1">Activar </span>
                                <span v-if="adAccion==2">Desactivar </span>
                                el ítem {{ adNombre }}
                            </v-card-text>
                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn color="green darken-1" flat="flat" @click="activarDesactivarCerrar">
                                    Cancelar
                                </v-btn>
                                <v-btn v-if="adAccion==1" color="orange darken-4" flat="flat" @click="activar">
                                    Activar
                                </v-btn>
                                <v-btn v-if="adAccion==2" color="orange darken-4" flat="flat" @click="desactivar">
                                    Desactivar
                                </v-btn>
                            </v-card-actions>

                        </v-card>
                    </v-dialog>
                </v-toolbar>
            <v-data-table
                :headers="headers"
                :items="ventas"
                :search="search"
                class="elevation-1"
            >
                <template slot="items" slot-scope="props">
                    <td class="justify-center layout px-0">
                        <v-icon
                        small
                        class="mr-2"
                        @click="editItem(props.item)"
                        >
                        edit
                        </v-icon>
                        <template v-if="props.item.estado=='Aceptado'">
                            <v-icon
                            small
                            @click="activarDesactivarMostrar(2,props.item)"
                            >
                            block
                            </v-icon>
                        </template>
                        <template v-else>
                            <v-icon
                            small
                            @click="activarDesactivarMostrar(1,props.item)"
                            >
                            check
                            </v-icon>
                        </template>
                    </td>
                    <td>{{ props.item.cliente }}</td>
                    <td>{{ props.item.asesorVenta }}</td>
                    <td>{{ props.item.compañia }}</td>
                    <td>{{ props.item.numComprobante }}</td>
                    <td>{{ props.item.fecha }}</td>
                    <td>{{ props.item.total }}</td>                  
                    <td>
                        <div v-if="props.item.estado=='Aceptado'">
                            <span class="blue--text">Aceptado</span>
                        </div>
                        <div v-else>
                            <span class="red--text">{{props.item.estado}}</span>
                        </div>
                    </td>
                </template>
                <template slot="no-data">
                <v-btn color="primary" @click="listar">Resetear</v-btn>
                </template>
            </v-data-table>

            <v-container grid-list-sm class="pa-4 white">
                <v-layout row wrap>                   
                    <v-flex xs12 sm4 lg4 xl4>
                        <v-text-field v-model="numComprobante" label="Numero Comprobante">

                        </v-text-field>
                    </v-flex>
                    <v-flex xs12 sm4 lg4 xl4>
                        <v-select v-model="idCliente"
                            :items="clientes" label ="Cliente">
                        </v-select>
                    </v-flex>
                    <v-flex xs12 sm4 lg4 xl4>
                        <v-select v-model="idAsesorVenta"
                            :items="asesores" label ="Asesor">
                        </v-select>
                    </v-flex>
                    <v-flex xs12 sm4 lg4 xl4>
                        <v-select v-model="idCompañia"
                            :items="compañias" label ="Compañia">
                        </v-select>
                    </v-flex>                    
                     <v-flex xs12 sm4 lg4 xl4>
                       <v-btn small fab dark color="teal">
                            <v-icon dark>List</v-icon>
                       </v-btn>
                    </v-flex>
                     <v-flex xs12 sm4 lg12 xl12>
                        <v-data-table
                            :headers="cabeceraDetalles"
                            :items="detalles"      
                            hide-actions 
                            class="elevation-1"
                        >
                            <template slot="items" slot-scope="props">
                                <td class="justify-center layout px-0">
                                    <v-icon
                                    small
                                    class="mr-2"                                    
                                    >
                                    delete
                                    </v-icon>                                                                  
                                </td>
                                <td>{{ props.item.producto }}</td>
                                <td>{{ props.item.precio }}</td>     
                                <td>{{ props.item.precio }}</td>  <!--//subtotal  -->
                            </template>
                            <template slot="no-data">
                                <h3>No hay productos agregados al detalle</h3>
                            </template>
                        </v-data-table>
                    </v-flex >
                    <v-flex xs12 sm4 lg12 xl12>
                        <v-btn color="blue darken-1" flat>Cancelar</v-btn>
                        <v-btn color="success">Guardar</v-btn>
                    </v-flex>
                </v-layout>
            </v-container>

        </v-flex>
    </v-layout>
</template>
<script>
    import axios from 'axios'
    export default {
        data(){
            return {
                ventas:[],                
                dialog: false,
                headers: [
                    { text: 'Opciones', value: 'opciones', sortable: false },
                    { text: 'Cliente', value: 'cliente' },   
                    { text: 'AsesorVenta', value: 'asesorVenta' },
                    { text: 'Compañia', value: 'compañia' },                  
                    { text: 'Número Comprobante', value: 'numComprobante', sortable: false  },
                    { text: 'Fecha', value: 'fecha', sortable: false  },
                    { text: 'Total', value: 'total', sortable: false  },                 
                    { text: 'Estado', value: 'estado', sortable: false  }                
                ],
                search: '',
                editedIndex: -1,
                id: '',  
                idCliente:'',
                idAsesorVenta:'',
                asesores:[],
                idCompañia:'',
                compañias:[],               
                clientes:[],                          
                nombre:'',
                tipo_documento: '',
                documentos: ['DNI','RUC','PASAPORTE','CEDULA'],
                numDocumento: '',
                numComprobante: '',
                cabeceraDetalles:[
                    { text: 'Borrar', value: 'borrar', sortable: false },
                    { text: 'Producto', value: 'producto' },   
                    { text: 'Precio', value: 'precio' },                                 
                    { text: 'SubTotal', value: 'subtotal', sortable: false  }                
                ],  
                detalles:[                   
                ],                     
                valida: 0,
                validaMensaje:[],
                adModal: 0,
                adAccion: 0,
                adNombre: '',
                adId: ''             
            }
        },
        computed: {
            formTitle () {
                return this.editedIndex === -1 ? 'Nuevo usuario' : 'Actualizar usuario'
            }
        },

        watch: {
            dialog (val) {
            val || this.close()
            }
        },

        created () {
            this.listar();
            this.selectCliente();           
            this.selectCompañia();
            this.selectASesor();
        },
        methods:{
            listar(){
                let me=this;
                axios.get('api/Ventas/Listar').then(function(response){
                    //console.log(response);
                    me.ventas=response.data;
                }).catch(function(error){
                    console.log(error);
                });
            },
            selectCliente(){
                let me=this;
                var clientesArray=[];
                axios.get('api/Clientes/Select').then(function(response){
                    clientesArray=response.data;
                    clientesArray.map(function(x){
                        me.clientes.push({text: x.nombre,value:x.idCliente});
                    });
                }).catch(function(error){
                    console.log(error);
                });
            },
             selectAsesor(){
                let me=this;
                var asesoresArray=[];
                axios.get('api/AsesorVentas/Select').then(function(response){
                   asesoresArray=response.data;
                    asesoresArray.map(function(x){
                        me.asesores.push({text: x.nombres,value:x.idAsesorVenta});
                    });
                }).catch(function(error){
                    console.log(error);
                });
            },
             selectCompañia(){
                let me=this;
                var compañiasArray=[];
                axios.get('api/Compañias/Select').then(function(response){
                    compañiasArray=response.data;
                    compañiasArray.map(function(x){
                        me.compañias.push({text: x.nombre,value:x.idCompañia});
                    });
                }).catch(function(error){
                    console.log(error);
                });
            },
            editItem (item) {
                this.id=item.idusuario;
                this.idrol=item.idrol;
                this.nombre=item.nombre;
                this.tipo_documento=item.tipo_documento;
                this.num_documento=item.num_documento;
                this.direccion=item.direccion;
                this.telefono=item.telefono;
                this.email=item.email;              
                this.editedIndex=1;
                this.dialog = true
            },
            close () {
                this.dialog = false;
                this.limpiar();
            },
            limpiar(){
                this.id="";
                this.idrol="";
                this.nombre="";
                this.tipo_documento="";
                this.num_documento="";
                this.direccion="";
                this.telefono="";
                this.email=""; 
                this.editedIndex=-1;
            },
            guardar () {
                if (this.validar()){
                    return;
                }
                if (this.editedIndex > -1) {
                    //Código para editar
                    //Código para guardar
                    let me=this;
                    if (me.password!=me.passwordAnt){
                        me.actPassword=true;
                    }
                    axios.put('api/Usuarios/Actualizar',{
                        'idusuario':me.id,
                        'idrol':me.idrol,
                        'nombre':me.nombre,
                        'tipo_documento': me.tipo_documento,
                        'num_documento':me.num_documento,
                        'direccion':me.direccion,
                        'telefono': me.telefono,
                        'email':me.email,                    
                    }).then(function(response){
                        me.close();
                        me.listar();
                        me.limpiar();                        
                    }).catch(function(error){
                        console.log(error);
                    });
                } else {
                    //Código para guardar
                    let me=this;
                    axios.post('api/Usuarios/Crear',{
                        'idrol':me.idrol,
                        'nombre':me.nombre,
                        'tipo_documento': me.tipo_documento,
                        'num_documento':me.num_documento,
                        'direccion':me.direccion,
                        'telefono': me.telefono,
                        'email':me.email,
                    }).then(function(response){
                        me.close();
                        me.listar();
                        me.limpiar();                        
                    }).catch(function(error){
                        console.log(error);
                    });
                }
            },
            validar(){
                this.valida=0;
                this.validaMensaje=[];

                if (this.nombre.length<3 || this.nombre.length>100){
                    this.validaMensaje.push("El nombre debe tener más de 3 caracteres y menos de 100 caracteres.");
                }
                if (!this.idrol){
                    this.validaMensaje.push("Seleccione un rol.");
                }
                if (!this.tipo_documento){
                    this.validaMensaje.push("Seleccione un tipo documento.");
                }
                if (this.validaMensaje.length){
                    this.valida=1;
                }
                return this.valida;
            },
            activarDesactivarMostrar(accion,item){
                this.adModal=1;
                this.adNombre=item.nombre;
                this.adId=item.idusuario;                
                if (accion==1){
                    this.adAccion=1;
                }
                else if (accion==2){
                    this.adAccion=2;
                }
                else{
                    this.adModal=0;
                }
            },
            activarDesactivarCerrar(){
                this.adModal=0;
            },
            activar(){
                let me=this;
                axios.put('api/Usuarios/Activar/'+this.adId,{}).then(function(response){
                    me.adModal=0;
                    me.adAccion=0;
                    me.adNombre="";
                    me.adId="";
                    me.listar();                       
                }).catch(function(error){
                    console.log(error);
                });
            },
            desactivar(){
                let me=this;
                axios.put('api/Usuarios/Desactivar/'+this.adId,{}).then(function(response){
                    me.adModal=0;
                    me.adAccion=0;
                    me.adNombre="";
                    me.adId="";
                    me.listar();                       
                }).catch(function(error){
                    console.log(error);
                });
            }
        }        
    }
</script>
