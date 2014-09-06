# myfun - my function language

Inspiration.  More of it, and caputred better please!

at x.5 versions we will drop the stdlibN to just stdlib... note it's an odd
number release so it's experimental, therefore every x.6 version will essentially
be the beginning of our LTS line for release x.

fun! side-effect: I'm sure 6.6 (and hopefully the rest of our releases) will
be our best to date the time, proving that we are not afraid of the 6 year
cure.

Primitive Types:

    Bool - Booleans
    Int - Integers - arbitrary precision (via gmp)
    Dec - Decimals - arbitrary precision (via gmp)
    Byte - 0 to 255
    SByte - -127 to 128
    Char - a unicode character
    String - a unicode string

    time? instants? dates? etc?

- Q. What's the "obvious" way to have e.g. UInt and SInt based on Int?

Tuples:

    (x, y) - n-arity...

Lists are cons cells made of tuples.  Since we're going to provide Null
semantics via Maybe/Either type of thing, how do we do empty cons cells?

Abstract Data Types:

adts are implemented on top of tuples I'm thinking...

    adt Gender
      Male
      Female

    adt Person
      name   => String
      age    => Int
      gender => Gender

Person has a default constructor so that it's equivalent to:

    adt Person
      Person
        name   => String
        age    => Int
        gender => Gender

or something, so you could have multiple constructors like

    adt Person
      Person
        name   => String
        age    => Int
        gender => Gender
      AnonymousPerson
        age    => Int
        gender => Gender

    adt Maybe a
      Just
        x => a
      Nothing

    adt Either a b
      Left
        a => a
      Right
        b => b

Functions:

    fmtPerson p => Person = "Person ${p.name} is ${p.age} years old."

    fmtPerson p => AnonymousPerson = "Person John Doe is ${p.age} years old."

Or if you never access any constructor specific fields you could do it by the type:

    fmtPerson p => Person. = "Person ${p.name} is ${p.age} years old."

I don't like this "period before the constructor or after the type" syntax but it
does solve a lot of problems...

We want to be able to allow colliding constructors, which would then be
differentiated by the type, ala Person.Person or Person.AnonymousPerson.

Note that dot accessors are used for both constructors and fields which are the
two things that can belong to an adt.  The difference is constructors are
capitalized and fields are lower.

Then of course you could specify everything fully:

    fmtPerson p => Person.Person = "Person ${p.name} is ${p.age} years old."
    fmtPerson p => Person.AnonymousPerson = "Person John Doe is ${p.age} years old."

which would be necessary if for example you had conflicting constructors from
two different types.

These obviously requires a person on the left, and also can be optimized because
it knows that, and in fact it should be optimized all the way out to cached
strings one per instance ever only generated once per lifetime of the runtime.

## String Interpolation

We basically want the same story from yesod or happstack or whatever with the
HTMLString type that has to be explicitly converted to a safestring or whatever.

So, how's this..

## Function Arguments aka LHS Matches

The LHS matches on constructors not types, hence p:Person is the first
constructor not the type. (and p:AnonymousPerson is obviously the
constructor). (This won't apply if we use the dot before/after approach).

Everything so far is immutable.

Everything so far is strict.

Laziness? Yay or nay?


## Data structures...

verything built on tuples

TODO:
- STUDY THE IMPLEMENTATIONS OF CLOJURE DATA STRUCTURES.

Lists via cons cells...
Trees via (V, L, R) or (L, V, R) or (child1, child2, ...childN) ...whatever.

Need vectors so we can do hash tables

Wither arrays or n-sized blocks of memory?

How do we do interfaces, because clearly we need them if we're going to do all
those implementations....

It's changing rapidly so check the source to be sure but something like this, perhaps:

    interface Heap
      heap
        cmp  => a => Bool
        a... => a
             -> Heap a


      # find the min/max
      extreme
        h => Heap a
          -> a

      insert
        h => Heap a
        a => a
          -> Heap a

      merge
        a1 => Heap a
        a2 => Heap a
           -> Hep a

then and an example implementation might be like:

    adt BionomialHeap
      heap
        cmp  => a => Bool
        a... => a
             -> Heap a
    = undefined

Interfaces are "implemented" automatically like in go.

etc.

PLOT TWIST: STATIC SINGLE ASSIGNMENT.

Like erlang.  One you say X = 5, X is 5 till the end of time in that scope.

Reload modules like in erlang.

OTPish?

PLOT TWIST: let blocks to shadow local scope

# Influences

Roughly in order of magnitude of influence:

- Clojure
- Haskell
- Scheme
- Erlang
- CoffeeScript
- Javascript ...I hate it but it got some stuff really right.
