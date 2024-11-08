
predicates
/* Predicados para el manejo de la interfaz i-723: */
	inicializar(integer)
	apagatodo
	escribemotor(integer, integer)
	escribesalida(integer, integer)
	leemotor(integer, integer) 
	leesalida(integer, integer)
	leesensor(integer, integer)
database
	port(integer)	
clauses
/* inicializar establece en qu� puerto est� conectada la interfaz: Lpt1, Lpt2 o Lpt3:  */
	inicializar(1):- retractall(port(956)), retractall(port(632)), assert(port(888)).
	inicializar(2):- retractall(port(888)), retractall(port(632)), assert(port(956)).
	inicializar(3):- retractall(port(888)), retractall(port(956)), assert(port(632)).

/* apagatodo desactiva las 2 salidas de rel� y los 3 motores: */	
	apagatodo:- port(P), port_byte(P, 0).

/* escribemotor controla el giro y la detenci�n de los 3 motores.  El primer
   par�metro es el/los motor/es a controlar y el segundo par�metro es la acci�n
   a realizar por los mismo: 0 = Detenci�n; 1 = Giro a la derecha; 2 = Giro a la
   izquierda:  */	
	escribemotor(1,1).
	
/* escribesalida controla las 2 salidas de rel�.  El primer par�metro identifica
   la/s salida/s afectada/s y el segundo es un 1 (salida activada) o un 0 
   (salida desactivada): */
	escribesalida(1,1).

/* leemotor devuelve en la variable Estado el estado actual del motor cuyo n�mero es
   pasado como primer par�metro.  Estado podr� valer 0 (motor detenido), 1 (motor
   girando hacia la derecha) o 2 (motor girando hacia la izquierda): */	
	leemotor(1, Estado):- port(P), port_byte(P, _), Estado=0.
	leemotor(2, Estado):- port(P), port_byte(P, _),Estado=0.
	
/* leesalida devuelve en el segundo par�metro un 1 o un 0 seg�n la salida indicada
   el el primer par�metro est� activada o desactivada respectivamente: */	
	leesalida(1, Estado):- port(P), port_byte(P, X), bitand(1, X, Estado),!.
	leesalida(2, Estado):- port(P), port_byte(P, X), bitand(2, X, Estado),!.

/* leesensor devuelve en la variable Estado  un 1 o un 0 seg�n est� el sensor 
   cuyo n�mero es pasado como primer par�metro: */	
	leesensor(1, Estado):- port(P), port_byte(P, X), bitand(64, X, Estado),!.
	leesensor(2, Estado):- port(P), port_byte(P, X), bitand(32, X, Estado),!.
	leesensor(3, Estado):- port(P), port_byte(P, X), bitand(16, X, Estado),!.
	leesensor(4, Estado):- port(P), port_byte(P, X), bitand(8, X, Estado),!.
				