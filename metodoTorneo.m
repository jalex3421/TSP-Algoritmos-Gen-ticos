%AUTOR: Alejandro Meza Tudela
%NOMBRE_ARCHIVO: metodoTorneo.m
%DESCRIPCION: Funcion que implemententa el metodo del torneo

%PARAMS_ENTRADA: vectorFitness: vector que contiene el fitness
%                de los individuos
%                numero padres: numero de padres a elegir
%                k: numero de concursantes en los torneos
%PARAMS_SALIDA: vector con la posicion de los padres 

function posicionesProgenitores = metodoTorneo(vectorFitness, numeroProgenitores, k)
    %Inversa de fitness, puesto que los que tienen mas
    % son las soluciones asociadas a un mayor coste
    vectorFitness = 1./vectorFitness;
    %array con posiciones de ejemplos: cada pos asocia un fitness
    totalPosiciones = size(vectorFitness,2);

    ganadores = zeros(numeroProgenitores,1);
    
    %inicializacion
    ganadores(ganadores==0)=-10000;

    %numero de veces que se realiza el torneo
    for p=1:numeroProgenitores 
     for i=1:k
        indice = randi([1,totalPosiciones]); 
        individuo = vectorFitness(indice);
        if (individuo > ganadores(p))
            ganadores(p) = individuo;
        end
     end    
    end
    
    %hallar el indice de ganadores y devolver
    for pr = 1:numeroProgenitores
       pos = find(vectorFitness==ganadores(pr)); 
       %en caso que haya mas de una pos con mismo fitness
       if size(pos,2)>1
          pos = pos(1);
       end
       ganadores(pr) = pos;
    end
    posicionesProgenitores = ganadores;

end