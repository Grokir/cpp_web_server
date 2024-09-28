#include <iostream>
#include <fstream>
#include <boost/asio.hpp>
#include <boost/algorithm/string.hpp>

std::string index(){
  std::ifstream in("./index.html");
  if(!in.is_open())
    return "Hello, World!";
  std::string res = "";
  for(std::string line; getline(in, line);)
    res += line;

  return res;
}

std::string handleRequest(const std::string& request) {
  // Process the request and generate the response
  std::cout << "[Request]\n" << request << std::endl;
  std::string response = "HTTP/1.1 200 OK\r\n\r\n" + index();
  return response;
}

void startServer() {
  boost::asio::io_context ioContext;
  boost::asio::ip::tcp::acceptor acceptor(ioContext, boost::asio::ip::tcp::endpoint(boost::asio::ip::tcp::v4(), 8080));
  while (true) {
    boost::asio::ip::tcp::socket socket(ioContext);
    acceptor.accept(socket);
    std::array<char, 4096> buffer;
    boost::system::error_code error;
    size_t bytesRead = socket.read_some(boost::asio::buffer(buffer), error);
    std::string request(buffer.data(), bytesRead);
    std::string response = handleRequest(request);
    boost::asio::write(socket, boost::asio::buffer(response));
  }
}

int main() {
 std::cout << "Starting the web service…\n";
 startServer();
 return 0;
}
