# TODO: Big-O notations.

adt Year
  year Int

  consts:
    minYear = 1     # following python for now... but I'm thinking minInt
    maxYear = 9999  # samsies but...                            ...maxInt

adt Month
  January
  February
  March
  April
  May
  June
  July
  August
  September
  October
  November
  December

adt Day
  day Int

adt Date
  year Year
  month Month
  day Day

Nanoseconds = Int

adt Time
  ns Nanoseconds

adt TimeDelta
  ns Nanoseconds

timeDelta
  t1 => Time
  t2 => Time
     -> TimeDelta
= TimeDelta . map . ns

[ hour, minute, second ] =
 t => Time
   -> X
=

adt Calendar
