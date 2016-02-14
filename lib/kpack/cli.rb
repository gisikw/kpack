require "thor"
require "kpack/version"

module KPack
  class CLI < Thor

  map %w[--version -v] => :__print_version

  desc "--version, -v", "print the version"
  def __print_version
    puts "KPack version #{KPack::VERSION}"
  end

  end
end
