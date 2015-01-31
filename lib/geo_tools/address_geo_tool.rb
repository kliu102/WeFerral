module GeoTools
  class AddressGeoTool
    include Geokit::Geocoders

    def self.do_geocode(address)
      begin
        return {} if address.blank?
        geo_addr = MultiGeocoder.geocode(address)
        if geo_addr.success
          {
              :lat => geo_addr.lat,
              :lng => geo_addr.lng,
              :success => geo_addr.lat.present? && geo_addr.lng.present?
          }
        else
          {}
        end
      rescue Exception => e
        Rails.logger.info "Error do_geocode for address #{address}: #{e}"
        return {}
      end
    end
  end
end