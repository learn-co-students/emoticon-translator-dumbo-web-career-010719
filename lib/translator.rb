# require modules here
require "yaml"

def load_library(path)
  # code goes here
  emo = YAML.load_file(path)
  output = {
    "get_emoticon" => {},
    "get_meaning" => {}
  }
  
  emo.each do |key, val|
    #puts "#{key}, #{val}"
    output["get_meaning"].merge!({
      val[1] => "#{key}"
    })
    output["get_emoticon"].merge!({
      val[0] => val[1]
    })
  end
  
  output
end

def get_japanese_emoticon(path, emo)
  # code goes here
  hash = load_library(path)
  
  hash["get_emoticon"].each do |key, val|
    if key == emo
      return val
    end
  end
  
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emo)
  # code goes here
  hash = load_library(path)
  
  hash["get_meaning"].each do |key, val|
    if key == emo
      return val
    end
  end
  
  return "Sorry, that emoticon was not found"
end
