:- prolog_load_context(directory, Dir), working_directory(_, Dir).

:- use_module(library(pce)).

start_gui :-
    new(MiVentana, dialog('Identificador de Aves')),

    % Crear campos de texto para cada atributo
    send(MiVentana, append, new(Ojos, text_item('ojos'))),
    send(MiVentana, append, new(Garganta, text_item('garganta'))),
    send(MiVentana, append, new(Loras, text_item('loras'))),
    send(MiVentana, append, new(Patas, text_item('patas'))),
    send(MiVentana, append, new(Alas, text_item('alas'))),
    send(MiVentana, append, new(Cabeza, text_item('cabeza'))),
    send(MiVentana, append, new(Cere, text_item('cere'))),
    send(MiVentana, append, new(Auriculares, text_item('auriculares'))),
    send(MiVentana, append, new(Corona, text_item('corona'))),
    send(MiVentana, append, new(CobertorasInferioresDeLaCola, text_item('cobertoras_inferiores_de_la_cola'))),
    send(MiVentana, append, new(Pico, text_item('pico'))),
    send(MiVentana, append, new(Cuerpo, text_item('cuerpo'))),
    send(MiVentana, append, new(Vientre, text_item('vientre'))),
    send(MiVentana, append, new(Pecho, text_item('pecho'))),
    send(MiVentana, append, new(ZonaMalar, text_item('zona_malar'))),
    send(MiVentana, append, new(Cola, text_item('cola'))),
    send(MiVentana, append, new(Tarsos, text_item('tarsos'))),
    send(MiVentana, append, new(Espalda, text_item('espalda'))),
    send(MiVentana, append, new(Come, text_item('come'))),

    % Crear botones
    % Boton para identificar ave
    send(MiVentana, append, button('Identificar', message(@prolog, identificar_ave,
        Ojos?selection, Garganta?selection, Loras?selection, Patas?selection, Alas?selection,
        Cabeza?selection, Cere?selection, Auriculares?selection, Corona?selection,
        CobertorasInferioresDeLaCola?selection, Pico?selection, Cuerpo?selection,
        Vientre?selection, Pecho?selection, ZonaMalar?selection, Cola?selection,
        Tarsos?selection, Espalda?selection, Come?selection))),

    % Boton para agregar ave
    send(MiVentana, append, button('Agregar ave', message(@prolog, gui_agregar_ave,  Ojos?selection, Garganta?selection, Loras?selection, Patas?selection, Alas?selection,
        Cabeza?selection, Cere?selection, Auriculares?selection, Corona?selection,
        CobertorasInferioresDeLaCola?selection, Pico?selection, Cuerpo?selection,
        Vientre?selection, Pecho?selection, ZonaMalar?selection, Cola?selection,
        Tarsos?selection, Espalda?selection, Come?selection))),

    % Boton para mostrar todas las aves de la base de conocimientos
    send(MiVentana, append, button('Mostrar todas las aves', message(@prolog, mostrar_aves))),

    % Boton para salir de la interfaz
    send(MiVentana, append, button('Salir', message(MiVentana, destroy))),

    send(MiVentana, open).


% Se recogen los valores de las aves y su nombre
gui_agregar_ave(Ojos, Garganta, Loras, Patas, Alas, Cabeza, Cere, Auriculares, Corona, CobertorasInferioresDeLaCola, Pico, Cuerpo, Vientre, Pecho, ZonaMalar, Cola, Tarsos, Espalda, Come) :-

    % Imprime los valores recibidos
    format('Recibido - Ojos: ~w, Garganta: ~w, Loras: ~w, Patas: ~w, Alas: ~w, Cabeza: ~w, Cere: ~w, Auriculares: ~w, Corona: ~w, CobertorasInferioresDeLaCola: ~w, Pico: ~w, Cuerpo: ~w, Vientre: ~w, Pecho: ~w, ZonaMalar: ~w, Cola: ~w, Tarsos: ~w, Espalda: ~w, Come: ~w\n',
        [Ojos, Garganta, Loras, Patas, Alas, Cabeza, Cere, Auriculares, Corona, CobertorasInferioresDeLaCola, Pico, Cuerpo, Vientre, Pecho, ZonaMalar, Cola, Tarsos, Espalda, Come]),

    new(Diag, dialog('Agregar nueva ave')),
    send(Diag, append, new(Nombre, text_item(nombre))),
    send(Diag, append, button('Aceptar', message(@prolog, nuevaAve,
        Nombre?selection, Ojos, Garganta, Loras, Patas, Alas, Cabeza, Cere, Auriculares, Corona, CobertorasInferioresDeLaCola, Pico, Cuerpo, Vientre, Pecho, ZonaMalar, Cola, Tarsos, Espalda, Come, Diag))),
    send(Diag, open).

