%AUTOR: Alejandro Meza Tudela
%NOMBRE_ARCHIVO: mejorFitnessIteracio.m
%DESCRIPCION: Funcion que devuelve el mejor fitness de la iteracion 

%PARAMS_ENTRADA: poblacion: poblacion de la iteracion actual
%                ciudades: matriz que representa el costo entre ciudades
%                numero Ciudades: numero de ciudades del  algoritmo
%PARAMS_SALIDA: fitness de ejemplo mas prometedor

function sol = mejorFitnessIteracion(poblacion,ciudades,numeroCiudades)
    %obtener el fitness de la nueva poblacion
    nuevo_fitness = fitness(ciudades, poblacion, numeroCiudades);
     %inversa: pues a mayor valor de fitness, peor (mayor distancia)
    nuevo_fitness = 1./nuevo_fitness;
    %obtener los indices de los mejores fitness ordenados
    %nos quedamos con los (numero_ciudades) mejores
    %ordenados de mayor a menor...
    [~,indices] = sort(nuevo_fitness);
    indices = flip(indices);
    sol = nuevo_fitness(indices(1));
end