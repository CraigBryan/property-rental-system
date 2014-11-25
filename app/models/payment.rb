class Payment < ActiveRecord::Base
  # Variables
  CC_REGEX= /\d{16}/

  belongs_to :customer_account

  # Remove spaces from CC number
  before_save { self.credit_card_number = credit_card_number.sub(/\s/, "") }

  validates_presence_of :customer_account,
                        :credit_card_stype,
                        :credit_card_number,
                        :credit_card_holder_name,
                        :expiry_month
                        :expiry_year

  validates :expiry_month, :inclusion { :in => 1..12}
  validates :expiry_year, :numericality { :greater_than_or_equal_to => 1900 }
  validates :credit_card_number, :format => {with: EMAIL_REGEX}
end