% Guardar el ave en la base de conocimientos y cerrar el di�logo
nuevaAve(NombreAve, Ojos, Garganta, Loras, Patas, Alas, Cabeza, Cere, Auriculares, Corona, CobertorasInferioresDeLaCola, Pico, Cuerpo, Vientre, Pecho, ZonaMalar, Cola, Tarsos, Espalda, Come, Diag) :-

    % Realiza el assertz con los valores recolectados
    assertz(ave(NombreAve, Ojos, Garganta, Loras, Patas, Alas, Cabeza, Cere, Auriculares, Corona, CobertorasInferioresDeLaCola, Pico, Cuerpo, Vientre, Pecho, ZonaMalar, Cola, Tarsos, Espalda, Come)),

    % Muestra el mensaje de confirmaci�n
    send(@display, inform, 'La ave ha sido agregada en la base de datos'),

    % Cierra la ventana de di�logo despu�s de agregar la ave
    send(Diag, destroy).

% Mostrar todas las aves en la base de conocimientos
mostrar_aves :-
    % Crear una ventana y un widget de label
    new(Dialogo, dialog('Aves Registradas')),
    new(T, label(texto, '')),
    send(T, font, font(times, roman, 12)),
    send(Dialogo, append, T),

    % Verificar si hay alguna ave en la base de conocimientos
    (   % Comprobar si existe al menos una ave
        ave(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _)
    ->  % Usar forall/2 para iterar sobre las aves si existen
        forall(
            ave(Nombre, Ojos, Garganta, Loras, Patas, Alas, Cabeza, Cere, Auriculares, Corona, CobertorasInferioresDeLaCola, Pico, Cuerpo, Vientre, Pecho, ZonaMalar, Cola, Tarsos, Espalda, Come),
            (   % Construir la cadena de texto para cada ave con separadores
                with_output_to(string(Str),
                    format('Ave: ~w\nOjos: ~w\nGarganta: ~w\nLoras: ~w\nPatas: ~w\nAlas: ~w\nCabeza: ~w\nCere: ~w\nAuriculares: ~w\nCorona: ~w\nCobertorasInferioresDeLaCola: ~w\nPico: ~w\nCuerpo: ~w\nVientre: ~w\nPecho: ~w\nZonaMalar: ~w\nCola: ~w\nTarsos: ~w\nEspalda: ~w\nCome: ~w\n---------------------------------------\n',
                      [Nombre, Ojos, Garganta, Loras, Patas, Alas, Cabeza, Cere, Auriculares, Corona, CobertorasInferioresDeLaCola, Pico, Cuerpo, Vientre, Pecho, ZonaMalar, Cola, Tarsos, Espalda, Come])),
                % Agregar la cadena de texto al label
                send(T, append, Str)
            )
        )
    ;   % En caso de que no haya aves, mostrar un mensaje
        send(T, value, 'No hay aves registradas en la base de conocimientos.')
    ),

    % Mostrar la ventana
    send(Dialogo, open).

identificar_ave(ColorOjos) :-
    (   ojos(ColorOjos)
    ->  Respuesta = 'El color de los ojos del ave es conocido.'
    ;   Respuesta = 'Color de los ojos no definido, se agregar� a la base de datos.',
        assertz(ojos(ColorOjos))  % Aseg�rate de manejar correctamente las aserciones.
    ),
    new(DialogoRespuesta, dialog('Resultado')),
    send(DialogoRespuesta, append, label(texto, Respuesta)),
    send(DialogoRespuesta, append, button('Ok', message(DialogoRespuesta, destroy))),
    send(DialogoRespuesta, open).


