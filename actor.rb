class Actor
  def initialize(block)
    @queue = Queue.new
    @block = block
  end

  def work(thing)
    @queue << thing
  end

  def run
    Thread.new do
      loop do
        work = @queue.pop
        @block.call(work)
      end
    end
  end
end

class MTActor
  def initialize(block, threads = 4)
    @threads = (1..threads).map { Actor.new(block) }
  end

  def start_workers
    @threads.each(&:run)
  end

  def workers
    @workers ||= @threads.cycle
  end

  def work(thing)
    workers.next.work(thing)
  end
end
