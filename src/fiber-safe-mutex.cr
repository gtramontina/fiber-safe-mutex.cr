require "deque"

# Extracted from the following Crystal PR, by @technorama:
# https://github.com/manastech/crystal/pull/1399
class FiberSafeMutex
  VERSION = "0.1.0"

  def initialize
    @cur_fiber = nil
    @lock_count = 0
    @mutex = Mutex.new
    @queue = Deque(Fiber).new
  end

  def lock
    have_lock = @mutex.synchronize do
      if cur_fiber = @cur_fiber
        if cur_fiber == Fiber.current # recursive lock
          @lock_count += 1
          true
        else
          @queue << Fiber.current
          false
        end
      else
        @cur_fiber = Fiber.current
        true
      end
    end

    Scheduler.reschedule unless have_lock
    nil
  end

  def unlock
    @mutex.synchronize do
      if @lock_count > 1
        @lock_count -= 1
        return nil
      end

      if fiber = @queue.pop?
        @cur_fiber = fiber
        Scheduler.enqueue fiber
      else
        @cur_fiber = nil
      end
    end
    nil
  end

  def synchronize
    lock
    begin
      yield
    ensure
      unlock
    end
  end
end
