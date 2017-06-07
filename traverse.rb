def entries_in(dir)
  puts "[ Digging into #{dir} ]"
  Dir.new(dir).entries.select {|entry| entry != '.' && entry != '..' && entry != '.git'}.each do |entry|
    relative_entry = "#{dir}/#{entry}"
    if File.directory? relative_entry
      entries_in relative_entry
    else
      puts "Entry: #{relative_entry}, size: #{File.size relative_entry}"
    end
  end
  puts "[ Finished working with #{dir} ]"
end

entries_in '.'