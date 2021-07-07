# require modules here
require "yaml"
require "pry"

# 1.) #load_library
#	accepts one argument, the file path
#	returns a hash
#   the keys inside the 'get_meaning' hash are the Japanese emoticons
#   the emoticon keys inside the 'get_meaning' hash point to their meanings
#   the keys inside the 'get_emoticon' hash are the English emoticons
#   the emoticon keys inside the 'get_emoticon' hash point to their Japanese equivalents
def load_library(file_path)
    # code goes here
    emojis = YAML.load_file(file_path)
    new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
    emojis.each do |meaning, emoticon|
        new_hash["get_meaning"][emoticon[1]] = meaning
        new_hash["get_emoticon"][emoticon[0]] = emoticon[1]
    end
    new_hash
end

# 2.) #get_japanese_emoticon
#  	accepts two arguments, the YAML file path and the emoticon
#  	calls on #load_library and gives it the argument of the file path
#  	returns the Japanese equivalent of an English grinning
#  	returns the Japanese equivalent of an English happy
#   returns the Japanese equivalent of an English sad
#   returns an apology message if the argument is not a known emoticon
def get_japanese_emoticon(yaml_file, emoticon)
    # code goes here
    emojis = load_library(yaml_file)

    response = nil

    emojis["get_emoticon"].each do |english, japanese|
        if emoticon == english
            response = japanese
        end
    end

    if response == nil
        return "Sorry, that emoticon was not found"
    else
        return response
    end
end

# 3.) #get_english_meaning
#	calls on #load_library and gives it the argument of the file path
#  	returns the English meaning of the Japanese emoticon (＾ｖ＾)
#  	returns the English meaning of the Japanese emoticon (￣ー￣)
#  	returns the English meaning of the Japanese emoticon (Ｔ▽Ｔ)
#  	returns an apology message if the argument is not a known emoticon
def get_english_meaning(yaml_file, emoticon)
    # code goes here
    library = load_library(yaml_file)
    response = nil

    library["get_meaning"].each do |emo, trans|
        if emo == emoticon
            response = trans
        end
    end

    if response == nil
        return "Sorry, that emoticon was not found"
    else
        return response
    end
end
