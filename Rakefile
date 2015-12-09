require_relative "people_parser"

namespace :sort do 

  files = ["inputs/input1.txt", "inputs/input2.txt", "inputs/input3.txt"]
  parser = PeopleParser.new(files)
  puts "\n" + "*"*50 + "\n\n"

  task :gender_last_name_asc do 
    parser.sort_by_attributes_asc(["gender", "last_name"])
  end  

  task :birth_last_name_asc do 
    parser.sort_by_attributes_asc(["birth_date", "last_name"])
  end
  
  task :last_name_desc do 
    parser.sort_by_attribute_desc("last_name")
  end  

  puts parser.to_s
  puts "\n" + "*"*50 + "\n\n"

end  