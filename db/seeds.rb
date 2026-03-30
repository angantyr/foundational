puts "Creating default administrator"

Managed::Account::User.find_or_create_by!(email: "mans@angantyr.com") do |u|
  u.name                  = "Mans Angantyr"
  u.password              = "foobar"
  u.password_confirmation = "foobar"
  u.language              = "en"
  u.time_zone             = "Eastern Time (US & Canada)"
  u.role                  = "root"
  u.state                 = "active"
end
