%  -*-prolog-*-
%
%  Riding Stable Puzzle
%
%  Last Saturday, all six of the horses in Johnson Stables were rented to children for the day, all
%  of them regulars. Each of the horses (whose names are Boris, Hunter, Lady, Ranger, Santa
%  Fe, and Topper) lives in one of the six stalls, numbered one to six from west to east. The
%  children included three boys (Brian, Curtis, and Roy) and three girls (Lily, Michelle, and
%  Theresa), each a different age (15, 14, 12, 10, 9, and 7 years old).
%
%  Coded by Huachao Li, adopted from Zebra Puzzle's Solution(by Jonathan Mohr) 
%  


%  Invoke this predicate if you just want to see the answer to the
%  question posed at the end of the puzzle.
% 
   solve :-
    solve(S),
% Write the solution in formatted form.
   write_solution(S).

   write_horse(santa_fe) :-
     write('Santa Fe ').
     capitalize(santa_fe, "Santa Fe").



%  Invoke this predicate (with a variable parameter) if you want to
%  see a complete solution.
solve(S) :-

% There are six houses.(whose names are Boris, Hunter, Lady, Ranger, Santa Fe, and Topper)
% Six house live in six stalls.(From NO.1 to NO.6) From west to east.
% They included three boys (Brian, Curtis, and Roy) and three girls (Lily, Michelle, and Theresa)
% They are all in different ages (15, 14, 12, 10, 9, and 7 years old).


% (The constraints that all colors, etc., are different can only be
% applied after all or most of the variables have been instantiated.
% See below.)

% S = [[Horse1, child1, age1] |_]
% The order of the sublists is the order of the houses, west to east.
    S = [[H1,C1,A1],
         [H2,C2,A2],
         [H3,C3,A3],
         [H4,C4,A4],
         [H5,C5,A5],
         [H6,C6,A6]],
 
 valid_age(15),
 valid_age(14),
 valid_age(12),
 valid_age(10),
 valid_age(9),
 valid_age(7),
 
 valid_child('Brian'),
 valid_child('Curtis'),
 valid_child('Roy'),
 valid_child('Lily'),
 valid_child('Michelle'),
 valid_child('Theresa'),
 
 is_girl('Lily'),
 is_girl('Michelle'),
 is_girl('Theresa'),
 
 valid_hourse('Boris'),
 valid_hourse('Hunter'),
 valid_hourse('Lady'),
 valid_hourse('Ranger'), 
 valid_hourse('Santa Fe'), 
 valid_hourse('Topper'),
 
 


 three_year_older([Hourse1, Child1, Age1], [Hourse2, Child2, Age2], S):-
   valid_age(Age1),
   valid_age(Age2),
   valid_child(Child1),
   valid_child(Child2),
   valid_hourse(Hourse1),
   valid_hourse(Hourse2),
   Age1 - Age2 = 3,
   member([Hourse1, Child1, Age1], S),
   member([Hourse2, Child2, Age2], S).
   
 two_year_older([Hourse1, Child1, Age1], [Hourse2, Child2, Age2], S):-
   valid_age(Age1),
   valid_age(Age2),
   valid_child(Child1),
   valid_child(Child2),
   valid_hourse(Hourse1),
   valid_hourse(Hourse2),
   Age1 - Age2 = 2,
   member([Hourse1, Child1, Age1], S),
   member([Hourse2, Child2, Age2], S).
   
 one_year_older([Hourse1, Child1, Age1], [Hourse2, Child2, Age2], S):-
   valid_age(Age1),
   valid_age(Age2),
   valid_child(Child1),
   valid_child(Child2),
   valid_hourse(Hourse1),
   valid_hourse(Hourse2),
   Age1 - Age2 = 1,
   member([Hourse1, Child1, Age1], S),
   member([Hourse2, Child2, Age2], S).
    
   
 two_more_stalls_east_of([Hourse1, Child1, Age1], [Hourse2, Child2, Age2], S):-
    valid_age(Age1),
    valid_age(Age2),
    valid_child(Child1),
    valid_child(Child2),
    valid_hourse(Hourse1),
    valid_hourse(Hourse2),
    westOf([Hourse2, Child2, Age2], Y, S),
    westOf(Y, [Hourse1, Child1, Age1], S).
 

