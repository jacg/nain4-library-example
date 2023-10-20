#include "CHANGEME.hh"
#include "n4-shape.hh"

#include <n4-geometry.hh>


namespace CHANGEME {

int add(int a, int b) { return a + b; }

G4PVPlacement* example_geometry() {
  auto air  = n4::material("G4_AIR");
  auto gold = n4::material("G4_Au");
  auto world = n4::box{"world"}.cube(1*m).volume(air);
  n4::sphere{"orb"}.r(1*cm).place(gold).in(world).now();
  return n4::place(world).now();
}

} // namespace abc
