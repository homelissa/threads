require 'concurrent'

$stdout.sync = true 

pool = Concurrent::FixedThreadPool.new(3)

6.times do |url|
    pool.post {
        puts 'fetching url...'
        sleep(1)
        puts 'done'
    }
end 

pool.shutdown 
pool.wait_for_termination