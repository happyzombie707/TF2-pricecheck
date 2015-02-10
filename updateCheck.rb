require "json"


class Update

  def initialize(ref, key, bud)
    @time = Time.now.to_i
    @ref = ref
    @key = key
    @bud = bud
  end

  def hashMe()
    hash = {}
    instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
    return hash
  end

  def serialize()
    self.hashMe()
    json_string = self.hashMe.to_json
    puts json_string
    jsonFile = open("data.json", "w")
    jsonFile.write(json_string)
    jsonFile.close
  end

end

def checkUpdate()
  updateData = open("data.json").read
  updateJson = JSON.parse(updateData)

  if updateJson["time"] < (Time.now.to_i + (60 * 60 * 24)) then
    puts "less than one day since last update"
    ref = updateJson["ref"]
    key = updateJson["key"]
    bud = updateJson["bud"]
    return ref, key, bud
  else
    url = "http://backpack.tf/api/IGetPrices/v4/?key="
    apiKey = #API KEY GOES HERE!
    compess = "&compress=1"

    puts "more than one day since last update"
    itemJson = open("#{url}#{apiKey}#{compress}").read
    puts "loaded json file"
    itemData = JSON.parse(itemJson)
    puts "parsed json file"
    ref = itemData["response"]["raw_usd_value"]
    key = itemData["response"]["items"]["Mann Co. Supply Crate Key"]["prices"]["6"]["Tradable"]["Craftable"][0]["value"]
    bud = itemData["response"]["items"]["Earbuds"]["prices"]["6"]["Tradable"]["Craftable"][0]["value"]
    update = Update.new(ref, key, bud)
    update.serialize
    return ref, key, bud
  end
end
