# Prompt File Template Documentation

This document explains the exact Markdown file format needed to auto-generate prompt pages in the Jekyll CMS.

## File Structure

Every prompt file should be saved in the `_prompts/` directory with a `.md` extension and follow this exact frontmatter structure:

```yaml
---
title: "🔮Your Prompt Title Here"
description: "Engaging description that explains what this prompt collection does and the value it provides to users."
icon: "🔮"  # Emoji icon for visual identification
categories: ["Category1", "Category2"]  # Array of categories
pack: "Pack Name 💸"  # Which pack this belongs to
pack_slug: "pack-slug"  # URL-friendly pack identifier
featured: true  # true/false - whether to show on homepage
slug: "unique-identifier-for-tracking"  # Unique tracking ID
prompts:
  - text: |
      Your first prompt text here.
      Use [placeholders] for customizable parts.
      
      Structure your prompt with:
      - Clear instructions
      - Placeholder variables: [Your Variable]
      - Expected outputs
      
      Multi-line prompts work perfectly.
    explanation: "Explanation of how to use this specific prompt and what results to expect."
  
  - text: |
      Your second prompt variation here.
      Keep it focused and actionable.
    explanation: "Brief explanation for this prompt variation."

tips:
  - title: "Tip Title Here"
    description: "Practical advice for using these prompts effectively."
  
  - title: "Another Helpful Tip"
    description: "More guidance to help users get better results."

related_prompts:
  - "filename-of-related-prompt"
  - "another-related-prompt"
---

## Additional Content (Optional)

Any content you write after the frontmatter will appear at the bottom of the prompt page. You can use Markdown formatting here to provide additional context, examples, or detailed explanations.

### Example Section
- Use bullet points
- Add code examples
- Include **bold** and *italic* text
- Create [links](https://example.com)
```

## Required Fields Explanation

### Essential Frontmatter Fields

| Field | Type | Description | Example |
|-------|------|-------------|---------|
| `title` | String | Page title with emoji | `"🔮Providing Performance Reports"` |
| `description` | String | SEO and preview description | `"Transform raw data into..."` |
| `icon` | String | Emoji for visual identification | `"🔮"` |
| `categories` | Array | Category tags for filtering | `["Business", "Analytics"]` |
| `pack` | String | Pack name with emoji | `"Business Pack 💸"` |
| `pack_slug` | String | URL-friendly pack identifier | `"business-pack"` |
| `featured` | Boolean | Show on homepage | `true` or `false` |
| `slug` | String | Unique tracking identifier | `"prc_performance-reports-business-nwd70s6z"` |

### Prompts Array Structure

Each prompt in the `prompts` array must have:

```yaml
- text: |
    Your prompt text here
    Use [placeholders] for variables
    Multiple lines are supported
  explanation: "How to use this prompt"
```

### Tips Array Structure

```yaml
- title: "Tip Title"
  description: "Detailed tip description"
```

### Related Prompts Array

```yaml
related_prompts:
  - "filename-without-extension"
  - "another-related-file"
```

## File Naming Convention

- Use lowercase letters
- Replace spaces with hyphens
- Use descriptive names
- Example: `providing-performance-reports.md`

## Categories Available

Based on your `_config.yml`, available categories include:
- Agency
- Assistants  
- Business
- Copywriting
- HR
- Marketing
- Productivity
- Real Estate
- Sales
- Startups
- Support
- Web Development

## Packs Available

Available packs from your configuration:
- Agency Pack 🏌️
- Assistants Pack ✍️
- Business Pack 💸
- Copywriting Pack ✍🏼
- HR Pack 🤝
- Marketing Pack 🤖
- Productivity Pack ✔️
- Real Estate Pack 🏠
- Sales Pack 💰
- Startups Pack 🚀
- Support Pack 💬
- Web Development Pack 💻

## Jekyll Collection Behavior

When you save a file with this structure in `_prompts/`:

1. **Auto-Generated URL**: `/prompts/filename/`
2. **Automatic Layout**: Uses `prompt.html` layout
3. **Category Filtering**: Appears in category filters
4. **Pack Grouping**: Groups with other pack prompts
5. **Featured Display**: Shows on homepage if `featured: true`
6. **Search Integration**: Searchable via site search
7. **Related Links**: Auto-links to related prompts

## Example Complete File

See the example files created:
- `becoming-expert-chatgpt.md`
- `generating-pinterest-ads.md` 
- `providing-performance-reports.md`

These demonstrate the complete structure with multiple prompts, tips, and related content.

## Best Practices

1. **Clear Titles**: Use descriptive titles with relevant emojis
2. **Engaging Descriptions**: Write compelling descriptions that explain value
3. **Structured Prompts**: Use clear formatting with placeholders
4. **Helpful Explanations**: Explain how to customize each prompt
5. **Practical Tips**: Provide actionable advice for better results
6. **Relevant Categories**: Tag appropriately for discoverability
7. **Unique Slugs**: Use unique tracking identifiers
8. **Related Connections**: Link to relevant prompts for user journey

## Deployment

After creating or editing prompt files:

1. Commit changes to Git
2. Push to GitHub
3. GitHub Actions automatically rebuilds the site
4. New prompts appear live within 1-2 minutes

The Jekyll collection system automatically handles:
- Page generation
- Navigation integration  
- Category filtering
- Pack grouping
- Search indexing
- Related prompt suggestions

