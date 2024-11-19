#!/bin/bash

dune exec test/cover_tests/dhtml_test.exe
dune exec test/cover_tests/ehtml_test.exe
dune exec test/cover_tests/thtml_test.exe
dune exec test/cover_tests/thtml_percent_test.exe
dune exec test/cover_tests/xhtml_test.exe

find . -name '*.coverage' | xargs rm -f
dune runtest --instrument-with bisect_ppx --force

bisect-ppx-report html
