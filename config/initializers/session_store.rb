# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hw_watch_session',
  :secret      => '9734b15d1b76e6030811544a7eff2cef87f4d8064638000b34c86b4bfb4f473cc5f418fabfb2203a61c708ceaea728a893f82bdc6c148f25bc8f0dc991c12370'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
