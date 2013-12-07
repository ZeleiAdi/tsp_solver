class Stopwatch
  @start_time
  @end_time
  def self.start
    @start_time = Time.now
  end

  def self.stop
    @end_time = Time.now
  end

  def self.elapsed_time
    @end_time - @start_time
  end
end