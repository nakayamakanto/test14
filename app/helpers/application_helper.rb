module ApplicationHelper
    def profile_img(user)
        return image_tag(user.avatar, alt: user.name) if user.avatar?
        
        if user.provider.blank?
          img_url = user.image
        else
          img_url = 'no_image.png'
        end
        image_tag(img_url, alt: user.name)
    end
end
