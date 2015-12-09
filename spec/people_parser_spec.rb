require_relative '../people_parser'

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
  let(:sorted_birth_date) {[["2/13/1943", "Abercrombie"],
                         ["7/12/1959", "Kelly"],
                         ["4/23/1967", "Bishop"],
                         ["12/2/1973", "Seles"],
                         ["6/3/1975", "Bonk"],
                         ["6/3/1975", "Bouillon"],
                         ["6/3/1975", "Kournikova"],
                         ["4/2/1979", "Hingis"],
                         ["3/3/1985", "Smith"]]}
  let(:sorted_last_name) {["Smith", "Seles", "Kournikova", "Kelly", "Hingis", "Bouillon", "Bonk", "Bishop", "Abercrombie"]}

  it 'should contain an array of person objects upon initialization' do 
    expect(parsed_people.people.all? {|entry| entry.is_a?(Person)}).to be(true)
  end
  
  it 'should sort data by gender and last name ascending correctly' do 
    result = parsed_people.sort_by_attributes_asc(["gender", "last_name"])
    result.map! {|entry| [entry.gender, entry.last_name]}
    expect(result).to eq(sorted_gender)
  end

  it 'should sort data by birth date and last name ascending correctly' do 
    result = parsed_people.sort_by_attributes_asc(["birth_date", "last_name"])
    result.map! {|entry| [entry.birth_date, entry.last_name]}
    expect(result).to eq(sorted_birth_date)
  end

  it 'should sort data by last name descending correctly' do 
    result = parsed_people.sort_by_attribute_desc("last_name")
    result.map! {|entry| entry.last_name }
    expect(result).to eq(sorted_last_name)
  end

end
