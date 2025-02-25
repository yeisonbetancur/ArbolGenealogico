%definicion de hechos. 
%relaciones directas

padre_de(abraham, homero).
padre_de(abraham, herbert).
padre_de(clancy, marge).
padre_de(clancy, patty).
padre_de(clancy, selma).
padre_de(homero, bart).
padre_de(homero, lisa).
padre_de(homero, maggie).


madre_de(mona, homero).
madre_de(jacqueline, marge).
madre_de(jacqueline, patty).
madre_de(jacqueline, selma).
madre_de(marge, bart).
madre_de(marge, lisa).
madre_de(marge, maggie).

madre_de(selma, ling).

% Definición de género
es_hombre(abraham).
es_hombre(homero).
es_hombre(herbert).
es_hombre(clancy).
es_hombre(bart).

es_mujer(mona).
es_mujer(jacqueline).
es_mujer(marge).
es_mujer(patty).
es_mujer(selma).
es_mujer(lisa).
es_mujer(maggie).
es_mujer(ling).

% definicion reglas. 
% relaciones de mas de una generacion 

abuelo_de(X,Y) :- padre_de(X,C), (padre_de(C,Y); madre_de(C,Y)).
abuela_de(X,Y) :- madre_de(X,C), (madre_de(C,Y); padre_de(C, Y)).
tio_de(X,Y) :- es_hombre(X),(padre_de(C, X), padre_de(C,Z), padre_de(Z, Y)), not(padre_de(X,Y)).
tia_de(X,Y) :- es_mujer(X),(madre_de(S, X), madre_de(S,P), madre_de(P, Y)), not(madre_de(X,Y)).

hermano_de(X,Y) :- es_hombre(X), (padre_de(C,X), padre_de(C,Y);madre_de(C,X), madre_de(C,Y)),X\=Y.
hermana_de(X,Y) :- es_mujer(X), (padre_de(C,X), padre_de(C,Y);madre_de(C,X), madre_de(C,Y)),X\=Y.

primo_de(X,Y) :- es_hombre(X),(padre_de(P1,X);madre_de(P1,X)),(padre_de(P2,Y);madre_de(P2,Y)),(hermano_de(P1,P2);hermana_de(P1,P2)),X\=Y.
prima_de(X,Y) :- es_mujer(X),(padre_de(P1,X);madre_de(P1,X)),(padre_de(P2,Y);madre_de(P2,Y)),(hermano_de(P1,P2);hermana_de(P1,P2)),X\=Y.
