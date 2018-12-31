# require modules here
require 'pry'
require 'yaml'

def load_library(file)
  # code goes here
  emoticons = YAML.load_file(file)
  #puts emoticons
  library = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  emoticons.each do |meaning, emoticons|
    library["get_meaning"][emoticons[1]] = meaning
    library["get_emoticon"][emoticons[0]] = emoticons[1]
    #binding.pry
  end
  library
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  library = load_library(file)
  if library["get_emoticon"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  end
  library["get_emoticon"][emoticon]
end

def get_english_meaning(file, emoticon)
  # code goes here
  library = load_library(file)
  if library["get_meaning"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  end
  library["get_meaning"][emoticon]
end