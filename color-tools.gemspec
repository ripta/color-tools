#--
# Colour management with Ruby.
#
# Copyright 2005 Austin Ziegler
#   http://rubyforge.org/ruby-pdf/
#
#   Licensed under a MIT-style licence.
#
# $Id$
#++
Gem::Specification.new do |s|
  s.name = %q{ripta-color-tools}
  s.version = %q{1.4.0}
  s.summary = %q{color-tools provides colour space definition and manpiulation as well as commonly named RGB colours.}
  s.platform = Gem::Platform::RUBY

  s.has_rdoc          = true
  s.rdoc_options      = %w(--title ripta-color-tools --main README.rdoc --line-numbers)
  s.extra_rdoc_files  = %w(README.rdoc Install Changelog)

  s.autorequire = %q{color}
  s.require_paths = %w{lib}

  s.files = Dir.glob("**/*").delete_if do |item|
    item.include?("CVS") or item.include?(".svn") or
    item == "install.rb" or item =~ /~$/ or
    item =~ /gem(?:spec)?$/
  end

  s.author = %q{Austin Ziegler}
  s.email = %q{austin@rubyforge.org}
  s.rubyforge_project = %q(ruby-pdf)
  s.homepage = %q{http://rubyforge.org/projects/ruby-pdf}
  description = []
  File.open("README.rdoc") do |file|
    file.each do |line|
      line.chomp!
      break if line.empty? && description.size > 0
      description << "#{line.gsub(/\[\d\]/, '')}"
    end
  end
  s.description = description[1..-1].join(" ") 
end
