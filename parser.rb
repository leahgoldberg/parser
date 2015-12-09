module Parser

  def import(file)
    # data_array = File.foreach(file_name).map {|line| line.gsub(/[\|,]/, "").split(" ") }
    # headers = data_array.shift.map {|header| to_snake_case(header)}.map(&:to_sym)
    # data_array.map { |line| Hash[headers.zip(line)] }
    data_array = convert_file_to_array(file)
    convert_array_to_hash(data_array)
  end
  
  def save(file, data)
    File.open(file, "w") do |file|
      data.each { |row| file.write(row.values.join(" ") + "\n") }
    end
  end

  # private  

  def convert_file_to_array(file_name)
    File.foreach(file_name).map do |line|
      line.gsub(/[\|,]/, "").split(" ")
    end 
  end  

  def convert_array_to_hash(array)
    headers = array.shift.map(&method(:to_snake_case)).map(&:to_sym)
    array.map { |line| Hash[headers.zip(line)] }
  end  

  def to_snake_case(camel_case_string)
    camel_case_string.gsub(/([a-z\d])([A-Z])/,'\1_\2').tr("-", "_").downcase
  end 

end  