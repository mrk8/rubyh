class Contact < ActiveRecord::Base
  belongs_to :contact
  validates :title, presence: true,
                    length: { minimum: 5 }
end