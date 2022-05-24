import 'dart:convert';

const _MapaStilo=
[
    {
        " estilistas ": [
            {
                " matiz ": "#2c3e50" 
            } ,
            {
                " saturación ": 250 
            }
        ]
    } ,
    {
        " FeatureType ": "carretera" ,
        " tipoElemento ": "geometría" ,
        " estilistas ": [
            {
                " ligereza ": 50 
            } ,
            {
                " visibilidad ": "simplificado" 
            }
        ]
    } ,
    {
        " FeatureType ": "carretera" ,
        " tipoElemento ": "etiquetas" ,
        " estilistas ": [
            {
                " visibilidad ": "apagado" 
            }
        ]
    } 
];
final MapaStilo= jsonEncode(_MapaStilo);