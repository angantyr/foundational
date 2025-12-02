# Supporting CSS and Tailwind Component Variants

## Context

This sandbox project uses CSS (css-zero) for component styling. The production `managed_design` engine uses Tailwind. We want to maintain both versions while keeping organization and APIs consistent.

## Recommended Strategy: ViewComponent Variants

Use ViewComponent's built-in variant support to maintain two template versions with shared Ruby logic.

### Structure

```
app/components/design/navigation/menu/
  dropdown_component.rb                    # Shared Ruby logic
  dropdown_component.html+css.erb          # CSS template
  dropdown_component.html+tailwind.erb     # Tailwind template (future)
```

### Implementation Steps

1. **Keep Ruby classes framework-agnostic**
   - No styling logic in Ruby
   - Only structural/behavioral logic
   - Same API regardless of styling approach

2. **Create parallel templates**
   - `.html+css.erb` - uses css-zero classes and semantic CSS
   - `.html+tailwind.erb` - uses Tailwind utility classes
   - Same structure, different class names

3. **Configure variant per environment**
   ```ruby
   # config/initializers/design_system.rb
   Rails.application.config.design_system_variant =
     ENV.fetch("DESIGN_SYSTEM_VARIANT", "css").to_sym
   ```

4. **Set ViewComponent variant in controller**
   ```ruby
   class ApplicationController < ActionController::Base
     before_action :set_component_variant

     private

     def set_component_variant
       variant = Rails.configuration.design_system_variant
       request.variant = variant if variant
     end
   end
   ```

### Example Component

**dropdown_component.rb** (shared):
```ruby
class Design::Navigation::Menu::DropdownComponent < ViewComponent::Base
  def initialize(trigger: :click)
    @trigger = trigger
  end

  def hover_trigger?
    @trigger == :hover
  end
end
```

**dropdown_component.html+css.erb**:
```erb
<nav class="dropdown-menu" data-controller="popover">
  <button class="btn dropdown-menu__trigger">Menu</button>
  <!-- CSS classes -->
</nav>
```

**dropdown_component.html+tailwind.erb**:
```erb
<nav class="relative" data-controller="popover">
  <button class="px-4 py-2 bg-blue-500 text-white rounded">Menu</button>
  <!-- Tailwind classes -->
</nav>
```

### Migration Path to Engine

1. Copy component structure to `managed_design` engine
2. Move templates to appropriate variant directories
3. Configure engine to support both variants
4. Apps can specify which variant to use
5. Can even mix variants per-component if needed

### Benefits

- ✅ Shared business logic (DRY)
- ✅ Clean template separation
- ✅ Built-in ViewComponent feature
- ✅ Easy to test both versions
- ✅ Gradual migration path
- ✅ Same organization structure
- ✅ Same component APIs

### Next Steps (When Ready)

1. Choose a simple component to prototype (e.g., Button)
2. Create both `.html+css.erb` and `.html+tailwind.erb` templates
3. Test switching between variants
4. Document any patterns or gotchas
5. Apply pattern to remaining components
6. Plan engine integration

## Notes

- Keep this sandbox as CSS reference implementation
- Build Tailwind variants when moving to `managed_design` engine
- Maintain API parity between variants
- Consider component variant as a solved problem - focus on component design
