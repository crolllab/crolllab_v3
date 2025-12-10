# Copilot Instructions for Croll Lab Website

This is a Jekyll-based academic lab website using the [Greene Lab Website Template](https://greene-lab.gitbook.io/lab-website-template-docs).

## Architecture Overview

- **Jekyll static site** (Ruby/Liquid templates) with YAML-driven data
- **Citation system**: Python scripts in `_cite/` auto-generate `_data/citations.yaml` from DOIs
- **Content types**: Members (`_members/`), Publications (`_data/sources.yaml`), Blog posts (`_posts/`)

## Key Developer Workflows

```bash
# Local development
bundle install && bundle exec jekyll serve

# Regenerate citations after adding sources
cd _cite && python cite.py
```

## Content Patterns

### Adding Team Members (`_members/*.md`)
Use filename format: `firstname-lastname.md`. Required frontmatter:
```yaml
---
name: Full Name
image: images/team/firstname.jpg  # photo in images/team/
group: current | alumni           # determines page section
role: pi | postdoc | phd | undergrad | staff  # from _data/types.yaml
links:
  email: name@unine.ch
  orcid: 0000-0000-0000-0000      # optional
---
Bio text here (markdown supported)
```

### Adding Publications (`_data/sources.yaml`)
Add DOI entries—citations auto-populate via `_cite/cite.py`:
```yaml
- id: doi:10.1234/example
  type: paper | preprint | review | book
  image: /images/pub_images/example.png   # optional thumbnail
  tags:
    - Highlight                           # appears in filter buttons
    - Zymoseptoria                        # research topic tags
```

### Blog Posts (`_posts/YYYY-MM-DD-title.md`)

**Quick start with script:**
```bash
./_scripts/new-blog-post.sh "Post Title" "AuthorName"
```
This creates the post file and image folder automatically.

**Manual creation:** Use filename `YYYY-MM-DD-slug.md`. Frontmatter:
```yaml
---
title: "Post Title"
date: YYYY-MM-DD
author: FirstName
---
```

**Adding images:** Place images in `images/blog/blog_YYYY-MM-DD/` and use the gallery include:
```liquid
{% include blog-gallery.html folder="blog_2025-01-15" images="
photo1.jpg::Caption for first photo
photo2.jpg::Caption for second photo
" %}

[Back to all blogs](/blog/)
```

## Template Components

Use Jekyll includes from `_includes/` in markdown pages:
- `{% include list.html data="members" component="portrait" filters="role: phd, group: current" %}`
- `{% include feature.html image="images/x.png" title="Title" text=text %}`
- `{% include button.html link="url" text="Label" icon="fa-solid fa-arrow-right" %}`

## Data Files Reference

| File | Purpose |
|------|---------|
| `_data/sources.yaml` | Publication DOIs (input for cite.py) |
| `_data/citations.yaml` | **Auto-generated** - never edit manually |
| `_data/types.yaml` | Role icons, link types, publication types |
| `_config.yaml` | Site metadata, Jekyll settings |

## Important Conventions

- **Images organization**:
  - `images/team/` – member portraits and group photos
  - `images/blog/` – blog post images
  - `images/pub_images/` – publication thumbnails
  - `images/site/` – page assets (homepage, contact, research)
  - Top-level: shared assets (background.jpg, logo.jpg, icon.png, fallback.svg)
- **Icons**: Use Font Awesome classes (e.g., `fa-solid fa-users`)
- **Member roles**: Must match keys in `_data/types.yaml` (pi, postdoc, phd, undergrad, staff, programmer, mascot)
- **DOIs**: Prefix with `doi:` in sources.yaml for proper plugin resolution
