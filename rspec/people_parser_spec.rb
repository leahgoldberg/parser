require_relative '../people_parser'
require 'pry'

describe PeopleParser do

  let(:files) { ["inputs/input1.txt", "inputs/input2.txt", "inputs/input3.txt"] }
  let(:parsed_people) { PeopleParser.new(files)}
  let(:sorted_gender) { [["Female", "Hingis"],
                         ["Female", "Kelly"],
                         ["Female", "Kournikova"],
                         ["Female", "Seles"],
                         ["Male", "Abercrombie"],
                         ["Male", "Bishop"],
                         ["Male", "Bonk"],
                         ["Male", "Bouillon"],
                         ["Male", "Smith"]]}
  let(:sorted_birth_date) {}
  let(:sorted_last_name) {}

  it 'should contain an array of person objects upon initialization' do 
    expect(parsed_people.people.all? {|entry| entry.is_a?(Person)}).to be(true)
  end
  
  it 'should sort data by gender and last name ascending correctly' do 
    result = parsed_people.sort_by_attributes_asc(["gender", "last_name"])
    result.map! {|entry| [entry.gender, entry.last_name]}
    expect(result).to eq(sorted_gender)
  end

  it 'should sort data by birth date and last name ascending correctly' do 
  end

  it 'should sort data by last name descending correctly' do 
  end

  it 'should format date as string in m/d/yyyy when displayed' do 
  end  

end
