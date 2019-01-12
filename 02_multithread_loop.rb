def output(num)
 sleep 1
 puts num
end

start = Time.now

# Create all of the separate threads
threads = (1..10).map { |num| Thread.new { output(num) } }

# Call "join" on each thread instance so it merges back with main thread
threads.each(&:join)

puts "#{Time.now.to_f - start.to_f} seconds to complete."