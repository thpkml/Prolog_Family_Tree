parent(chabi, kamal).
parent(chabi, pratik).
parent(santi, pratik).
parent(santi, kamal).
parent(chabi, mina).
parent(santi, mina).
parent(tilak, chabi).
parent(gauri, chabi).
parent(shiv, santi).
parent(devi, santi).
parent(mina, sambav).
parent(mina, prakriti).

male(chabi).
male(kamal).
male(pratik).
male(tilak).
male(sambav).
male(shiv).

female(santi).
female(gauri).
female(devi).
female(mina).
female(prakriti).

grandparent(X, Y):-
	parent(X, Z),
	parent(Z, Y),
	write(X), write(' is '), write(Y), write('\'s grandparent').

grandfather(X, Y):-
	parent(X, Z),
	parent(Z, Y),
	male(X),
	write(X), write(' is '), write(Y), write('\'s grandfather').

grandmother(X, Y):-
	parent(X, Z),
	parent(Z, Y),
	female(X),
	format('~w ~s ~w ~s grandmother ~n', [X, 'is', Y, '\'s']).
	/* w - variable, s - string, n - newline, \ - escape char */

father(X, Y):-
	parent(X, Y),
	male(X),
	write(X), write(' is '), write(Y), write('\'s father').

mother(X, Y):-
	parent(X, Y),
	female(X),
	write(X), write(' is '), write(Y), write('\'s mother').

grandfatherM(X, Y):-
	mother(Z, Y),
	father(X, Z),
	write(X), write(' is '), write(Y), write('\'s mom\'s father').

grandmotherM(X, Y):-
	mother(Z, Y),
	mother(X, Z),
	write(X), write(' is '), write(Y), write('\'s mom\'s mother').

grandfatherF(X, Y):-
	father(Z, Y),
	father(X, Z),
	write(X), write(' is '), write(Y), write('\'s dad\'s father').

grandmotherF(X, Y):-
	father(Z, Y),
	mother(X, Z),
	write(X), write(' is '), write(Y), write('\'s dad\'s mother').

greatgrandparent(X, Y):-
	grandparent(X, Z),
	parent(Z, Y),
	write(X), write(' is '), write(Y), write('\'s greatgrandparent').

greatgrandpa(X, Y):-
	greatgrandparent(X, Y),
	male(X),
	write(X), write(' is '), write(Y), write('\'s greatgrandpa').

greatgrandma(X, Y):-
	greatgrandparent(X, Y),
	female(X),
	write(X), write(' is '), write(Y), write('\'s greatgrandma').

sister(X, Y):-
	parent(Z, X),
	parent(Z, Y),
	female(X),
	not(X = Y),
	write(X), write(' is '), write(Y), write('\'s sister').

brother(X, Y):-
	parent(Z, X),
	parent(Z, Y),
	male(X),
	not(X = Y),
	write(X), write(' is '), write(Y), write('\'s brother').

niece(X, Y):-
	parent(Z, X),
	sister(Z, Y),
	female(X),
	write(X), write(' is '), write(Y), write('\'s niece').

nephew(X, Y):-
	parent(Z, X),
	sister(Z, Y),
	male(X),
	write(X), write(' is '), write(Y), write('\'s nephew').

maternaluncle(X, Y):-
	mother(Z, Y),
	brother(X, Z),
	write(X), write(' is '), write(Y), write('\'s maternaluncle'), nl.
