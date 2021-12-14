input = []
File.foreach("input.txt") do |l|
  spl = l.gsub("\n","").split(" | ")
  spl[0] = spl[0].split
  spl[1] = spl[1].split
  input.append spl
end
puts "#{input}"

result = 0
input.each do |i|
  #puts "#{i[1]}"
  i[1].each do |k|
    len = k.length
    if len == 2 || len == 4 || len == 3 || len == 7
      result += 1
    end
  end
end

puts "result: #{result}"
