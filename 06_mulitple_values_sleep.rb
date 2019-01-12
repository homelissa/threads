diff = count1 = count2 = 0
threads = []

1000.times do |i|
 threads[i] = Thread.new do
   sleep(rand)
   count1 += 1
   
   sleep(rand)
   count2 += 1
     
   diff += count1 - count2
 end
end

threads.each(&:join)

puts "count1 : #{count1}"
puts "count2 : #{count2}"
puts "diff : #{diff}"