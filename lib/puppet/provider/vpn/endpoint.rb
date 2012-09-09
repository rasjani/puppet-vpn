Puppet::Type.type(:vpn).provide(:endpoint) do
    desc "Checkpoint Endpoint VPN Support for Mac OS X"
    @@cmd =  "/Library/Application\ Support/Checkpoint/Endpoint\ Connect/command_line"
    commands :epcommand=> @@cmd

    def create
        %x['#{@@cmd}' create -s '#{resource[:access_point]}' -a #{resource[:authentication_type]}]
        $?.exitstatus == 24
    end

    def destroy
        %x['#{@@cmd}' delete -s '#{resource[:access_point]}']
        $?.exitstatus == 24
    end

    def exists?
        %x['#{@@cmd}' info -s '#{resource[:access_point]}' | grep 'Conn #{resource[:access_point]}:' -]
        $?.exitstatus == 0
    end
end
