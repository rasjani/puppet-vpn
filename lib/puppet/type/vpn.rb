Puppet::Type.newtype(:vpn) do
    @doc = "Intention of this type is to provide configurable options to VPN configurations running in OSX"

    ensurable

    feature :endpoint, "Checkpoint endpoint vpn provider"

    newparam(:access_point) do
        desc "URL To accesspoint"
        isnamevar
    end

    newparam(:authentication_type) do
        desc "Authentication Mechanism"
        validate do |value|
            unless  [ "username-password", "certificate", "p12-certificate", "challenge-response", "securIDKeyFob" ].include?value 
                raise ArgumentError , "%s is not a valid file path" % value
            end
        end
    end
end
