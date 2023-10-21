% rules

% columna(C):- Head = a, Rest = [b,c,d,e,f,g,h], C = [Head|Rest].


% fila(F):- Head = 1, Rest = [2,3,4,5,6,7,8], F = [Head|Rest].


% tablero(T):- columna(C), fila(F), T = [F|C].

movimientoValido(FilaDestino, ColumnaDestino):- 
    casilla(FilaOrigen, ColumnaOrigen),
    columna(ColumnaOrigen),
    fila(FilaOrigen),
    Movimiento1 is ColumnaDestino - ColumnaOrigen,
    Movimiento2 is FilaDestino - FilaOrigen,
    Movimiento1 == 1,
    Movimiento2 == 1.

% facts

columna(1).
columna(2).
columna(3).
columna(4).
columna(5).
columna(6).
columna(7).
columna(8).

fila(1).
fila(2).
fila(3).
fila(4).
fila(5).
fila(6).
fila(7).
fila(8).

casilla(2, 1).

