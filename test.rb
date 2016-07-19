load 'ukrainian_codes.rb'

codes = File.open('codes.txt').map {|c| c.gsub(/\n+/,'')}

res = codes.map{|c| UkrainianCodes.edrpou? c}

puts res