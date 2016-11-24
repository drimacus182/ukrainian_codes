module UkrainianCodes
	WEIGHTS_OUTER_1 = [1,2,3,4,5,6,7]
	WEIGHTS_INNER_1 = [7,1,2,3,4,5,6]
	WEIGHTS_OUTER_2 = [3,4,5,6,7,8,9]
	WEIGHTS_INNER_2 = [9,3,4,5,6,7,8]

	def self.edrpou? code_str
		if code_str.nil?
			return false
		end
		
		code_str = code_str.strip
		return false unless /\A\d{8}\z/.match(code_str)

		code = code_str.split('').map { |c| c.to_i }
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
		remainder = (summ % 11) % 10

		return remainder == last
	end


	#####################################################################

	WEIGHTS_IPN_10 = [-1,5,7,9,4,6,10,5,7]
	WEIGHTS_IPN_12_1 = [11,13,17,19,23,29,31,37,41,43,47]
	WEIGHTS_IPN_12_2 = [13,17,19,23,29,31,37,41,43,47,53]
	WEIGHTS_IPN_9_1 = [9,11,13,17,19,23,29,31]
	WEIGHTS_IPN_9_2 = [11,13,17,19,23,29,31,37]

	def self.ipn? code_str
		if code_str.nil?
			return false
		end
		
		code_str = code_str.strip
		if /\A\d{10}\z/.match(code_str)
			code = code_str.split('').map { |c| c.to_i }
			summ = WEIGHTS_IPN_10.each_with_index.map { |w, i| w * code[i] }.reduce(:+)
			remainder = (summ % 11) % 10

			return remainder == code.last
		elsif /\A\d{12}\z/.match(code_str)
			code = code_str.split('').map { |c| c.to_i }
			summ = WEIGHTS_IPN_12_1.each_with_index.map { |w, i| w * code[i] }.reduce(:+)
			remainder = summ % 11

			return remainder == code.last if remainder < 10

			summ = WEIGHTS_IPN_12_2.each_with_index.map { |w, i| w * code[i] }.reduce(:+)
			remainder = (summ % 11) % 10

			return remainder == code.last
		elsif	/\A\d{9}\z/.match(code_str)
			code = code_str.split('').map { |c| c.to_i }
			summ = WEIGHTS_IPN_9_1.each_with_index.map { |w, i| w * code[i] }.reduce(:+)
			remainder = summ % 11

			return remainder == code.last if remainder < 10

			summ = WEIGHTS_IPN_9_2.each_with_index.map { |w, i| w * code[i] }.reduce(:+)
			remainder = (summ % 11) % 10

			return remainder == code.last
		end

		return false
	end
end
