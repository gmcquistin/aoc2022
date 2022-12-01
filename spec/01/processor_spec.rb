require_relative "../../01/processor"
require "tempfile"
require "pry"

RSpec.describe Processor do
  let(:file_data) {
    <<~DATA
      10
      10
      20

      10
      15
      25
      10

      10
      20

      1
      1
      2
      1
    DATA
  }
  let(:temp_file) {
    Tempfile.new
  }
  let(:processor) {
    described_class.new(temp_file.path)
  }

  before do
    temp_file.write(file_data)
    temp_file.close
  end

  describe "#top_calories" do
    subject { processor.top_calories }

    it "returns the max number of calories carried by any one elf" do
      expect(subject).to eq 60
    end
  end

  describe "#top_3_calories_combined" do
    subject { processor.top_3_calories_combined }

    it "returns top 3 calorie counts combined" do
      expect(subject).to eq 130
    end
  end
end
