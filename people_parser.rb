require 'pry'
require_relative 'person'
require_relative 'parser'

class PeopleParser

  include Parser

  def initialize(file_names)
    @files = file_names
    @people ||= import_files
  end  

  def sort_by_attributes_asc(file, attributes)
    sorted_people = @people.sort_by do |person| 
      attributes.map { |attrib| person.instance_variable_get("@#{attrib}") }
    end  
    save_file(file, sorted_people)
  end  

  def sort_by_attribute_desc(file, attribute)
    sorted_people = @people.sort do |person1, person2| 
      person2.instance_variable_get("@#{attribute}") <=> person1.instance_variable_get("@#{attribute}") 
    end  
    save_file(file, sorted_people)
  end  

  def to_s
    @people.map do |person|
      person.instance_variables.map { |attrib| person.instance_variable_get(attrib)}.join(" ")
    end.join("\n")
  end  
  
  private

  def import_files
    people_data = @files.map { |file| Parser.import(file)}.flatten
    people_data.map { |person| Person.new(person)}
  end  

  # def convert_to_hash
  #   @people.each_with_object([]) do |person, new_people_array|
  #     hash = {}
  #     person.instance_variables.map {|headers| hash[headers.to_s.delete("@")] = person.instance_variable_get(headers) }
  #     new_people_array << hash
  #   end
  # end


  # def save_file(file, data)
    
  #   Parser.save(file, people_objects)
  # end  

end