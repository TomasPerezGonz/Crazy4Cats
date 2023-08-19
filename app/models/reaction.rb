class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :article, optional: true
  belongs_to :comment, optional: true

  validates :kind, presence: true
  validate :either_article_or_comment

  private

  def either_article_or_comment
    if article.nil? && comment.nil?
      errors.add(:base, "Reaction should belong to either an article or a comment, not both.")
    end
  end
end