:- dynamic
    ojos/1,
    garganta/1,
    loras/1,
    patas/1,
    alas/1,
    cabeza/1,
    cere/1,
    auriculares/1,
    corona/1,
    cobertoras_inferiores_cola/1,
    pico/1,
    cuerpo/1,
    vientre/1,
    pecho/1,
    zona_malar/1,
    cola/1,
    tarsos/1,
    espalda/1,
    come/1,
    ave/1.

archivo_aves('avesColomos.pl').
guardar :- archivo_aves(File), tell(File), listing(ave), told.
recuperar :- archivo_aves(File), exists_file(File), consult(File).

buscar :-
    recuperar,
    eliminarUsuario,
    conocer,
    respuesta.

respuesta :-
    not(ave(_)),
    write("No encontramos tu ave."), nl,
    verificar, nl, nl,
    write("Te gustaria agregar esta nueva ave?"), nl, read(R),
    (R = no; nuevaAve, guardar).

respuesta :-
    ave(X),
    write("Tu ave es un(a): "), write(X), nl,
    verificar.

/* Modulo de explicacion */
predecir(ave(X), prueba(ave(X),
    Iojos,
    Igarganta,
    Iloras,
    Ipatas,
    Ialas,
    Icere,
    Ivientre,
    Icabeza,
    Ipecho,
    Iespalda,
    Iauriculares,
    Icobertoras_inferiores_cola,
    Icome,
    Icorona,
    Izona_malar,
    Itarsos,
    Icuerpo,
    Icola,
    Ipico
)) :- ave(X),
    predecir(ojos(_), Iojos),
    predecir(garganta(_), Igarganta),
    predecir(loras(_), Iloras),
    predecir(patas(_), Ipatas),
    predecir(alas(_), Ialas),
    predecir(come(_), Icome),
    predecir(vientre(_), Ivientre),
    predecir(cobertoras_inferiores_cola(_), Icobertoras_inferiores_cola),
    predecir(espalda(_), Iespalda),
    predecir(pecho(_), Ipecho),
    predecir(tarsos(_), Itarsos),
    predecir(auriculares(_), Iauriculares),
    predecir(corona(_), Icorona),
    predecir(pico(_), Ipico),
    predecir(zona_malar(_), Izona_malar),
    predecir(cuerpo(_), Icuerpo),
    predecir(cere(_),Icere),
    predecir(cola(_), Icola),
    predecir(cabeza(_), Icabeza).

predecir(loras(X), verificar(loras(X), hecho)) :- loras(X), not(loras(desconocido)).
predecir(loras(X), verificar(loras(X), no_definido)) :- not(loras(X)); loras(desconocido).

predecir(alas(X), verificar(alas(X), hecho)) :- alas(X), not(alas(desconocido)).
predecir(alas(X), verificar(alas(X), no_definido)) :- not(alas(X)); alas(desconocido).

predecir(cabeza(X), verificar(cabeza(X), hecho)) :- cabeza(X), not(cabeza(desconocido)).
predecir(cabeza(X), verificar(cabeza(X), no_definido)) :- not(cabeza(X)); cabeza(desconocido).

predecir(cere(X), verificar(cere(X), hecho)) :- cere(X), not(cere(desconocido)).
predecir(cere(X), verificar(cere(X), no_definido)) :- not(cere(X)); cere(desconocido).

predecir(ojos(X), verificar(ojos(X), hecho)) :- ojos(X), not(ojos(desconocido)).
predecir(ojos(X), verificar(ojos(X), no_definido)) :- not(ojos(X)); ojos(desconocido).

predecir(espalda(X), verificar(espalda(X), hecho)) :- espalda(X), not(espalda(desconocido)).
predecir(espalda(X), verificar(espalda(X), no_definido)) :- not(espalda(X)); espalda(desconocido).

predecir(cola(X), verificar(cola(X), hecho)) :- cola(X), not(cola(desconocido)).
predecir(cola(X), verificar(cola(X), no_definido)) :- not(cola(X)); cola(desconocido).

predecir(tarsos(X), verificar(tarsos(X), hecho)) :- tarsos(X), not(tarsos(desconocido)).
predecir(tarsos(X), verificar(tarsos(X), no_definido)) :- not(tarsos(X)); tarsos(desconocido).

