load 'ukrainian_codes.rb'

codes = File.open('edrpou.txt').map {|c| c.gsub(/\n+/,'')}

res = codes.map{ |c| UkrainianCodes.edrpou? c}

trues = res.count(true)
falses = res.count(false)

puts "EDRPOU"
puts "True - #{trues}"
puts "False - #{falses}"

codes = File.open('ipn_10.txt').map {|c| c.gsub(/\n+/,'')}

res = codes.map{ |c| UkrainianCodes.ipn? c}

trues = res.count(true)
falses = res.count(false)

puts "IPN 10"
puts "True - #{trues}"
puts "False - #{falses}"

codes = File.open('ipn_12.txt').map {|c| c.gsub(/\n+/,'')}

res = codes.map{ |c| UkrainianCodes.ipn? c}

trues = res.count(true)
falses = res.count(false)

puts "IPN 12"
puts "True - #{trues}"
puts "False - #{falses}"
