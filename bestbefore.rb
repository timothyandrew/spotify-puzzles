#!/usr/bin/env ruby

require 'Date'

def find_smallest_date(dates)
	lowest = dates[0]
	for date in dates
		if (date <=> lowest) > 0
			lowest = date
		end
	end
	return lowest
end

def bestbefore(str)
	a = str.split("/").map { |num| num.to_i }

	results = Array.new

	a.permutation { |perm|
		begin
			date = Date.civil(perm[2] < 2000 ? perm[2] + 2000 : perm[2], perm[1], perm[0])
			results.push(date)
		rescue ArgumentError
			#Do nothing
		end
	}

	if results.length == 0
		 puts str[0...-1] + " is illegal"
		 return
	end

	puts find_smallest_date(results).strftime("%Y-%m-%d")
end

IO.foreach(ARGV[0]) { |line|
	bestbefore(line)
}
