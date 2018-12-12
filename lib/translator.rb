# require modules here
require "YAML"
require "pry"

def load_library path
  # code goes here
  lib = YAML.load_file(path)


  newLib = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }



  getE = lib.invert
  getE.each do |k,v|
    k.each do |e|
      newLib["get_meaning"][e] = v
    end
  end



  engE ={
    "angel"	=> "O:)",
    "angry" =>	">:(",
    "bored"	=> ":O",
    "confused" =>	"%)",
    "embarrased" =>	":$",
    "fish" =>	"><>",
    "glasses" =>	"8D",
    "grinning" =>	"=D",
    "happy"	=> ":)",
    "kiss"	=> ":*",
    "sad" =>	":'(",
    "surprised" => ":o",
    "wink" =>	";)"
  }

  newLib["get_meaning"].each do |k,v|
    engE.each do |k1,v1|
      if v == k1
        newLib["get_emoticon"].merge!({v1 => k})
      end
    end
  end
newLib
end

def get_japanese_emoticon path, emoticon
  lib = load_library path
  if lib["get_emoticon"].keys.include?(emoticon)
    lib["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning path, emoticon
  # code goes here
  lib = load_library path
  if lib["get_meaning"].keys.include?(emoticon)
    lib["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
