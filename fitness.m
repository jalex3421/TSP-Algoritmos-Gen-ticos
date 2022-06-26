%AUTOR: Alejandro Meza Tudela
%NOMBRE_ARCHIVO: fitness.m
%DESCRIPCION: Funcion que devuelve un vector con el fitness
%             de cada individuo

%PARAMS_ENTRADA: ciudades: matriz con distancia entre ciudades
%                poblacion: poblacion a usar en algoritmo
%                numero Ciudades: numero de ciudades del  algoritmo
%PARAMS_SALIDA: vector con el valor de fitness para cada individuo
function vectorFitness = fitness(ciudades,poblacion,numeroCiudades)

    ejemplos = size(poblacion,1);
    distancias = zeros(1,ejemplos);

    for i=1:ejemplos %iteracion por numero de ejemplos
        for j=1:numeroCiudades-1 %iteracion por columnas
            %actualizacion del costo del individuo
            distancias(i) = distancias(i)+ ( ciudades(poblacion(i,j),poblacion(i,j+1)));
        end
    end
    vectorFitness = distancias;

end