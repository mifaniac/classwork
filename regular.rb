require 'byebug'

regular = /(\@{1,2}[a-z]|[a-zA-Z])[a-z\d_]+|[A-Z][A-Z_\d]+/

a = gets.chomp

if a[regular] == a
  puts 'Идентификатор корректный'
else
  puts 'Идентификатор не корректный'
end
