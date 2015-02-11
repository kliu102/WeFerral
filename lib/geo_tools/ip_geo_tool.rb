module GeoTools
    class IpGeoTool
        GEO_IP_DATA_FILE = '/Users/kunpeng/projects/GeoIPCity.dat'

        def self.do_geocode(ip)
            begin
                return {} unless ip.present?
                return {} if '0.0.0.0' == ip
                return {} unless /^(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})?$/.match(ip)
                geoip = GeoIP.new(GEO_IP_DATA_FILE).city(ip)
                return {
                        :state => geoip[6],
                        :city => geoip[7],
                        :zip => geoip[8],
                        :lat => geoip[9],
                        :lng => geoip[10],
                        :country_code => geoip[2],
                        :success => geoip[9].present? && geoip[10].present?
                }
            rescue Exception => e
                Rails.logger.info "Error get_city_state_zip_from_ip IP address #{ip}: #{e}"
                return {}
            end
        end
    end
end