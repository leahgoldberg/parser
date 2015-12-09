require 'date'
require_relative 'parser'

class Person

  include Parser
  attr_reader :last_name, :first_name, :gender, :favorite_color
  attr_writer :birth_date

  def initialize(args)
    @last_name = args.fetch(:last_name)
    @first_name = args.fetch(:first_name)
    @gender = format_gender(args.fetch(:gender))
    @birth_date = format_birth_date(args.fetch(:date_of_birth))
    @favorite_color = args.fetch(:favorite_color)
  end  

  def self.from_file

  end

  def birth_date=
    @birth_date = value
  end

  def birth_date
    @birth_date.strftime("%m/%d/%Y")
  end

  def display_birth_date
    self.birth_date = birth_date.strftime('%-m/%-d/%Y')
  end  
  
  private

  def format_birth_date(date)
    date.include?("-") ? date.gsub!("-", "/") : date
    DateTime.strptime(date, "%m/%d/%Y")
  end
  
  def format_gender(gender)
    gender.include?("M") ? "Male" : "Female"
  end  

end  
