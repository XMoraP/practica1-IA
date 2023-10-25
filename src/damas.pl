:- dynamic (casilla/3).
:- dynamic (casillaTablero/3).

% rules
jugar :-
    writeln('Bienvenido a una versión de el juego de damas'),
    writeln('Para visualizar el tablero (casilla por casilla), escribe: casillaTablero(Ficha, Fila, Columna)'),
    writeln('Para realizar un movimiento diagonal-derecha escribe: movimientoDD(Ficha, FilaDestino, ColumnaDestino)'),
    writeln('Para realizar un movimiento diagonal-izquierda escribe: movimientoDI(Ficha, FilaDestino, ColumnaDestino)'),
    writeln('Las Ficha solo se podrá definir como negra o blanca'),
    writeln('Si tiene una ficha de color distinto delante diagonal-derecha y la quiere comer escriba: comerFichaDD(MiFicha, FichaQueComere, FilaDestino, ColumnaDestino)'),
    writeln('Si tiene una ficha de color distinto delante diagonal-izquierda y la quiere comer escriba: comerFichaDI(MiFicha, FichaQueComere, FilaDestino, ColumnaDestino)').

casillaTablero(Ficha, Fila, Columna):-
    casilla(Ficha , Fila, Columna).

comerFichaDD(FichaA, FichaB, FilaDestino, ColumnaDestino):-
    FichaA == blanca,
    FichaB == negra,
    FilaOrigen is FilaDestino - 2,
    ColumnaOrigen is ColumnaDestino - 2,
    FilaComer is FilaDestino - 1, 
    ColumnaComer is ColumnaDestino - 1,
    casilla(FichaA, FilaOrigen, ColumnaOrigen),
    \+ casillaTablero(_, FilaDestino, ColumnaDestino),
    Movimiento1 is abs(ColumnaDestino - ColumnaOrigen),
    Movimiento2 is abs(FilaDestino - FilaOrigen),
    Movimiento1 == 2,
    Movimiento2 == 2,
    asserta(casilla(FichaA, FilaDestino, ColumnaDestino)),
    retract(casilla(FichaA, FilaOrigen, ColumnaOrigen)),
    retract(casilla(FichaB, FilaComer, ColumnaComer));

    FichaA == negra,
    FichaB == blanca,
    FilaOrigen is FilaDestino + 2,
    ColumnaOrigen is ColumnaDestino + 2,
    FilaComer is FilaDestino + 1, 
    ColumnaComer is ColumnaDestino + 1,
    casilla(FichaA, FilaOrigen, ColumnaOrigen),
    \+ casillaTablero(_, FilaDestino, ColumnaDestino),
    Movimiento1 is abs(ColumnaDestino - ColumnaOrigen),
    Movimiento2 is abs(FilaDestino - FilaOrigen),
    Movimiento1 == 2,
    Movimiento2 == 2,
    asserta(casilla(FichaA, FilaDestino, ColumnaDestino)),
    retract(casilla(FichaA, FilaOrigen, ColumnaOrigen)),
    retract(casilla(FichaB, FilaComer, ColumnaComer)).

comerFichaDI(FichaA, FichaB, FilaDestino, ColumnaDestino):-
    FichaA == blanca,
    FichaB == negra,
    FilaOrigen is FilaDestino - 2,
    ColumnaOrigen is ColumnaDestino + 2,
    FilaComer is FilaDestino - 1, 
    ColumnaComer is ColumnaDestino + 1,
    casilla(FichaA, FilaOrigen, ColumnaOrigen),
    \+ casillaTablero(_, FilaDestino, ColumnaDestino),
    Movimiento1 is abs(ColumnaDestino - ColumnaOrigen),
    Movimiento2 is abs(FilaDestino - FilaOrigen),
    Movimiento1 == 2,
    Movimiento2 == 2,
    asserta(casilla(FichaA, FilaDestino, ColumnaDestino)),
    retract(casilla(FichaA, FilaOrigen, ColumnaOrigen)),
    retract(casilla(FichaB, FilaComer, ColumnaComer));

    FichaA == negra,
    FichaB == blanca,
    FilaOrigen is FilaDestino + 2,
    ColumnaOrigen is ColumnaDestino - 2,
    FilaComer is FilaDestino + 1, 
    ColumnaComer is ColumnaDestino - 1,
    casilla(FichaA, FilaOrigen, ColumnaOrigen),
    \+ casillaTablero(_, FilaDestino, ColumnaDestino),
    Movimiento1 is abs(ColumnaDestino - ColumnaOrigen),
    Movimiento2 is abs(FilaDestino - FilaOrigen),
    Movimiento1 == 2,
    Movimiento2 == 2,
    asserta(casilla(FichaA, FilaDestino, ColumnaDestino)),
    retract(casilla(FichaA, FilaOrigen, ColumnaOrigen)),
    retract(casilla(FichaB, FilaComer, ColumnaComer)).

