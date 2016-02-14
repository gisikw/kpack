require "spec_helper"

describe "KPack cli" do
  %w{-v --version}.each do |flag|
    describe flag do
      it "returns the KPack version" do
        expect(`ruby -Ilib ./exe/kpack #{flag}`).to eq "KPack version #{KPack::VERSION}\n"
      end
    end
  end
end
