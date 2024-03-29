predicates
	nondeterm male(symbol)
	nondeterm female(symbol)
	
	nondeterm parent(symbol, symbol)
	nondeterm father(symbol, symbol)
	nondeterm mother(symbol, symbol)
	
	nondeterm couple(symbol, symbol)
	nondeterm sibling(symbol, symbol)
	
	nondeterm child(symbol, symbol)
	nondeterm son(symbol, symbol)
	nondeterm daughter(symbol, symbol)
	nondeterm brother(symbol, symbol)
	nondeterm sister(symbol, symbol)
	
	nondeterm grandparent(symbol, symbol)
	nondeterm grandfather(symbol, symbol)
	nondeterm grandmother(symbol, symbol)
	nondeterm grandchild(symbol, symbol)
	nondeterm grandson(symbol, symbol)
	nondeterm granddaughter(symbol, symbol)
	
	nondeterm greatgrandparent(symbol, symbol)
	nondeterm greatgrandfather(symbol, symbol)
	nondeterm greatgrandmother(symbol, symbol)
	nondeterm greatgrandchild(symbol, symbol)
	nondeterm greatgrandson(symbol, symbol)
	nondeterm greatgranddaughter(symbol, symbol)
	
	nondeterm greatgreatgrandparent(symbol, symbol)
	nondeterm greatgreatgrandfather(symbol, symbol)
	nondeterm greatgreatgrandmother(symbol, symbol)
	nondeterm greatgreatgrandchild(symbol, symbol)
	nondeterm greatgreatgrandson(symbol, symbol)
	nondeterm greatgreatgranddaughter(symbol, symbol)
	
	nondeterm uncle(symbol, symbol)
	nondeterm aunt(symbol, symbol)
	nondeterm cousin(symbol, symbol)
	nondeterm nephew(symbol, symbol)
	nondeterm niece(symbol, symbol)
	
	nondeterm ancestor(symbol, symbol)
	nondeterm descendant(symbol, symbol)
	nondeterm samebloodline(symbol, symbol)
		
clauses
	male("Alexey").
	male("Fedor II").
	male("Ivan V").
	male("Herzorg Meklenbursky").
	male("Prince Anton Brownschweighsky").
	male("Ivan VI").
	male("Petr I").
	male("Herzog Golsteinsky").
	male("Petr III").	
	
	mother("Mariya Miloslavskaya", "Sofiya").
	mother("Mariya Miloslavskaya", "Ivan V").
	mother("Mariya Miloslavskaya", "Fedor II").
	mother("Natalya Naryshkina", "Petr I").
	mother("Ekaterina I", "Anna").
	mother("Ekaterina I", "Elizaveta").
	mother("Ekaterina", "Anna Lesopoldovna").
	mother("Anna", "Petr III").
	mother("Anna Lesopoldovna", "Ivan VI").
	mother("Anna", "Ekaterina II").
	
	father("Alexey", "Sofiya").
	father("Alexey", "Ivan V").
	father("Alexey", "Fedor II").
	father("Alexey", "Petr I").
	father("Alexey", "Ekaterina I").
	father("Ivan V", "Anna Ioanovna").
	father("Ivan V", "Ekaterina").
	father("Petr I", "Anna").
	father("Petr I", "Elizaveta").
	father("Herzorg Meklenbursky", "Anna Lesopoldovna").
	father("Herzog Golsteinsky", "Petr III").
	father("Prince Anton Brownschweighsky", "Ivan VI").
	father("Herzog Golsteinsky", "Ekaterina II").
	
	female(X) :- not(male(X)).
	
	couple(X, Y) :- father(X, Z), mother(Y, Z).
	
	parent(X, Y) :- father(X, Y); mother(X, Y).
	
	child(X, Y) :- parent(Y, X).
	son(X, Y) :- child(X, Y), male(X).
	daughter(X, Y) :- child(X, Y), female(X).
	
	brother(X, Y) :- sibling(X, Y), male(X), not(X = Y).
	sister(X, Y) :- sibling(Y, X), female(X), not (X = Y).
	sibling(X, Y) :- father(Z, X), father(Z, Y), mother(V, X), mother(V, Y), not(X = Y). 
	
	grandparent(X, Y) :- parent(X, Z) , parent(Z, Y).
	grandfather(X, Y) :- grandparent(X, Y) , male(X).
	grandmother(X, Y) :- grandparent(X, Y) , female(X).
	grandchild(X, Y) :- grandparent(Y, X).
	grandson(X, Y) :- grandchild(X, Y) , male(X).
	granddaughter(X, Y) :- grandchild(X, Y) , female(X).
	
	greatgrandparent(X, Y) :- grandparent(X, Z) , parent(Z, Y).
	greatgrandfather(X, Y) :- greatgrandparent(X, Y) , male(X).
	greatgrandmother(X, Y) :- greatgrandparent(X, Y) , female(X).
	greatgrandchild(X, Y) :- greatgrandparent(Y, X).
	greatgrandson(X, Y) :- greatgrandchild(X, Y), male(X).
	greatgranddaughter(X, Y) :- greatgrandchild(X, Y), female(X).
	
	greatgreatgrandparent(X, Y) :- greatgrandparent(X, Z) , parent(Z, Y).
	greatgreatgrandfather(X, Y) :- greatgreatgrandparent(X, Y) , male(X).
	greatgreatgrandmother(X, Y) :- greatgreatgrandparent(X, Y) , female(X).
	greatgreatgrandchild(X, Y) :- greatgreatgrandparent(Y, X).
	greatgreatgrandson(X, Y) :- greatgreatgrandchild(X, Y), male(X).
	greatgreatgranddaughter(X, Y) :- greatgreatgrandchild(X, Y), female(X).
	
	uncle(X, Y) :- parent(Z, Y), brother(X, Z).
	aunt(X, Y) :- parent(Z, Y), sister(X, Z).
	cousin(X, Y) :- uncle(Z, X), father(Z, Y).
	nephew(X, Y) :- uncle(Y, X), male(X).
	nephew(X, Y) :- aunt(Y, X), male(X).
	niece(X, Y) :- uncle(Y, X), female(X).
	niece(X, Y) :- aunt(Y, X), female(X).
	
	ancestor(X, Y) :- parent(X, Y).
	ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y), not(X = Y).
	descendant(X, Y) :- ancestor(Y, X).
	samebloodline(X, Y) :- ancestor(X, Y) ; descendant(X, Y).
	
goal
	%couple(Who, "Anna").
	%sibling(Who, "Elizaveta").
	%child("Anna", "Petr I").
	daughter("Ekaterina II", "Anna").
	%sibling(Who, "Sofiya").
	%female("Ekaterina II").
