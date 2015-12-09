require_relative 'people_parser'

def print_stars
  "\n" + "*"*50 + "\n\n"
end  

files = ["inputs/input1.txt", "inputs/input2.txt", "inputs/input3.txt"]
parse = PeopleParser.new(files)

parse.sort_by_attributes_asc(["gender", "last_name"])
puts parse.to_s
puts print_stars

parse.sort_by_attributes_asc(["birth_date", "last_name"])
puts parse.to_s
puts print_stars

parse.sort_by_attribute_desc("last_name")
puts parse.to_s
puts print_stars

