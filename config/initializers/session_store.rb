# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_popmao_session',
  :secret      => '58ba5d2fb336fe27ff7fb9dede81cf36ad2451654aba0e519031fb4f75bec3a65bb793c52339c820e5431302b26bbe154febb4c3748f80c3e83a2149712660a1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
