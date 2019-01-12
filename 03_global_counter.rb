count = 0
threads = []

1000.times do |i|
 threads[i] = Thread.new do
  count += 1
 end
end

threads.each(&:join)

puts "count = #{count}"