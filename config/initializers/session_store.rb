# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_robots_session',
  :secret      => '3f86eafdedf7ce2d9ba0f93e2ed47ec6896404ab9436551613bfb9bf4cc06166a1e0dc59a8793bd8a02001d800f686896e24a8e7212cbe2325aac02a02a1bc6f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
