require 'sinatra'

def caesar_cipher(input, shift_factor)
 
  output = []
  input = input.split('')
  shift_factor = shift_factor.to_i

  input.each { |char|
  
      converted_char = char.ord
      caesar_char = converted_char + shift_factor
  
      if (converted_char >= 97) && (converted_char <= 122)
          if caesar_char > 122
              caesar_char = (caesar_char - 122) + 96
          end
      
      elsif (converted_char >= 65) && (converted_char <= 90)
          if caesar_char > 90
              caesar_char = (caesar_char - 90) + 64
          end
      elsif (converted_char >= 48) && (converted_char <= 57)
          if caesar_char > 57
              caesar_char = (caesar_char - 57) + 47
          end
      else
          caesar_char = char
      end

      output.push(caesar_char.chr)
  }

  return output.join("")
end

get '/' do
    user_input = params['user_input']
    shift_factor = params['shift_factor']

    if !user_input.nil? && !shift_factor.nil?
        encoded_input = caesar_cipher(user_input, shift_factor)
    end
    
    erb :index, :locals => {:encoded_input => encoded_input}
end