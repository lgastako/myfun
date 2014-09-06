# 2.4.4 Streams
# Streams (Okasaki 1998) are simply lazy lists. They are similar to
# the ordinary lists and they provide the same functionality and API.
# Streams are used in many of the foregoing data structures to achieve
# lazy evaluation. Streams do not change the asymptotic performance
# of any list operations, but introduce overhead at each suspension.
# Since streams have distinct evaluation behavior, they are given a
# distinct type, (Stream A).

