
% 3.1
member2(H,[H,H|_]).
member2(H,[_|T]) :- member2(H,T).

% 3.2
member2a(X, L2) :- append(_, Y, L2), append([X,X], _, Y).
