Puppet::Type.type(:vpn).provide(:endpoint) do
    desc "Checkpoint Endpoint Support"
    syntax_terror
    commands :epcommand=> "/Library/Application\ Support/Checkpoint/Endpoint\ Connect/command_line"

    def create
        epcommand "create -s ", resource [:acesspoint], " -a ", resource[:authentication]
    end

    def destroy
        epcommand "delete -s '", resource [:acesspoint], "'"
    end

    def exists?
        true
    end
end
