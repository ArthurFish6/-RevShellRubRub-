require 'socket'

PORT = 80
server = TCPServer.new(PORT)
puts "[*] Server listening on port #{PORT}"


loop do
  client = server.accept
  puts "[*] Client connected from #{client.peeraddr[2]}:#{client.peeraddr[1]}"
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
