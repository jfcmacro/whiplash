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

def getWPcfgFile()
  filepath=ENV["HOME"] + "/" + ".whiplash"
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
