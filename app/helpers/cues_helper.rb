module CuesHelper
	def decimal_format(number)
		if number.floor == number
			number.round
		else
			number
		end
	end
end
