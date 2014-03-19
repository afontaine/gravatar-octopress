# include the MD5 gem, this should be part of a standard ruby install
require 'digest/md5'
require 'net/http'
requre 'json'

module Jekyll

	class Gravatar < Liquid::Tag

		def initialize(tag_name, size, token)
		  super
		  @size = size.strip
		end

		def get_profile(hash)
			return nil unless hash.is_a? String
			# get JSON for profile
			uri = URI("http://en.gravatar.com/#{hash}.json")
			res = Net::HTTP.get_response(uri)
			if not res.is_a?(Net::HTTPSuccess)
				return nil
			else
				# parse JSON and return simplified hash of information
				profile = res.body
				name = profile.fetch("entry")[0].fetch("name").key?("formatted") ?
					profile.fetch("entry")[0].fetch("name").fetch("formatted") :
					profile.fetch("entry")[0].fetch("username")
				location = profile.fetch("entry")[0].key?("currentLocation") ?
					profile.fetch("entry")[0].fetch("currentLocation") :
					""
				profile_url = profile.fetch("entry")[0].fetch("profileUrl")
				info = Hash.new
				info[:name] = name
				# don't bother adding a location if there isn't one
				info[:location] = location unless location.empty?
				info[:url] = url
				return info
			end
		end
		
		def render(context)
			# get the site config variables
			site_config = context.registers[:site].config
			# get blog author
			author = site_config['author']

			# get the email address from the site config
			email_address = site_config['gravatar_email']
			# change the email address to all lowercase
			email_address = email_address.downcase
			
			# create an md5 hash from the email address
			gravatar_hash = Digest::MD5.hexdigest(email_address)
			
			# get profile info
			profile = get_profile(gravatar_hash)

			# compile the full Gravatar URL
			image_src = "http://www.gravatar.com/avatar/#{gravatar_hash}"

			# append size query to URL if provided in tag
			unless @size.empty?
			  image_src = image_src+"?s=#{@size}"
			end

			# output the full Gravatar URL
			image = "<img src=\"#{image_src}\" alt=\"Gravatar of #{author}\" title=\"Gravatar of #{author} \"/>"
			image
		end

	end

end

# register the "gravatar_image" tag
Liquid::Template.register_tag('gravatar_image', Jekyll::Gravatar)
