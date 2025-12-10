#!/bin/bash
# Creates a new blog post with image gallery structure
# Usage: ./_scripts/new-blog-post.sh "Post Title" "author-name"

set -e

# Get today's date
DATE=$(date +%Y-%m-%d)

# Process arguments
TITLE="${1:-New Post}"
AUTHOR="${2:-Daniel}"

# Create slug from title (lowercase, spaces to hyphens)
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | sed 's/[^a-z0-9-]//g')

# File paths
POST_FILE="_posts/${DATE}-${SLUG}.md"
IMAGE_DIR="images/blog/blog_${DATE}"

# Create image directory
mkdir -p "$IMAGE_DIR"

# Create post file
cat > "$POST_FILE" << EOF
---
title: "${TITLE}"
date: ${DATE}
author: ${AUTHOR}
---

Write your post content here...

{% include blog-gallery.html folder="blog_${DATE}" images="
image1.jpg::Caption for first image
image2.jpg::Caption for second image
" %}

[Back to all blogs](/blog/)
EOF

echo "✅ Created: $POST_FILE"
echo "✅ Created: $IMAGE_DIR/"
echo ""
echo "Next steps:"
echo "1. Add images to: $IMAGE_DIR/"
echo "2. Update the images list in: $POST_FILE"
echo "3. Edit the post content"
