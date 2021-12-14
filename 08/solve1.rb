# frozen_string_literal: true

knowns = [2, 3, 4, 7]

input = []
File.foreach('input.txt') do |l|
  spl = l.gsub('\n', '').split(' | ')
  spl[0] = spl[0].split
  spl[1] = spl[1].split
  input.append spl
end

puts input.to_s

result = 0
input.each do |i|
  # puts '#{i[1]}'
  i[1].each do |k|
    len = k.length
    result += 1 if knowns.include?(len)
  end
end

puts "result: #{result}"
