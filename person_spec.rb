require_relative 'person'

describe Person do 

  let(:someone) { Person.new(last_name: "lkj", first_name: "kjkj", gender:"M", date_of_birth:"4/13/1982", favorite_color:"Blue") }
  let(:person) { Person.new(last_name: "lkj", first_name: "kjkj", gender:"F", date_of_birth:"4/1/1982", favorite_color:"Blue") }

  it 'should store a DateTime object for birth date' do 
    expect(someone.instance_variable_get("@birth_date")).to be_an_instance_of(DateTime)
  end

  describe "#format_birth_date" do 

    it 'should return a string when accessing birth date' do 
      expect(someone.birth_date).to be_a(String)
    end  

    it 'should be in the format m/dd/yyyy given a double digit day' do 
      expect(someone.birth_date).to match(/\d{1}\/\d{2}\/\d{4}/)
    end  

    it 'should be in the format m/d/yyyy given a single digit day' do 
      expect(person.birth_date).to match(/\d{1}\/\d{1}\/\d{4}/)
    end 
  end   
  
  describe "#format_gender" do 
    it 'should return Male given M' do 
      expect(someone.gender).to eq("Male")
    end  

    it 'should return Female given F' do 
      expect(person.gender).to eq("Female")
    end 
  end  

end  