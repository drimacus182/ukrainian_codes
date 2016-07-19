module UkrainianCodes
	def self.edrpou? code_str
		code_str = code_str.strip
		return false unless /\A\d{8}\z/.match(code_str)

		code = code_str.split('').map { |c| c.to_i}
		code7 = code[0,7]
		last = code[7]

		if code_str < "30000000" || code_str > "60000000"
			weights = "1234567"
		elsif code_str > "30000000" && code_str < "60000000"
			weights = "7123456"
		else
			raise "This aint gonna happen"
		end
		weights = weights.split('').map {|c| c.to_i}

		summ = weights.each_with_index.map { |w, i| w * code7[i] }.reduce(:+)
		remainder = summ % 11

		return remainder == last if remainder < 10
	#
		if code_str < "30000000" || code_str > "60000000"
			weights = "3456789"
		elsif code_str > "30000000" && code_str < "60000000"
			weights = "9345678"
		else
			raise "This aint gonna happen"
		end
		weights = weights.split('').map {|c| c.to_i}

		summ = weights.each_with_index.map { |w, i| w * code7[i] }.reduce(:+)
		remainder = summ % 11

		return remainder == last if remainder < 10
		return last == 0 if remainder == 10
		return false
	end

	def self.ipn? code




	end
end
