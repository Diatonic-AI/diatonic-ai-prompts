# 📝 Exact Markdown Template Format

Use this exact format to create new prompts that auto-generate with all components:

## 🎯 PROMPT FILE TEMPLATE

Save as: `_prompts/your-prompt-name.md`

```markdown
---
title: "⛑Your Prompt Title Here"
description: "If you're looking to [describe the goal], ChatGPT can be a valuable tool in helping you [explain the benefit]. By providing prompts and suggestions, ChatGPT can save you time and ensure that [explain what it ensures]. Here are some prompts to get you started:"
icon: "⛑"
categories: ["Web Development"]
pack: "Web Development Pack 💻"
pack_slug: "web-development-pack"
featured: true
slug: "prc_ultimate-chatgpt-web-developer-prompt-pack-hscx0sqa"
prompts:
  - text: |
      In order to curate and design highly personalized and engaging illustrations for the [SPECIFICWEBSITENAME] website, we are seeking expert guidance and recommendations. Could you please provide us with some advanced, innovative, and [ADJECTIVE1] strategies, methodologies, or digital tools that would enhance our design process? Additionally, could you also elaborate on how these techniques can be utilized effectively to align with our website's aesthetics, user interface, and overall branding? Furthermore, if possible, could you provide case studies or examples where such [ADJECTIVE2] techniques have yielded successful results in the past?
    explanation: "Replace [SPECIFICWEBSITENAME] with your website name, [ADJECTIVE1] with descriptive words like 'cutting-edge' or 'innovative', and [ADJECTIVE2] with words like 'advanced' or 'proven'."

  - text: |
      "Develop a detailed data protection policy for a [WEBSITE NAME] that processes sensitive data, such as [SPECIFY TYPES OF SENSITIVE DATA], in accordance with [APPLICABLE LAWS AND INDUSTRY STANDARDS]. The policy should include measures to ensure the [CONFIDENTIALITY/INTEGRITY/AVAILABILITY] of the data, as well as procedures for handling [DATA BREACHES/USER REQUESTS]."
    explanation: "Customize [WEBSITE NAME] with your site name, specify the types of sensitive data you collect, and include relevant laws like GDPR or CCPA."

  - text: |
      "Create a website data protection policy for a [WEBSITE NAME] that operates in multiple jurisdictions and must comply with [APPLICABLE LAWS AND REGULATIONS]. The policy should address how the website will handle [CROSS-BORDER DATA TRANSFERS/USER CONSENT/DATA SUBJECT RIGHTS] and provide users with clear and concise information about their rights and how to exercise them."
    explanation: "Perfect for international websites. Replace placeholders with your specific jurisdictions and applicable regulations."

  - text: |
      "Generate a data protection policy for a [WEBSITE NAME] that collects and processes personal data for various purposes, such as [SPECIFY PURPOSES]. The policy should describe how the website will obtain user consent, use [COOKIES/OTHER TRACKING TECHNOLOGIES], and ensure the [SECURITY/INTEGRITY/AVAILABILITY] of the data. Additionally, it should provide users with clear and concise information about their rights and how to exercise them."
    explanation: "Specify your data collection purposes like 'marketing analytics' or 'user experience improvement' and detail your tracking methods."

  - text: |
      "Develop a data protection policy for a [WEBSITE NAME] that allows users to create accounts and store personal information, such as [SPECIFY TYPES OF INFORMATION]. The policy should address how the website will protect user data, including [PASSWORD STORAGE/ENCRYPTION], and how users can access, modify, or delete their information. Furthermore, it should outline the website's procedures for handling [DATA BREACHES/USER COMPLAINTS]."
    explanation: "Ideal for sites with user accounts. Specify what personal information you store and your security measures."

tips:
  - title: "Use specific keywords related to website accessibility"
    description: "Use terms like 'assistive technology' or 'screen reader' to help ChatGPT understand the context of your prompt."
  
  - title: "Break down your questions into smaller, more specific parts"
    description: "This helps ChatGPT provide more accurate and relevant answers for your specific needs."
  
  - title: "Include details about your target audience"
    description: "Specify users with visual impairments, mobile users, etc. to help ChatGPT provide more tailored guidance."
---

Website data protection policies are essential for maintaining user trust and legal compliance. Whether you're developing a new site or updating existing policies, these prompts will help you create comprehensive protection frameworks that address modern privacy concerns.

The key to effective data protection policies lies in being specific about your data handling practices while remaining accessible to your users. These prompts guide you through various scenarios from simple data collection to complex multi-jurisdictional requirements.
```

---

## 🗂️ CATEGORIES TEMPLATE

Add new categories to: `_data/categories.yml`

```yaml
- name: "Your New Category"
  slug: "your-new-category"
  icon: "🎯"
```

**Existing Categories:**
- Agency 🏌️
- Assistants ✍️  
- Business 💸
- Copywriting ✍🏼
- HR 🤝
- Marketing 🤖
- Productivity ✔️
- Real Estate 🏠
- Sales 💰
- Startups 🚀
- Support 💬
- Web Development 💻

---

## 📦 PACKS TEMPLATE

Add new packs to: `_data/packs.yml`

```yaml
- name: "Your New Pack"
  icon: "🎯"
  slug: "your-new-pack"
```

**Existing Packs:**
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

---

## 📋 FIELD REQUIREMENTS

### Required Frontmatter:
```yaml
title: "⛑Your Title"           # Title with emoji
description: "Description..."    # Intro paragraph 
icon: "⛑"                      # Same emoji as title
categories: ["Category"]        # Array with one category
pack: "Pack Name 💻"           # Pack with emoji
pack_slug: "pack-slug"         # URL-friendly pack name
featured: true                 # true/false for homepage
slug: "unique-tracking-id"     # Unique identifier
```

### Prompts Array:
```yaml
prompts:
  - text: |
      Your prompt with [PLACEHOLDERS] here.
      Multiple lines are fine.
    explanation: "How to use this prompt and customize placeholders."
```

### Tips Array:
```yaml
tips:
  - title: "Tip Title"
    description: "Practical advice for better results."
```

---

## 🎯 AUTO-GENERATED COMPONENTS

When you save a file with this format:

✅ **Individual prompt page** at `/prompts/filename/`  
✅ **Category filtering** in sidebar  
✅ **Pack grouping** with checkboxes  
✅ **Featured display** on homepage (if `featured: true`)  
✅ **Related prompts** section  
✅ **Tips section** with expandable cards  
✅ **Copy buttons** for each prompt  
✅ **SEO meta tags** and descriptions  

---

## 📁 FILE NAMING

- Use lowercase
- Replace spaces with hyphens  
- Be descriptive
- Example: `write-website-data-protection-policy.md`

---

## 🚀 QUICK START

1. Copy the template above
2. Replace all placeholder text
3. Customize prompts with your [PLACEHOLDERS]
4. Add helpful tips
5. Save as `_prompts/your-filename.md`
6. Site automatically rebuilds with your new prompt!

The Jekyll system will generate everything automatically using your existing layouts and styling.
