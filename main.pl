:- prolog_load_context(directory, Dir), working_directory(_, Dir).

:- use_module(library(pce)).

:- dynamic
    ojos/1,
    pico/1,
    cuerpo/1,
    patas/1,
    tarsos/1,
    loras/1,
    alas/1,
    vientre/1,
    corona/1,
    espalda/1,
    habitat/1,
    alimentacion/1,
    ave/13.

% Funci�n que se ejecuta al inicio del programa para cargar las aves
cargar_aves :-
    format('Iniciando la carga de aves desde el archivo...\n'),
    % Abre el archivo de la base de datos de aves en modo lectura
    open('AvesColomosPrueba.pl', read, Stream),
    % Llama a la funci�n para leer y cargar las aves
    leer_aves(Stream),
    % Cierra el archivo
    close(Stream),
    format('Archivo de aves le�do.\n'),
    % Ahora mostramos todas las aves cargadas
    mostrar_aves_cargadas.

% Muestra todas las aves que han sido cargadas en la base de conocimientos
mostrar_aves_cargadas :-
    format('Aves cargadas en la base de conocimientos:\n'),
    (   % Comprobar si existe al menos una definici�n de ave con 13 atributos
        ave(_, _, _, _, _, _, _, _, _, _, _, _, _)
    ->  % Usar forall/2 para iterar sobre las aves si existen
        forall(
            ave(Nombre, Ojos, Pico, Cuerpo, Patas, Tarsos, Loras, Alas, Vientre, Corona, Espalda, Habitat, Alimentacion),
            format('Ave: ~w, Ojos: ~w, Pico: ~w, Cuerpo: ~w, Patas: ~w, Tarsos: ~w, Loras: ~w, Alas: ~w, Vientre: ~w, Corona: ~w, Espalda: ~w, Habitat: ~w, Alimentacion: ~w\n', [Nombre, Ojos, Pico, Cuerpo, Patas, Tarsos, Loras, Alas, Vientre, Corona, Espalda, Habitat, Alimentacion])
        )
    ;   % En caso de que no haya aves, mostrar un mensaje
        format('No hay aves registradas en la base de conocimientos.\n')
    ).

% Funci�n recursiva para leer el archivo de aves l�nea por l�nea
leer_aves(Stream) :-
    % Comprueba si hemos alcanzado el final del archivo
    at_end_of_stream(Stream),
    !,  % Si es as�, termina la recursi�n con corte (!) para prevenir backtracking
    format('Fin del archivo alcanzado.\n').
leer_aves(Stream) :-
    % No hemos alcanzado el final, lee la siguiente l�nea
    read(Stream, Ave),
    % Aseg�rate de que la l�nea le�da es una cl�usula v�lida
    (   is_ave(Ave)
    ->  % Si es una cl�usula de ave, �sala para hacer un assertz
        assertz(Ave),
        format('Ave cargada: ~w\n', [Ave])
    ;   % Si no, ignora la l�nea
        true
    ),
    % Contin�a con la siguiente l�nea
    leer_aves(Stream).

% Verifica si la cl�usula le�da corresponde a una definici�n de ave
is_ave(Ave) :-
    % Comprueba si Ave es una cl�usula que comienza con ave(...)
    Ave =.. [ave|_].

%Ejecucion de la interfaz principal
start_gui :-
    % Carga las aves de la BD
    format('Iniciando la interfaz gr�fica...\n'),
    cargar_aves,

    new(MiVentana, dialog('Identificador de Aves')),

    send(MiVentana, append, label(instructivo, 'IMPORTANTE: Si no tiene informacion de un atributo espec�fico, escriba \'desconocido\'.')),
    send(MiVentana, append, label(instructivo, 'NOTA: Si son multiples valores para un atributo especifico escriba por ejemplo: \'rojo,azul\'')),

    % Crear campos de texto para cada atributo relevante
    send(MiVentana, append, new(Ojos, text_item('Color de ojos'))),


    send(MiVentana, append, new(Pico, text_item('pico'))),
    send(MiVentana, append, new(Cuerpo, text_item('cuerpo'))),
    send(MiVentana, append, new(Patas, text_item('patas'))),
    send(MiVentana, append, new(Tarsos, text_item('tarsos'))),

    % Los siguientes campos son opcionales, ya que no aparecen en todas las definiciones de aves
    send(MiVentana, append, new(Loras, text_item('loras'))), % Si existe el atributo loras
    send(MiVentana, append, new(Alas, text_item('alas'))), % Si existe el atributo alas
    send(MiVentana, append, new(Vientre, text_item('vientre'))), % Si existe el atributo vientre
    send(MiVentana, append, new(Corona, text_item('corona'))), % Si existe el atributo corona
    send(MiVentana, append, new(Espalda, text_item('espalda'))), % Si existe el atributo espalda

    % Campos para h�bitat y alimentaci�n
    send(MiVentana, append, new(Habitat, text_item('habitat'))),
    send(MiVentana, append, new(Alimentacion, text_item('alimentacion'))),

    % Crear botones
    % Bot�n para identificar ave
    send(MiVentana, append, button('Identificar', message(@prolog, identificar_ave,
    Ojos?selection, Pico?selection, Cuerpo?selection, Patas?selection, Tarsos?selection,
    Loras?selection, Alas?selection, Vientre?selection, Corona?selection, Espalda?selection,
    Habitat?selection, Alimentacion?selection))),

    % Bot�n para agregar ave
    send(MiVentana, append, button('Agregar ave', message(@prolog, gui_agregar_ave,
    Ojos?selection, Pico?selection, Cuerpo?selection, Patas?selection, Tarsos?selection,
    Loras?selection, Alas?selection, Vientre?selection, Corona?selection, Espalda?selection,
    Habitat?selection, Alimentacion?selection))),

    % Boton para mostrar todas las aves de la base de conocimientos
    send(MiVentana, append, button('Mostrar todas las aves', message(@prolog, mostrar_aves))),

    % Boton para salir de la interfaz y limpiar la base de conocimientos de las aves
    send(MiVentana, append, button('Salir', message(@prolog, limpiar_datos_y_salir, MiVentana))),
    send(MiVentana, open).

