# exercise_01.rb

# Output all words containing the letters 'lab'

words = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

words.each do |w|
  puts w if w.downcase.sub(' ', '') =~ /lab/
end
