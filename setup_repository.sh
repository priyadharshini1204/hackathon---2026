
#!/bin/bash
set -e

REPO_URL="https://github.com/internetarchive/openlibrary.git"
BASE_COMMIT="84cc4ed5697b83a849e9106a09bfed501169cc20"
TEST_FILE_COMMIT="c4eebe6677acc4629cb541a98d5e91311444f5d4"
TARGET_DIR="/testbed"

echo "Setting up repository in $TARGET_DIR..."

if [ ! -d "$TARGET_DIR/.git" ]; then
    mkdir -p $TARGET_DIR
    git clone $REPO_URL $TARGET_DIR
fi

git -C $TARGET_DIR config --global --add safe.directory $TARGET_DIR
git -C $TARGET_DIR reset --hard $BASE_COMMIT
git -C $TARGET_DIR clean -fd

# Checkout the specific test file that contains the new tests
git -C $TARGET_DIR checkout $TEST_FILE_COMMIT -- openlibrary/tests/core/test_imports.py

# Initialize submodules (Infogami is in vendor/infogami)
echo "Initializing submodules..."
git -C $TARGET_DIR submodule update --init --recursive

# Set PYTHONPATH in the environment for the remaining steps
export PYTHONPATH=$TARGET_DIR:$TARGET_DIR/vendor/infogami:$PYTHONPATH
echo "PYTHONPATH set to $PYTHONPATH"

echo "Repository setup complete."

