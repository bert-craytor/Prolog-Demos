%% Author:        William Bert Craytor
%% Title:         N Floors, 1 or 2 at a Time
%% Description:   I couldn't resist writing this Prolog program for an interview 
%%                I came across:
%%                Question: How many ways can you go down N floors in
%%                          elevator if you go down only 1 or 2 floors at a time?
%% Date:          August, 2013

start(N) :-      nb_setval(ways,0),
                 nb_setval(totalFloors, N),
                 start1(N), !,
	         nb_getval(ways, OutWays),
	         write('Ways: '), writeln(OutWays).
	    

start1(N) :-           
		 goDown(N,[]),nl, 
		 nb_getval(totalFloors, TotalFloors),
		 fail.   
		 
	        
start1(_).

%% reverse(+List, -ReversedList)
reverse([], []).
reverse([X | Rest], Reversed) :-
    reverse(Rest, RevRest),
    concat(RevRest, [X], Reversed). % append [X] at end

%% empty(+Queue) which succeeds if the Queue is
%%   empty - same implementation as for stacks

%% join(+Item, +OldQueue, -NewQueue)
%%     adds Item to the *end* of the OldQueue
%%     to make NewQueue
join(Item, [], [Item]).
join(Item, [First | Rest], [First | NewRest]) :-
        join(Item, Rest, NewRest).

%% serve(-Item, +OldQueue, -NewQueue)
%%      takes the Item from the head of the
%%      OldQueue to produce the NewQueue
serve(Item, [Item | NewQueue], NewQueue).
%% NB: this does the same thing as pop

%% empty(+Stack) succeeds if the Stack is empty
empty([]).

%% pop(-Item, +OldStack, -NewStack)
%%    takes the Item from the head of the
%%    OldStack to produce the NewStack
pop(Item, [Item | NewStack], NewStack).

%% push(+Item, +OldStack, -NewStack)
%%    adds Item to the *front* of the OldStack
%%    to make NewStack
push(Item, OldStack, [Item | OldStack]).

goDown(0,Stack) :-     writeln('new solution'),
                 nb_getval(ways,OutWays),
		 getSolution(Stack),
		 writeln(''),
	         NewWays is OutWays + 1,
                 nb_setval(ways,NewWays),!.
		 
	       
goDown(N,Stack) :-  nb_getval(totalFloors, TotalFloors),
	            nextSol(TotalFloors,N),
                    (goDown2(N,Stack) ;  goDown1(N,Stack)). 
	      
nextSol(totFloors,floorsLeft) :-  totFloors== floorsLeft,
                 nl,nl, writeln('Next Way').     
nextSol(_,_).	        	        

goDown1(N,Stack) :-   N > 0, 
	         FloorsLeft is N - 1,
		 push(1,Stack,NewStack),  
                 goDown(FloorsLeft,NewStack).
	      
goDown2(N, Stack) :-   N > 1, 
	        FloorsLeft is N - 2,
		push(2,Stack,NewStack),
		goDown(FloorsLeft,NewStack).

getSolution([]).
getSolution([F|Stack]) :-  write(F), write(','),  getSolution(Stack).

 
