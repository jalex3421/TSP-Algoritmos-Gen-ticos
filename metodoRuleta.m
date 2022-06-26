%AUTOR: Alejandro Meza Tudela
%NOMBRE_ARCHIVO: metodoRuleta.m
%DESCRIPCION: Funcion que implemententa el metodo de la ruleta

%PARAMS_ENTRADA: vectorFitness: vector que contiene el fitness
%                de los individuos
%                numero padres: numero de padres a elegir
%PARAMS_SALIDA: vector con la posicion de los padres 

function posicionesPadres = metodoRuleta(vectorFitness, numeroPadres)
    totalFitness = sum(vectorFitness);
    probabilidadesPoblacion = (vectorFitness/totalFitness);
    %Por la semantica del problema, los elementos con mayor fitness
    %son los peores (mayor distancia), luego se calculara el valor
    %inverso para todos los elementos
    
    %Factor que normalizara las inversas de las probabilidades
    t = sum(1-probabilidadesPoblacion);
    probabilidadesPoblacion_definitivas = (1-probabilidadesPoblacion)./t;

    %array con posiciones de ejemplos: cada pos asocia un fitness
    totalPosiciones = size(vectorFitness,2);
    posiciones = 1:totalPosiciones;
    N = numeroPadres; 
    posicionesPadres = posiciones( sum( bsxfun(@ge, rand(N,1), cumsum(probabilidadesPoblacion_definitivas./sum(probabilidadesPoblacion_definitivas))), 2) + 1 );

end