File.open('test.txt') do |f|
  2.times do
    until f.eof
      print f.gets
      sleep 0.1
    end
    f.rewind
    puts "\n============"
  end
end

#File.foreach('test.txt') {|l| puts l}