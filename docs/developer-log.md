


December 2, 2025

1. Added web and design engines to the app

```ruby
gem "web", path: "~/code/engines/nobuild/managed_web"
gem "design", path: "~/code/engines/nobuild/managed_design"
```

2. intalled the migrations and migrated the database:

```
bin/rails web_engine:install:migrations
bin/rails design_engine:install:migrations
rails db:migrate:primary
```


3. for the design engine, we need install the iconography component:

a. download the icon library
b. load the icons into the design engine


```
% rails  generate rails_icons:sync --libraries=lucide --destination=app/assets/svg/icons
Cloning into '/Users/angantyr/code/sandbox/foundational/tmp/rails_icons/lucide'...
[Rails Icons] 'lucide' repository cloned successfully.
[Rails Icons] Icon variants processed successfully
[Rails Icons] Non-SVG files removed successfully
[Rails Icons] Synced 'lucide' library successfully 🎉
```

```
% rails design:import_icons
Importing icons for library: lucide
  Using variant: outline
    Added icons for variant: outline
✅ Icon import complete!
```

4. migrate data and web rake tasks to build website and pages

```
lib/tasks/data/sites.yml
lib/tasks/data/pages.yml
lib/tasks/helpers.rake
lib/tasks/web.rake
```

5. rebuild the website and pages data

```
rake foundational:web:rebuild
```

6. Fixed SQLite compatibility in rake helpers

Updated `lib/tasks/helpers.rake` to make `truncate_action_text_tables` adapter-aware (SQLite doesn't support TRUNCATE syntax).

7. Extended engine models with concerns

Created `config/initializers/extend_engine_models.rb` to cleanly extend engine models without copying entire classes:

```ruby
# config/initializers/extend_engine_models.rb
Rails.application.config.to_prepare do
  Web::Page.include Design::Iconifiable unless Web::Page.include?(Design::Iconifiable)
  Web::Page.include Media::Placeholder unless Web::Page.include?(Media::Placeholder)
end
```

This pattern allows extending engine models with application-specific concerns while keeping code DRY.