% Se recogen los valores de las aves y su nombre
gui_agregar_ave(Ojos, Pico, Cuerpo, Patas, Tarsos, Loras, Alas, Vientre, Corona, Espalda, Habitat, Alimentacion) :-

    % Imprime los valores recibidos
    format('Recibido - Ojos: ~w, Pico: ~w, Cuerpo: ~w, Patas: ~w, Tarsos: ~w, Loras: ~w, Alas: ~w, Vientre: ~w, Corona: ~w, Espalda: ~w, Habitat: ~w, Alimentacion: ~w\n',
        [Ojos, Pico, Cuerpo, Patas, Tarsos, Loras, Alas, Vientre, Corona, Espalda, Habitat, Alimentacion]),

    new(Diag, dialog('Agregar nueva ave')),
    send(Diag, append, new(Nombre, text_item(nombre))),
    send(Diag, append, button('Aceptar', message(@prolog, nuevaAve,
        Nombre?selection, Ojos, Pico, Cuerpo, Patas, Tarsos, Loras, Alas, Vientre, Corona, Espalda, Habitat, Alimentacion, Diag))),
    send(Diag, open).

nuevaAve(NombreAve, Ojos, Pico, Cuerpo, Patas, Tarsos, Loras, Alas, Vientre, Corona, Espalda, Habitat, Alimentacion, Diag) :-
    % Realiza el assertz con los valores recolectados
    assertz(ave(NombreAve, Ojos, Pico, Cuerpo, Patas, Tarsos, Loras, Alas, Vientre, Corona, Espalda, Habitat, Alimentacion)),

    % Abre el archivo en modo de anexi�n
    open('AvesColomosPrueba.pl', append, File),

    % Escribe la informaci�n del ave en el archivo
    maplist(ensure_value, [Ojos, Pico, Cuerpo, Patas, Tarsos, Loras, Alas, Vientre, Corona, Espalda, Habitat, Alimentacion], FormattedValues),
    format(File, 'ave(~w, ~w, ~w, ~w, ~w, ~w, ~w, ~w, ~w, ~w, ~w, ~w, ~w).\n', [NombreAve|FormattedValues]),

    % Cierra el archivo
    close(File),

    % Muestra el mensaje de confirmaci�n
    send(@display, inform, 'La ave ha sido agregada en la base de datos'),

    % Cierra la ventana de di�logo despu�s de agregar la ave
    send(Diag, destroy).

% Asegurarse de que cada valor est� presente, de lo contrario utilizar 'null'
% Adem�s, si el valor contiene comas, lo convierte en una lista de Prolog.
ensure_value(Value, Result) :-
    (   nonvar(Value), Value \= '' ->
        (   split_string(Value, ",", " ", Parts),
            Parts = [_|_] -> % Verifica que haya m�s de un elemento
            % Convertir las partes en una lista de �tomos
            maplist(atom_string, AtomParts, Parts),
            % Crear una representaci�n de lista Prolog en forma de cadena
            atomics_to_string(AtomParts, ',', AtomList),
            format(atom(Result), '[~w]', [AtomList])
        ;   % Solo hay una parte, as� que usa el valor como est�
            Result = Value
        )
    ;   Result = 'null'
    ).

% Mostrar todas las aves en la base de conocimientos
mostrar_aves :-
    % Crear una ventana y un widget de label
    new(Dialogo, dialog('Aves Registradas')),
    new(T, label(texto, '')),
    send(T, font, font(times, roman, 12)),
    send(Dialogo, append, T),

    % Verificar si hay alguna ave en la base de conocimientos
    (   % Comprobar si existe al menos una definici�n de ave con 13 atributos
        ave(_, _, _, _, _, _, _, _, _, _, _, _, _)
    ->  % Usar forall/2 para iterar sobre las aves si existen
        forall(
            ave(Nombre, Ojos, Pico, Cuerpo, Patas, Tarsos, Loras, Alas, Vientre, Corona, Espalda, Habitat, Alimentacion),
            (   % Construir la cadena de texto para cada ave con separadores
                with_output_to(string(Str),
                    format('Ave: ~w\nOjos: ~w\nPico: ~w\nCuerpo: ~w\nPatas: ~w\nTarsos: ~w\nLoras: ~w\nAlas: ~w\nVientre: ~w\nCorona: ~w\nEspalda: ~w\nHabitat: ~w\nAlimentacion: ~w\n---------------------------------------\n',
                           [Nombre, Ojos, Pico, Cuerpo, Patas, Tarsos, Loras, Alas, Vientre, Corona, Espalda, Habitat, Alimentacion])),
                % Agregar la cadena de texto al label
                send(T, append, Str)
            )
        )
    ;   % En caso de que no haya aves, mostrar un mensaje
        send(T, value, 'No hay aves registradas en la base de conocimientos.')
    ),

    % Mostrar la ventana
    send(Dialogo, open).

% Predicado para limpiar los datos de aves y cerrar la ventana
limpiar_datos_y_salir(Ventana) :-
    retractall(ave(_, _, _, _, _, _, _, _, _, _, _, _, _)),
    send(Ventana, destroy).


% Falta: Identificar Aves, guardar el ave a�adida a la base de datos y
% por ultimo darle un poco de decoracion a la interfaz
