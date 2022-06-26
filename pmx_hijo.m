%AUTOR: Alejandro Meza Tudela
%NOMBRE_ARCHIVO: pmx_hijo1.m
%DESCRIPCION: Funcion que implementa cruzamiento PMX
%             para el segundo hijo

%PARAMS_ENTRADA: n: entero
%                i: entero
%                hijo: vector de elementos que es el hijo
%                progenitor: progenitor
%PARAMS_SALIDA: hijo modificado

function hijo =  pmx_hijo(n,i,hijo, progenitor) 
       %iteramos sobre todos los elementos
       for k=1:size(hijo,2)
                if hijo(n)== progenitor(k)
                   %si la posicion esta libre...
                   if hijo(k)==0
                      hijo(k)=progenitor(i);
                      break;
                   else %sino, llamar de nuevo al metodo
                       hijo = pmx_hijo(k,i, hijo,progenitor);
                   end 
                end
       end  
 end