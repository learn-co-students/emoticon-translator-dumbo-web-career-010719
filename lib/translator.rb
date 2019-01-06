require 'pry'


def load_library(emoticons)
  require "yaml"
  emote = YAML.load_file("#{emoticons}")
  returnkeys = {}
  get_emoticon = {}
  get_meaning ={}
  emote.each do |meaning , emoji|
    get_emoticon[emoji[0]] = emoji[1]
    get_meaning[emoji[1]] = meaning
  end
  returnkeys['get_emoticon'] = get_emoticon
  returnkeys['get_meaning'] = get_meaning
  return returnkeys
end

def get_japanese_emoticon(emoticons, emote)
  load_library(emoticons)["get_emoticon"].each do |english,japan|
    if emote == english
      return japan
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(emoticons, emote)
  load_library(emoticons)["get_meaning"].each do |emoji, meaning|
    if emote == emoji
      return meaning
    end
  end
  return "Sorry, that emoticon was not found"
end
