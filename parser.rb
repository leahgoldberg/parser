module Parser

  extend self

  def import(file)
    data_array = convert_file_to_array(file)
    convert_array_to_hash(data_array)
  end
  
  def save(file, data)
    File.open(file, "w") do |file|
      data.each { |row| file.write(row.values.join(" ") + "\n") }
    end
  end

  def convert_file_to_array(file_name)
    File.foreach(file_name).map do |line|
      line.gsub(/[\|,]/, "").split(" ")
    end 
  end  

  def convert_array_to_hash(array)
    headers = array.shift.map(&method(:to_snake_case)).map(&:to_sym)
    array.map { |line| Hash[headers.zip(line)] }
  end  

  def convert_object_to_hash(data)
    data.each_with_object([]) do |obj, obj_array|
      hash = {}
      obj.instance_variables.map {|headers| hash[headers.to_s.delete("@")] = obj.instance_variable_get(headers) }
      obj_array << hash
    end
  end 

  def to_snake_case(camel_case_string)
    camel_case_string.gsub(/([a-z\d])([A-Z])/,'\1_\2').tr("-", "_").downcase
  end 

end  