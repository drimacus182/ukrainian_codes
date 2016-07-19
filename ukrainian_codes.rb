module UkrainianCodes
	WEIGHTS_OUTER_1 = [1,2,3,4,5,6,7]
	WEIGHTS_INNER_1 = [7,1,2,3,4,5,6]
	WEIGHTS_OUTER_2 = [3,4,5,6,7,8,9]
	WEIGHTS_INNER_2 = [9,3,4,5,6,7,8]


	def self.edrpou? code_str
		code_str = code_str.strip
		return false unless /\A\d{8}\z/.match(code_str)

		code = code_str.split('').map { |c| c.to_i}
		code7 = code[0,7]
		last = code[7]

		if code_str < "30000000" || code_str > "60000000"
			weights = WEIGHTS_OUTER_1
		elsif code_str > "30000000" && code_str < "60000000"
			weights = WEIGHTS_INNER_1
		else
			raise "This aint gonna happen"
		end

		summ = weights.each_with_index.map { |w, i| w * code7[i] }.reduce(:+)
		remainder = summ % 11

		return remainder == last if remainder < 10
	#
		if code_str < "30000000" || code_str > "60000000"
			weights = WEIGHTS_OUTER_2
		elsif code_str > "30000000" && code_str < "60000000"
			weights = WEIGHTS_INNER_2
		else
			raise "This aint gonna happen"
		end

		summ = weights.each_with_index.map { |w, i| w * code7[i] }.reduce(:+)
		remainder = summ % 11

		return remainder == last if remainder < 10
		return last == 0 if remainder == 10
		return false
	end


	def self.ipn? code




	end
end
