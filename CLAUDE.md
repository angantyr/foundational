# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Foundational is a Rails 8.0.4 application using Ruby 3.3.2. It leverages modern Rails features including:
- **Hotwire** (Turbo + Stimulus) for interactive UIs without complex JavaScript
- **css-zero** for zero-runtime CSS with utility classes
- **Propshaft** for asset pipeline (no preprocessing)
- **Slim templates** for concise view markup
- **ViewComponent** for reusable view components
- **Lookbook** for component preview and documentation

The application is configured with a local managed engine at `~/code/engines/nobuild/managed_engine`.

## Multi-Database Architecture

The application uses a **multi-database setup** with three separate SQLite databases:

1. **Primary database** (`storage/foundational_development`)
   - Standard Rails models inherit from `ApplicationRecord`
   - Default database for application data

2. **Managed database** (`storage/development_managed.sqlite3`)
   - Models inherit from `ManagedRecord` (app/models/managed_record.rb:1)
   - Migrations in `db/managed_migrate/`
   - Connected via: `connects_to database: { writing: :managed }`

3. **Search database** (`storage/development_search.sqlite3`)
   - Models inherit from `SearchRecord` (app/models/search_record.rb:1)
   - Migrations in `db/search_migrate/`
   - Connected via: `connects_to database: { writing: :search, reading: :search }`

When creating new models, determine which database they belong to and inherit from the appropriate base class.

## Development Commands

### Setup
```bash
bin/setup                    # Install dependencies, prepare databases, start server
bin/setup --skip-server      # Setup without starting the server
```

### Running the Application
```bash
bin/dev                      # Start development server (wraps bin/rails server)
bin/rails server             # Start Rails server directly
```

### Database Operations
```bash
# Primary database
bin/rails db:migrate
bin/rails db:rollback
bin/rails db:schema:load

# Managed database
bin/rails db:migrate:managed
bin/rails db:rollback:managed

# Search database
bin/rails db:migrate:search
bin/rails db:rollback:search

# All databases
bin/rails db:prepare         # Setup all databases (create, migrate, seed)
```

### Testing
```bash
bin/rails test                              # Run all tests (parallel by default)
bin/rails test test/models/user_test.rb     # Run specific test file
bin/rails test test/models/user_test.rb:12  # Run test at specific line
bin/rails test:system                       # Run system tests (Capybara/Selenium)
```

Tests run in parallel using all processor cores (configured in test/test_helper.rb:8).

### Code Quality
```bash
bin/rubocop                  # Run RuboCop linter (Omakase style)
bin/rubocop -a               # Auto-correct offenses
bin/brakeman                 # Security vulnerability scan
```

RuboCop uses the Rails Omakase style guide (config: .rubocop.yml:2).

### Component Development
```bash
bin/rails lookbook:preview   # Start Lookbook component preview server
```

Use Lookbook to develop and preview ViewComponents in isolation.

### Asset Management
```bash
bin/importmap pin <package>  # Add JavaScript package via importmap
```

The application uses **css-zero** for styling, which provides:
- Reset styles (loaded first)
- CSS variables for theming
- Utility classes (loaded last for high specificity)

**css-zero Architecture**:
- The css-zero gem (`~/.rvm/gems/ruby-3.3.2@foundational/gems/css-zero-3.1.0`) contains ONLY:
  - Design tokens (colors, sizes, typography, borders, effects, etc.)
  - Utility classes
- Component CSS files (button.css, input.css, etc.) are NOT in the gem
- Components are generated into `app/assets/stylesheets/` by the css-zero installer
- Components are meant to be customized locally

**Finding css-zero component templates**:
1. GitHub: https://github.com/lazaronixon/css-zero/blob/master/lib/generators/css_zero/add/templates/app/assets/stylesheets
2. Local gem bundle: `bundle show css-zero` then look in `lib/generators/css_zero/add/templates/app/assets/stylesheets/`

Load order (controlled by `application.css`):
1. Fonts (Google Fonts import)
2. `css-zero/reset` - Clean slate
3. `variables.css` - Design tokens (imports from css-zero)
4. `css-zero/utilities` - Framework utilities
5. `css_zero/button.css` - Generated component base styles
6. `base.css` - Custom theme/base styles
7. `buttons.css` - Custom component overrides
8. `header.css` - Custom components
9. Custom utility extensions (max-i-*, leading-*, tracking-*)

## Architecture Notes

### View Layer Organization

**Shared partials** are in `app/views/application/`:
- `_flash.html.erb` - Flash message display
- `_header.html.erb` - Main header
- `_header_menu.html.erb` - Header navigation menu
- `_mobile_menu.html.erb` - Mobile navigation

**Layout structure**: The main layout uses `.header-layout` body class with a `<main id="main">` container wrapping a `.container` div for content.

### Styling Approach

Custom fonts are imported via Google Fonts (application.css:11):
- **Mona Sans** - Main body font
- **Sour Gummy** - Title font (use `.font-title` class)

The `.prose` class provides semantic typography for content areas.

**Important**: With Propshaft, all custom stylesheets must be:
1. Added to asset paths in `config/initializers/assets.rb:8`
2. Explicitly loaded in the layout with `stylesheet_link_tag`
3. Loaded **after** `css-zero/utilities` to override utility classes

Component-specific styles should be in separate CSS files (e.g., `header.css`, `button.css`) and loaded individually in the layout.

### Key Gems and Their Purposes

- **acts-as-taggable-on** - Tagging functionality
- **acts_as_list** - Ordered list behavior for models
- **acts_as_tree** - Hierarchical/tree structure for models
- **ransack** - Advanced search/filtering
- **pagy** - Fast pagination
- **simple_form** - Form builder
- **aasm** - State machine implementation
- **stringex** - String extensions for URLs/slugs
- **rails_icons** - Icon helper integration
- **inline_svg** - SVG embedding with optimization
- **annotaterb** - Annotate models with schema info

### Database Schema Management

Each database has its own schema file:
- `db/schema.rb` - Primary database
- `db/managed_schema.rb` - Managed database (substantial schema at 8KB)
- `db/search_schema.rb` - Search database

The managed database appears to be the most complex with extensive migrations (25 files in db/managed_migrate/).

### Deployment

The application includes:
- **Kamal** configuration (config/deploy.yml) for Docker-based deployment
- **Thruster** for HTTP caching/compression in production
- **Solid Queue** for background jobs
- **Solid Cache** for database-backed caching
- **Solid Cable** for ActionCable/WebSockets

Dockerfile is provided for containerized deployment.
