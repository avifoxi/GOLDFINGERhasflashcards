def form_error(errors)
  error_array = ''
  errors.each_pair {|key, value| error_array << "#{key}: #{value[0]}<br>"}
  error_array
end
