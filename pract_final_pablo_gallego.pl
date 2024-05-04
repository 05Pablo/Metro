% =====================================================================
% PRACTICA FINAL PROLOG - Logica Matematica - CUNEF Universidad
% Sistema experto del servicio de informacion del metro de Madrid
% Alumno: Pablo Gallego Garcia
% =====================================================================

% ---------------------------------------------------------------------
% EJERCICIO 1
% ---------------------------------------------------------------------

% --- Usuarios registrados y tarifa cargada ---------------------------
usr_tarifa(mario, global).
usr_tarifa(eva, central).
usr_tarifa(lucas, central).
usr_tarifa(maria, global).

% --- Rutas disponibles -----------------------------------------------
ruta(amarilla).
ruta(roja).
ruta(naranja).
ruta(azul).

% --- Paradas de cada ruta: parada(Ruta, Parada) ----------------------
% Ruta amarilla
parada(amarilla, moncloa).
parada(amarilla, plaza_de_espana).
parada(amarilla, callao).
parada(amarilla, sol).
parada(amarilla, embajadores).
parada(amarilla, legazpi).
parada(amarilla, villaverde_alto).

% Ruta roja
parada(roja, cuatro_caminos).
parada(roja, canal).
parada(roja, quevedo).
parada(roja, sol).
parada(roja, principe_de_vergara).
parada(roja, goya).
parada(roja, ventas).

% Ruta naranja
parada(naranja, pitis).
parada(naranja, francos_rodriguez).
parada(naranja, canal).
parada(naranja, alonso_cano).
parada(naranja, cartagena).
parada(naranja, pueblo_nuevo).

% Ruta azul
parada(azul, cuatro_caminos).
parada(azul, iglesia).
parada(azul, bilbao).
parada(azul, gran_via).
parada(azul, sol).
parada(azul, atocha).

% --- Areas: area(Parada, Area) ---------------------------------------
% Area A
area(plaza_de_espana, a).
area(callao, a).
area(sol, a).
area(iglesia, a).
area(bilbao, a).
area(gran_via, a).

% Area B (el resto de paradas)
area(moncloa, b).
area(embajadores, b).
area(principe_de_vergara, b).
area(goya, b).
area(ventas, b).
area(pitis, b).
area(francos_rodriguez, b).
area(canal, b).
area(alonso_cano, b).
area(cartagena, b).
area(pueblo_nuevo, b).
area(cuatro_caminos, b).
area(atocha, b).
area(quevedo, b).
area(legazpi, b).
area(villaverde_alto, b).

% --- Tarifas validas por area: tarifa_area(Tarifa, Area) --------------
% Area A: tarifa central o global.  Area B: solo tarifa global.
tarifa_area(central, a).
tarifa_area(global, a).
tarifa_area(global, b).

% --- Reglas ----------------------------------------------------------

% Una ruta R1 tiene transbordo con R2 si son distintas y tienen
% al menos una parada en comun.
transbordo(R1, R2) :-
    R1 \= R2,
    parada(R1, P),
    parada(R2, P).

% Parada concreta en la que se hace el transbordo entre dos rutas.
transbordo_en(R1, R2, P) :-
    R1 \= R2,
    parada(R1, P),
    parada(R2, P).

% Se puede llegar de X a Y si estan en la misma ruta.
llegar(X, Y) :-
    parada(R, X),
    parada(R, Y),
    X \= Y.

% Se puede llegar de X a Y si estan en rutas distintas entre las que
% existe transbordo.
llegar(X, Y) :-
    parada(R1, X),
    parada(R2, Y),
    R1 \= R2,
    transbordo(R1, R2).

% Un usuario solo puede usar una parada si su tarifa es valida para
% el area en la que esta la parada.
puede_usar(Usuario, Parada) :-
    usr_tarifa(Usuario, Tarifa),
    area(Parada, Area),
    tarifa_area(Tarifa, Area).

% Un usuario puede viajar de Y a Z si puede usar ambas paradas con su
% tarifa y ademas se puede llegar de Y a Z.
puede_viajar(Usuario, Y, Z) :-
    puede_usar(Usuario, Y),
    puede_usar(Usuario, Z),
    llegar(Y, Z).



%--- Cuestiones -------------------------------------------------------
% Pregunta 1: Existe un transbordo entre la ruta roja y la azul?
% Hacer ?- transbordo(roja, azul).
% Respuesta True

% Pregunta 2: Eva y Mario necesitan ir de Sol a Cuatro Caminos. Pueden ambos? Por que?
% Hacer ?- puede_viajar(mario, sol, cuatro_caminos).
% Respuesta True
% Hacer ?- puede_viajar(eva, sol, cuatro_caminos).
% Respuesta False

% Pregunta 3: Lucas necesita saber que parada de la linea roja hace transbordo con la linea amarilla.
% Hacer ?- transbordo_en(roja, amarilla, P).
% Respuesta P = sol.
