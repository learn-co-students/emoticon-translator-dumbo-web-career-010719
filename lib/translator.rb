# require modules here
require 'yaml'

def load_library(filePath)
  emo=YAML.load_file(filePath)
  emo_hash={
          "get_meaning" => {},
          "get_emoticon" => {} 
         }
  emo.each do |k, v|
    emo_hash["get_meaning"][v[1]]= k
    emo_hash["get_emoticon"][v[0]]= v[1]
  end
  return emo_hash
end

def get_japanese_emoticon(file, emo)
    emo_hash=load_library(file)
    emo_hash["get_emoticon"].each do |k, v|
      if k==emo
        return v
      end
    end
    "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emo)
  emo_hash=load_library(file)
    emo_hash["get_meaning"].each do |k, v|
      if k == emo
        return v
      end
    end
    "Sorry, that emoticon was not found"
end
