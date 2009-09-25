require 'rubygems'
require 'firewatir'
require 'thread'
require 'deployment'

include FireWatir

class StartBenchmark
  
  
  #######################
  #
  # The following are the setable variables for running the benchmark
  #
  #

  # The webprojects to use in benchmark
  # Ruby array example: ["EA SPORTS", "EA SPORTS FOOTBALL COUK"]
  webprojects = ["EASFCOUKTEST"]
  
  # The authoring server
  authoring = "stageeaswars01.beta.eao.abn-iad.ea.com"
  
  # Snapshot filter
  # Possible values: all, today, week, month
  filter = "today"
  
  # Deployment Targets
  # The number of deployment targets that will be used
  targets = 3
  
  # Timeout
  # Number of seconds to wait for deployment to finish
  timeout = 1800
  #
  #
  ######################

  #Store the running threads
  threads = []
  
  puts "Starting Benchmark Test."
#  #start a thread for each project
#  webprojects.each_index do |i|
#    threads << Thread.new do
#      puts "Threaded Started"
#      port = 9990 + i
#      puts "port: #{port}"
#      profile = "user#{i}"
#      puts "profile: " + profile
#      start_time = Time.now
#      Deployment.new(port, profile, webprojects[i], authoring, filter, targets, timeout)
#      puts "finished #{i} @ #{Time.now - start_time}"
#    end
#  end


  Deployment.new(9997, "default", webprojects[0], authoring, filter, targets, timeout)


  #clean up the threads
#  threads.each {|t| t.join}
  
end
