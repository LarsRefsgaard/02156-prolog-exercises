w(5,2186369,a,det).
w(2107,4249,abandon,v).
w(5204,1110,abbey,n).
w(966,10468,ability,n).
w(321,30454,able,a).
w(6277,809,abnormal,a).
w(3862,1744,abolish,v).
w(5085,1154,abolition,n).
w(4341,1471,abortion,n).
w(179,52561,about,adv).
w(69,144554,about,prep).
w(3341,2139,above,a).
w(942,10719,above,adv).
w(786,12889,above,prep).
w(2236,3941,abroad,adv).
w(5106,1146,abruptly,adv).


%1.1
ambigious(W) :- w(_,_,W,X), w(_,_,W,Y), X \== Y.

%1.2
display(N) :- w(X,_,I,J), X < N, write(I), write(' '), write(J).


%3.1
firstLast([H,H]).
firstLast([H1, H2 | Tail]) :- firstLast([H1 | Tail]).

%3.2
firstLastA(L) :- append([H | _], [H], L).



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

%4.1
test(I) :- score(_,_,I).

%4.2
problem :- score(test, N, It), score(exam, N, Ie), It > 2 * Ie, write(N).

/* 

*/