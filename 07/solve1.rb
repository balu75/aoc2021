data = File.read("input.txt").split(",").map { |x| x.to_i }
puts "max: #{data.max}"
min = 1000000000
minpos = -1
data.max.times do |x|
  cost = 0
  data.each do |c|
    cost += (x-c).abs
  end
  puts "cost #{x}: #{cost}"
  if cost < min
    min = cost
    minpos = x
  end
end
puts "min: #{min}"
puts "minpos: #{minpos}"
