class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :content, :human

  validates :name, presence: { message: "Name can't be blank" }
  validates :content, presence: { message: "Message can't be blank" }
  validates :email,
            presence: { message: "Email can't be blank" },
            format: { with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\Z/i,
                      message: "Invalid email", if: 'email.present?' }
  validate :human_check

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  private

  def human_check
    if human == "1"
      errors.add(:base, "Leave the checkbox unchecked if you're a human")
    end
  end
end