/*
 * To build this file, you must have Make installed
 * Inside this folder, use `make run`
 */

#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <regex>

std::vector<std::string> split(const std::string str, const std::string regex_str)
{
  std::regex regex(regex_str);
  std::vector<std::string> list(std::sregex_token_iterator(str.begin(), str.end(), regex, -1),
                                std::sregex_token_iterator());

  return list;
}

int calculate_position(std::vector<std::string> const& input)
{
  int horizontal_pos = 0;
  int depth = 0;

  for (auto iter = input.begin(); iter != input.end(); ++iter)
  {
    std::vector<std::string> split_result = split(*iter, " ");
    std::string command = split_result.front();
    int value = std::stoi(split_result.back());

    if (command == "forward") horizontal_pos += value;
    if (command == "down") depth += value;
    if (command == "up") depth -= value;
  }

  return horizontal_pos * depth;
}

int main()
{
  std::ifstream file("../../input.txt");

  if (!file)
  {
    std::cout << "Error opening input file!\n";
    return -1;
  }

  std::vector<std::string> input {};
  std::string line {};

  while(getline(file, line))
  {
    input.push_back(line);
  }

  std::cout << calculate_position(input) << '\n';
  return 0;
}
