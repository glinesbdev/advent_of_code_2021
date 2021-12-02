/*
 * To build this file, you must have Make installed
 * Inside this folder, use `make run`
 */

#include <iostream>
#include <fstream>
#include <numeric> // reduce function header
#include <string>
#include <vector>

std::vector< std::vector<int> > each_cons(std::vector<int> &input, size_t amount)
{
  std::vector< std::vector<int> > result {};
  std::vector<int> tempVec {};
  size_t index = 0;
  size_t offset = 0;

  for (auto iter = input.begin(); iter != input.end(); ++iter)
  {
    for (; index < amount; index++)
    {
      try
      {
        tempVec.push_back(input.at(index + offset));
      }
      catch (std::out_of_range const& _e)
      {
        return result;
      }
    }

    result.push_back(tempVec);
    tempVec.clear();
    index = 0;

    if (index % 2 == 0)
    {
      offset++;
    }
  }

  return result;
}

int main()
{
  std::ifstream file("../../input.txt");

  if (!file)
  {
    std::cout << "Error opening input file!\n";
    return -1;
  }

  size_t window_limit = 3;
  std::vector<int> input {};
  std::string line {};

  while(getline(file, line))
  {
    input.push_back(std::stoi(line));
  }

  int count = 0;
  std::vector< std::vector<int> > windows = each_cons(input, window_limit);

  for (auto window : windows)
    std::cout << "[" << window.at(0) << ", " << window.at(1) << ", " << window.at(2) << "]\n";

  std::vector< std::vector<int> >::iterator iter;

  for (iter = windows.begin(); iter != windows.end(); ++iter)
  {
    if (std::next(iter)->size() == window_limit)
    {
      int current_value = std::reduce(iter->cbegin(), iter->cend(), 0);
      int next_value = std::reduce(std::next(iter)->cbegin(), std::next(iter)->cend(), 0);

      if (current_value < next_value)
      {
        count += 1;
      }
    }
  }

  std::cout << count << '\n';
  return 0;
}
