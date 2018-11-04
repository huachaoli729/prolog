% In the documentation, the pet are assigned as dog or cat, when adding new data,
%     the dog should have a
%        name: dog(A).
%        sex(optional): dogsex(A, SEX).
%        age(optional): dogage(A, AGE).
%        type(optional): dogtype(A, TYPE).
%        natures(different nature use different lines): dognature(A, NATURE).
%     
%     cats are the same rule as dogs'.
%     The owners should have
%        name: owner(B).
%        house type(optional): house(B, TYPE).
%        natures(different nature use different lines,owner's pet(s) natures are 
%            included): ownernature(B, NATURE).
%        
% Nature transformations:
%     quiet, calm ¡ú calm (no match with "active", "energetic", "playful")
%     active/energetic/playful ¡ú ctive/energetic/playful (no match with "calm")
%     chase/fight dogs(owner's pet(s)), house/apartment don't allowed dogs or don't 
%         like dogs ¡ú no dogs(no match with any dog)
%     chase/fight cats(owner's pet(s)), house/apartment don't allowed cats or don't 
%         like cats ¡ú no cats(no match with any cat)
%     like dogs ¡ú with dogs(no match with "no dogs")
%     like cats ¡ú with cats(no match with "no cats")
%     chase/fight/don't like small/large dogs ¡ú no small/large dogs(mo match with 
%         "no small/large dogs"
%     like outdoor exercise with pets ¡ú outdoor exercise(no match with "no outdoor 
%         exercise", "calm")
%     don't like outdoor exercise ¡ú no outdoor exercise(no match with "outdoor exercise")
%     don't like (small) children ¡ú no (small) children(no match with "with children" 
%         or "with small children")
%     owner who has (small)children ¡ú with (small) children(no match with "no (small) 
%         children")
%     well-trained ¡ú well-trained(no match with "no train")
%     no train, didn't train ¡ú no train(no match with "well-trained")
%     
%     If new rules needed, put new lines for rules in notmatch().
%     The pet and owner's information must be in the header of the fact lines, recorded
%         as documention.
%     
% To find out if the adoption matches, use query:
%            match("OWNER NAME", "PET NAME") to see if the adoption matchs(True = match, false = no match)
%    
%     author: Huachao Li,   2016-11-14



%  Milo, a 5-year-old male Shih Tzu. Milo is small and shy so not recommended for a 
%     household with children. He likes quiet cuddles.
% Sierra, a 2-year-old Great Pyrenees. She is a large and energetic and gets along with 
%     some dogs.
% Jack, a 4-year-old Pit Bull. He is calm, cuddly, and well-trained. He would get along
%     with some dogs.
% Chiano, a 2-year-old German Shepherd. He is energetic and would need lots of exercise.
%     He is a big dog and we don't know how he gets along with other animals.
% Zoey, a 4-year-old German Shepherd mix. She is shy and does not get along well with 
%     other dogs. She chases cats so should not live with them. She is well trained.
% Silvos, a 7-year-old Siberian Husky. He is active and loves children. Companionable,
%     energetic, and well-trained, he gets along with some dogs but not others.
% Mouse, a 10-year-old Chihuahua. He is shy and nervous so would be best as an only dog 
%     in a household with no children. He is very vocal and does not need much outdoor 
%     exercise.
% Skeletor, a 2-year-old Greyhound. He is an extremely energetic, playful dog who gets 
%     along with a select few dogs.
% Brooklyn, a 10-year-old Akita. She has a sweet temperament and gets along with some 
%     other dogs, but will constantly chase cats. Although she is older she is not trained.


dog("Milo").
dog("Sierra").
dog("Jack").
dog("Chiano").
dog("Zoey").
dog("Silvos").
dog("Mouse").
dog("Skeletor").
dog("Brooklyn").

dogage("Milo", 5).
dogage("Sierra", 2).
dogage("Jack", 4).
dogage("Chiano", 2).
dogage("Zoey", 4).
dogage("Silvos", 7).
dogage("Mouse", 10).
dogage("Skeletor", 2).
dogage("Brooklyn", 10).

dogsex("Milo", "male").
dogsex("Sierra", "female").
dogsex("Jack", "male").
dogsex("Chiano", "male").
dogsex("Zoey", "female").
dogsex("Silvos", "male").
dogsex("Mouse", "male").
dogsex("Skeletor", "male").
dogsex("Brooklyn", "female").

dogtype("Milo", "Shih Tzu").
dogtype("Sierra", "Great Pyrenees").
dogtype("Jack", "Pit Bull").
dogtype("Chiano", "German Shepherd").
dogtype("Zoey", "German Shepherd mix").
dogtype("Silvos", "Siberian Husky").
dogtype("Mouse", "Chihuahua").
dogtype("Skeletor", "Greyhound").
dogtype("Brooklyn", "Akita").

dogsize("Milo", "small").
dogsize("Sierra", "large").
dogsize("Chiano", "large").

dognature("Milo", "no children").         
dognature("Milo", "quiet cuddles").
dognature("Sierra", "energetic").
dognature("Sierra", "with dogs").
dognature("Jack", "calm").
dognature("Jack", "cuddly").
dognature("Jack", "well-trained").
dognature("Jack", "with dogs").
dognature("Chiano", "energetic").
dognature("Chiano", "no train").
dognature("Chiano", "unknown with other animals").
dognature("Zoey", "shy").
dognature("Zoey", "no dogs").
dognature("Zoey", "no cats").
dognature("Zoey", "well-trained").
dognature("Silvos", "active").
dognature("Silvos", "loves children").
dognature("Silvos", "energetic").
dognature("Silvos", "well-trained").
dognature("Silvos", "with dogs").
dognature("Silvos", "no cats").
dognature("Mouse", "shy").
dognature("Mouse", "no dogs").
dognature("Mouse", "no children").
dognature("Mouse", "no outdoor exercise").
dognature("Skeletor", "energetic").
dognature("Skeletor", "with select few dogs").
dognature("Brooklyn", "sweet temperament").
dognature("Brooklyn", "with dogs").
dognature("Brooklyn", "no cats").
dognature("Brooklyn", "no train").

% Simba, a 5-year-old cat. He is long-hair and quite wild, so both shy and defensive 
%     around other animals.
% Maddie, a 6-month-old kitten. She is sweet and playful.
% Stella, a 2-year-old-cat. She is extremely energetic and does not get along with 
%     other animals or small children.
% Jasper, a 4-year-old-cat. He is calm and gets along with both cats and dogs.


cat("Simba").
cat("Maddie").
cat("Stella").
cat("Jasper").

catage("Simba", 5).
catage("Maddie", 0.5).
catage("Stella", 2).
catage("Jasper", 4).

catsex("Simba", "male").
catsex("Maddie", "female").
catsex("Stella", "female").
catsex("Jasper", "male").

cattype("Simba", "long-hair").

catnature("Simba", "wild").
catnature("Simba", "no dogs").
catnature("Simba", "no cats"). 
catnature("Maddie", "sweet").
catnature("Maddie", "playful").
catnature("Stella", "energetic").
catnature("Stella", "no cats").
catnature("Stella", "no dogs").
catnature("Stella", "no small children").
catnature("Jasper", "calm").
catnature("Jasper", "with dogs").
catnature("Jasper", "with cats").

% Jacqueline, who loves cats and has a house with a yard.
% Chairman, a 14-year-old male cat. Owned by Jacqueline. Chairman is indifferent to 
%     children, would like a cat companion, absolutely hates dogs.
% James, who likes both cats and dogs but lives in an apartment which only 
%     allows cats. He has no pets yet.
% Tarabi, who has a small apartment that allows pets. He is very active and looking 
%     for a dog that he can take hiking on the weekends in the mountains.
% Susie, who has a farm and loves all pets. She has a large dog.
% Sarah, who loves dogs. She has an apartment that allows small dogs and cats. Suvi, an 
%     8-year-old female Pug. Owned by Sarah. Suvi adores large dogs, fights with small
%     dogs, and ignores live-in cats. She tolerates children.
% Maren, who loves dogs, especially large ones, and wants many. She has a house with a 
%     large yard.
% Mia, who has two school-age children and wants a calm dog. She has a house with a yard. 
%     Dion, Mia's partner. He is allergic to cats and prefers large dogs to small.

owner("Jacqueline").
owner("James").
owner("Tarabi").
owner("Susie").
owner("Sarah").
owner("Maren").
owner("Mia").

house("Jacqueline", "house with yard").
house("James", "apartment").
house("Tarabi", "small apartment").
house("Susie", "farm").
house("Sarah", "apartment").
house("Maren", "house with yard").
house("Mia", "house with yard").

ownernature("Jacqueline", "cats").
ownernature("Jacqueline", "no dogs").
ownernature("Jacqueline", "with cats").
ownernature("James", "cats").
ownernature("James", "no dogs").
ownernature("Tarabi", "dogs").
ownernature("Tarabi", "active").
ownernature("Tarabi", "outdoor exercise").
ownernature("Susie", "with dogs").
ownernature("Susie", "dogs").
ownernature("Susie", "cats").
ownernature("Susie", "with large dog").
ownernature("Sarah", "dogs").
ownernature("Sarah", "with small dog").
ownernature("Sarah", "no small dog").
ownernature("Maren", "dogs").
ownernature("Mia", "with small children").
ownernature("Mia", "calm").
ownernature("Mia", "dogs").
ownernature("Mia", "large dog").

petnature(A, B):- dognature(A, B).
petnature(A, B):- catnature(A, B).
notmatch(X, Y):- ownernature(X, "no dogs"), dog(Y). 
notmatch(X, Y):- ownernature(X, "no cats"), cat(Y). 
notmatch(X, Y):- ownernature(X, "with small children"), petnature(Y, "no children").
notmatch(X, Y):- ownernature(X, "with small children"), petnature(Y, "no small children").
notmatch(X, Y):- ownernature(X, "with children"), petnature(Y, "no children").
notmatch(X, Y):- ownernature(X, "with children"), petnature(Y, "no small children").
notmatch(X, Y):- ownernature(X, "with small children"), petnature(Y, "no small children").
notmatch(X, Y):- ownernature(X, "large dog"), dogsize(Y, "small").
notmatch(X, Y):- ownernature(X, "no large dog"), dogsize(Y, "large").
notmatch(X, Y):- ownernature(X, "no small dog"), dogsize(Y, "small").
notmatch(X, Y):- ownernature(X, "small dog"), dogsize(Y, "large").
notmatch(X, Y):- ownernature(X, "with dogs"), petnature(Y, "no dogs").
notmatch(X, Y):- ownernature(X, "with small dogs"), petnature(Y, "no small dogs").
notmatch(X, Y):- ownernature(X, "with large dogs"), petnature(Y, "no large dogs").
notmatch(X, Y):- ownernature(X, "with cats"), petnature(Y, "no cats").
notmatch(X, Y):- ownernature(X, "energetic"), petnature(Y, "clam").
notmatch(X, Y):- ownernature(X, "playful"), petnature(Y, "clam").
notmatch(X, Y):- ownernature(X, "active"), petnature(Y, "clam").
notmatch(X, Y):- ownernature(X, "clam"), petnature(Y, "energetic").
notmatch(X, Y):- ownernature(X, "clam"), petnature(Y, "playful").
notmatch(X, Y):- ownernature(X, "clam"), petnature(Y, "active").
notmatch(X, Y):- ownernature(X, "well-trained"), petnature(Y, "no train").
notmatch(X, Y):- ownernature(X, "no train"), petnature(Y, "well-trained").
notmatch(X, Y):- ownernature(X, "outdoor exercise"), petnature(Y, "no outdoor exercise").
notmatch(X, Y):- ownernature(X, "outdoor exercise"), petnature(Y, "calm").
notmatch(X, Y):- ownernature(X, "calm"), petnature(Y, "outdoor exercise").
notmatch(X, Y):- ownernature(X, "no outdoor exercise"), petnature(Y, "outdoor exercise").
isowner(X):- owner(X).
ispet(Y):- dog(Y); cat(Y).
match(X, Y):- isowner(X), ispet(Y), \+(notmatch(X,Y)).