# -*-Makefile-*-

set positional-arguments := true

default:
  just test ''

test PATTERN *FLAGS: install-tests
  sh install/nain4-test/run-each-test-in-separate-process.sh {{PATTERN}} {{FLAGS}}

install-lib:
  meson setup      build/lib src
  meson compile -C build/lib
  meson install -C build/lib

install-tests: install-lib
  meson setup      build/test test
  meson compile -C build/test
  meson install -C build/test

clean:
  fd --no-ignore "^build$"   --exec rm -rf {}
  fd --no-ignore "^install$" --exec rm -rf {}


# -*-Makefile-*-

# default:
#     just clean # Remove this once exploratory development is done
#     just test-nain4

# test PATTERN *FLAGS: install-tests
#     sh install/nain4-test/run-each-test-in-separate-process.sh {{PATTERN}} {{FLAGS}}

# test-nain4 *FLAGS: install-tests
#     just test '' {{FLAGS}}

# install-nain4:
#     meson setup nain4/build/nain4 nain4/src
#     meson compile -C nain4/build/nain4
#     meson install -C nain4/build/nain4

# install-tests: install-nain4
#     meson setup nain4/build/nain4-test nain4/test
#     meson compile -C nain4/build/nain4-test
#     meson install -C nain4/build/nain4-test
