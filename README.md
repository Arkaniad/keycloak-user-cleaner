# Keycloak User Cleaner

This is a very simple script to fix a silly mistake I made while working with Keycloak & LDAP user storage. If you click 'unlink users' in the user provider settings, you end up with a bunch of users in a detached state and cannot re-import from the directory due to username overlap. The only way in the Admin UI to fix this is to manually delete every users. With a few hundred users this becomes a huge chore and it ended up being faster to just write a script to do the heavy lifting for me.

Tested with Keycloak 9

## Installing
```
bundle install
```

## Configuration

Set the environment variables `KEYCLOAK_USERNAME`, `KEYCLOAK_PASSWORD`, `KEYCLOAK_SERVER_URL` to the desired values using bash exports or a script.

## Running
``` 
bundle exec main.rb
```
