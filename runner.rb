require_relative 'people_parser'

files = ["inputs/input1.txt", "inputs/input2.txt", "inputs/input3.txt"]
parse = PeopleParser.new(files)
puts parse.to_s
# p parse.people
# parse.sort_by_attributes_asc("outputs/output1.txt", ["gender", "last_name"])
# parse.sort_by_birth("outputs/output2.txt")
# parse.sort_by_attribute_desc("outputs/output3.txt", "last_name")
