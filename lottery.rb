#!/usr/bin/env ruby

#Return the factorial of n
def factorial(n)
	if n < 2
		return 1
	end
	result = 1
	for i in 1..n
		result *= i
	end
	return result
end

#Number of ways of choosing b values from a values. Same as aCb.
def C(a,b)
	return factorial(a)/((factorial(b))*(factorial(a-b)))
end

#Start processing input
list = gets.chomp

# m = Total number of entrants
# n = Total number of winners
#
# t = Number of tickets available to each winner
# p = Number of people in your group
m,n,t,p = list.split(" ").map { |num| num.to_i }

# total = total possible winner combinations
total = C(m,n)

# need_wins = Minimum number of winners needed
need_wins = (p.to_f / t.to_f).ceil


# A success is a case where the number of wins is >= the no. of required wins
#
# Each of these cases (i = need_wins..n) is represents a number of
# successes. We must calculate how many successes exactly.
#
# We compose the set of n winners in two partitions:
#		For the first, we choose i winners from our group (p).
#		For the second, we choose (n-i) winners from the rest of the entrants (m-p). 
#
#	This gives us the total number of ways of composing this list for the given i.
success = 0
for i in need_wins..n
	success += C(p,i) * C(m-p, n-i)
end

#Probability of Success = No. of successes / Total tries
puts (success.to_f/total)
