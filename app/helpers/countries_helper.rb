module CountriesHelper
  def available_countries
    countries ||= [] << Country.find_by_iso_name('CHINA')
    countries.collect do |country|
      country.name = t(country.iso, scope: 'country_names', default: country.name)
      country
    end.sort { |a, b| a.name.parameterize <=> b.name.parameterize }
  end
end
