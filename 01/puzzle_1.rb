require_relative "./processor"

puts Processor.new(File.expand_path("./input.txt", __dir__)).top_calories