west_of([Hourse1, Child1, Age1], [Hourse2, Child2, Age2], [[Hourse1, Child1, Age1], [Hourse2, Child2, Age2] |_]).
west_of([Hourse1, Child1, Age1], [Hourse2, Child2, Age2], [_| Rest ]) :-
    valid_age(Age1),
    valid_age(Age2),
    valid_child(Child1),
    valid_child(Child2),
    valid_hourse(Hourse1),
    valid_hourse(Hourse2),
    west_of([Hourse1, Child1, Age1], [Hourse2, Child2, Age2], Rest).
    
    
next_to([Hourse1, Child1, Age1], [Hourse2, Child2, Age2], S) :-
   valid_age(Age1),
   valid_age(Age2),
   valid_child(Child1),
   valid_child(Child2),
   valid_hourse(Hourse1),
   valid_hourse(Hourse2),
   west_of([Hourse1, Child1, Age1], [Hourse2, Child2, Age2], S).
next_to([Hourse1, Child1, Age1], [Hourse2, Child2, Age2], S) :-
   valid_age(Age1),
   valid_age(Age2),
   valid_child(Child1),
   valid_child(Child2),
   valid_hourse(Hourse1),
   valid_hourse(Hourse2),
   west_of([Hourse2, Child2, Age2], [Hourse1, Child1, Age1], S).



% 1. Topper lives two or more stalls to the east of Theresa¡¯s horse.
    two_more_stalls_east_of(['Topper', _, _], [_, 'Theresa', _], S),
    
% 2. The nine-year-old¡¯s horse lives somewhere to the west of Brian¡¯s horse.
    west_of([_, _, 9], [_, 'Brian', _], S),
    
% 3. Three horses in consecutive stalls, from west to east, are Boris, Brian¡¯s horse, and the
%     12-year-old¡¯s horse.
    west_of(['Boris', _, _], [_, 'Brian', _], S),
    west_of([_, 'Brian', _], [_, _, 12], S),
    next_to([_, 'Brian', _], [_, _, 12], S),
    next_to([_, 'Brian', _], [_, _, 12], S),
    
    

    
% 4. The child who rode Topper is three years older than the one who rode the horse in stall 4,
%     while Roy is three years older than Michelle. (These are 4 different children).
    three_year_older(['Topper', who, _], [H4,C4,A4], S),
    three_year_older([_, 'Roy', _], [_, 'Michelle', _], S),
    who \== 'Roy',
    who \== 'Michelle',
    C4 \== 'Roy',
    C4 \== 'Michelle',
    
% 5. Ranger¡¯s rider is three years older than Lily, who in turn is two years older than the girl who rode Lady.
    three_year_older(['Ranger', _, _], [_, 'Lily', _], S),
    two_year_older([_, 'Lily', _], ['Lady', who, _], S),
    is_girl(who),
    
% 6. Santa Fe lives somewhere to the west of Curtis¡¯s horse.
    west_of(['Santa Fe', _, _], [_, 'Curtis', _]S),
  
% 7. Brian is just one year older than Theresa.
    one_year_older([_, 'Brian', _], [_, 'Theresa', _]S),
    
% 8. Roy didn¡¯t ride the horse in stall 6.
    C6 \== 'Roy'

%
% The puzzle is so constrained that the following checks are not really
% required, but I include them for completeness (since one would not
% know in advance of solving the puzzle if it were fully constrained
% or not).
%
% Each house has its own unique name.
    N1 \== N2, N1 \== N3, N1 \== N4, N1 \== N5, N1 \== N6,
    N2 \== N3, N2 \== N4, N2 \== N5, N2 \== N6,
    N3 \== N4, N3 \== N5, N3 \== N6, 
    N4 \== N5, N4 \== N6,
    N5 \== N6, 
    
% All house owners are of different name.
    C1 \== C2, C1 \== C3, C1 \== C4, C1 \== C5, C1 \== C6,
    C2 \== C3, C2 \== C4, C2 \== C5, C2 \== C6,
    C3 \== C4, C3 \== C5, C3 \== C6,
    C4 \== C5, C4 \== C6,
    C5 \== C6,
    
% All hourses have different ages.
    A1 \== A2, A1 \== A3, A1 \== A4, A1 \== A5, A1 \== A6,
    A2 \== A3, A2 \== A4, A2 \== A5, A2 \== A6,
    A3 \== A4, A3 \== A5, A3 \== A6,
    A4 \== A5, A4 \== A6,
    A5 \== A6,
    




