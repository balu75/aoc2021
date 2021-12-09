dur=256
data = File.read("input.txt").split(",").map { |x| x.to_i }
state = Array.new(9) { |x| 0 }
data.each do |f|
  state[f] += 1
end
puts "#{state}"

dur.times do |d|
  nuller = state[0]
  state = state.drop(1)
  state[8] = 0
  state[6]+=nuller
  state[8]+=nuller
end

puts "#{state.sum}"
