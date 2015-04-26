class WikiPolicy < ApplicationPolicy

  def index
    user.present?
  end

  def show?
    !record.private? || user.present?
  end
end