require 'pry'
require_relative 'parser'
require_relative 'person'

class PeopleParser

  include Parser

  def initialize(file_names)
    @files = file_names
    @people ||= import_files
  end  

  def sort_by_attributes_asc(attributes)
    @people.sort_by! do |person| 
      attributes.map { |attrib| person.instance_variable_get("@#{attrib}") }
    end  
  end  

  def sort_by_attribute_desc(attribute)
    @people.sort! do |person1, person2| 
      person2.instance_variable_get("@#{attribute}") <=> person1.instance_variable_get("@#{attribute}") 
    end  
  end  

  def to_s
    @people.map do |person|
      person.instance_variables.map do |attrib| 
        person.instance_variable_get(attrib)
      end.join(" ")
    end.join("\n")
  end  
  
  private

  def import_files
    people_data = @files.map { |file| Parser.import(file)}.flatten
    people_data.map { |person| Person.new(person)}
  end  

end