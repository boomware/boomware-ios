Pod::Spec.new do |s|
s.name 			= 'Boomware'
s.version 		= '1.9'
s.summary 		= 'Phone number verification'
s.homepage 		= 'https://github.com/boomware/boomware-ios'
s.license 		= { :type => 'Custom', :file => 'LICENSE' }
s.author 		= { 'Sergey Popov' => 'serj@boomware.com' }

s.source 		= { :http => "https://github.com/boomware/boomware-ios/archive/#{s.version}.tar.gz" }

s.requires_arc	= true
s.platform		= :ios, '9.0'
s.frameworks 	= 'CoreTelephony'

s.vendored_frameworks = 'Boomware.framework'
end
