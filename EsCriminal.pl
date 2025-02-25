nacionalidad_de(coronel_west, estados_unidos).
enemigo_de(corea_del_sur, estados_unidos).
vender_armas_a(coronel_west, corea_del_sur).

criminal(X) :- 
    nacionalidad_de(X, estados_unidos),
    vender_armas_a(X, Pais),
    enemigo_de(Pais, estados_unidos).
