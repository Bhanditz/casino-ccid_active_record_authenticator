A simple CASino authenticator for the database format we use for
login.creativecommons.org

Copyright: Creative Commons Corporation 2017
License: MIT (to maintain project license).

# Installation:

Add this line to CASinoApp/Gemfile:

    gem 'casino-ccid_active_record_authenticator', :git => 'https://github.com/creativecommons/casino-ccid_active_record_authenticator'

then run:

   bundle install --path vendor/bundle

# Configuration

Example CASinoApp cas.yml config:

```
development:
  frontend:
    sso_name: 'login.creativecommons.org'
    footer_text: 'This is <a href"/">login.creativecommons.org</a>'
  authenticators:
    ccid_users:
      authenticator: "CCIDActiveRecord"
      options:
        connection:
          adapter: "mysql2"
          host: "localhost"
          username: "dbuser"
          password: "dbpassword"
          database: "ccid_users"
        table: "cas"
        username_column: "email"
        password_column: "password"
        salt_column: "encryption_salt"
        extra_attributes:
          email: "email"
          nickname: "nickname"
          global: "global"
```