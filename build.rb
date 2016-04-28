require 'json'
def dump(code, lng0, lat0, lng1, lat1)
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
end

30.upto(68) {|n1|
  22.upto(53) {|n2|
    dump("#{n1}#{n2}".to_i, n2 + 100.0, n1 * 2.0 / 3, (n2 + 1) + 100.0, (n1 + 1) * 2.0 / 3)
    8.times{|n3|
      8.times{|n4|
        dump("#{n1}#{n2}#{n3}#{n4}".to_i, n2 + n4 / 8.0 + 100.0, (n1 + n3 / 8.0) * 2.0 / 3, (n2 + (n4 + 1) / 8.0) + 100.0, (n1 + (n3 + 1) / 8.0) * 2.0 / 3)
      }
    }
  }
}
