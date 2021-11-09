% Home 04

% Problem 1

score(test,xenia,50).
score(test,alice,99).
score(test,bruce,22).
score(test,carol,77).
score(test,dorit,50).
score(test,erica,22).
score(exam,peter,42).
score(exam,alice,11).
score(exam,bruce,88).
score(exam,carol,33).
score(exam,dorit,50).
score(exam,erica,66).
score(exam,james,77).

% 1.1
students_aux(A) :- score(_, A, _).
students(S) :- setof(A, students_aux(A), S).

% 1.2
money_help :- score(exam, _, R), R > 40.
money(M) :- findall(_, money_help, Y), length(Y, L), M is L * 1000.


% Problem 2





% Problem 3
/* 
Imp (Uni p[0]) (p[a]) 

AlphaImp
  Neg (Uni p[0])
  p[a]
GammaUni
  Neg p[a]
  p[a]
Ext
  p[a]
  Neg p[a]
Basic
 */

/* 

Imp (p[a,a]) (Exi Exi p[1,0])

AlphaImp
	Neg p[a,a]
	Exi Exi p[1,0]
Ext
	Exi Exi p[1,0]
	Neg p[a,a]
GammaExi
	Exi p[a,0]
	Neg p[a,a]
GammaExi
	p[a,a]
	Neg p[a,a]
Basic

*/

/* 
Imp (Con (Uni p[0]) (Uni q[0])) (Uni (Con p[0] q[0]))

AlphaImp
	Neg (Con (Uni p[0]) (Uni q[0]))
	Uni (Con p[0] q[0])
AlphaCon
	Neg (Uni p[0])
	Neg (Uni q[0])
	Uni (Con p[0] q[0])
Ext
	Uni (Con p[0] q[0])
	Neg (Uni p[0])
	Neg (Uni q[0])
DeltaUni
	Con p[a] q[a]
	Neg (Uni p[0])
	Neg (Uni q[0])
Ext
	Neg (Uni p[0])
	Neg (Uni q[0])
	Con p[a] q[a]
GammaUni
	Neg p[a]
	Neg (Uni q[0])
	Con p[a] q[a]
Ext
	Neg (Uni q[0])
	Neg p[a]
	Con p[a] q[a]
GammaUni
	Neg q[a]
	Neg p[a]
	Con p[a] q[a]
Ext
	Con p[a] q[a]
	Neg q[a]
	Neg p[a]
BetaCon
	p[a] 
	Neg q[a]
	Neg p[a]
+
	q[a]
	Neg q[a]
	Neg p[a]
Basic */