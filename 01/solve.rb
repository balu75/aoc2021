prevs = [0,0,0]
result = 0
lnr = 0
prev = 10000
File.readlines('input.txt').each do |line|
  lnr = lnr + 1
  cur = line.to_i
  prevs.shift()
  prevs[2]=cur
  if lnr > 2
    #p prevs
    sum = prevs.sum
    result = result + 1 if sum > prev
    puts "prev: #{prev} sum: #{sum}"
    prev = sum
  end
end
puts "result #{result}"
