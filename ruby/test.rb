load 'ukrainian_codes.rb'

codes = File.open('../data/edrpou.txt').map {|c| c.gsub(/\n+/,'')}

res = codes.map{ |c| UkrainianCodes.edrpou? c}

trues = res.count(true)
falses = res.count(false)

puts "EDRPOU"
puts "True - #{trues}"
puts "False - #{falses}"

codes = File.open('../data/ipn_10.txt').map {|c| c.gsub(/\n+/,'')}

res = codes.map{ |c| UkrainianCodes.ipn? c}

trues = res.count(true)
falses = res.count(false)

puts "IPN 10"
puts "True - #{trues}"
puts "False - #{falses}"

codes = File.open('../data/ipn_12.txt').map {|c| c.gsub(/\n+/,'')}

res = codes.map{ |c| UkrainianCodes.ipn? c}

trues = res.count(true)
falses = res.count(false)

puts "IPN 12"
puts "True - #{trues}"
puts "False - #{falses}"

codes = File.open('../data/ipn_9.txt').map {|c| c.gsub(/\n+/,'')}

res = codes.map{ |c| UkrainianCodes.ipn? c}

trues = res.count(true)
falses = res.count(false)

puts "IPN 9"
puts "True - #{trues}"
puts "False - #{falses}"
