require "spec_helper"
require "fileutils"

describe "KPack cli" do
  def in_tmp_dir &block
    FileUtils.mkdir_p "tmp/cli"
    FileUtils.chdir("./tmp/cli") {
      yield ->(args) { `ruby -Ilib ../../exe/kpack #{args}` }
    }
    FileUtils.rm_rf "tmp"
  end

  exe = ->(args) { `ruby -Ilib ./exe/kpack #{args}` }

  %w{-v --version}.each do |flag|
    describe flag do
      it "returns the KPack version" do
        expect(exe[flag]).to eq "KPack version #{KPack::VERSION}\n"
      end
    end
  end

  describe "init" do
    it "copies the sample Packfile.ks to the current directory" do
      in_tmp_dir { |exe|
        exe["init"]
        expect(File.read("Packfile.ks")).to eq File.read("../../lib/templates/Packfile.ks")
      }
      expect(exe["-v"]).to eq "KPack version #{KPack::VERSION}\n"
    end
  end
end
