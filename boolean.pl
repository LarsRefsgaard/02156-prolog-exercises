% boolean.pl

:- op(650,xfy,eqv).  /* equivalence */ 
:- op(640,xfy,imp).  /* implication */ 
:- op(630,xfy,dis).  /* disjunction */ 
:- op(620,xfy,con).  /* conjunction */ 
:- op(610,fy, neg).  /* negation    */

tt(neg A,  V,TV) :- tt(A,V,TVA), negate(TVA,TV).
tt(A con B,V,TV) :- tt(A,V,TVA), tt(B,V,TVB), opr(con,TVA,TVB,TV).
tt(A dis B,V,TV) :- tt(A,V,TVA), tt(B,V,TVB), opr(dis,TVA,TVB,TV).
tt(A eqv B,V,TV) :- tt(A,V,TVA), tt(B,V,TVB), opr(eqv,TVA,TVB,TV).
tt(A imp B,V,TV) :- tt(A,V,TVA), tt(B,V,TVB), opr(imp,TVA,TVB,TV).
tt(A,      V,TV) :- member((A,TV),V).

/*

negate(t,f). negate(f,t).

opr(con,t,t,t). opr(con,t,f,f). opr(con,f,t,f). opr(con,f,f,f).
opr(dis,t,t,t). opr(dis,t,f,t). opr(dis,f,t,t). opr(dis,f,f,f).
opr(eqv,t,t,t). opr(eqv,t,f,f). opr(eqv,f,t,f). opr(eqv,f,f,t).
opr(imp,t,t,t). opr(imp,t,f,f). opr(imp,f,t,t). opr(imp,f,f,t).

*/

/* 
negate(P,Q) :- P = t -> Q = f ; Q = t.
opr(con,P,Q,R) :- P = t, Q = t -> R = t ; R = f.
opr(dis,P,Q,R) :- P = f, Q = f -> R = f ; R = t.
opr(eqv,P,Q,R) :- P = Q -> R = t ; R = f.
opr(imp,P,Q,R) :- negate(P,N), opr(dis,N,Q,R).
*/



values([t,f,x]).

negate(P,Q) :-
  P = t -> Q = f ;
  P = f -> Q = t ;
  Q = P.

negate :-
  values(L), write(neg), nl,
  member(P,L), negate(P,Q),
  write(P), write(' '), write(Q), nl,
  fail.
negate.



