def output(num)
 sleep 1
 puts num
end

start = Time.now

(1..10).each { |num| output(num) }

puts "#{Time.now-start} seconds to complete."