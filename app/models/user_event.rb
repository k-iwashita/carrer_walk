# -*- encoding : utf-8 -*-
class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event
end
