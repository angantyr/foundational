class Design::Navigation::CarouselComponentPreview < Lookbook::Preview
  # @label Default
  def default
    render_with_template(locals: { features: sample_features })
  end

  # @label With Pagination
  def with_pagination
    render_with_template(locals: { features: sample_features })
  end

  # @label With Feature Cards
  def with_feature_cards
    render_with_template(locals: { features: sample_features })
  end

  private

  def sample_features
    [
      OpenStruct.new(
        icon: "globe",
        header: "Account",
        summary: "Manage your account settings and preferences. Update your profile information, email address, and notification settings.",
        preview: OpenStruct.new(
          caption: "Account settings screenshot",
          src: "/lookbook/tabs/account.png"
        )
      ),
      OpenStruct.new(
        icon: "image",
        header: "Password",
        summary: "Change your password and configure two-factor authentication. Keep your account secure with a strong password.",
        preview: OpenStruct.new(
          caption: "Password settings screenshot",
          src: "/lookbook/tabs/password.png"
        )
      ),
      OpenStruct.new(
        icon: "hotel",
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
