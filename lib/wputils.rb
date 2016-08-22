require 'rubygems'
require 'twitter'
require 'yaml'
require 'faraday'
require 'faraday_middleware'

def resolve_redirects(url)
  response = fetch_response(url, method= :head)
  if response
    return response.to_hash[:url].to_s
  else
    return nil
  end
end

def fetch_response(url, method= :get)
  conn = Faraday.new do |b|
    b.use FaradayMiddleware::FollowRedirects;
    b.adapter :net_http
  end
  return conn.send method, url
rescue Faraday::Error, Faraday::Error::ConnectionFailed => e
  return nil
end

def getWPcfgFile(file)
  filepath=file || File.join(ENV['HOME'], '.whiplash', 'config' ,'auth')
  YAML.load_file(filepath)
end

def getPScfgFile()
  filepath=File.join(ENV['HOME'], '.powerslave', 'config', 'auth')
  YAML.load_file(filepath)
end

def get_tweeter_client(yamlconf)
  client =  Twitter::REST::Client.new do |config|
    config.consumer_key = yamlconf['consumer_key']
    config.consumer_secret = yamlconf['consumer_secret']
    config.access_token = yamlconf['access_token']
    config.access_token_secret = yamlconf['access_token_secret']
  end
end

def getWPTag(options)
  pTag="NOTAGDEF"
  if options[:tag] != nil
    pTag = options[:tag]
  elsif ENV["WPTAG"] != nil
    pTag = ENV["WPTAG"]
  end
  return ("#" + pTag)
end

def endIfNil(value, msg)
  if value.nil?
    STDERR.puts msg
    exit 1
  end
end

def printLevelMsg(levelMsg, currentLevel, msg)
  case currentLevel
  when 0
    levelMsg = 0
  when 1, levelMsg == currentLevel
    STDERR.puts msg
  when 2, levelMsg <= currentLevel
    STDERR.puts msg
  when 3, levelMsg <= currentLevel
    STDERR.puts msg
  end
end

def creatFileWrTr(filename, options, mode, msg)
  hf = File.new(filename, File::CREAT|File::TRUNC|File::RDWR,0600)
  hf.write msg
  hf.close
end
