create table digit as
select 0 n
union select 1
union select 2
union select 3
union select 4
union select 5
union select 6
union select 7
union select 8
union select 9
;

select n,
case
  when n mod (3 * 5) = 0 then 'fizzbuzz'
  when n mod 3 = 0 then 'fizz'
  when n mod 5 = 0 then 'buzz'
  else n
end fizzbuzz
from(
  select d1.n + d2.n * 10 + 1 n
  from digit d1, digit d2
) d
;