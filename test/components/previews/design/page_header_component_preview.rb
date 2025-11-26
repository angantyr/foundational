class Design::PageHeaderComponentPreview < Lookbook::Preview
  # @label Default
  def default
    render_with_template(locals: {
      section: "Modules",
      icon: "hotel",
      title: "Corporate",
      description: "Manage companies, subsidiaries, offices, and people. Define organization hierarchies, reporting structures, departments, and teams. Add milestones, values, and benefits to tell your story."
    })
  end
end
