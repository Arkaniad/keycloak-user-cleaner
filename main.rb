#!/usr/bin/env ruby

require 'rest-client'
require 'uri'
require 'json'
require 'logger'

require "keycloak"

log = Logger.new(STDOUT)
log.info("Keycloak user fixer initializing")

admin_username = ENV['KEYCLOAK_USERNAME'] || 'admin'
admin_password = ENV['KEYCLOAK_PASSWORD'] || 'admin'
auth_server_url = ENV['KEYCLOAK_SERVER_URL'] || 'http://127.0.0.1:8080/auth'
realm = 'dev.bushelops.com'

# authenticate

log.debug("Authenticated with server at #{auth_server_url} using user #{admin_username}")
client = Keycloak::Client.new(auth_server_url, realm)
client.authenticate(admin_username, admin_password, "password", "admin-cli", "master")
log.debug("Authenticated. Getting users.")

client.find_users.each do |user|
  log.debug("Deleting user #{user.id} - #{user.username}")
  client.delete_user(user.id)
end
