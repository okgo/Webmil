# Script to watch a directory for any changes to a haml file
# and compile it.
#
# USAGE: ruby haml_watch.rb
#
require 'rubygems'
require 'fssm'
 
directory = ARGV.first
FSSM.monitor(directory, '**/*.haml') do
  update do |base, relative|
    input = "#{relative}"
    output = "#{relative.gsub!('.haml', '.html')}"
    command = "haml -f html5 #{input} #{output}"
    %x{#{command}}
    puts "Regenerated #{input} to #{output}"
  end
end