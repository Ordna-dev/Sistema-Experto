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
    habitat(acuatico),
    alimentacion(peces),
    alimentacion(insectos),
    alimentacion(crustaceos).

ave(garceta_pie_dorado_joven) :-
    ojos(amarillo),
    loras(amarillo),
    pico([negro, 'amarillo con la punta negra']),
    cuerpo(blanco),
    tarsos(['amarillos', 'verde amarillento']),
    patas(amarillo),
    alas(blanco),
    vientre(blanco),
    habitat(acuatico),
    alimentacion(peces),
    alimentacion(insectos),
    alimentacion(crustaceos).

ave(garza_ganadera_adulto) :-
    ojos(amarillo),
    pico(['amarillos', anaranjado]),
    cuerpo(blanco),
    patas(negras),
    tarsos(negros),
    corona(['anaranjado claro']),
    espalda(['anaranjado claro']),
    pecho(['anaranjado claro']),
    habitat([granjas, sembradios, 'cuerpos de agua']),
    alimentacion(insectos),
    alimentacion('huevos de otras aves'),
    alimentacion(peces).

ave(garza_ganadera_joven) :-
    ojos(amarillo),
    pico(negro),
    cuerpo(blanco),
    patas(negras),
    tarsos(negros),
    loras(amarillentas),
    habitat([granjas, sembradios, 'cuerpos de agua']),
    alimentacion(insectos),
    alimentacion('huevos de otras aves'),
    alimentacion(peces).

ave(garceta_verde) :-
    ojos(amarillo),
    pico(['negro', 'base amarillenta']),
    loras(' '),
    cuerpo(blanco),
    tarsos(['amarillos', anaranjados]),
    patas(['amarillas', anaranjados]),
    habitat(acuatico),
    alimentacion(peces),
    alimentacion(insectos),
    alimentacion(crustaceos).

ave(pedrete_corona_negra) :-
    ojos(rojos),
    pico(negro),
    loras(''),
    cuerpo(['Cabeza blanco-grisácea'. 'Garganta blanquecina; pecho y vientre grisáceos.']),
    tarsos(amarillos),
    patas(amarillos),
    habitat(['Cuerpos de agua dulce y salobre.']),
    alimentacion(['peces', 'algas', 'lombrices', 'insectos', 'crustaceos', 'anfibios', 'pequeños roedores']).

ave(zopilote_comun) :-
    ojos(negros),
    pico(['negro con la punta de la maxila blanca']),
    cuerpo(['Cuerpo negruzco.']),
    habitat(['Zonas boscosas y áreas abiertas en general']),
    alimentacion('carroña').

ave(zopilote_aura) :-
    ojos(negros),
    pico(['con base rojiza y punta blanca']),
    cuerpo(['Cabeza roja. Cuerpo café oscuro.']),
    habitat(['Zonas boscosas y áreas abiertas en general']),
    alimentacion('carroña'),
    alimentacion('caza su alimento').

ave(gavilan_pecho_rufo) :-
    ojos(rojos),
    pico('gris oscuro'),
    cuerpo(['Pecho y vientre blancos jaspeados de anaranjado-rojizo.']),
    tarsos(amarillos),
    habitat(['Bosques templados']),
    alimentacion(['aves pequeñas', 'roedores']).

ave(aguililla_cola_roja) :-
    ojos(['negros o amarillos']),
    pico(['gris oscuro']),
    cuerpo(['Coloración del plumaje general variable, normalmente compuesto por tonos cafés, rojizos y/o blanquecinos.']),
    habitat(['Áreas abiertas, bosques y cableado eléctrico paralelo a carreteras']),
    alimentacion(['roedores', 'otros mamíferos pequeños', 'aves', 'reptiles', 'anfibios', 'carroña']).

ave(cernicalo_americano) :-
    ojos(negros),
    pico(['gris oscuro']),
    cuerpo(['Pecho anaranjado deslavado; vientre, lados y flancos blancos con motas negras.']),
    tarsos(amarillos),
    habitat(['Áreas abiertas, bordes de bosques, matorrales y ciudades']),
    alimentacion(['insectos', 'mamíferos pequeños', 'aves', 'reptiles']).

ave(paloma_domestica) :-
    ojos(rojizos),
    pico(['gris oscuro']),
    cuerpo(['La coloración de su plumaje es muy variable.']),
    habitat(['Ciudades', 'suburbios', 'granjas']),
    alimentacion(['semillas', 'insectos']).

ave(tortola_cola_larga) :-
    ojos(rojos),
    pico('gris'),
    cuerpo(['Cuerpo café grisáceo con apariencia escamosa.']),
    tarsos(anaranjados),
    habitat(['Matorrales', 'bordes de bosques', 'granjas', 'ciudades']),
    alimentacion(['semillas', 'frutos']).

