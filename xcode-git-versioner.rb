#!/usr/bin/env macruby
raise "Must be run from Xcode" unless ENV['XCODE_VERSION_ACTUAL']

plist = File.join ENV['BUILT_PRODUCTS_DIR'], ENV['INFOPLIST_PATH']

git = `sh /etc/profile; which git`.chomp
sha = `#{git} rev-parse --short HEAD`.chomp
 
list = NSMutableDictionary.dictionaryWithContentsOfFile plist
list['CFBundleVersion'] = sha
list.writeToFile plist, :atomically => true