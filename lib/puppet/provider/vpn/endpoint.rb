Puppet::Type.type(:vpn).provide(:endpoint) do
    desc "Checkpoint Endpoint Support"
    commands :epcommand=> "/Library/Application\ Support/Checkpoint/Endpoint\ Connect/command_line"

    def create
        epcommand "create","-s", resource[:access_point], "-a", resource[:authentication_type]
    end

    def destroy
        epcommand "delete","-s", resource[:access_point]
    end

    def exists?
        false
    end
end