predecir(garganta(X), verificar(garganta(X), hecho)) :- garganta(X), not(garganta(desconocido)).
predecir(garganta(X), verificar(garganta(X), no_definido)) :- not(garganta(X)); garganta(desconocido).

predecir(patas(X), verificar(patas(X), hecho)) :- patas(X), not(patas(desconocido)).
predecir(patas(X), verificar(patas(X), no_definido)) :- not(patas(X)); patas(desconocido).

predecir(pecho(X), verificar(pecho(X), hecho)) :- pecho(X), not(pecho(desconocido)).
predecir(pecho(X), verificar(pecho(X), no_definido)) :- not(pecho(X)); pecho(desconocido).

predecir(vientre(X), verificar(vientre(X), hecho)) :- vientre(X), not(vientre(desconocido)).
predecir(vientre(X), verificar(vientre(X), no_definido)) :- not(vientre(X)); vientre(desconocido).

predecir(auriculares(X), verificar(auriculares(X), hecho)) :- auriculares(X), not(auriculares(desconocido)).
predecir(auriculares(X), verificar(auriculares(X), no_definido)) :- not(auriculares(X)); auriculares(desconocido).

predecir(come(X), verificar(come(X), hecho)) :- come(X), not(come(desconocido)).
predecir(come(X), verificar(come(X), no_definido)) :- not(come(X)); come(desconocido).

predecir(zona_malar(X), verificar(zona_malar(X), hecho)) :- zona_malar(X), not(zona_malar(desconocido)).
predecir(zona_malar(X), verificar(zona_malar(X), no_definido)) :- not(zona_malar(X)); zona_malar(desconocido).

predecir(corona(X), verificar(corona(X), hecho)) :- corona(X), not(corona(desconocido)).
predecir(corona(X), verificar(corona(X), no_definido)) :- not(corona(X)); corona(desconocido).

predecir(cobertoras_inferiores_cola(X),verificar(cobertoras_inferiores_cola(X), hecho)) :-
    cobertoras_inferiores_cola(X), not(cobertoras_inferiores_cola(desconocido)).
predecir(cobertoras_inferiores_cola(X),verificar(cobertoras_inferiores_cola(X), no_definido)) :-
    not(cobertoras_inferiores_cola(X)); cobertoras_inferiores_cola(desconocido).

predecir(pico(X), verificar(pico(X), hecho)) :- pico(X), not(pico(desconocido)).
predecir(pico(X), verificar(pico(X), no_definido)) :- not(pico(X)); pico(desconocido).

predecir(cuerpo(X), verificar(cuerpo(X), hecho)) :- cuerpo(X), not(cuerpo(desconocido)).
predecir(cuerpo(X), verificar(cuerpo(X), no_definido)) :- not(cuerpo(X)); cuerpo(desconocido).

conocer :-
    obtenerOjos,
    obtenerGarganta,
    obtenerLoras,
    obtenerPatas,
    obtenerAlas,
    obtenerCabeza,
    obtenerCere,
    obtenerAuriculares,
    obtenerCorona,
    obtenerCobertorasInferioresDeLaCola,
    obtenerPico,
    obtenerCuerpo,
    obtenerVientre,
    obtenerPecho,
    obtenerZonaMalar,
    obtenerCola,
    obtenerTarsos,
    obtenerEspalda,
    obtenerCome.

obtenerOjos :-
    write("¿Sabes el color de sus ojos? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(ojos(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl, read(Y),
        (Y = si -> write("Escribe su otro color"), nl, read(Z), asserta(ojos(Z)); Y \= si)
    ).

obtenerGarganta :-
    write("¿Sabes el color de su garganta? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(garganta(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl, read(Y),
        (Y = si -> write("Escribe su otro color?"), nl, read(Z), asserta(garganta(Z)); Y \= si)
    ).

obtenerLoras :-
    write("¿Sabes el color de sus loras? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(loras(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl, read(Y),
        (Y = si -> write("Escribe su otro color"), nl, read(Z), asserta(loras(Z)); Y \= si)
    ).

