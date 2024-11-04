/* Copyright (c)1998 Juli n da Silva Gillig
   Todos los derechos reservados */   
   
predicates
/* Predicados para el manejo de la interfaz i-723: */
	inicializar(integer)
	apagatodo
	escribemotor(integer, integer)
	escribesalida(integer, integer)
	leemotor(integer, integer) 
	leesalida(integer, integer)
	leesensor(integer, integer)
/* Predicados auxiliares: */
	sal_aux1(integer, integer)
	mot_aux1(integer, integer, integer)
	sen_aux1(integer, integer)
database
	port(integer)	
clauses
/* inicializar: */
	inicializar(1):- retractall(port(956)), retractall(port(632)), assert(port(888)).
	inicializar(2):- retractall(port(888)), retractall(port(632)), assert(port(956)).
	inicializar(3):- retractall(port(888)), retractall(port(956)), assert(port(632)).

/* apagatodo: */
	apagatodo:- port(P), port_byte(P, 0).

/* escribemotor: */
	escribemotor(1,0):- port(P), port_byte(P, Inp), bitor(12, Inp, T),
			    Out=T-12, port_byte(P, Out).
	escribemotor(1,1):- port(P), port_byte(P, Inp), bitor(12, Inp, T),
			    Out=T-8, port_byte(P, Out).
	escribemotor(1,2):- port(P), port_byte(P, Inp), bitor(12, Inp, T),
			    Out=T-4, port_byte(P, Out).
			    
	escribemotor(2,0):- port(P), port_byte(P, Inp), bitor(48, Inp, T),
			    Out=T-48, port_byte(P, Out).
	escribemotor(2,1):- port(P), port_byte(P, Inp), bitor(48, Inp, T),
			    Out=T-32, port_byte(P, Out).
	escribemotor(2,2):- port(P), port_byte(P, Inp), bitor(48, Inp, T),
			    Out=T-16, port_byte(P, Out).

	escribemotor(3,0):- port(P), port_byte(P, Inp), bitor(192, Inp, T),
			    Out=T-192, port_byte(P, Out).
	escribemotor(3,1):- port(P), port_byte(P, Inp), bitor(192, Inp, T),
			    Out=T-128, port_byte(P, Out).
	escribemotor(3,2):- port(P), port_byte(P, Inp), bitor(192, Inp, T),
			    Out=T-64, port_byte(P, Out).
	
/* escribesalida: */	
	escribesalida(1,1):- port(P), port_byte(P, Inp), bitor(1, Inp, Out),
			     port_byte(P, Out).
	escribesalida(2,1):- port(P), port_byte(P, Inp), bitor(2, Inp, Out),
			     port_byte(P, Out).
	escribesalida(12,1):- port(P), port_byte(P, Inp), bitor(3, Inp, Out),
			      port_byte(P, Out).
	escribesalida(21,1):- escribesalida(12,1).
	escribesalida(1,0):- port(P), port_byte(P, Inp), bitor(1, Inp, T),
			     Out=T-1, port_byte(P, Out).
	escribesalida(2,0):- port(P), port_byte(P, Inp), bitor(2, Inp, T),
			     Out=T-2, port_byte(P, Out).
	escribesalida(12,0):- port(P), port_byte(P, Inp), bitor(3, Inp, T),
			      Out=T-3, port_byte(P, Out).
	escribesalida(21,0):-escribesalida(12,0).
			     
/* leemotor: */
	mot_aux1(0, 0, Estado):- Estado = 0,!.
	mot_aux1(DA, 0, Estado):- DA>0, Estado = 1,!.
	mot_aux1(0, IZ, Estado):- IZ>0, Estado = 2,!.
	leemotor(1, Estado):- port(P), port_byte(P, X), bitand(4 ,X, DA),
			      bitand(8, X, IZ), mot_aux1(DA, IZ, Estado).
	leemotor(2, Estado):- port(P), port_byte(P, X), bitand(16 ,X, DA),
			      bitand(32, X, IZ), mot_aux1(DA, IZ, Estado).
	leemotor(3, Estado):- port(P), port_byte(P, X), bitand(64 ,X, DA),
			      bitand(128, X, IZ), mot_aux1(DA, IZ, Estado).

/* leesalida: */
	sal_aux1(X, Estado):- X > 0, Estado = 1,!.
	sal_aux1(0, Estado):- Estado = 0,!.
	leesalida(1, Estado):- port(P), port_byte(P, X), bitand(1, X, T), sal_aux1(T, Estado),!.
	leesalida(2, Estado):- port(P), port_byte(P, X), bitand(2, X, T), sal_aux1(T, Estado),!.

/* leesensor: */
	sen_aux1(X, Estado):- X > 0, Estado = 0,!.
	sen_aux1(0, Estado):- Estado = 1,!.
	leesensor(1, Estado):- port(P), P1=P+1, port_byte(P1, X), 
			       bitand(64, X, T), sen_aux1(T, Estado),!.			       
	leesensor(2, Estado):- port(P), P1=P+1, port_byte(P1, X), 	
			       bitand(32, X, T), sen_aux1(T, Estado),!.			       
	leesensor(3, Estado):- port(P), P1=P+1, port_byte(P1, X),	
			       bitand(16, X, T), sen_aux1(T, Estado),!.			       
	leesensor(4, Estado):- port(P), P1=P+1, port_byte(P1, X),
			       bitand(8, X, T), sen_aux1(T, Estado),!.
				