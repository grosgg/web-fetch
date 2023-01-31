require "nokogiri"
require "httparty"

abort "Wrong number of parameters" if ARGV.length < 1 || ARGV.length > 2
abort "Missing parameter: web page URL" if (ARGV.include? "--metadata") && ARGV.length == 1

url = ARGV[(ARGV.index("--metadata") || 1) - 1]
metadata = ARGV.include? "--metadata"

# puts "URL: #{url}"
# puts "Metadata: #{metadata}"

filename = "pages/" + url.sub(/^.*\/\//, "").gsub("/", "_") + ".html"

if !File.exist?(filename) || !metadata
  begin
    response = HTTParty.get(url)
  rescue SocketError, Errno::ECONNREFUSED => e
    abort e.message
  end

  file = File.open(filename, "w") do |f|
    f.write response
  end
end

file = File.open(filename)
doc = Nokogiri::HTML(file)

if metadata
  puts "site: #{url}"
  puts "num_links: #{doc.css("a").count}"
  puts "images: #{doc.css("img").count}"
  puts "last_fetch: #{File.mtime(filename)}"
end