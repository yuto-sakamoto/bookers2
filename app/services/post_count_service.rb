class PostCountService

  def initialize
  end

  def compare_with_previous(current_count, prev_count)
    return 0 if current_count.zero? || prev_count.zero?
    (current_count / prev_count) * 100
  end

end