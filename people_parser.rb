require 'pry'
require_relative 'person'
require_relative 'parser'

class PeopleParser

  include Parser

  def initialize(file_names)
    @files = file_names
    @people = nil
  end  

  def import_files
    people_data = @files.map { |file| import(file)}.flatten
    @people = people_data.map { |person| Person.new(person)}
  end  

  def save_file(file, data)
    formatted_data = dates_to_string
    people_objects = convert_object_to_hash(formatted_data)
    # binding.pry
    save(file, people_objects)
  end  

  def sort_by_attributes_asc(file, attributes)
    sorted_people = @people.sort_by do |person| 
      attributes.map { |attrib| person.instance_variable_get("@#{attrib}") }
    end  
    save_file(file, sorted_people)
  end  

  def sort_by_birth(file)
    # binding.pry
    sorted = @people.sort_by { |person| [person.birth_date, person.last_name]}
    save_file(file, sorted)
  end  

  def sort_by_attribute_desc(file, attribute)
    sorted_people = @people.sort do |person1, person2| 
      person2.instance_variable_get("@#{attribute}") <=> person1.instance_variable_get("@#{attribute}") 
    end  
    save_file(file, sorted_people)
  end  

  private

  def convert_object_to_hash(data)
    data.each_with_object([]) do |obj, obj_array|
      hash = {}
      obj.instance_variables.map {|headers| hash[headers.to_s.delete("@")] = obj.instance_variable_get(headers) }
      obj_array << hash
    end
  end 

  def dates_to_string
    @people.each {|person| person.birth_date = person.display_birth_date }
  end  

end

files = ["inputs/input1.txt", "inputs/input2.txt", "inputs/input3.txt"]
parse = PeopleParser.new(files)
parse.import_files
parse.sort_by_attributes_asc("outputs/output1.txt", ["gender", "last_name"])
parse.sort_by_birth("outputs/output2.txt")
parse.sort_by_attribute_desc("outputs/output3.txt", "last_name")
