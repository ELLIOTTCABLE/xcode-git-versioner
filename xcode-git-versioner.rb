RunOnlyOnRelease = false

raise "Must be run from Xcode" unless ENV['XCODE_VERSION_ACTUAL']
raise "Not a Release build" if ENV["BUILD_STYLE"] != "Release" and RunOnlyOnRelease

plist = File.join ENV['BUILT_PRODUCTS_DIR'], ENV['INFOPLIST_PATH']
raise "Info.plist missing, or path error" unless File.file? plist

git = `sh /etc/profile; which git`.chomp
tag, age, sha = `git describe --tags --always --long`.chomp.match(/(.*)-(\d+)-([0-9a-g]+)/i)[1..3]

# "v1.0", "v1.0b2 [g3f22c9f]", "[g3f22c9f]"
version = tag ? (age.to_i.zero? ? "#{tag}" : "#{tag}b#{age} [#{sha}]") : "[#{sha}]"

list = NSMutableDictionary.dictionaryWithContentsOfFile plist
list['CFBundleVersion'] = version
list.writeToFile plist, :atomically => true

puts "CFBundleVersion set to '#{version}'!"
