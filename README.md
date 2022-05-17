# IS1
Segunda práctica de IS1


## Links relevantes:
- [wiki sobre osmfilter](https://wiki.openstreetmap.org/wiki/Osmfilter)  
- Sudo de usar windows asi que usare el wsl tambien puede usarse el [escritorio de la upm](https://escritorio.upm.es/) aunque no se como de facil de usar sera por el tema de que el visual que tienen no soporta github y te tienes que instalar la ultima version cada vez que loggeas en el escritorio, aun asi configurarse un **wsl** no es nada muy loco. 
- [**Tutorial de pive random para extraer datos (MUY UTIL)**](https://journocode.com/en/tutorials/extracting-geodata-from-openstreetmap-with-osmfilter/)
 
### El setup que voy a usar yo
- WSL con ubuntu
- Visual con la extension de WSL para conectarme al subsistema
- 5L de codeina
 

## PUNTO 1
Descargarse [OpenStreetMap-datos para españita](https://download.geofabrik.de/europe/spain.html) igual hay que hacer un sudo npi

- [ ] Usar osmfilter para  extraer todos los nodos
- [ ] Filtrar los de dentro de Madrid (osmfilter)
- [ ] usar osmconvert para convertir los datos a CSV. 
    Deben guardarse: id, lat, long, nombre, horario (mas si queremos pero no queremos *de momento*)
- [x] Usar comandos linux para filtrar entradas sin nombre (si las hay)
    ```grep -P '\d{8,10}\s-\d.\d{7}\s\d\d.\d{7}.*\S*..*'```
- [ ] Crear una base de datos se puede hacer desde [la terminal](https://www.inmotionhosting.com/support/server/databases/create-a-mysql-database/)
- [ ] Cargar todos los elementos a una bd. 





