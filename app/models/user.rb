class User < ActiveRecord::Base
  validates :google_uid, :first_name, :last_name, :picture_url, :email, presence: true
  validates :google_uid, :email, uniqueness: true
  
  has_and_belongs_to_many :projects
  has_many :completed_user_votes
  has_many :rated_iterations, through: :completed_user_votes, source: :iteration
  
  def self.find_or_create_from_google_auth_hash(auth_hash)
    user = find_by(google_uid: auth_hash['uid'])
    unless user
      user = User.new
      user.google_uid = auth_hash['uid']
      user.first_name = auth_hash['info']['first_name']
      user.last_name =  auth_hash['info']['last_name']
      user.picture_url =  auth_hash['info']['image']
      user.email =  auth_hash['info']['email']
      user.save!
    end
    return user
  end
  
  def has_voted_for?(iteration)
    return rated_iterations.include?(iteration)
  end
  
  def voted_for(iteration)
    completed_user_votes.create!({iteration: iteration})
  end
end