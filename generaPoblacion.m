%AUTOR: Alejandro Meza Tudela
%NOMBRE_ARCHIVO: generaPoblacion.m
%DESCRIPCION: Funcion que devuelve una matriz de nxn representando
%             las posibles soluciones, que seran la  poblacion

%PARAMS_ENTRADA: numeroCiudades: entero que representa el numero de ciudades
%PARAMS_SALIDA: matriz que contiene algunas combinaciones 

function poblacion_a_devolver = generaPoblacion(numeroCiudades, numeroPoblacion)
    %se crea matriz de poblacion
    poblacion = zeros(numeroPoblacion,numeroCiudades);
    %Se asigna una permutacion a cada fila de la matriz
    for filas=1:size(poblacion,1)
        poblacion(filas,:) = randperm(numeroCiudades);
    end
    poblacion_a_devolver= poblacion;
    
end