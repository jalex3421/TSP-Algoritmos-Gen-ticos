%AUTOR: Alejandro Meza Tudela
%NOMBRE_ARCHIVO: mutacion.m
%DESCRIPCION: funcion que se encarga de implementar la mutacion por
%insercion
%PARAMS_ENTRADA: totalEjemplos: numero de ciudades de la simulacion
%                hijo: hijo a ser mutado
%PARAMS_SALIDA: hijo mutado


function hijo_mutado = mutacion(totalEjemplos,hijo)

    %inicializacion de las ciudades elegidas
    ciudad_elegida=1; %ciudad elegida en el tour
    ciudad_insercion = 1; %ciudad elegida: donde insertar despues de estas

    while(ciudad_elegida==ciudad_insercion) 
        ciudad_elegida =  randi(totalEjemplos);
        ciudad_insercion = randi(totalEjemplos);
    end

    %una vez obtenidas las ciudades, se inserta la ciudad elegida despues
    %de la ciudad elegida como punto de insercion

    %eliminar ciudad elegida de hijo
    hijo( hijo == ciudad_elegida ) = [];
    %insertar ciudad elegida en posicion de insercion
    posicion_insercion = find(hijo==ciudad_insercion);
    if (posicion_insercion == totalEjemplos-1)
        hijo = [hijo(1:posicion_insercion) ciudad_elegida];
    else
        hijo = [hijo(1:posicion_insercion) ciudad_elegida hijo(posicion_insercion+1:end)];
    end
    hijo_mutado = hijo;
end