obtenerPatas :-
    write("¿Sabes el color de sus patas? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(patas(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl,
        read(Y),
        (Y = si -> write("Escribe su otro color"), nl, read(Z), asserta(patas(Z)); Y \= si)
    ).

obtenerAlas :-
    write("¿Sabes el color de sus alas? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(alas(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl,
        read(Y),
        (Y = si -> write("Escribe su otro color"), nl, read(Z), asserta(alas(Z)); Y \= si)
    ).

obtenerCabeza :-
    write("¿Sabes el color de su cabeza? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(cabeza(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl,
        read(Y),
        (Y = si -> write("Escribe su otro color"), nl, read(Z), asserta(cabeza(Z)); Y \= si)
    ).

obtenerCere :-
    write("¿Sabes el color de su cere? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(cere(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl,
        read(Y),
        (Y = si -> write("Escribe su otro color"), nl, read(Z), asserta(cere(Z)); Y \= si)
    ).

obtenerAuriculares :-
    write("¿Sabes el color de sus auriculares? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(auriculares(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl,
        read(Y),
        (Y = si -> write("Escribe su otro color"), nl, read(Z), asserta(auriculares(Z)); Y \= si)
    ).

obtenerCorona :-
    write("¿Sabes el color de su corona? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(corona(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl,
        read(Y),
        (Y = si -> write("Escribe su otro color"), nl, read(Z), asserta(corona(Z)); Y \= si)
    ).

obtenerCobertorasInferioresDeLaCola :-
    write("¿Sabes el color de sus cobertoras inferiores de la cola? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(cobertoras_inferiores_cola(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl,
        read(Y),
        (Y = si -> write("Escribe su otro color"), nl, read(Z), asserta(cobertoras_inferiores_cola(Z)); Y \= si)
    ).

obtenerPico :-
    write("¿Sabes el color de su pico? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(pico(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl,
        read(Y),
        (Y = si -> write("Escribe su otro color"), nl, read(Z), asserta(pico(Z)); Y \= si)
    ).

obtenerCuerpo :-
    write("¿Sabes el color de su cuerpo? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(cuerpo(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl,
        read(Y),
        (Y = si -> write("Escribe su otro color"), nl, read(Z), asserta(cuerpo(Z)); Y \= si)
    ).

obtenerVientre :-
    write("¿Sabes el color de su vientre? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(vientre(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl,
        read(Y),
        (Y = si -> write("Escribe su otro color"), nl, read(Z), asserta(vientre(Z)); Y \= si)
    ).

obtenerPecho :-
    write("¿Sabes el color de su pecho? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(pecho(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl,
        read(Y),
        (Y = si -> write("Escribe su otro color"), nl, read(Z), asserta(pecho(Z)); Y \= si)
    ).

obtenerZonaMalar :-
    write("¿Sabes el color de su zona malar? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(zona_malar(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl,
        read(Y),
        (Y = si -> write("Escribe su otro color"), nl, read(Z), asserta(zona_malar(Z)); Y \= si)
    ).

obtenerCola :-
    write("¿Sabes el color de su cola? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(cola(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl,
        read(Y),
        (Y = si -> write("Escribe su otro color"), nl, read(Z), asserta(cola(Z)); Y \= si)
    ).

obtenerTarsos :-
    write("¿Sabes el color de sus tarsos? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(tarsos(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl,
        read(Y),
        (Y = si -> write("Escribe su otro color"), nl, read(Z), asserta(tarsos(Z)); Y \= si)
    ).

