#!/usr/bin/env ruby

require 'Date'
require 'pp'

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
	a = str.split("/")
	a = a.map { |num| num.to_i }

	result = Array.new

	a.permutation { |date|
		if Date.valid_civil?(date[2], date[1], date[0])
			result.push(date)
		end
	}

	if result.length == 0
		return "Date is illegal"
	end

	return find_smallest_date(result)
end

IO.foreach(ARGV[0]) { |line|
	puts PP.pp(bestbefore(line))
}
