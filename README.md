# Sintra AI Prompts - Dynamic CMS Website

A comprehensive prompt library website built with Jekyll and GitHub Pages. This dynamic CMS allows easy management of ChatGPT prompts with identical structure across all prompt landing pages.

## Features

- **Dynamic Content Management**: Easy-to-manage prompt collections using Jekyll collections
- **Responsive Design**: Mobile-first design that works on all devices
- **Search Functionality**: Real-time search through prompts
- **Category Filtering**: Filter prompts by categories and industries
- **SEO Optimized**: Built-in SEO optimization with meta tags and structured data
- **Copy-to-Clipboard**: One-click copying of prompts
- **GitHub Pages Ready**: Automatic deployment via GitHub Pages

## Project Structure

```
├── _config.yml              # Jekyll configuration
├── _layouts/                 # Page layouts
│   ├── default.html         # Main layout template
│   └── prompt.html          # Prompt page layout
├── _includes/                # Reusable components
│   ├── header.html          # Site header
│   └── footer.html          # Site footer
├── _prompts/                 # Prompt collection
│   ├── becoming-expert-chatgpt.md
│   └── writing-blog-posts.md
├── assets/                   # Static assets
│   ├── css/
│   │   └── main.css         # Main stylesheet
│   ├── js/
│   │   └── main.js          # JavaScript functionality
│   └── images/              # Images and icons
├── index.html               # Homepage
├── Gemfile                  # Ruby dependencies
└── README.md               # This file
```

## Getting Started

### Prerequisites

- Ruby 2.7+ and RubyGems
- Jekyll 4.3+
- Git

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/prompt-library.git
   cd prompt-library
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Start the development server**
   ```bash
   bundle exec jekyll serve
   ```

4. **Open your browser**
   Navigate to `http://localhost:4000`

### Adding New Prompts

1. Create a new markdown file in the `_prompts/` directory
2. Use the following frontmatter structure:

```yaml
---
title: "Your Prompt Title"
description: "Brief description of what this prompt does"
icon: "🎯"  # Optional emoji icon
categories: ["Business", "Marketing"]  # Array of categories
featured: true  # Optional: display on homepage
prompts:
  - text: |
      Your actual prompt text here.
      Use [placeholders] for customizable parts.
    explanation: "Explanation of how to use this prompt"
  - text: |
      Second prompt variation
    explanation: "Another explanation"
tips:
  - title: "Tip Title"
    description: "Helpful tip for using these prompts"
---

Additional content about the prompt collection goes here.
```

### Customization

#### Updating Site Configuration

Edit `_config.yml` to customize:
- Site title and description
- Navigation menu items
- Categories and packs
- Social media links
- SEO settings

#### Styling

- Main styles are in `assets/css/main.css`
- CSS variables are defined at the top for easy color customization
- Responsive breakpoints are included

#### JavaScript Features

- Search functionality
- Mobile menu
- Category filtering
- Copy-to-clipboard for prompts
- Analytics tracking (configure in `main.js`)

## Deployment

### GitHub Pages (Recommended)

1. **Create a GitHub repository**
2. **Push your code to the repository**
3. **Enable GitHub Pages**
   - Go to repository Settings
   - Scroll to Pages section
   - Select "Deploy from a branch"
   - Choose "main" branch and "/ (root)" folder
   - Click Save

4. **Configure your domain** (optional)
   - Add a CNAME file with your custom domain
   - Update DNS settings to point to GitHub Pages

### Manual Deployment

1. **Build the site**
   ```bash
   bundle exec jekyll build
   ```

2. **Deploy the `_site/` folder** to your web server

## Content Management

### Categories

Categories are defined in `_config.yml` under the `categories` section. Each category has:
- `name`: Display name
- `slug`: URL-friendly identifier
- `icon`: Optional emoji icon

### Packs

Sintra Packs are defined in `_config.yml` under the `packs` section. These are collections of related prompts.

### Featured Prompts

Set `featured: true` in a prompt's frontmatter to display it on the homepage.

## SEO Optimization

The site includes several SEO features:
- Meta tags and Open Graph tags
- Structured data markup
- XML sitemap generation
- SEO-friendly URLs
- Fast loading times

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)
- Mobile browsers

## Contributing

1. Fork the repository
2. Create a feature branch
3. Add your prompts or improvements
4. Submit a pull request

## License

This project is open source and available under the [MIT License](LICENSE).

## Support

For questions or support, please:
- Open an issue on GitHub
- Contact us at your-email@domain.com

## Roadmap

- [ ] Advanced search filters
- [ ] User-generated prompts
- [ ] Prompt rating system
- [ ] Export functionality
- [ ] API integration
- [ ] Multi-language support

---

Built with ❤️ using Jekyll and GitHub Pages

