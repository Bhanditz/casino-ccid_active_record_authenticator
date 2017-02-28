# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = 'casino-ccid_active_record_authenticator'
  s.version     = '0.1.1'
  s.authors     = ['Rob Myers']
  s.email       = ['rob@creativecommons.org']
  s.homepage    = 'https://github.com/creativecommons/casino-ccid_active_record_authenticator'
  s.license     = 'MIT'
  s.summary     = 'Provides mechanism to use ActiveRecord as an authenticator for CASino using CCID hashes.'
  s.description = 'This gem can be used to allow the CASino backend to authenticate against an SQL server using ActiveRecord with CCID hashes.'
  s.files       = ["lib/casino-ccid_active_record_authenticator.rb"]
end
