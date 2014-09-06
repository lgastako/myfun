# http://www.ccs.neu.edu/racket/pubs/sfp10-kth.pdf

adt Queue a


# Constracut a queue with the given elements in order.
# O(?)
queue
  a... => a
       -> Queue a
=

# O(?)
enqueue
  q    => Queue a
  a... => a
       -> Queue a
=

# O(?)
head
  q => Queue a
    -> a
=

# O(?)
tail
  q => Queue a
    -> a
=

# TODO:
# Implementations:
# - Bankers
# - Physicists
# - Real-Time
# - Implicit
# - Bootstrapped
# - Hood-Melville
