#!/usr/bin/ruby

require 'json'

env_vars = JSON.parse(`sudo /opt/elasticbeanstalk/bin/get-config environment`)
jvm_parameters = env_vars.inject("") do |str, (key, value)|
	if key == "heapMin"
		str << " -Xms#{value}"
	elsif key == "heapMax"
		str << " -Xmx#{value}"
	elsif key == "jvmOptions"
		str << " #{value}"
	else
		str << " -D#{key}=\\\"#{value}\\\""
	end
end
`sudo sed -i '/command=*/c\ command=java #{jvm_parameters} org.springframework.boot.loader.JarLauncher' /etc/supervisor/conf.d/kratos2.conf`
