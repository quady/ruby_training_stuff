class Address < ActiveRecord::Base
  belongs_to :user
  attr_accessible :city, :state, :street, :zip, :user_id
  validates :city, :state, :street, :zip, :user, presence: true

  validates_format_of :zip,
                      :with => %r{\d{5}},
                      :message => "Zip Code should be a number"

  validates_format_of :state,
                      :with => %r{[A-Z]{2}},
                      :message => "State should be a two letter abbreviation"

  validates_format_of :state,
                      :with => %r{/AK|AZ|CT|FL|HI|IL|KY|MD|MN|MT|NE|NM|OH|PA|SC|TX|VI|WI|AL|CA|DC|GA|IA|IN|LA|ME|MO|NC|NH|NV|OK|PR|SD|UT|VT|WV|AR|CO|DE|GU|ID|KS|MA|MI|MS|ND|NJ|NY|OR|RI|TN|VA|WA|WY/},
                      :message => "Must be a valid state"

  scope :by_state(state)

end



