require "thor"
require "kpack/version"
require "fileutils"

module KPack
  class CLI < Thor
    include Thor::Actions
    def self.source_root
      File.join(File.dirname(__FILE__), "../templates")
    end

    map %w[--version -v] => :__print_version

    desc "--version, -v", "Print KPack's version information"
    def __print_version
      puts "KPack version #{KPack::VERSION}"
    end

    desc "init", "Generate a Packfile.yml in the current directory"
    def init
      copy_file "Packfile.ks"
    end

  end
end
