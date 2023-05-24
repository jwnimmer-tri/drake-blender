#!/bin/bash

# This script is intended for use by drake-blender developers.
# Users of the project do not need to run it.

# This script upgrades the pinned version of all dependencies, as captured
# by the requirements.txt files that are commited into git.

set -eu -o pipefail

me=$(python3 -c 'import os; print(os.path.realpath("'"$0"'"))')
cd $(dirname "$me")

./bazel run //:requirements.update -- --upgrade
./bazel run //:test_requirements.update -- --upgrade
./bazel run //examples:requirements.update -- --upgrade