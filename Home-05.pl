
% 1.1
member1([H|L]) :- member(H, L), !.

% 1.2
/* Attempt 1
p([], R) :- 
p([A], R) :-
p(L, R) :- member(A, L), p_helper(A, O), append(O, C), sort(C, R).
*/

/* Attempt 2
p_helper([], L, L).
p_helper(A, L, R) :- member(B, A), p_helper(B, L, O), append(B, O, R).
p(L,R) :- member(A, L), p_helper(A, [], O), append(A, O), sort(O, R).
*/

/* Attempt 3
p_helper([H|T], L) :- member(E, [H|T]), p_helper(E, O), write(E), write(" "), write(O).
p_helper(A, L) :- append(A, L).
p(L,R) :- p_helper(L, A).
*/

% p_helper(L, R) :- member(A, L), append(A, L, R).
p_helper(L, R) :- member(A, L), append(A, L, R1), p_helper(A, R2), append(R1, R2, R).
p(L, R) :- member(A, L), p_helper(A, R).
	
	
% 2.1
:- ensure_loaded(database).

selectlist_helper(A) :- (w(N, _, A, n); w(N, _, A, v)), N =< 100.
selectlist(R) :- setof(A ,selectlist_helper(A), R).

% 2.2
dump :- w(_, _, A, a), w(_, _, A, adv), w(_,_,A,C), C \== a, C \== adv, write(A), write(' '), write(C).


% 3.1


% 4
/* 
Imp (Exi Uni p[1,0]) (Uni Exi p[0,1])

AlphaImp
	Neg (Exi Uni p[1,0])
	(Uni Exi p[0,1])
DeltaExi
	Neg (Uni p[a,0])
	(Uni Exi p[0,1])
Ext
	(Uni Exi p[0,1])
	Neg (Uni p[a,0])
DeltaUni
	Exi p[0,b]
	Neg (Uni p[a,0])
GammaExi
	p[a,b]
	Neg (Uni p[a,0])
Ext
	Neg (Uni p[a,0])
	p[a,b]
GammaUni
	Neg p[a,b]
	p[a,b]
Ext
	p[a,b]
	Neg p[a,b]
Basic
 */