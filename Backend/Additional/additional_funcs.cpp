#include "additional_funcs.h"

std::pair<std::string, std::string> GetMethodAndURL(const std::string& request){
  std::string method, url;
  std::size_t posdelim, posdelim2;
  request.find(' ', posdelim);
  method = request.substr(0, posdelim);
  request.find(" H", posdelim2);
  url = request.substr(posdelim+1, posdelim2);
  
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