movimientoDD(Ficha, FilaDestino, ColumnaDestino):-

    % Movimiento válido para un ficha blanca hacia la derecha  
    FilaDestino \= 1,
    Ficha == blanca,
    FilaOrigen is FilaDestino - 1,
    ColumnaOrigen is ColumnaDestino - 1,
    casilla(Ficha, FilaOrigen, ColumnaOrigen),
    \+ casillaTablero(_, FilaDestino, ColumnaDestino),
    Movimiento1 is abs(ColumnaDestino - ColumnaOrigen),
    Movimiento2 is abs(FilaDestino - FilaOrigen),
    Movimiento1 == 1,
    Movimiento2 == 1,
    asserta(casilla(Ficha, FilaDestino, ColumnaDestino)),
    retract(casilla(Ficha, FilaOrigen, ColumnaOrigen));

    % movimiento válido para una ficha negra hacia derecha
    FilaDestino \= 1,
    Ficha == negra,
    FilaOrigen is FilaDestino + 1,
    ColumnaOrigen is ColumnaDestino + 1,
    casilla(Ficha, FilaOrigen, ColumnaOrigen),
    \+ casillaTablero(_, FilaDestino, ColumnaDestino),
    Movimiento1 is abs(ColumnaDestino - ColumnaOrigen),
    Movimiento2 is abs(FilaDestino - FilaOrigen),
    Movimiento1 == 1,
    Movimiento2 == 1,
    asserta(casilla(Ficha, FilaDestino, ColumnaDestino)),
    retract(casilla(Ficha, FilaOrigen, ColumnaOrigen)).


movimientoDI(Ficha, FilaDestino, ColumnaDestino):-

    % movimiento válido para una ficha blanca hacia la izquierda
    FilaDestino \= 1,
    Ficha == blanca,
    FilaOrigen is FilaDestino - 1,
    ColumnaOrigen is ColumnaDestino + 1,
    casilla(Ficha, FilaOrigen, ColumnaOrigen),
    \+ casillaTablero(_, FilaDestino, ColumnaDestino),
    Movimiento1 is abs(ColumnaDestino - ColumnaOrigen),
    Movimiento2 is abs(FilaDestino - FilaOrigen),
    Movimiento1 == 1,
    Movimiento2 == 1,
    asserta(casilla(Ficha, FilaDestino, ColumnaDestino)),
    retract(casilla(Ficha, FilaOrigen, ColumnaOrigen));

    % movimiento válido para una ficha negra hacia la izquierda
    FilaDestino \= 1,
    Ficha == negra,
    FilaOrigen is FilaDestino + 1,
    ColumnaOrigen is ColumnaDestino - 1,
    casilla(Ficha, FilaOrigen, ColumnaOrigen),
    \+ casillaTablero(_, FilaDestino, ColumnaDestino),
    Movimiento1 is abs(ColumnaDestino - ColumnaOrigen),
    Movimiento2 is abs(FilaDestino - FilaOrigen),
    Movimiento1 == 1,
    Movimiento2 == 1,
    asserta(casilla(Ficha, FilaDestino, ColumnaDestino)),
    retract(casilla(Ficha, FilaOrigen, ColumnaOrigen)).


% facts

casilla(blanca, 2, 1).
casilla(blanca, 3, 2).
casilla(blanca, 1, 2).
casilla(blanca, 2, 3).
casilla(blanca, 3, 4).
casilla(blanca, 1, 4).
casilla(blanca, 2, 5).
casilla(blanca, 3, 6).
casilla(blanca, 1, 6).
casilla(blanca, 2, 7).
casilla(blanca, 3, 8).
casilla(blanca, 1, 8).

casilla(negra, 8, 1).
casilla(negra, 6, 1).
casilla(negra, 7, 2).
casilla(negra, 8, 3).
casilla(negra, 6, 3).
casilla(negra, 7, 4).
casilla(negra, 8, 5).
casilla(negra, 6, 5).
casilla(negra, 7, 6).
casilla(negra, 8, 7).
casilla(negra, 6, 7).
casilla(negra, 7, 8).
