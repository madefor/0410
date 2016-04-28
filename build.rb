require 'json'
30.upto(68) {|n1|
  22.upto(53) {|n2|
    code = "#{n1}#{n2}".to_i
    lng0 = n2 + 100.0
    lat0 = n1 * 2.0 / 3
    lng1 = (n2 + 1) + 100.0
    lat1 = (n1 + 1) * 2.0 / 3
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
          :url => "http://madefor.github.io/0410/api/v1/#{code}.geojson",
          :view => "https://github.com/madefor/0410/blob/gh-pages/api/v1/#{code}.geojson"
        }
      })
    }
  }
}

