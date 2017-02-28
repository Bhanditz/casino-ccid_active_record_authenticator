require 'digest'

class CASino::CCIDActiveRecordAuthenticator < CASino::ActiveRecordAuthenticator

  def validate(username, password)
    user = @model.send("find_by_#{@options[:username_column]}!", username)
    password_from_database = user.send(@options[:password_column])
    salt_from_database = user.send(@options[:salt_column])
    if valid_password_ccid?(password, password_from_database,
                            salt_from_database)
      user_data(user)
    else
      false
    end
  end

  def valid_password_ccid?(password, password_from_database, salt_from_database)
    return false if password_from_database.blank? or salt_from_database.blank?
    d = Digest::SHA256.hexdigest("--#{salt_from_database}--#{password}--")
    Rails.logger.error("#{password_from_database} == #{d}")
    password_from_database == Digest::SHA256.hexdigest("--#{salt_from_database}--#{password}--")
  end

end
