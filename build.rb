require 'json'
30.upto(68) {|n1|
  22.upto(53) {|n2|
    code = "#{n1}#{n2}".to_i
    lng0 = n1 + 100.0
    lat0 = n2 * 3.0 / 2
    lng1 = (n1 + 1) + 100.0
    lat1 = (n2 + 1) * 3.0 / 2
    File.open("api/v1/#{code}.geojson", 'w') {|w|
      w.print JSON.dump({
        :type => 'Feature',
        :geometry => {
          :type => 'Polygon',
          :coordinates => [[
            [lng0, lat0], [lng0, lat1], 
            [lng1, lat1], [lng1, lat0], [lng0, lat0]
          ]]
        },
        :properties => {
          :code => code,
          :url => "http://madefor.github.io/0410/api/v1/#{code}.geojson"
        }
      })
    }
  }
}

