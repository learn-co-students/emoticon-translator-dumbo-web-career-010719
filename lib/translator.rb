# require modules here
  require "yaml"
require 'pry'

def load_library(file_path)
  hash1 = YAML.load_file(file_path)
  answer = Hash.new()
  answer['get_meaning'] = {}
  answer['get_emoticon'] = {}

  hash1.each do |meaning, emote|
    answer['get_meaning'][emote[1]] = meaning
    answer['get_emoticon'][emote[0]] = emote[1]
  end
  
  return answer
end

def get_japanese_emoticon(file, emo)
  res = load_library(file)
  if res['get_emoticon'][emo]
    return res['get_emoticon'][emo]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emo)
    res = load_library(file)
  if res['get_meaning'][emo]
    return res['get_meaning'][emo]
  else
    return "Sorry, that emoticon was not found"
  end


end