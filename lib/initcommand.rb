require 'net/http'
require 'uri'

def createSubTreeDirectory(workDir, ovrwr, url)
  workPath = ENV['HOME'] + '/' + workDir

  if Dir.exists? workPath then
    if ovrwr then
      eraseDirAll(workPath)
    else
      STDERR.puts "#{workPath} already exists"
      exit 1
    end
  end
  
  Dir.mkdir workPath
  File.chmod(0700, workPath) 
  Dir.mkdir workPath + '/config'
  File.chmod(0700, workPath + '/config')
  Dir.mkdir workPath + '/history'
  File.chmod(0700, workPath + '/history')
  createAuthFile(url, workPath + '/config/auth')
end

def eraseDirAll(dir)
  if Dir.exists? dir then
    Dir.foreach(dir) do |filename|
      if not (filename == '.' or filename == '..') then
        pathname = dir + '/' + filename
        if File.file? pathname then
          puts "Deleting file #{pathname}"
          File.delete pathname
        elsif File.directory? pathname then
          puts "Deleting directory #{pathname}"
          eraseDirAll pathname
        else
          puts "This never could happen #{pathname}"
          # Unknown file
        end
      end
    end
    begin
      Dir.delete dir
    rescue SystemCallError => sce
      STDERR.puts "Unexpected exection #{sce}"
      exit 1
    end
  end
end

def createAuthFile(url, authfile)
  uriclass = URI.parse(url)
  perms = String.new
  if uriclass.scheme == "http" or uriclass.scheme == "https" then
    perms = Net::HTTP.get(URI.parse(url))
  elsif uriclass.scheme == "file" then
    urlfile = File.open(uriclass.path, "r")
    perms = urlfile.read
    urlfile.close
  else
    urlfile = File.open(url, "r")
    perms = urlfile.read
    urlfile.close
  end

  # puts perms
  f = File.new(authfile, File::CREAT|File::TRUNC | File::WRONLY, 0600)
  f.write perms
  f.close
end
