module Enumerable
  # Your code goes here
  def my_all?
    for element in self
      return false unless yield(element)
    end
    true
  end

  def my_any?
    for element in self
      return true if yield(element)
    end
    false
  end

  def my_none?
    for element in self
      return false if yield(element)
    end
    true
  end

  def my_count
    count = 0
    for element in self
      if block_given?
        count += 1 if yield(element)
      else
        count += 1
      end
    end
    count
  end

  def my_select
    result = []
    for element in self
      result << element if yield(element)
    end
    result
  end

  def my_map
    result = []
    for element in self
      result << yield(element)
    end
    result    
  end

  def my_inject(initial_value = nil)
    if initial_value
      accumulator = initial_value
      index_start = 0
    else
      accumulator = self[0]
      index_start = 1
    end
    
    for element in self[index_start..-1]
      accumulator = yield(accumulator, element)
    end
    accumulator
  end

  def my_each_with_index
    index = 0
    for element in self
      yield(element, index)
      index += 1
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self
      yield(element)
    end
  end
end
