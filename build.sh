#!/bin/sh
# Regenerate styles.css from the utility classes used in index.html.
# Run after adding any new Tailwind class — including ones inside the JS strings,
# which the CLI picks up because it scans the file as plain text.
set -e
cd "$(dirname "$0")"
printf '@tailwind base;\n@tailwind utilities;\n' > .tw-input.css
npx --yes tailwindcss@3 -i .tw-input.css -o styles.css --content index.html --minify
rm .tw-input.css
echo "styles.css rebuilt: $(wc -c < styles.css) bytes"
