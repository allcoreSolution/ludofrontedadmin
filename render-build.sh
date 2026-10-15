#!/usr/bin/env bash
set -e

echo "=== Installing Flutter SDK on Render ==="
FLUTTER_DIR="$HOME/flutter"

if [ ! -d "$FLUTTER_DIR" ]; then
  git clone https://github.com/flutter/flutter.git -b stable --depth 1 "$FLUTTER_DIR"
else
  echo "Flutter SDK directory found."
fi

export PATH="$PATH:$FLUTTER_DIR/bin"

echo "=== Flutter Version ==="
flutter --version

echo "=== Installing Dependencies ==="
flutter config --no-analytics
flutter pub get

echo "=== Building Flutter Web Release ==="
flutter build web --release --base-href /

echo "=== Flutter Web Build Completed Successfully ==="
