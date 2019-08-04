require 'pry'
class Base

  @min = 0
  @max = 100
  @not_sure_error = 'not sure what to do here'
  @to_many_unit_error = 'more XXX than are in a day'
  @invalid_error = 'is an invalid XXX number'
  @parsing_error = 'error parsing the XXX'
  SPECIAL_CHARS = {:backslash => '/', :dash=> '-',:comma => ',', :star => '*'}

  def self.parser expression
    if expression == @min.to_s
      return @min

    elsif expression == SPECIAL_CHARS[:star]
      return (@min..@max).to_a.join(' ')

    elsif expression.include?(SPECIAL_CHARS[:backslash])
      segments = expression.split(SPECIAL_CHARS[:backslash])
      start_time = segments[0]
      end_time = check_number_isnt_out_of_range segments[1].to_i
      if start_time == SPECIAL_CHARS[:star]
        time_array = [@min]
        end_time_int = end_time.to_i
        until end_time_int > @max
          time_array << end_time_int
          end_time_int = end_time_int + end_time.to_i
        end
        return time_array.join(' ')
      elsif start_time.to_i.class == Fixnum
        raise RuntimeError,  @not_sure_error
      end

    elsif expression.include?(SPECIAL_CHARS[:comma])
      segments = expression.split(SPECIAL_CHARS[:comma]).collect {|seg| seg.to_i}
      segments.each {|seg| check_number_isnt_out_of_range seg}

      return segments.join(' ')
    elsif expression.include?(SPECIAL_CHARS[:dash])
      check_number_isnt_out_of_range expression.to_i
      segments = expression.split(SPECIAL_CHARS[:dash])

      start_time = check_number_isnt_out_of_range segments[0].to_i
      end_time = check_number_isnt_out_of_range segments[1].to_i

      return (start_time..end_time).to_a.join(' ')

    elsif expression.to_i > @max
      raise RuntimeError, @to_many_unit_error
    elsif expression.to_i.class == Fixnum
      if expression.to_i == 0
        raise RuntimeError, "#{expression} #{@invalid_error}"
      else
        return expression
      end
    else
      return raise @parsing_error
    end
  end

  def self.check_number_isnt_out_of_range number
    if number > @max || number < @min
      raise RuntimeError, "#{number} #{@invalid_error}"
    else
      return number
    end
  end
end
