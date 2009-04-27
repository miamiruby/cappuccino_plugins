# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_railscapp_session',
  :secret      => 'edba2a1d7ad8d5c40c04ab8287bb44b927666331c20d270b3d4c0e84b037d8144a644047c0d8211ea6ab63b9549f76f7abc8d91579770d8ac3cbbe93fdb89ca6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
