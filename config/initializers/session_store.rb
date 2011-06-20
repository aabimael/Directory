# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Agenda_session',
  :secret      => '2203a65e6faeba7a2669ac608c5fa1c38f1b9432ffa7dad24dd233a71d095d939d3166ab47df6c4f37c6175615c405ddc508a689b63a2c28b859b11b36587a5b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
