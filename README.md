### Juego de Damas Versión 1.0 

Esta es una versión sencilla y básica del juego de damas españolas. 

#### Reglas

1. El juego se desarrolla en un tablero cuadrado con 8 filas y 8 columnas enumeradas.
2. Hay dos tipos de fichas: blancas y negras.
3. Las fichas se mueven en diagonal.
4. Una ficha puede comer a una ficha enemiga si está a una casilla de distancia en diagonal y la siguiente casilla en la misma dirección está vacía.

#### Comandos Disponibles

- `casillaTablero(Ficha, Fila, Columna)`: Muestra el tablero indicando las casillas que estan ocupadas por una ficha, se debe poner ';' para ir viendo todas las casillas.
- `movimientoDD(ColorFicha, FilaDestino, ColumnaDestino)`: Realiza un movimiento diagonal hacia la derecha de la ficha a la casilla de destino.
- `movimientoDI(ColorFicha, FilaDestino, ColumnaDestino)`: Realiza un movimiento diagonal hacia la izquierda de la ficha a la casilla de destino.
- `comerFichaDD(ColorMiFicha, ColorFichaQueComere, FilaDestino, ColumnaDestino)`: Si una ficha de color distinto está en una posición adecuada para ser comida, esta función la come en el movimiento diagonal-derecha.
- `comerFichaDI(ColorMiFicha, ColorFichaQueComere, FilaDestino, ColumnaDestino)`: Si una ficha de color distinto está en una posición adecuada para ser comida, esta función la come en el movimiento diagonal-izquierda.

#### Instrucciones

1. Inicia el juego ejecutando el predicado `jugar`.
2. Sigue las instrucciones que aparecen en la consola.
3. Utiliza los comandos mencionados para realizar tus movimientos y comidas.

### Ejemplo de Uso

```prolog
?- consult("~/workSpace/practica1-IA/src/damas.pl").
true.

?- jugar.
Bienvenido a una versión de el juego de damas
Para visualizar el tablero (casilla por casilla), escribe: casillaTablero(Ficha, Fila, Columna)
Para realizar un movimiento diagonal-derecha escribe: movimientoDD(ColorFicha, FilaDestino, ColumnaDestino)
Para realizar un movimiento diagonal-izquierda escribe: movimientoDI(ColorFicha, FilaDestino, ColumnaDestino)
Las Ficha solo se podrá definir como negra o blanca
Si tiene una ficha de color distinto delante diagonal-derecha y la quiere comer escriba: comerFichaDD(ColorMiFicha, FichaQueComere, FilaDestino, ColumnaDestino)
Si tiene una ficha de color distinto delante diagonal-izquierda y la quiere comer escriba: comerFichaDI(ColorMiFicha, FichaQueComere, FilaDestino, ColumnaDestino)
true.

?- casillaTablero(Ficha, Fila, Columna).
Ficha = blanca,
Fila = 2,
Columna = 1 ;
Ficha = blanca,
Fila = 3,
Columna = 2 ;
Ficha = blanca,
Fila = 1,
Columna = 2 .

?- movimientoDD(blanca,4,3).
true .

?- casillaTablero(Ficha, Fila, Columna).
Ficha = blanca,
Fila = 4,
Columna = 3 .

?- movimientoDD(negra,5,4).
true.

?- casillaTablero(Ficha, Fila, Columna).
Ficha = negra,
Fila = 5,
Columna = 4 ;
Ficha = blanca,
Fila = 4,
Columna = 3 .

?- movimientoDI(blanca,4,7).
true .

?- casillaTablero(Ficha, Fila, Columna).
Ficha = blanca,
Fila = 4,
Columna = 7 ;
Ficha = negra,
Fila = 5,
Columna = 4 ;
Ficha = blanca,
Fila = 4,
Columna = 3 .

?- comerFichaDD(negra, blanca, 3, 2).
true .

?- casillaTablero(Ficha, Fila, Columna).
Ficha = negra,
Fila = 3,
Columna = 2 ;
Ficha = blanca,
Fila = 4,
Columna = 7 ;
Ficha = blanca,
Fila = 2,
Columna = 1 .

?-
``
