# require modules here
require 'yaml'
require 'pry'

def load_library(file)
  emoticons = YAML.load_file(file)
  translation = {
    "get_emoticon" = {};
    "get_meaning" = {}
  }
  emoticons.each do |meaning,array|
    english = array[0]
    japanese = array[1]
    translation["get_emoticon"][english] = japanese
    translation["get_meaning"][japanese] = meaning
  end
  translation
end

def get_japanese_emoticon(file, emoticon)
  translation = load_library(file)
  if translation["get_emoticon"][emoticon]
    translation["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  translation = load_library(file)
  if translation["get_meaning"][emoticon]
    translation["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end