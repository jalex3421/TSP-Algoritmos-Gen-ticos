%AUTOR: Alejandro Meza Tudela
%NOMBRE_ARCHIVO: generaMatriz.m
%DESCRIPCION: Funcion que devuelve una matriz de nxn representando
%             las distancias entre n ciudades. La representacion
%             escogida ha sido la del camino. 

%PARAMS_ENTRADA: N: entero que representa el numero de ciudades
%PARAMS_SALIDA: matriz de enteros nxn
function matriz = generaMatriz(N)
    % Los valores de la diagonal
    d = round(100*(0.1 + (1-0.1).*rand(N,1)));
    % Los valores de la matriz superior
    t = round(triu(bsxfun(@max,d,d.').*rand(N),1));
    % Poner en una matriz traingular
    M = diag(d)+t+t.'; 

    %Poner ceros en la diagonal: distancia con uno mismo = 0
    for i=1:N
        for j=1:N
            if i==j
                M(i,j)=0;
            end
        end
    end
    matriz = M;
    
end