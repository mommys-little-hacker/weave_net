# Check if docker image and container are present on the system

require "docker"

# Check if docker image is present on the server
def img_exists?(img_name, exact = false)
  Docker::Image.all.each do |img|
    img.info["RepoTags"].each do |tag|
      if exact == true
        return true if tag == img_name
      else
        return true if tag.include?(img_name)
      end
    end
  end
  return false
end

# Check if docker container is running
def cnt_exists?(cnt_name, exact = false)
  if exact == true
    begin
      return true if Docker::Container.get(cnt_name)
    rescue
      return false
    end
  else
    Docker::Container.all.each do |cnt|
      cnt.info["Names"].each do |name|
        return true if name.include?(cnt_name)
      end
    end
  end
  return false
end