ave(perico_frente_naranja) :-
    ojos(amarillos),
    pico(['amarillo grisáceo claro']),
    cuerpo(['Garganta y pecho amarillo-cafés; vientre verde amarillento.']),
    habitat(['Bosques áridos y semihúmedos', 'ecotonos', 'áreas semiabiertas.']),
    alimentacion(['semillas', 'flores', 'insectos']).

ave(loro_corona_lila) :-
    ojos(amarillos),
    pico(['amarillo ocre claro']),
    cuerpo(['Cuerpo verde.']),
    habitat(['Bosques tropicales', 'bordes de bosque de pino-encino', 'manglares']),
    alimentacion(['semillas']).

ave(garrapatero_pijuy) :-
    ojos(negros),
    pico('ancho y surcado gris'),
    cuerpo(['Cuerpo negro.']),
    habitat(['Matorrales densos', 'pastizales', 'tierras agrícolas', 'bordes de bosques tropicales']),
    alimentacion(['insectos', 'semillas', 'frutos']).

ave(lechuza_de_campanario) :-
    ojos(negros),
    pico(['gris claro con base rosácea']),
    cuerpo(['Pecho y vientre blanco grisáceos con pequeños puntos negros. Resto del cuerpo anaranjado amarillento claro con áreas grises.']),
    habitat(['Áreas abiertas', 'borde de bosques semiáridos a semihúmedos', 'granjas', 'graneros', 'zonas urbanas']),
    alimentacion(['mamíferos pequeños', 'aves pequeñas', 'lagartijas']).

ave(chotacabras_menor) :-
    ojos(negros),
    pico(negro),
    cuerpo(['Cuerpo gris', 'vientre barrado de amarillo, anaranjado claro y negro. Cola ocre barrada con café.']),
    habitat(['Matorrales', 'pastizales', 'praderas', 'ciudades', 'bosques tropicales']),
    alimentacion(['insectos']).

ave(chotacabras_zumbon) :-
    ojos(negros),
    pico(negros),
    cuerpo(['Garganta blanca', 'pecho barrado de gris-café oscuro y negro, vientre barrado de blanco y café. Espalda grisácea.']),
    habitat(['Áreas abiertas y semiabiertas', 'bosques de pino', 'borde de bosques húmedos']),
    alimentacion(['insectos']).

ave(colibri_pico_ancho) :-
    ojos(negros),
    pico(['rojo con punta negra']),
    cuerpo(['Pecho y vientre verde iridiscentes. Alas oscuras. Cola emarginada azul.']),
    habitat(['Matorrales arbolados', 'bosques de encino', 'bosques húmedos', 'vegetación riparia', 'ciudades']),
    alimentacion(['néctar floral', 'insectos']).

ave(zafiro_oreja_blanca) :-
    ojos(negros),
    pico(['rojo con la punta negra']),
    cuerpo(['Verde; vientre y cobertoras inferiores de la cola blanquecinas.']),
    habitat(['Claros y bordes de bosques montañosos cercanos a arroyos']),
    alimentacion(['néctar floral', 'insectos pequeños']).

ave(colibri_berilo) :-
    ojos(negros),
    pico(['rojo con la punta negra']),
    cuerpo(['Flancos, lados y vientre grisáceos. Espalda verde; rabadilla y cobertoras superiores de la cola café-canela.']),
    habitat(['Ecotonos y claros de bosques montañosos, principalmente encino y sembradíos tropicales']),
    alimentacion(['néctar floral', 'insectos']).

ave(colibri_corona_violeta) :-
    ojos(negros),
    pico(['rojo con la punta negra']),
    cuerpo(['Garganta, pecho y vientre blancos, lados y flancos verde claro. Nuca, espalda y cobertoras del ala verde olivo.']),
    habitat(['Matorrales', 'bosques', 'vegetación riparia', 'áreas semiabiertas']),
    alimentacion(['néctar floral', 'insectos']).

ave(momoto_corona_cafe) :-
    ojos(cafes),
    pico(['largo y punteado negro']),
    cuerpo(['Pecho verde con mota central negra, vientre verde amarillento. Alas azul-verde. Cola verde.']),
    habitat(['Bosques y matorrales']),
    alimentacion(['frutos', 'insectos']).

ave(martin_pescador_norteno) :-
    ojos(negros),
    pico(['negro con base gris']),
    loras('Blanca'),
    cuerpo(['Pecho y vientre blancos, flancos azules. Espalda, rabadilla y cobertoras superiores de la cola azules.']),
    habitat(['Prácticamente en cualquier cuerpo de agua.']),
    alimentacion(['peces', 'cangrejos', 'ranas', 'mamíferos pequeños', 'aves pequeñas', 'lagartijas', 'frutos']).
