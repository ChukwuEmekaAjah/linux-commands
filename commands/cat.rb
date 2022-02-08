require 'pathname'

# cat prints out the contents of file on the console.
def cat
  print('root@laptop% ')
  command = gets
  splittedCommand = command.split(' ')
  exit(0) unless %w[quit exit].index(splittedCommand[0].downcase.strip).nil?

  raise 'Please provide cat command' if splittedCommand[0].downcase.chomp != 'cat'
  raise 'Please provide readable file' unless splittedCommand.size > 1
  # Read file content
  puts(read_file(splittedCommand[1]))

end



def read_file(file_path)
  begin
    path = Pathname.new(file_path)
    raise 'It is a directory' if path.directory?
    f = File.open(path.realpath.to_s, 'r')
    f.read
  rescue StandardError => e
    e.to_s
  ensure
    f.close
  end
end

loop do
  cat
end

