Pod::Spec.new do |s|
s.name 			= 'Boomware'
s.version 		= '1.2'
s.summary 		= 'Phone number verification'
s.homepage 		= 'https://github.com/boomware/boomware-ios'
s.documentation_url = 'https://boomware.com/'
s.license 		= { :type => 'Custom', :file => 'LICENSE' }
s.author 		= { 'Sergey Popov' => 'serj@boomware.com' }

s.source 		= { :http => "https://github.com/boomware/boomware-ios/archive/#{s.version}.tar.gz" }

s.requires_arc	= true
s.platform		= :ios, '8.0'
s.frameworks 	= 'CoreTelephony'

s.vendored_frameworks = 'Boomware.framework'

# Dependencies
s.dependency 'AFNetworking', '~> 3.2'
s.dependency 'UICKeyChainStore'
end
