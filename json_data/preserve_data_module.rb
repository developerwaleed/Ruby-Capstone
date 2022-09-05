require 'json'

module Preserve_json_data
    def save_json_data(data_array, json_file)
        File.write("./json_data/#{json_file}.json", JSON.generate(data_array))
    end
end