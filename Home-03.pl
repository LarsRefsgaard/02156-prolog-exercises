:- ensure_loaded(boolean).


% 1.1
% tt tells whether a given term is a true term, given the input parameters of
% the second argument and being true when this term equals the third argument

% 1.2
boolean :- negate(t,f), negate(f,t), opr(con,t,t,t), opr(con,t,f,f), opr(con,f,t,f), opr(con,f,f,f), opr(dis,t,t,t), opr(dis,t,f,t), opr(dis,f,t,t), opr(dis,f,f,f),opr(eqv,t,t,t), opr(eqv,t,f,f), opr(eqv,f,t,f), opr(eqv,f,f,t), opr(imp,t,t,t), opr(imp,t,f,f), opr(imp,f,t,t), opr(imp,f,f,t).

% 1.3
opr(con,P,Q,R) :- 
    P = Q -> R = P ;
    P = t -> R = Q ;
    Q = t -> R = P ;
    R = f.
opr(dis,P,Q,R) :- 
    negate(P, P1),
    negate(Q, Q1),
    opr(con, P1, Q1, R1),
    negate(R1, R).
opr(eqv,P,Q,R) :- 
    P = Q -> R = t ; 
    P = t -> R = Q ;
    Q = t -> R = P ;
    P = f -> negate(Q, R) ;
    Q = f -> negate(P, R) ;
    R = f.
opr(imp,P,Q,R) :- 
    opr(con, P, Q, N), opr(eqv,N,P,R).


opr :-
    values(L), write('P Q'), write(' '), write(con), write(' '), write(dis), write(' '), write(eqv), write(' '), write(imp),nl,
    member(P,L), member(Q,L), opr(con,P,Q,ConR), opr(dis, P, Q, DisR), opr(eqv, P, Q, EqvR), opr(imp, P, Q, ImpR),
    write(P), write(' '), write(Q), write('  '), write(ConR),write('   '), write(DisR),write('   '), write(EqvR),write('   '), write(ImpR), nl,
    fail.
  negate.


% 1.4

% 4
/* 
(* The shortened proof *)

Imp (Imp p q) (Imp (Dis p r) (Dis q r))

AlphaImp
  Neg (Imp p q)
  Imp (Dis p r) (Dis q r)
Ext
  Imp (Dis p r) (Dis q r)
  Neg (Imp p q)
AlphaImp
  Neg (Dis p r)
  Dis q r
  Neg (Imp p q)
Ext
  Dis q r
  Neg (Dis p r)
  Neg (Imp p q)
AlphaDis
  q
  r
  Neg (Dis p r)
  Neg (Imp p q)
Ext
  Neg (Dis p r)
  Neg (Imp p q)
  q
  r
BetaDis
  Neg p
  Neg (Imp p q)
  q
  r
+
  Neg r
  Neg (Imp p q)
  q
  r
Ext
  Neg (Imp p q)
  Neg p
  q
+
  r
  Neg r
BetaImp
  p
  Neg p
  q
+
  Neg q
  Neg p
  q
+ 
  r
  Neg r
Ext
  p
  Neg p
+ 
  q
  Neg q
+
  r
  Neg r
Basic

*/