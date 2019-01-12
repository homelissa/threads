count = 0
threads = []

1000.times do |i|
 threads[i] = Thread.new do
   # Each sleep sleeps for a random amount of time to simulate extra work (e.g. API request)
   sleep(rand)
   count += 1
 end
end

threads.each(&:join)

puts "count = #{count}"

# The reason why this example worked is that the standard Ruby runtime isn’t capable of parallelism. By default, threads will only execute one at a time on a global variable. With the standard Ruby runtime, you don’t have to worry too much about race conditions.