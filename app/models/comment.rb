class Comment < ApplicationRecord
  validates :title, :text, presence: true, on: :create, on: :update

  belongs_to :user
end
