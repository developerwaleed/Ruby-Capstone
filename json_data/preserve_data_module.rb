require 'json'

module PreserveJsonData
  def save_json_data(data_array, json_file)
    File.write("./json_data/#{json_file}.json", JSON.generate(data_array))
  end

  def load_json_data(json_file)
    data = []
    file = "./json_data/#{json_file}.json"
    return data unless File.exist?(file) && File.read(file) != ''

    if File.empty?("./json_data/#{json_file}.json")
      puts 'No data in the catalog'
    else
      JSON.parse(File.read("./json_data/#{json_file}.json"))

    end
  end
end
