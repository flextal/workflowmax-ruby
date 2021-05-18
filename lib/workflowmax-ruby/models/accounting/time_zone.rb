=begin
#Xero Accounting API

#No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

Contact: api@xero.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.1

=end

require 'time'
require 'date'

module WorkflowMaxRuby::Accounting
  class TimeZone
    MOROCCOSTANDARDTIME = "MOROCCOSTANDARDTIME".freeze
    UTC = "UTC".freeze
    GMTSTANDARDTIME = "GMTSTANDARDTIME".freeze
    GREENWICHSTANDARDTIME = "GREENWICHSTANDARDTIME".freeze
    WEUROPESTANDARDTIME = "WEUROPESTANDARDTIME".freeze
    CENTRALEUROPESTANDARDTIME = "CENTRALEUROPESTANDARDTIME".freeze
    ROMANCESTANDARDTIME = "ROMANCESTANDARDTIME".freeze
    CENTRALEUROPEANSTANDARDTIME = "CENTRALEUROPEANSTANDARDTIME".freeze
    WCENTRALAFRICASTANDARDTIME = "WCENTRALAFRICASTANDARDTIME".freeze
    NAMIBIASTANDARDTIME = "NAMIBIASTANDARDTIME".freeze
    JORDANSTANDARDTIME = "JORDANSTANDARDTIME".freeze
    GTBSTANDARDTIME = "GTBSTANDARDTIME".freeze
    MIDDLEEASTSTANDARDTIME = "MIDDLEEASTSTANDARDTIME".freeze
    EGYPTSTANDARDTIME = "EGYPTSTANDARDTIME".freeze
    SYRIASTANDARDTIME = "SYRIASTANDARDTIME".freeze
    EEUROPESTANDARDTIME = "EEUROPESTANDARDTIME".freeze
    SOUTHAFRICASTANDARDTIME = "SOUTHAFRICASTANDARDTIME".freeze
    FLESTANDARDTIME = "FLESTANDARDTIME".freeze
    TURKEYSTANDARDTIME = "TURKEYSTANDARDTIME".freeze
    ISRAELSTANDARDTIME = "ISRAELSTANDARDTIME".freeze
    KALININGRADSTANDARDTIME = "KALININGRADSTANDARDTIME".freeze
    LIBYASTANDARDTIME = "LIBYASTANDARDTIME".freeze
    ARABICSTANDARDTIME = "ARABICSTANDARDTIME".freeze
    ARABSTANDARDTIME = "ARABSTANDARDTIME".freeze
    BELARUSSTANDARDTIME = "BELARUSSTANDARDTIME".freeze
    RUSSIANSTANDARDTIME = "RUSSIANSTANDARDTIME".freeze
    EAFRICASTANDARDTIME = "EAFRICASTANDARDTIME".freeze
    IRANSTANDARDTIME = "IRANSTANDARDTIME".freeze
    ARABIANSTANDARDTIME = "ARABIANSTANDARDTIME".freeze
    AZERBAIJANSTANDARDTIME = "AZERBAIJANSTANDARDTIME".freeze
    RUSSIATIMEZONE3 = "RUSSIATIMEZONE3".freeze
    MAURITIUSSTANDARDTIME = "MAURITIUSSTANDARDTIME".freeze
    GEORGIANSTANDARDTIME = "GEORGIANSTANDARDTIME".freeze
    CAUCASUSSTANDARDTIME = "CAUCASUSSTANDARDTIME".freeze
    AFGHANISTANSTANDARDTIME = "AFGHANISTANSTANDARDTIME".freeze
    WESTASIASTANDARDTIME = "WESTASIASTANDARDTIME".freeze
    EKATERINBURGSTANDARDTIME = "EKATERINBURGSTANDARDTIME".freeze
    PAKISTANSTANDARDTIME = "PAKISTANSTANDARDTIME".freeze
    INDIASTANDARDTIME = "INDIASTANDARDTIME".freeze
    SRILANKASTANDARDTIME = "SRILANKASTANDARDTIME".freeze
    NEPALSTANDARDTIME = "NEPALSTANDARDTIME".freeze
    CENTRALASIASTANDARDTIME = "CENTRALASIASTANDARDTIME".freeze
    BANGLADESHSTANDARDTIME = "BANGLADESHSTANDARDTIME".freeze
    NCENTRALASIASTANDARDTIME = "NCENTRALASIASTANDARDTIME".freeze
    MYANMARSTANDARDTIME = "MYANMARSTANDARDTIME".freeze
    SEASIASTANDARDTIME = "SEASIASTANDARDTIME".freeze
    NORTHASIASTANDARDTIME = "NORTHASIASTANDARDTIME".freeze
    CHINASTANDARDTIME = "CHINASTANDARDTIME".freeze
    NORTHASIAEASTSTANDARDTIME = "NORTHASIAEASTSTANDARDTIME".freeze
    SINGAPORESTANDARDTIME = "SINGAPORESTANDARDTIME".freeze
    WAUSTRALIASTANDARDTIME = "WAUSTRALIASTANDARDTIME".freeze
    TAIPEISTANDARDTIME = "TAIPEISTANDARDTIME".freeze
    ULAANBAATARSTANDARDTIME = "ULAANBAATARSTANDARDTIME".freeze
    TOKYOSTANDARDTIME = "TOKYOSTANDARDTIME".freeze
    KOREASTANDARDTIME = "KOREASTANDARDTIME".freeze
    YAKUTSKSTANDARDTIME = "YAKUTSKSTANDARDTIME".freeze
    CENAUSTRALIASTANDARDTIME = "CENAUSTRALIASTANDARDTIME".freeze
    AUSCENTRALSTANDARDTIME = "AUSCENTRALSTANDARDTIME".freeze
    EAUSTRALIASTANDARDTIME = "EAUSTRALIASTANDARDTIME".freeze
    AUSEASTERNSTANDARDTIME = "AUSEASTERNSTANDARDTIME".freeze
    WESTPACIFICSTANDARDTIME = "WESTPACIFICSTANDARDTIME".freeze
    TASMANIASTANDARDTIME = "TASMANIASTANDARDTIME".freeze
    MAGADANSTANDARDTIME = "MAGADANSTANDARDTIME".freeze
    VLADIVOSTOKSTANDARDTIME = "VLADIVOSTOKSTANDARDTIME".freeze
    RUSSIATIMEZONE10 = "RUSSIATIMEZONE10".freeze
    CENTRALPACIFICSTANDARDTIME = "CENTRALPACIFICSTANDARDTIME".freeze
    RUSSIATIMEZONE11 = "RUSSIATIMEZONE11".freeze
    NEWZEALANDSTANDARDTIME = "NEWZEALANDSTANDARDTIME".freeze
    UTC12 = "UTC+12".freeze
    UTC13 = "UTC+13".freeze
    FIJISTANDARDTIME = "FIJISTANDARDTIME".freeze
    KAMCHATKASTANDARDTIME = "KAMCHATKASTANDARDTIME".freeze
    TONGASTANDARDTIME = "TONGASTANDARDTIME".freeze
    SAMOASTANDARDTIME = "SAMOASTANDARDTIME".freeze
    LINEISLANDSSTANDARDTIME = "LINEISLANDSSTANDARDTIME".freeze
    AZORESSTANDARDTIME = "AZORESSTANDARDTIME".freeze
    CAPEVERDESTANDARDTIME = "CAPEVERDESTANDARDTIME".freeze
    UTC02 = "UTC02".freeze
    MIDATLANTICSTANDARDTIME = "MIDATLANTICSTANDARDTIME".freeze
    ESOUTHAMERICASTANDARDTIME = "ESOUTHAMERICASTANDARDTIME".freeze
    ARGENTINASTANDARDTIME = "ARGENTINASTANDARDTIME".freeze
    SAEASTERNSTANDARDTIME = "SAEASTERNSTANDARDTIME".freeze
    GREENLANDSTANDARDTIME = "GREENLANDSTANDARDTIME".freeze
    MONTEVIDEOSTANDARDTIME = "MONTEVIDEOSTANDARDTIME".freeze
    BAHIASTANDARDTIME = "BAHIASTANDARDTIME".freeze
    NEWFOUNDLANDSTANDARDTIME = "NEWFOUNDLANDSTANDARDTIME".freeze
    PARAGUAYSTANDARDTIME = "PARAGUAYSTANDARDTIME".freeze
    ATLANTICSTANDARDTIME = "ATLANTICSTANDARDTIME".freeze
    CENTRALBRAZILIANSTANDARDTIME = "CENTRALBRAZILIANSTANDARDTIME".freeze
    SAWESTERNSTANDARDTIME = "SAWESTERNSTANDARDTIME".freeze
    PACIFICSASTANDARDTIME = "PACIFICSASTANDARDTIME".freeze
    VENEZUELASTANDARDTIME = "VENEZUELASTANDARDTIME".freeze
    SAPACIFICSTANDARDTIME = "SAPACIFICSTANDARDTIME".freeze
    EASTERNSTANDARDTIME = "EASTERNSTANDARDTIME".freeze
    USEASTERNSTANDARDTIME = "USEASTERNSTANDARDTIME".freeze
    CENTRALAMERICASTANDARDTIME = "CENTRALAMERICASTANDARDTIME".freeze
    CENTRALSTANDARDTIME = "CENTRALSTANDARDTIME".freeze
    CENTRALSTANDARDTIME_MEXICO = "CENTRALSTANDARDTIME(MEXICO)".freeze
    CANADACENTRALSTANDARDTIME = "CANADACENTRALSTANDARDTIME".freeze
    USMOUNTAINSTANDARDTIME = "USMOUNTAINSTANDARDTIME".freeze
    MOUNTAINSTANDARDTIME_MEXICO = "MOUNTAINSTANDARDTIME(MEXICO)".freeze
    MOUNTAINSTANDARDTIME = "MOUNTAINSTANDARDTIME".freeze
    PACIFICSTANDARDTIME_MEXICO = "PACIFICSTANDARDTIME(MEXICO)".freeze
    PACIFICSTANDARDTIME = "PACIFICSTANDARDTIME".freeze
    ALASKANSTANDARDTIME = "ALASKANSTANDARDTIME".freeze
    HAWAIIANSTANDARDTIME = "HAWAIIANSTANDARDTIME".freeze
    UTC11 = "UTC11".freeze
    DATELINESTANDARDTIME = "DATELINESTANDARDTIME".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = TimeZone.constants.select { |c| TimeZone::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #TimeZone" if constantValues.empty?
      value
    end
  end
end
