cbits = []
max = 12
max.times do |x|
  cbits[x] = 0
end

numl = 0
File.readlines('input.txt').each do |line|
  numl+=1
  max.times do |x|
    cbits[x] += line[x].to_i
  end
end

goal = numl / 2

gamma = ""
epsilon = ""

max.times do |x|
  if cbits[x] > goal
    gamma += "1"
    epsilon += "0"
  else
    gamma += "0"
    epsilon += "1"
  end
end

puts "result: #{gamma.to_i(2)*epsilon.to_i(2)}"
