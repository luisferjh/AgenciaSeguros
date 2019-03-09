<template>
    <v-layout align-start>
        <v-flex>
            <v-toolbar flat color="white">
                <v-toolbar-title>Clientes</v-toolbar-title>
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
                                <v-flex xs12 sm12 md12>
                                    <v-text-field v-model="nombre" label="Nombre">
                                    </v-text-field>
                                </v-flex>                        
                                <v-flex xs12 sm12 md12>
                                    <v-select v-model="tipoDocumento"
                                    :items="documentos" label="Tipo Documento">
                                    </v-select>
                                </v-flex>
                                <v-flex xs12 sm12 md12>
                                    <v-text-field v-model="numDocumento" label="Número Documento">
                                    </v-text-field>
                                </v-flex>
                                <v-flex xs12 sm12 md12>
                                    <v-text-field v-model="fechaNacimiento" label="Fecha de nacimiento">
                                    </v-text-field>
                                </v-flex>
                                <v-flex xs12 sm12 md12>
                                    <v-text-field v-model="direccion" label="Dirección">
                                    </v-text-field>
                                </v-flex>
                                <v-flex xs12 sm12 md12>
                                    <v-text-field v-model="telefono" label="Teléfono">
                                    </v-text-field>
                                </v-flex>
                                <v-flex xs12 sm12 md12>
                                    <v-text-field v-model="email" label="Email">
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
                </v-toolbar>
            <v-data-table
                :headers="headers"
                :items="clientes"
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
                    </td>
                    <td>{{ props.item.nombre }}</td>      
                    <td>{{ props.item.tipoCliente }}</td>            
                    <td>{{ props.item.tipoDocumento }}</td>
                    <td>{{ props.item.numDocumento }}</td>
                    <td>{{ props.item.fechaNacimiento }}</td>
                    <td>{{ props.item.telefono }}</td>
                    <td>{{ props.item.direccion }}</td>
                    <td>{{ props.item.email }}</td>

                </template>
                <template slot="no-data">
                <v-btn color="primary" @click="listar">Resetear</v-btn>
                </template>
            </v-data-table>
        </v-flex>
    </v-layout>
</template>
<script>
    import axios from 'axios'
    export default {
        data(){
            return {
                clientes:[],                
                dialog: false,
                headers: [
                    { text: 'Opciones', value: 'opciones', sortable: false },
                    { text: 'Nombre', value: 'nombre' },      
                    { text: 'Tipo Persona', value: 'tipoCliente' },
                    { text: 'Tipo Documento', value: 'tipoDocumento' },
                    { text: 'Número Documento', value: 'numDocumento', sortable: false  },
                    { text: 'Fecha nacimiento', value: 'fechaNacimiento' },
                    { text: 'Dirección', value: 'direccion', sortable: false  },
                    { text: 'Teléfono', value: 'telefono', sortable: false  },
                    { text: 'Email', value: 'email', sortable: false  },
                                
                ],
                search: '',
                editedIndex: -1,
                id: '',             
                nombre:'',
                tipoDocumento: '',
                documentos: ['DNI','RUC','PASAPORTE','CEDULA'],
                numDocumento: '',
                fechaNacimiento:'',
                direccion: '',
                telefono: '',
                email: '',               
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
                return this.editedIndex === -1 ? 'Nuevo cliente' : 'Actualizar cliente'
            }
        },

        watch: {
            dialog (val) {
            val || this.close()
            }
        },

        created () {
            this.listar();
        },
        methods:{
            listar(){
                let me=this;
                axios.get('api/Clientes/Listar').then(function(response){
                    //console.log(response);
                    me.clientes=response.data;
                }).catch(function(error){
                    console.log(error);
                });
            },

            editItem (item) {
                this.id=item.idCliente;  
                this.tipoCliente = item.tipoCliente;
                this.nombre=item.nombre;
                this.tipoDocumento=item.tipoDocumento;
                this.numDocumento=item.numDocumento;
                this.fechaNacimiento=item.fechaNacimiento;
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
                this.nombre="";
                this.tipoDocumento="";
                this.numDocumento="";
                this.fechaNacimiento = "";
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
                    axios.put('api/Clientes/Actualizar',{
                        'IdCliente':me.id,
                        'TipoCliente':me.tipoCliente,                       
                        'Nombre':me.nombre,
                        'TipoDocumento': me.tipoDocumento,
                        'NumDocumento':me.numDocumento,
                        'FechaNacimiento':me.fechaNacimiento,
                        'Direccion':me.direccion,
                        'Telefono': me.telefono,
                        'Email':me.email                                     
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
                    axios.post('api/Clientes/Crear',{
                        'TipoCliente':me.tipoCliente,                       
                        'Nombre':me.nombre,
                        'TipoDocumento': me.tipoDocumento,
                        'NumDocumento':me.numDocumento,
                        'FechaNacimiento':me.fechaNacimiento,
                        'Direccion':me.direccion,
                        'Telefono': me.telefono,
                        'Email':me.email
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

                if (this.nombre.length<10 || this.nombre.length>100){
                    this.validaMensaje.push("El nombre debe tener más de 3 caracteres y menos de 100 caracteres.");
                }
                if (!this.tipoDocumento){
                    this.validaMensaje.push("Seleccione un tipo documento.");
                }
                if (this.validaMensaje.length){
                    this.valida=1;
                }
                return this.valida;
            }
        }        
    }
</script>
