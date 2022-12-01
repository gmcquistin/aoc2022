require "pry"

class Processor
  def initialize(filename)
    @filename = filename
  end

  def top_calories
    calories_per_elf.first
  end

  def top_3_calories_combined
    calories_per_elf.first(3).sum
  end

  private

  def calories_per_elf
    calories_per_elf = []
    current_calorie_count = 0

    File.foreach(@filename) do |line|
      if line == "\n"
        calories_per_elf << current_calorie_count
        current_calorie_count = 0
        next
      end
      current_calorie_count += line.to_i
    end
    calories_per_elf << current_calorie_count
    calories_per_elf.sort.reverse
  end
end
