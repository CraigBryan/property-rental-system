# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( specific/admins.js )
Rails.application.config.assets.precompile += %w( specific/property_edit.js )
Rails.application.config.assets.precompile += %w( specific/property_index.js )
Rails.application.config.assets.precompile += %w( specific/visit_new.js )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
