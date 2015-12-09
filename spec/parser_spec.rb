require_relative '../parser'

describe Parser do 

  let(:parsed_data) { Parser.import("inputs/input1.txt") }
  
  it 'should return an array of hashes' do 
    expect(parsed_data.all? { |entry| entry.is_a?(Hash)} ).to be(true)
  end

  it 'should contain number of hashes equal to lines in original file - 1' do 
    file_lines = File.foreach("inputs/input1.txt").map(&:to_s).length
    expect(parsed_data.length).to eq(file_lines - 1)
  end  

end  