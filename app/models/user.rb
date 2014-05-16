class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :rememberable, :trackable, :omniauthable
    has_many :sections, dependent: :destroy

    def self.connect_to_linkedin(auth, signed_in_resource = nil)
        user = User.where(provider: auth.provider, uid: auth.uid).first
        if user
            return user
        else
            registered_user = User.where(email: auth.info.email).first
            if registered_user
                return registered_user
            else
                puts "[INFO] Creating user"
                puts auth.to_yaml
                User.create(
                    name: auth.info.name,
                    provider: auth.provider,
                    uid: auth.uid,
                    email: auth.info.email,
                    password: Devise.friendly_token[0, 20]
                )
            end
        end
    end  
end
