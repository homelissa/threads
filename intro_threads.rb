# a thread is a unit of execution
# all processes start with one thread, called the 'main' thread.
# you can spawn multiple threads and give each thread an individual task.

#Concurrency 
# only one task can be active at a time 

# Parallelization 
# many task can be active at the same time 
# what this means is that if you can break a CPU-intensive task (algorithm calculation) into smaller task, you can complete that task faster

threads = []

Thread.abort_on_exception = true 

threads << Thread.new { puts 1 }
threads << Thread.new { puts 2 }
threads << Thread.new { raise 'something' }

puts 123

sleep(3)

threads.map(&:join) #waits until all the threads have finished