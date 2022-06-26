%AUTOR: Alejandro Meza Tudela
%NOMBRE_ARCHIVO: main.m
%DESCRIPCION: Programa principal, que simula un algoritmo genetico 
%FECHA: 20/04/2021

%-----------------------------PARAMETROS-----------------------------
numeroCiudades = 10;
numeroPoblacion = 10;
%numero de progenitores: numero multiplo de 2
numeroProgenitores = 4;
probabilidadCruzamiento = 0.8;
probabilidadMutacion = 0.3;
numeroIteraciones = 1000;

cruzamiento_pmx_flag = 1; %variable que indicara si se hara este cruzamiento
metodo_ruleta_flag = 0; %variable que indicara si se realiza esta seleccion
%-------------------------------------------------------------------

%generacion de la matriz de costo entre las ciudades
ciudades = generaMatriz(numeroCiudades);

%generacion de la poblacion
poblacion = generaPoblacion(numeroCiudades,numeroPoblacion);
poblacion_original = poblacion;

%Evaluacion de la poblacion mediante la funcion fitness
vectorFitness = fitness(ciudades, poblacion, numeroCiudades);

%iterador
l=1; 

%variable que guardara el mejor fitness de las iteraciones
mejorFitnessIter = 0; 

%variable donde se guardara el fitness de cada iteracion
vectorFitnessTotalIteraciones = zeros(numeroIteraciones,1);

%mientras no condicion de parada iteramos el algoritmo genetico
while(l<numeroIteraciones)
    %1.----------------------SELECCION DE PROGENITORES----------------------
    if metodo_ruleta_flag ==1
        %1.1 metodo de la ruleta
        posicionesProgenitores = metodoRuleta(vectorFitness,numeroProgenitores);
        totalEjemplos = size(poblacion,1);
    else
        %1.2 metodo del torneo
        totalEjemplos = size(poblacion,1);
        k = randi([2 totalEjemplos]); %numero de participantes
        posicionesProgenitores = zeros(numeroProgenitores,1);
        %itereamos mientras los ejemplos ganadores sean iguales
        %while(length(posicionesProgenitores) ~= length(unique(posicionesProgenitores))) 
        posicionesProgenitores = metodoTorneo(vectorFitness,numeroProgenitores,k);
        %end
    end

    %-----------Creacion una matriz con tantas filas como progenitores---------
    %progenitores: tantas filas como progenitores, y columnas como ciudades
    progenitores = zeros(numeroProgenitores,numeroCiudades);
    %rellenamos la matriz con los progenitores
    for j=1:numeroProgenitores
        progenitores(j,:) = poblacion(posicionesProgenitores(j),:);
    end
    %-------------------------------------------------------------------------



    %2---------------------------CRUZAMIENTO----------------------------------

    hijos = zeros(numeroProgenitores,numeroCiudades);
    
    if cruzamiento_pmx_flag ==1
        %2.1 cruzamiento PMX
        %en caso que sea menor que probabilidad de cruazamiento, realizarla...
        if rand<= probabilidadCruzamiento
            %disp('Se ha producido cruzamiento')
            for i = 1:2:numeroProgenitores
               hijos_sol = pmx(numeroCiudades, progenitores(i,:), progenitores(i+1,:))';
               hijos(i,:) = hijos_sol(1,:);
               hijos(i+1,:)= hijos_sol(2,:);
            end
        else
            %sino, copiar los progenitores directamente en los hijos
            %disp('los hijos son igual que padres')
            for k = 1:numeroProgenitores
                hijos(k,:) = progenitores(k,:);
            end
        end
    else
        %2.2 cruzamiento basado en orden
        %en caso que sea menor que probabilidad de cruazamiento, realizarla...
        if rand<= probabilidadCruzamiento
            %disp('Se ha producido cruzamiento')
            for i = 1:2:numeroProgenitores
               hijos_sol = orden(numeroCiudades, progenitores(i,:), progenitores(i+1,:))';
               hijos(i,:) = hijos_sol(1,:);
               hijos(i+1,:)= hijos_sol(2,:);
            end
        else
            %sino, copiar los progenitores directamente en los hijos
            %disp('los hijos son igual que padres')
            for k = 1:numeroProgenitores
                hijos(k,:) = progenitores(k,:);
            end
        end
    end
    %-------------------------------------------------------------------------


    %3------------------------------MUTACION-----------------------------------
    if rand<= probabilidadMutacion
        numeroHijos = size(hijos,1);
        for h = 1:numeroHijos
            hijos(h,:) = mutacion(numeroCiudades,hijos(h,:));
        end
    end

    %4.---------------SELECCION INDIVIDUOS SIGUIENTE GENERACION-------------
    %Se ha implementado la seleccion elitista
    poblacion = seleccionElitista(poblacion,hijos,ciudades,numeroCiudades,numeroPoblacion);
    res = mejorFitnessIteracion(poblacion,ciudades,numeroCiudades);
    vectorFitnessTotalIteraciones(l) = res;
    
    if(res>mejorFitnessIter)
        mejorIndividuoIter = mejorIndividuoIteracion(poblacion,ciudades,numeroCiudades);
        mejorFitnessIter = res;
    end
    
    %Evaluacion de la nueva poblacion mediante la funcion fitness
    vectorFitness = fitness(ciudades, poblacion, numeroCiudades);
    l=l+1;
end

disp('---------------------------------------------------')
disp('La solucion ofrecida por el algoritmo genetico es: ')
disp(mejorIndividuoIter);
disp('El mejor fitness es de: ');
disp(mejorFitnessIter);
disp('El fitness medio , tras el pasar de las iteraciones:')
disp(mean(mejorFitnessIter));
disp('---------------------------------------------------')
