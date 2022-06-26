%AUTOR: Alejandro Meza Tudela
%NOMBRE_ARCHIVO: pmx.m
%DESCRIPCION: Funcion que implementa cruzamiento PMX

%PARAMS_ENTRADA: totalEjemplos: numero de ciudades de la simulacion
%                progenitor1: progenitor
%                progenitor2: progenitor
%PARAMS_SALIDA: matriz, en la que cada columna son los hijos

function hijos = pmx(totalEjemplos, progenitor1, progenitor2)
    %bucle que se encarga de crear los intervalos
    for k=1:100
            %intervalo inferior
            int_inf=randi(totalEjemplos);
            incremento= randi(totalEjemplos);
            %intervalo superior
            int_sup=int_inf+incremento;
            if (int_sup>totalEjemplos)
                continue;
            else
                break;
            end
    end

    %inicializar hijos
    hijo_1=zeros(1,totalEjemplos);
    hijo_2=zeros(1,totalEjemplos);

    %copiar los elementos iguales
    for i=int_inf:int_sup
            hijo_1(i)=progenitor2(i);
            hijo_2(i)=progenitor1(i);
    end

    %-----------------creacion del primer hijo----------------
     for i=int_inf:int_sup
        cont=0;
        for j= int_inf: int_sup
            %checkeamos si los elementos son iguales con hijo
            %se ve si hay elementos faltantes
            if(progenitor1(i)== hijo_1(j))
                cont = cont+1;
                break;
             end           
        end
         %en caso que haya un elemento del hijo que falta, realizamos
         %las operaciones necesarias
         if cont==0
            hijo_1= pmx_hijo(i,i,hijo_1,progenitor1);              
         end    
     end
    %terminar de poner elementos en el primer hijo
    for k=1:totalEjemplos
        %rellenamos posiciones que son cero
            if hijo_1(k)==0
                hijo_1(k)=progenitor1(k);
            end       
    end
    %--------------fin de creacion del primer hijo-----------

    %-----------------creacion del segundo hijo----------------
     for i=int_inf:int_sup
            cont2=0;
            for j=int_inf:int_sup
                if(progenitor2(i)==hijo_2(j))
                    cont2=cont2+1;
                    break;
                end           
            end
            if (cont2==0)
             hijo_2= pmx_hijo(i,i,hijo_2,progenitor2);                     
            end    
     end
    %terminar de poner elementos en el segundo hijo
    for k=1:totalEjemplos
        %rellenamos posiciones que son cero
            if hijo_2(k)==0
                hijo_2(k)=progenitor2(k);
            end       
    end
    %--------------fin de creacion del segundo hijo-----------
    
    %concatenacion de hijos en matriz
    hijos = [hijo_1(:),hijo_2(:)];
    
end