# Note that this module highlights an interesting point.  Our modules working
# roughly equivalently to python's __init__.py module's but while we obviously
# do switch from .py to .fun, instead of being named __init__.fun we drop the
# dunders and add the restriction that the file be named the same as the module
# it is in, as in this case, lists/lists.fun.

# This decision also result in the inability to create nest modules names that
# repeat like x.x or datetime.datetime.datetime.datetime, etc. I think that's a
# very good thing.

adt List

list
  a... => [a]  # ?
       -> List a
=

cons
  xs => List a
  x => a
    -> List a
= x:xs

first
  x:xs => List a
       -> a
= x

rest
  x:xs => List a
       -> List a
= xs


# TODO
# Implementations:
# - Random Acess
# - Binary Random Access List
# - Skew Binary Random Access List
# - Catenable List
# - VList
# -

# implicit haskell "forall" or equivalent