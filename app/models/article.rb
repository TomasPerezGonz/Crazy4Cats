class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy

  Kinds = %w[like dislike not_interested neutral].freeze
  KindsSpanish = {
    "like" => "Me gusta", 
    "dislike" => "No me gusta",
    "not_interested" => "No me interesa", 
    "neutral" => "Neutral"
  }.freeze
end

