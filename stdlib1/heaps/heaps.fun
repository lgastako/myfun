# http://www.ccs.neu.edu/racket/pubs/sfp10-kth.pdf

adt Heap a

heap
  cmp  => a => Bool
  a... => a
       -> Heap a
=

# find the min/max
extreme
  h => Heap a
    -> a
=

insert
  h => Heap a
  a => a
    -> Heap a
=

merge
  a1 => Heap a
  a2 => Heap a
     -> Hep a
=

# TODO:
# Implementations:
# - Bionomial
# - Leftist
# - Pairing
# - Splay
# - Skew Binomial
# - Lazy Pairing
# - Bootstrapped
