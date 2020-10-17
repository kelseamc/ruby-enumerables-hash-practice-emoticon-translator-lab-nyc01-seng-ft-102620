# require modules here
require "yaml"

require 'pry'

def load_library(path)
  emoticons = {}
  YAML.load_file(path).each do |name, lang|
    emoticons[name] = {}
    #binding.pry
    emoticons[name][:english] = lang[0]
    emoticons[name][:japanese] = lang[1]
  end
  emoticons
end

def get_japanese_emoticon(path, emoticon)
  load_library(path).each do |name, lang|
    if lang[:english] == emoticon
      return lang[:japanese]
    end
    #binding.pry
  end
end


def get_english_meaning(path, emoticon)
  load_library(path).each do |name, lang|
    if lang[:japanese] == emoticon
      return name
    else
      return "Sorry, that emoticon was not found"
    end
  end
end
