domains
	i = integer
	list = i*
	listc = char*
predicates
	nondeterm divide_list(list, list, list)
	nondeterm run()
	nondeterm do(char)
clauses
	divide_list([H|T], L, [H|T1]):-
		H>-1,
		divide_list(T, L, T1).
	divide_list([H|T], [H|T1], L):-
		divide_list(T, T1, L).
	divide_list([], [], []).
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
		readterm(list, Source),
		divide_list(Source, R1, R2),
		write(R1, "\n", R2).
	do('0'):-
		write("That's all."), exit.
	do(_):-
		write("Bad value\n\n").
goal
	run.
