#!/usr/bin/ruby
# filename: wp.rb
require 'rubygems'
require 'twitter'
require 'yaml'
require 'pastie-api'
require 'extensions'

if ARGV.empty? then
  puts "Usage: wp <filename>"
  exit 1
end

sendfile=ARGV[0]

# Getting whiplash config file
filepath=ENV["HOME"] + "/" + ".whiplash"

yamlconf = YAML.load_file(filepath)

# Reading a file
unless File::exist? sendfile or File::readable? sendfile
  puts "Error: file #{sendfile} does not exist or not readable"
  exit 1
end

file = File.new(sendfile, "r")
conts = ""
file.each_line do |line|
  conts += line
end
file.close

# Create a new paste
lang = $filexts[File.extname sendfile]
p = Pastie.create(conts, false, lang)

# Getting environment variables that contains the tag info
course=ENV["WPCOURSE"]
group=ENV["WPGROUP"]

unless course == nil or group == nil
  tag="#" + course + group
else
  tag="#NOTAGDEF"
end

# Setting twitter client
client = Twitter::REST::Client.new do |config|
  config.consumer_key = yamlconf['consumer_key']
  config.consumer_secret = yamlconf['consumer_secret']
  config.access_token = yamlconf['access_token']
  config.access_token_secret = yamlconf['access_token_secret']
end

# Send a twitter with new file info
begin
  client.update(tag + " " + p.link)
rescue Exception => e
  puts "No message send due: #{e.message}"
  exit 1
end
