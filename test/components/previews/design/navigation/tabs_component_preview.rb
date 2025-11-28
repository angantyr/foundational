class Design::Navigation::TabsComponentPreview < Lookbook::Preview
  # @label Default
  def default
    render_with_template(locals: { tabs: sample_tabs })
  end

  # @label Vertical
  def vertical
    render_with_template(locals: { tabs: sample_tabs })
  end

  private

  def sample_tabs
    [
      OpenStruct.new(
        header: "Account",
        summary: "Manage your account settings and preferences. Update your profile information, email address, and notification settings.",
        preview: OpenStruct.new(
          caption: "Account settings screenshot",
          src: "https://via.placeholder.com/600x400/e2e8f0/64748b?text=Account+Settings"
        )
      ),
      OpenStruct.new(
        header: "Password",
        summary: "Change your password and configure two-factor authentication. Keep your account secure with a strong password.",
        preview: OpenStruct.new(
          caption: "Password settings screenshot",
          src: "https://via.placeholder.com/600x400/e2e8f0/64748b?text=Password+Settings"
        )
      ),
      OpenStruct.new(
        header: "Notifications",
        summary: "Control how and when you receive notifications. Choose which events trigger email or push notifications.",
        preview: OpenStruct.new(
          caption: "Notification preferences screenshot",
          src: "https://via.placeholder.com/600x400/e2e8f0/64748b?text=Notification+Settings"
        )
      )
    ]
  end
end
