require_relative "./actor.rb"

def prime?(num)
  i = 3
  while i < Math.sqrt(num)
    return false if (num % i).zero?

    i += 2
  end
  true
end

block = lambda do |range|
  range.each do |i|
    puts "#{i} IS PRIME" if prime?(i)
  end
end

threads = 16
a = MTActor.new(block, threads)
a.start_workers

(3..100_000_000).select(&:odd?).each_slice(50_000_000 / threads) do |range|
  a.work(range)
end
