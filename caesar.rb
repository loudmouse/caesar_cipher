#This is my attempt at the caesar cipher project from The Odin Project, here: https://www.theodinproject.com/courses/ruby-programming/lessons/building-blocks
#I imagine Caesar similarly to GLaDOS from the Portal series: https://theportalwiki.com/wiki/GLaDOS
#Feedback is encouraged and can be sent to: https://twitter.com/loudmouse312

#-------------------------

# a method with 2 parameters - 1 for the text you want to cipher, and 1 for the shift number
def caesar_cipher(phrase, shift)
  # creates an empty variable to hold the soon to be ciphered text string
  ciphertext = ''
  # takes each character of the string and gives it its integer value
  phrase.each_codepoint do |asc|
    #uses case statement (when/then) and pushes each ciphered character to the ciphered string variable
    ciphertext << case asc
      #when we're passing a codepoint that relates to a lower case letter between a and z
      when 'a'.ord..'z'.ord
        #take the codepoint value of the letter, then substract from it the value of lowercase a, then add the shift value. Next modulo by 26. And lastly add back the value of lowercase a.
        'a'.ord + (asc - 'a'.ord + shift) % 26
      #but when we're passing a codepoint that relates to an upper case letter between A and Z...
      when 'A'.ord..'Z'.ord
        #take the codepoint value of the letter, then subract from it the value of uppercase A, then add the shift value. Next modulo by 26. Next modulo by 26. Lastly, add back the value of uppercase A.
        'A'.ord + (asc - 'A'.ord + shift) % 26
      else
        #since it's not a lowercase nor uppercase letter we leave it alone and it will be pushed to the ciphertext string as is. This would be the case for punctuation or numbers.
        asc
    #closing out the case (when/then) statement
    end
  #closing out the each_codepoint section
  end
  #returns the ciphertext string based on the conversions made above
  ciphertext
end

#asks user for his/her name and stores it in the string variable called name
puts "Hello, I'm Caesar. What's your name, friend?"
name = gets.chomp

#asks the user to input the text they'd like to have encrypted
puts "What a coincidence! I have a good friend named #{name}. It's nice to meet you, #{name}."
puts "What super-secret phrase would you like to encrypt today, #{name}?"
#stores user input as a string variable
phrase = gets.chomp

#asks the user to input a number which is converted to an integer and saved to the variable shift.
puts "Ooo, that's really very good, and I completely understand why you'd want to encrypt this."
puts "Now tell me, #{name}, what level of encryption would you like to apply?"
puts "I'd recommend a number between 1 and 26."
shift = gets.chomp.to_i

#take the users string and interger input and passes through as arguments to the caesar cipher method which then puts the ciphered string out to the user.
puts "Great, we'll encrypt '#{phrase}' at a level of #{shift}. Excellent choice, #{shift} is my FAVORITE level of encryption."
puts "."
puts "."
puts "Processing"
puts "."
puts "."
puts "Just about there..."
puts "."
puts "."
puts "You're being so patient, and I appreciate that. I'm new to this, you know?"
puts "."
puts "."
puts "Well, here we have it #{name}! Drumroll, please... your encryped entry is:"
puts caesar_cipher(phrase,shift)
