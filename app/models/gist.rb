class Gist < ActiveRecord::Base

  validates :snippet, presence: true
  validates :description, presence: true


    def self.search(search)
      if search
        find(:all, :conditions => ['lang LIKE ?', "%#{search}%"])
      else
        limit(0)
      end
    end

end
