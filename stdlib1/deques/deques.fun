# http://www.ccs.neu.edu/racket/pubs/sfp10-kth.pdf
# TODO: Big-O annotations

adt Deque a


deque
  a... => a
       -> Deque a
=

endeque
  q    => Deque a
  a... => a
       -> Deque a
=

head
  q => Deque a
    -> a
=

tail
  q => Deque a
    -> a
=

# TODO:
# Implmentations:
# - Bankers
# - Real-Time
# - Implicit
