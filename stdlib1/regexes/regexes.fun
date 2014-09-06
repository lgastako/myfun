adt Match
  Match
    offset       => Int
    length       => Int
    value        => String
    captureGroup => Maybe Int

adt Regex
  # not sure, at first probably just the string and we raw dog it.

compile
  pattern => String
          -> Either Error Regex
=

first
  cre => Regex
  s   => String
      -> Maybe Match
=

all
  cre => Regex
  s   => String
      -> [Match]
=

split
  cre  => Regex
  s    => String
  with => Bool
       -> [Match]
=

replace
  cre => Regex
  new => String
  old => String
      -> String
=
