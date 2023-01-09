

#include <iostream>
#include <optional>

int main() {
  int x = 5;
  int y = x;
  return y + x;
  std::optional<uint32_t> x = 5;
}


[[nodiscard]] auto gg() -> uint32_t {
  return 5;
}
