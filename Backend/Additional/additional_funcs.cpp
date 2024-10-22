#include "additional_funcs.h"

std::pair<std::string, std::string> GetMethodAndURL(const std::string& request){
  std::string method, url, HEADERS;
  HEADERS = request.substr(0, 256);
  std::size_t posdelim;
  posdelim = HEADERS.find(" ");
  method = HEADERS.substr(0, posdelim);
  HEADERS.erase(0, posdelim + 1);
  posdelim = HEADERS.find(" ");
  url = HEADERS.substr(0, posdelim);
  
  return std::pair(method, url);
}

std::string ReadFile(const std::string& path){
  std::string   response = "";
  std::ifstream inf(path);
  if(!inf.is_open())
    return "";

  std::string line;
  for(;inf >> line;)
    response += line;

  return response;
}