obtenerEspalda :-
    write("¿Sabes el color de su espalda? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(espalda(X)),
    (
        X = desconocido;
        write("¿Cuenta con algun otro color?"), nl,
        read(Y),
        (Y = si -> write("Escribe su otro color"), nl, read(Z), asserta(espalda(Z)); Y \= si)
    ).

obtenerCome :-
    write("¿Sabes de que se alimenta? Escribelo. Si desconoces escribe: 'desconocido'"), nl, read(X),
    asserta(come(X)),
    (
        X = desconocido;
        write("¿Come algun otro alimento?"), nl,
        read(Y),
        (Y = si -> write("Escribe su otro alimento"), nl, read(Z), asserta(come(Z)); Y \= si)
    ).

/* Las pruebas que se muestran al usuario cuando se llega a una respuesta */
verificar :-
    verificarOjos,
    verificarGarganta,
    verificarLoras,
    verificarPatas,
    verificarAlas,
    verificarCabeza,
    verificarCere,
    verificarAuriculares,
    verificarCorona,
    verificarCobertorasInferiorasDeLaCola,
    verificarPico,
    verificarCuerpo,
    verificarVientre,
    verificarPecho,
    verificarZonaMalar,
    verificarCola,
    verificarTarsos,
    verificarEspalda,
    verificarCome.

verificarOjos :-
    predecir(ojos(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color de los ojos no definido.");
        write("El color de los ojos del ave es: "), write(X)
    ).

verificarGarganta :-
    predecir(garganta(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color de la garganta no definida.");
        write("El color de la garganta del ave es: "), write(X)
    ).

verificarLoras :-
    predecir(loras(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color de las loras no definido.");
        write("El color de las loras del ave es: "), write(X)
    ).

verificarPatas :-
    predecir(patas(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color de las patas no definido.");
        write("El color de las patas del ave es: "), write(X)
    ).

verificarAlas :-
    predecir(alas(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color de las alas no definido.");
        write("El color de las alas del ave es: "), write(X)
    ).

verificarCabeza :-
    predecir(cabeza(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color de la cabeza no definido.");
        write("El color de la cabeza del ave es: "), write(X)
    ).

verificarCere :-
    predecir(cere(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color del cere no definido.");
        write("El color del cere del ave es: "), write(X)
    ).

verificarAuriculares :-
    predecir(auriculares(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color de los auriculares no definido.");
        write("El color de los auriculares del ave es: "), write(X)
    ).

verificarCorona :-
    predecir(corona(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color de la corona no definido.");
        write("El color de la corona del ave es: "), write(X)
    ).

verificarCobertorasInferiorasDeLaCola :-
    predecir(cobertoras_inferiores_cola(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color de las cobertoras inferiores de la cola no definido.");
        write("El color de las cobertoras inferiores de la cola del ave es: "), write(X)
    ).

verificarPico :-
    predecir(pico(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color del pico no definido");
        write("El color del pico del ave es: "), write(X)
    ).

verificarCuerpo :-
    predecir(cuerpo(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color del cuerpo no definido");
        write("El color del cuerpo del ave es: "), write(X)
    ).

verificarVientre :-
    predecir(vientre(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color del vientre no definido");
        write("El color del vientre del ave es: "), write(X)
    ).

verificarPecho :-
    predecir(pecho(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color del pecho no definido");
        write("El color del pecho del ave es: "), write(X)
    ).

verificarZonaMalar :-
    predecir(zona_malar(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color de la zona malar no definido");
        write("El color de la zona malar del ave es: "), write(X)
    ).

verificarCola :-
    predecir(cola(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color de la cola no definido");
        write("El color de la cola del ave es: "), write(X)
    ).

verificarTarsos :-
    predecir(tarsos(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color de los tarsos no definido");
        write("El color de los tarsos del ave es: "), write(X)
    ).

verificarEspalda :-
    predecir(espalda(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Color de la espalda no definido");
        write("El color de la espalda del ave es: "), write(X)
    ).

verificarCome :-
    predecir(come(X), verificar(_, B)), nl,
    (
        B = no_definido, write("Alimento del ave no definido");
        write("El ave se alimenta de: "), write(X)
    ).

/* Agrega una nueva ave con la descripcion que hay en memoria */
eliminarUsuario :-
    retractall(ojos(_)),
    retractall(garganta(_)),
    retractall(loras(_)),
    retractall(patas(_)),
    retractall(alas(_)),
    retractall(cabeza(_)),
    retractall(cere(_)),
    retractall(auriculares(_)),
    retractall(corona(_)),
    retractall(cobertoras_inferiores_cola(_)),
    retractall(pico(_)),
    retractall(cuerpo(_)),
    retractall(vientre(_)),
    retractall(pecho(_)),
    retractall(zona_malar(_)),
    retractall(cola(_)),
    retractall(tarsos(_)),
    retractall(espalda(_)),
    retractall(come(_)).
