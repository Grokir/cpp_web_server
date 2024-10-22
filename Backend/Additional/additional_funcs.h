#pragma once

#include <string>
#include <fstream>
#include <utility>

std::pair<std::string, std::string> GetMethodAndURL(const std::string& request);
std::string                         ReadFile       (const std::string& path);
