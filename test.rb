load 'ukrainian_codes.rb'

codes = File.open('codes.txt').map {|c| c.gsub(/\n+/,'')}

res = codes.map{|c| UkrainianCodes.edrpou? c}

trues = res.count(true)
falses = res.count(false)


puts "True - #{trues}"
puts "False - #{falses}"