# GitHub Actions Workflows

This directory contains automated workflows for maintaining the Diatonic AI Prompts Jekyll site. These workflows ensure data integrity, security, performance, and SEO optimization.

## 🔄 Workflows Overview

### 1. `jekyll.yml` - Main Build and Deploy
**Triggers:** Push/PR to main, manual dispatch
**Purpose:** Core CI/CD pipeline with comprehensive validation

**Features:**
- ✅ **Data Validation**: YAML structure, required fields, template consistency
- ✅ **Build Validation**: Jekyll build success, page generation verification
- ✅ **Auto-Deploy**: GitHub Pages deployment
- ✅ **Dependency Chain**: Validation → Build → Deploy

### 2. `pr-validation.yml` - Pull Request Validation
**Triggers:** Pull requests to main
**Purpose:** Validate changes before they reach main branch

**Features:**
- ✅ **Change Detection**: Only validates modified files
- ✅ **Prompt Validation**: Required frontmatter fields, YAML structure
- ✅ **Duplicate Detection**: Prevents slug conflicts
- ✅ **Category Validation**: Ensures valid category references

### 3. `site-maintenance.yml` - Automated Site Maintenance
**Triggers:** Daily at 2 AM UTC, manual dispatch, prompt/data changes
**Purpose:** Keep site statistics and metadata current

**Features:**
- ✅ **Statistics Updates**: Auto-count prompts, categories, packs
- ✅ **SEO Data Generation**: Sitemap data, meta information
- ✅ **README Updates**: Keep statistics current in documentation
- ✅ **Health Checks**: Verify build integrity and page generation
- ✅ **Auto-Commit**: Commits updates back to repository

### 4. `seo-validation.yml` - SEO and Link Validation
**Triggers:** Weekly on Sundays, manual dispatch, template changes
**Purpose:** Ensure SEO best practices and link integrity

**Features:**
- ✅ **Meta Tag Validation**: Title, description, Open Graph tags
- ✅ **Link Checking**: Internal links, broken link detection
- ✅ **Sitemap Validation**: XML structure and completeness
- ✅ **Accessibility Testing**: Automated accessibility audits
- ✅ **Performance Metrics**: File sizes, page counts

### 5. `security-updates.yml` - Security and Dependencies
**Triggers:** Monthly on 1st, manual dispatch, Gemfile changes
**Purpose:** Maintain security and dependency health

**Features:**
- ✅ **Security Audits**: Vulnerability scanning with bundler-audit
- ✅ **Dependency Updates**: Automated gem updates via PR
- ✅ **Sensitive Data Scanning**: Detect potential data leaks
- ✅ **Performance Auditing**: Build time and size monitoring
- ✅ **Auto-PR Creation**: Creates PRs for dependency updates

## 📊 Validation Rules

### Prompt File Validation
Every prompt file (`_prompts/*.md`) must contain:
- `title`: Descriptive title with optional emoji
- `description`: Brief explanation of the prompt's purpose
- `categories`: Array of valid categories from `_data/categories.yml`
- `slug`: Unique URL identifier
- `prompts`: Array of actual prompt content
- YAML frontmatter delimited by `---`

### Data Consistency
- Templates use `site.data.categories` and `site.data.packs` consistently
- No duplicate slugs across prompt files
- All category references exist in `_data/categories.yml`
- Pack references match `_data/packs.yml` entries

### Security Standards
- No hardcoded sensitive data (passwords, tokens, keys)
- Jekyll security settings reviewed
- Dependencies scanned for vulnerabilities
- Build environment isolated and secure

## 🎯 Key Benefits

### 1. **Automated Quality Assurance**
- Prevents broken builds from reaching production
- Validates data integrity before deployment
- Catches common errors early in development cycle

### 2. **SEO Optimization**
- Ensures proper meta tags on all pages
- Validates sitemap generation and structure
- Monitors page performance and accessibility

### 3. **Security Maintenance**
- Regular dependency updates via automated PRs
- Vulnerability scanning and alerting
- Sensitive data leak prevention

### 4. **Performance Monitoring**
- Build time tracking and optimization alerts
- Site size monitoring and recommendations
- Page generation verification

### 5. **Developer Experience**
- Clear validation feedback on PRs
- Automated statistics updates
- Comprehensive error reporting

## 🔧 Configuration Files

### `.yamllint.yml`
YAML linting configuration for consistent formatting:
- Line length: 120 characters
- Indentation: 2 spaces
- Truthy values: Flexible settings for Jekyll
- Document start: Optional for frontmatter

### Workflow Dependencies
- **Ruby 3.1**: Consistent Ruby version across all workflows
- **bundler-audit**: Security vulnerability scanning
- **yamllint**: YAML structure validation
- **axe-core**: Accessibility testing
- **beautifulsoup4**: HTML parsing for SEO validation

## 📈 Monitoring and Reports

### Automated Reports
1. **Validation Report**: Daily build status and validation results
2. **SEO Report**: Weekly SEO and performance metrics
3. **Security Report**: Monthly security audit results
4. **Health Report**: Site integrity and build metrics

### Artifacts Generated
- Site health reports (30-day retention)
- SEO validation reports (30-day retention)
- Accessibility audit results (30-day retention)
- Performance audit reports (30-day retention)

### Status Indicators
- ✅ **Green**: All validations passed
- ⚠️ **Yellow**: Warnings detected (build continues)
- ❌ **Red**: Critical errors (build fails)

## 🚀 Getting Started

### For New Prompts
1. Create `.md` file in `_prompts/` directory
2. Use proper YAML frontmatter structure
3. Ensure unique slug
4. Reference valid categories
5. Pull request will auto-validate

### For Data Changes
1. Modify `_data/categories.yml` or `_data/packs.yml`
2. Ensure consistent structure
3. Site maintenance workflow will update statistics
4. Templates will automatically reflect changes

### Manual Triggers
All workflows support manual triggering via GitHub Actions UI:
1. Go to **Actions** tab in repository
2. Select desired workflow
3. Click **Run workflow**
4. Choose branch and trigger

## 🛠️ Troubleshooting

### Common Issues
1. **YAML Validation Errors**: Check frontmatter structure and indentation
2. **Duplicate Slugs**: Ensure all prompt slugs are unique
3. **Missing Categories**: Verify categories exist in `_data/categories.yml`
4. **Build Failures**: Check Jekyll logs for syntax errors

### Debug Mode
Enable verbose logging by adding to workflow files:
```yaml
env:
  ACTIONS_STEP_DEBUG: true
  ACTIONS_RUNNER_DEBUG: true
```

## 📝 Contributing

When modifying workflows:
1. Test changes in feature branch
2. Verify workflow syntax with GitHub Actions validator
3. Update this documentation for new features
4. Ensure backward compatibility

---

*This automation system ensures the Diatonic AI Prompts site maintains high quality, security, and performance standards with minimal manual intervention.*
