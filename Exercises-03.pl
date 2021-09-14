% Exercises-03

% 1
membera(X, L2) :- append(_, Y, L2), append([X], _, Y).

% 2
:- ensure_loaded(logic).
/*

?- truthtable(p => q => p). 
valid

?- truthtable((p => q) => p). 
not valid

?- truthtable((p => q => r) => (p => q) => p => r).
valid

?- truthtable( p => (q => r) => (p=> q) => p => r)
valid

?- truthtable(((p => q) => p) => p).
valid

?- truthtable(p => q => p => p).
valid

*/

% 3

/*

(p xor q) xor q = p
p xor (q xor q) = p
p xor 0 = p
p = p

*/

% 6

% Partition for Quicksort

part(_,[],[],[]).
part(X,[Y|Xs],[Y|Ls],Bs) :- X > Y, part(X,Xs,Ls,Bs).
part(X,[Y|Xs],Ls,[Y|Bs]) :- X =< Y, part(X,Xs,Ls,Bs).


% Quicksort
qs([],[]).
qs([H | Tail], L) :-
    part(H, Tail, ST, GTE),
    qs(ST, STsort), qs(GTE, GTEsort),
	append(STsort, [H | GTEsort], L).


