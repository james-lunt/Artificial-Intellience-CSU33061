%James Lunt
%18323467

member(X, [X|_]).                              
member(X, [_|Tail]):- member(X, Tail).

append([], Ys, Ys).
append([X|Xs], Ys, [X|Zs]) :- append(Xs, Ys, Zs).

len([], 0).
len([_ | Tail], Length):- len(Tail, Length1), Length is Length1 + 1,!.   

arc([H|T],Node,Cost,KB) :- member([H|B],KB), append(B,T,Node),
                           len(B,L), Cost is 1+ L/(L+1).

goal([]).

astar(Node,Node,0,KB):- goal(Node).
astar(Node,[Node|Path],Cost, KB):- arc(Node,NextNode,ArcCost,KB),
                              astar(NextNode,Path,AccCost,KB), Cost is AccCost + ArcCost.
							  
							  
