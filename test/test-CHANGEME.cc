#include <n4-shape.hh>

#include <catch2/catch_test_macros.hpp>

TEST_CASE("dummy failing test", "[dummy][fail]") {
    CHECK(7*6 == 666);
}

TEST_CASE("dummy passing test", "[dummy][pass]") {
    CHECK(7*6 == 42);
}
