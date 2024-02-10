predicates
    nondeterm isletter(char).
clauses 
    isletter(Ch) :- 'a'<= Ch, Ch<='z'.
    isletter(Ch) :- 'A'<=Ch, Ch<='Z'.
goal
%isletter('x').		%yes
%isletter('2').		%no
%isletter('hello').	%error: not a char
%isletter(a).		%type_error: wrong object type
%isletter(X).		%error: free(empty) variable in expression
