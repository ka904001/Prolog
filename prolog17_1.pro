domains
	list = integer*
	i = integer

predicates
	nondeterm replace(i, i, list, list)
	nondeterm run()
	nondeterm do(char)
clauses
	replace(_, _, [], []).
	replace(A, X, [A|T], [X|T]).
	replace(A, X, [H|T], [H|T1]):-
		replace(A, X, T, T1).
	run:-
		write("\n******Enter******\n"),
		write(" 1 to start\n"),
		write(" 0 to EXIT\n"),
		write("*****************\n"),
		write(">>"),
		readchar(X),
		write(X),
		nl,
		do(X),
		run.
	do('1'):-
		write("Enter your list>>"),
		readterm(list, List),
		write("Change what>>"),
		readint(A),
		write("Change for>>"),
		readint(X),
		replace_all(A, X, List, Result),
		write("The result is:\n"),
		write(Result).
	do('0'):-
		write("That's all."), exit.
	do(_):-
		write("Bad value\n\n").
	
goal
	run.
