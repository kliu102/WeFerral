namespace :maxmind do
  require 'net/http'

  def download_file(uri, path)
    file = File.open(path, 'wb')

    puts "Downloading #{uri} to #{file.path}"

    response = Net::HTTP.get_response(uri) do |res|
      size, total = 0, res.header['Content-Length'].to_i
      puts "   fetching #{total / 1024}K of data"
      res.read_body do |chunk|
        size += chunk.size
        file.syswrite chunk
      end
    end

    raise "Error downloading data" unless response.code == "200"

    return file
  ensure
    file.close
  end

  namespace :binary_ip_geodata do
    desc "Download the binary GeoIP data from Maxmind"
    task :download => :rake_helper do
      relative_path = "app/download_new?edition_id=133&suffix=tar.gz&license_key=FIehRDN0GDQl"
      uri = URI("http://www.maxmind.com/#{relative_path}")

      file = download_file(uri, "/tmp/binarygeocitydata.tar.gz")
      `tar -zxvf #{file.path} --strip-components=1 -C /tmp "*/GeoIPCity.dat"`
      `cp /tmp/GeoIPCity.dat #{Geokit::Geocoders::BinaryIpGeocoder::GEO_IP_DATA_FILE}`
    end

    desc "Download the binary GeoIP data from Maxmind to the shared directory"
    task :download_to_shared => :rake_helper do
      relative_path = "app/download_new?edition_id=133&suffix=tar.gz&license_key=FIehRDN0GDQl"
      uri = URI("http://www.maxmind.com/#{relative_path}")

      file = download_file(uri, "/tmp/binarygeocitydata.tar.gz")
      `if [ ! -e '/data/thepoint/shared/maxmind' ] ; then mkdir /data/thepoint/shared/maxmind ; else echo "using existing maxmind directory" ; fi`
      `tar -zxvf #{file.path} --strip-components=1 -C /data/thepoint/shared/maxmind --wildcards "*/GeoIPCity.dat"`
    end

    desc "Copy the binary GeoIP data from the shared directory"
    task :copy_from_shared => :rake_helper do
      `cp #{Geokit::Geocoders::BinaryIpGeocoder::GEO_IP_DATA_FILE} #{Geokit::Geocoders::BinaryIpGeocoder::GEO_IP_DATA_FILE}.backup`
      `cp /data/thepoint/shared/maxmind/GeoIPCity.dat #{Geokit::Geocoders::BinaryIpGeocoder::GEO_IP_DATA_FILE}`
    end

    desc "Restore the backed-up binary GeoIP data file"
    task :restore_backup => :rake_helper do
      `cp #{Geokit::Geocoders::BinaryIpGeocoder::GEO_IP_DATA_FILE}.backup #{Geokit::Geocoders::BinaryIpGeocoder::GEO_IP_DATA_FILE}`
    end
  end
end
