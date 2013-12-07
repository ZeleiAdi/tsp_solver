class Stopwatch
  @start_time
  @end_time
  def start
    @start_time = Time.now
  end

  def stop
    @end_time = Time.now
  end

  def elapsed_time
    @end_time - @start_time
  end
end