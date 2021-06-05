module ApplicationHelper
    def gravatar_for(user,options = {size:80})
        email_address = user.email.downcase
        size = options[:size]
        hash = Digest::MD5.hexdigest(email_address)
        url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(url,class:"shadow rounded mx-auto d-block")
    end

end
