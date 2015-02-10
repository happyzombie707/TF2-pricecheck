require "json"
require "open-uri"
require "pp"
require_relative "updateCheck.rb"
require_relative "convert.rb"

def command(com)

  case com.split[0]
  when "-$"
    puts "fromcash"
    if com.split[2] == ">>" then
      convert(com.split[0], com.split[1], com.split[3])
    end
  when "-m"
    if com.split[2] == ">>" then
      convert(com.split[0], com.split[1], com.split[3])
    end
  when "-k"
    if com.split[2] == ">>" then
      convert(com.split[0], com.split[1], com.split[3])
    end
  when "-b"
    if com.split[2] == ">>" then
      convert(com.split[0], com.split[1], com.split[3])
    end
  when "-q"
    puts "Quiting..."
  when "-h"
    puts "value prefixes: \n-$ money, -m refined, -k keys, -b buds, -i item, -q exit"
    puts "Use '>>' to show what you are converting to.\nExample: -b 1.2 >> -k will convert 1.2 buds to keys"
  else
    puts "Invalid command, use -h for help."
  end
  return com
end

def main()
  ref, key, bud = checkUpdate()
  setConVal(ref, key, bud)

  puts "CURRENT VALUES: one ref = #{ref} USD, one key = #{key} refined, one earbud = #{bud} keys."
  puts "-----------------------------------------------------------------------------------------\n\n"


  input = ""

  while input != "-q"
      print "> "
      input = command(gets.chomp)
  end
end

main()
