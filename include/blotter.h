#ifndef _BLOTTER_H_
#define _BLOTTER_H_

#include <string>
#include <sstream>
#include <ostream>
using std::string;
using std::stringstream;
using std::ofstream;

class Blotter {

public:
  Blotter() : initialize("blotter.out.json") { }
  Blotter(const char* filename) : initialize(filename) { }
  ~Blotter() { finish(); }

  /*
   * json output functions
   */
  void init(const string name) {

  }

  template<class T> void set(const string name, T value) { // type is set as nil

  }

  template<> void set<float>(const string name, const string type, float value) { set(name, "float", value); }
  template<> void set<int>  (const string name, const string type, int value)   { set(name, "integer", value); }

  /*
   * output stream functions
   */
  void finish() {
    this->flush();
    os.close();
  }

  void flush() {
    os << ss.str();
    os.flush();
    ss.str(string());
    ss.clear();
  }

private:
  ofstream os;
  stringstream ss;
  void initialize(const char* filename) {
    f = fopen(filename, "w");
    fprintf("")
  }
};

#endif // _BLOTTER_H_
