#include "CHANGEME.hh"

#include <n4-shape.hh>
#include <n4-geometry-iterators.hh>

#include <catch2/catch_test_macros.hpp>

TEST_CASE("dummy failing test", "[dummy][fail]") {
  CHECK(7*6 == 666);
}

TEST_CASE("dummy passing test", "[dummy][pass]") {
  CHECK(7*6 == 42);
}

TEST_CASE("dummy test lib", "[dummy][lib]") {
  CHECK(CHANGEME::add(40, 2) == 42);
}

TEST_CASE("dummy geometry", "[dummy][geometry]") {
  auto geometry = CHANGEME::example_geometry();
  for (const auto& volume: geometry) {
      std::cout << volume -> GetName() << std::endl;
  }
  CHECK(1 == 2);
}
