/*
 * To build this file, you must have Make installed
 * Inside this folder, use `make run`
 */

#include <iostream> // output to console
#include <fstream> // stream data from file
#include <string> // use strings instead of char*
#include <vector> // dynamically growable data containers

// Main program
int main()
{
  // Output variable
  int count = 0;

  // Container for input data
  std::vector<int> input;

  // File stream data
  std::ifstream file("../input.txt");

  // Fail with error if we can't open the file
  if (!file)
  {
    std::cout << "Error opening input file!\n";
    return -1;
  }

  // Data for reading each line of the file
  std::string line;

  // While we can get the next line of the file,
  // put string converted into an integer (stoi) into our input data container
  while(getline(file, line))
  {
    input.push_back(std::stoi(line));
  }

  // Iterate over the data container from the beginning to the end
  // auto has the type of std::vector<int>::iterator
  for (auto iter = std::begin(input); iter != std::end(input); ++iter)
  {
    // Is the current element smaller than the next one?
    if (*iter < *std::next(iter))
    {
      // If so, increase the output variable
      count += 1;
    }
  }

  // Print results to the console
  std::cout << count << '\n';

  // Return successfully
  return 0;
}
