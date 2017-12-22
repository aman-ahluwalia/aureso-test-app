class Track < ActiveRecord::Base
  belongs_to :factor, optional: true
end
