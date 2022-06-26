%AUTOR: Alejandro Meza Tudela
%NOMBRE_ARCHIVO: seleccionElitista.m
%DESCRIPCION: Funcion que devuelve la nueva poblacion

%PARAMS_ENTRADA: poblacion: poblacion de la iteracion actual
%                hijos: hijos creados en la iteracion, pueden haber mutado
%                ciudades: matriz que representa el costo entre ciudades
%                numero Ciudades: numero de ciudades del  algoritmo
%                numero Poblacion: entero que representa numero de
%                poblacion
%PARAMS_SALIDA: poblacion

function poblacion = seleccionElitista(poblacion,hijos,ciudades,numeroCiudades,numeroPoblacion)
    %poblacion nueva: se agregan los hijos a la poblacion actual
    poblacion_nueva = [poblacion;hijos];
    %obtener el fitness de la nueva poblacion
    nuevo_fitness = fitness(ciudades, poblacion_nueva, numeroCiudades);
     %inversa: pues a mayor valor de fitness, peor (mayor distancia)
    nuevo_fitness = 1./nuevo_fitness;
    %obtener los indices de los mejores fitness ordenados
    %nos quedamos con los (numero_ciudades) mejores
    %ordenados de mayor a menor...
    [~,indices] = sort(nuevo_fitness);
    indices = flip(indices);
    poblacion = poblacion_nueva(indices(1:numeroPoblacion),:);
end