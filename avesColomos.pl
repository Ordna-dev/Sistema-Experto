:- dynamic ave/1.

ave(garceta_pie_dorado) :-
    ojos(amarillo),
    loras(amarillo),
    pico(negro),
    cuerpo(blanco),
    espalda(blanco),
    tarsos(negro),
    patas(amarillo),
    alas(blanco),
    vientre(blanco),
    (   come(peces)
    ;   come(insectos)
    ;   come(crustaceos)
    ).
ave(garceta_verde) :-
    ojos(amarillo),
    garganta(rojo),
    pico(negro),
    pico(amarillo),
    espalda(verde),
    (   tarsos(amarillo)
    ;   tarsos(naranja)
    ),
    (   patas(amarillo)
    ;   tarsos(naranja)
    ),
    alas(verde_oscuro),
    pecho(rojo),
    vientre(gris),
    zona_malar(blanco),
    corona(verde_oscuro),
    cola(verde_oscuro),
    (   come(peces)
    ;   come(ranas)
    ;   come(insectos)
    ).
ave(pedrete_corona_negra) :-
    ojos(rojo),
    garganta(blanco),
    pico(negro),
    espalda(negro),
    tarsos(negro),
    patas(amarillo),
    alas(gris),
    pecho(gris),
    vientre(gris),
    corona(negra),
    cola(gris),
    come(peces).
ave(gavilan_pecho_rufo) :-
    ojos(rojo),
    pico(gris_oscuro),
    cere(amarillo),
    auriculares(gris),
    espalda(gris),
    tarsos(amarillo),
    patas(amarillo),
    alas(gris),
    pecho(blanco),
    (   pecho(naranja)
    ;   pecho(rojo)
    ),
    vientre(blanco),
    (   vientre(naranja)
    ;   vientre(rojo)
    ),
    cola(gris),
    cola(negro),
    cobertoras_inferiores_cola(blanco),
    (   come(aves)
    ;   come(roedores)
    ).
ave(cernicalo_americano) :-
    garganta(blanco),
    pico(gris_oscuro),
    cere(amarillo),
    auriculares(negro),
    espalda(negro),
    espalda(rojo),
    (   alas(azul)
    ;   alas(gris)
    ),
    alas(negro),
    pecho(naranja_deslavado),
    vientre(blanco),
    vientre(negro),
    zona_malar(negro),
    (   corona(azul)
    ;   corona(gris)
    ),
    corona(rojo),
    cola(rojo),
    (   come(insectos)
    ;   come(mamiferos_pequenios)
    ;   come(aves)
    ;   come(reptiles)
    ).
ave(paloma_domestica) :-
    ojos(rojo),
    (   tarsos(naranja)
    ;   tarsos(rojo)
    ),
    (   patas(naranja)
    ;   patas(rojo)
    ),
    alas(gris_claro),
    cola(gris_claro),
    (   come(semillas)
    ;   come(insectos)
    ).
ave(perico_frente_naranja) :-
    ojos(amarillo),
    (   garganta(amarillo)
    ;   garganta(cafe)
    ),
    (   pico(amarillo_claro)
    ;   pico(gris_claro)
    ),
    auriculares(verde),
    espalda(verde),
    alas(verde),
    (   pecho(amarillo)
    ;   pecho(cafe)
    ),
    (   vientre(verde)
    ;   vientre(amarillo)
    ),
    (   come(insectos)
    ;   come(flores)
    ;   come(semillas)
    ).
ave(loro_corona_lila) :-
    ojos(amarillo),
    (   pico(amarillo_claro)
    ;   pico(ocre_claro)
    ),
    cuerpo(verde),
    espalda(blanco),
    espalda(negro),
    alas(verde),
    pecho(verde),
    vientre(verde),
    (   corona(azul)
    ;   corona(lila)
    ),
    cola(negro),
    come(semillas).
ave(garza_ganadera) :-
    ojos(amarillos),
    garganta(desconocido),
    loras(amarillentas),
    patas(negras),
    alas(desconocido),
    cabeza(desconocido),
    cere(desconocido),
    auriculares(desconocido),
    corona(anaranjada),
    cobertoras_inferiores_cola(desconocido),
    pico(anaranjado),
    cuerpo(blanco),
    vientre(desconocido),
    pecho(desconocido),
    zona_malar(desconocido),
    cola(desconocido),
    tarsos(negros),
    espalda(anaranjada),
    come(peces).
ave(zopilote_aura) :-
    ojos(negros),
    garganta(desconocido),
    loras(desconocido),
    patas(desconocido),
    alas(grises),
    cabeza(roja),
    cere(desconocido),
    auriculares(desconocido),
    corona(desconocido),
    cobertoras_inferiores_cola(desconocido),
    pico(blanco),
    cuerpo(cafe),
    vientre(desconocido),
    pecho(desconocido),
    zona_malar(desconocido),
    cola(gris),
    tarsos(desconocido),
    espalda(desconocido),
    come('carroña').
ave(end_of_file) :-
    ojos(end_of_file),
    garganta(end_of_file),
    loras(end_of_file),
    patas(end_of_file),
    alas(end_of_file),
    cabeza(end_of_file),
    cere(end_of_file),
    auriculares(end_of_file),
    corona(end_of_file),
    cobertoras_inferiores_cola(end_of_file),
    pico(end_of_file),
    cuerpo(end_of_file),
    vientre(end_of_file),
    pecho(end_of_file),
    zona_malar(end_of_file),
    cola(end_of_file),
    tarsos(end_of_file),
    espalda(end_of_file),
    come(end_of_file).

