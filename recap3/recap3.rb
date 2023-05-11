def no_dupes?(arr)
  count = Hash.new(0)

  arr.each { |ele| count[ele] += 1 }

  count.select{ |k, v| v == 1 }.keys
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arr)
  (0...arr.length - 1).none? { |i| arr[i] == arr[i + 1] }
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true


def char_indices(str)
  count = Hash.new{ |hash, k| hash[k] = [] }

  str.each_char.with_index { |char, i| count[char] << i }

  count
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def longest_streak(str)
   new_str = ""
   longest = ""

   (0...str.length).each do |i|
     if str[i] == str[i - 1] || i == 0
        new_str += str[i]
     else
        new_str = str[i]
     end
   
     if new_str.length >= longest.length
     longest = new_str
     end
    end

   longest
 end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'


def bi_prime?(num)
  prime_factors = []
  (2..num).each { |n| prime_factors << n if (prime?(n)) && (num % n == 0) }

  prime_factors.each_with_index do |fac1, idx1|
    prime_factors.each_with_index do |fac2, idx2|
      if (idx2 > idx1) && ((fac1 * fac2) == num)
         return true
      end
    end
end
false
end

def prime?(num)
  return false if num < 2
    
  (2...num).none? { |factor| num % factor == 0 }
end

p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false