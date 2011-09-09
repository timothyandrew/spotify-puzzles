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


# A failure is a case where the number of required wins is not reached.
# That is, the number of wins is < need_wins
#
# Each of these cases (i = 0..need_wins) is represents a number of
# failures. We must calculate how many failures exactly.
#
# We compose the set of n winners in two partitions:
#		The first being i (i < need_wins) members of our group (p)
#		The second being the rest (m-p) of the participants
failure = 0
for i in 0...need_wins
	failure += C(p,i) * C(m-p, n-i)
end


#Probability of Success == 1 - (Probability of Failure)
puts 1 - (failure.to_f/total)
