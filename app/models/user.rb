class User
  def initialize(user_id, password, name, address, city, state, zip, country, email)
    @user_id = user_id
    @password = password
    @name = name
    @address = address
    @city = city
    @state = state
    @zip = zip
    @country = country
    @email = email
  end

  def user_id
    @user_id
  end

  def password
    @password
  end

  def name
    @name
  end

  def address
    @address
  end

  def city
    @city
  end

  def state
    @state
  end

  def zip
    @zip
  end

  def country
    @country
  end

  def email
    @email
  end

end
