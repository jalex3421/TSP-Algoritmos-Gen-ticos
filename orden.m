%AUTOR: Alejandro Meza Tudela
%NOMBRE_ARCHIVO: orden.m
%DESCRIPCION: Funcion que implementa cruzamiento basado en orden

%PARAMS_ENTRADA: totalEjemplos: numero de ciudades de la simulacion
%                progenitor1: progenitor
%                progenitor2: progenitor
%PARAMS_SALIDA: matriz, en la que cada columna son los hijos

function hijos = orden(totalEjemplos, progenitor1, progenitor2)
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

     %------------creacion del primer hijo------
     %Copiar elementos de progenitor que aun no han aparecido en orden

     %llenar posiciones de la derecha
     if int_sup ~= totalEjemplos
         for k = int_sup+1:totalEjemplos %recorrido hijo
             flag1 = 0;
             if (flag1~=totalEjemplos)
                 for j= int_sup+1:totalEjemplos%recorrido padre
                     %comprobar si elemento no esta en hijo
                     if((any(hijo_1(:)==progenitor1(j)))==0)
                        hijo_1(k)= progenitor1(j);
                        flag1 = j;
                        break;
                     end
                 end
             end
         end
     end


     %en caso que quedan posiciones por rellenar
     if (~isempty(find(hijo_1(int_sup+1:totalEjemplos)==0)))
         %actualizacion de indice superior
         res = find(hijo_1(int_sup+1:totalEjemplos)==0);
         i_up = res(1);
          for k = int_sup+i_up:totalEjemplos %recorrido hijo
             flag2 = 0;
             if (flag2~=int_sup)
                 for j= 1:int_sup%recorrido padre
                     %comprobar si elemento no esta en hijo
                     if((any(hijo_1(:)==progenitor1(j)))==0)
                        hijo_1(k)= progenitor1(j);
                        flag2 = j;
                        break;
                     end
                 end
             end
         end
     end


     %llenar posiciones izquierda
    if int_inf ~= 1
         for k = 1:int_inf %recorrido hijo
             for j= 1:totalEjemplos%recorrido padre
                 %comprobar si elemento no esta en hijo
                 if((any(hijo_1(:)==progenitor1(j)))==0)
                    hijo_1(k)= progenitor1(j);
                end
             end
         end
    end
    %--------------------fin de creacion del primer hijo---

    %--------------Creacion del segundo hijo----------------
    %llenar posiciones de la derecha
     if int_sup ~= totalEjemplos
         for k = int_sup+1:totalEjemplos %recorrido hijo
             flag11 = 0;
             if (flag11~=totalEjemplos)
                 for j= int_sup+1:totalEjemplos%recorrido padre
                     %comprobar si elemento no esta en hijo
                     if((any(hijo_2(:)==progenitor2(j)))==0)
                        %disp(j)
                        %disp(progenitor1(j))
                        hijo_2(k)= progenitor2(j);
                        flag11 = j;
                        break;
                     end
                 end
             end
         end
     end


     %en caso que quedan posiciones por rellenar
     if (~isempty(find(hijo_2(int_sup+1:totalEjemplos)==0)))
         %actualizacion de indice superior
         res = find(hijo_2(int_sup+1:totalEjemplos)==0);
         i_up = res(1);
          for k = int_sup+i_up:totalEjemplos %recorrido hijo
             flag22 = 0;
             if (flag22~=int_sup)
                 for j= 1:int_sup%recorrido padre
                     %comprobar si elemento no esta en hijo
                     if((any(hijo_2(:)==progenitor2(j)))==0)
                        hijo_2(k)= progenitor2(j);
                        flag22 = j;
                        break;
                     end
                 end
             end
         end
     end

     %llenar posiciones izquierda
    if int_inf ~= 1
         for k = 1:int_inf %recorrido hijo
             for j= 1:totalEjemplos%recorrido padre
                 %comprobar si elemento no esta en hijo
                 if((any(hijo_2(:)==progenitor2(j)))==0)
                    hijo_2(k)= progenitor2(j);
                end
             end
         end
    end
    %concatenacion de hijos en matriz
    hijos = [hijo_1(:),hijo_2(:)];

end