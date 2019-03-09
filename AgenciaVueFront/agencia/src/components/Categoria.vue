<template>
    <v-layout align-start>
        <v-flex>
          <v-toolbar flat color="white">
              <v-toolbar-title>Categorias</v-toolbar-title>
              <v-divider
                  class="mx-2"
                  inset
                  vertical
              ></v-divider>
              <v-spacer></v-spacer>
              <v-text-field class="text-xs-center" v-model="search" append-icon="search" label="Busqueda" single-line hide-details></v-text-field>
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
                              <v-text-field v-model="nombre" label="Nombre"></v-text-field>
                          </v-flex>
                          <v-flex xs12 sm12 md12>
                              <v-text-field v-model="descripcion" label="Descripcion"></v-text-field>
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
                      <v-btn color="blue darken-1" flat @click="close">Cancelar</v-btn>
                      <v-btn color="blue darken-1" flat @click="guardar">Guardar</v-btn>
                  </v-card-actions>
                  </v-card>
              </v-dialog>
              </v-toolbar>
              <v-data-table
                :headers="headers"
                :items="categorias"
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
                      <v-icon
                          small
                          @click="deleteItem(props.item)"
                      >
                          delete
                      </v-icon>
                  </td>
                  <td>{{ props.item.nombre }}</td>
                  <td>{{ props.item.descripcion }}</td>                
                
              </template>
              <template slot="no-data">
                  <v-btn color="primary" @click="initialize">Resetear</v-btn>
              </template>
              </v-data-table>
        </v-flex>
    </v-layout>
</template>



<script>
  import axios from 'axios'
  export default {
    data: () => ({
        categorias:[],
        dialog: false,
        headers: [
          { text: 'Opciones', value: 'opciones', sortable: false },        
          { text: 'Nombre', value: 'nombre' },
          { text: 'Descripcion', value: 'descripcion', sortable: false }            
      ],
      search: '',
      editedIndex: -1,
      id:'',
      nombre:'',
      descripcion:'',
      valida:0,
      validaMensaje:[]
      
    }),

    computed: {
      formTitle () {
        return this.editedIndex === -1 ? 'Nueva Categoria' : 'Actualizando categoria'
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

    methods: {
      listar(){
          let me=this;
          axios.get('api/Categorias/Listar').then(function(response){
            //console.log(response);
            me.categorias=response.data;
          }).catch(function(error){
            console.log(error);
          });
        },
    
      editItem (item) {
        this.id = item.idCategoria;
        this.nombre=item.nombre;
        this.descripcion=item.descripcion;
        this.editedIndex=1;
        this.dialog = true
      },

      deleteItem (item) {
        const index = this.desserts.indexOf(item)
        confirm('Estas seguro de eliminar este producto?') && this.desserts.splice(index, 1)
      },

      close () {
        this.dialog = false    
        this.limpiar();
      },
      limpiar(){
          this.Idcategoria="";
          this.nombre="";
          this.descripcion="";     
          this.editedIndex=-1;     
      },
      guardar () {
        if(this.validar()){
          return;
        }  

        if (this.editedIndex > -1) {
            //codigo para editar
             let me = this;
            axios.put('api/Categorias/Actualizar',{
              'IdCategoria':me.id,
              'Nombre':me.nombre,
              'Descripcion':me.descripcion
          }).then(function(response){
            me.close();
            me.listar();          
            me.limpiar();
           }).catch(function(error){
              console.log(error);
          });
        } else {
          //codigo para guardar
          let me = this;
          axios.post('api/Categorias/Crear',{
              'Nombre':me.nombre,
              'Descripcion':me.descripcion
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
        this.valida = 0;
        this.validaMensaje = [];
        if(this.nombre.length < 10 || this.nombre.length > 50){
          this.validaMensaje.push("El nombre debe tener mas de 10 caracteres y menos de 50 caracteres")
        }
        if(this.validaMensaje.length){
          this.valida = 1;
        }
        return this.valida;
      }
    }
  }
</script>




