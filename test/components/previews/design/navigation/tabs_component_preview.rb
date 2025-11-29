class Design::Navigation::TabsComponentPreview < Lookbook::Preview
  # @label Default
  def default
    render_with_template(locals: { tabs: sample_tabs })
  end

  # @label Vertical
  def vertical
    render_with_template(locals: { tabs: sample_tabs })
  end

  # @label Responsive
  def responsive
    render_with_template(locals: { tabs: sample_tabs })
  end

  # @label With Images (Complex)
  def with_images
    render_with_template(locals: { tabs: sample_tabs })
  end

  # @label Custom (Original Design)
  def custom
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
          src: "/lookbook/tabs/account.png"
        )
      ),
      OpenStruct.new(
        header: "Password",
        summary: "Change your password and configure two-factor authentication. Keep your account secure with a strong password.",
        preview: OpenStruct.new(
          caption: "Password settings screenshot",
          src: "/lookbook/tabs/password.png"
        )
      ),
      OpenStruct.new(
        header: "Notifications",
        summary: "Control how and when you receive notifications. Choose which events trigger email or push notifications.",
        preview: OpenStruct.new(
          caption: "Notification preferences screenshot",
          src: "/lookbook/tabs/notifications.png"
        )
      )
    ]
  end
end
