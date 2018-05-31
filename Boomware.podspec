Pod::Spec.new do |s|
s.name 			= 'Boomware'
s.version 		= '1.0'
s.summary 		= 'Phone number verification'
s.homepage 		= 'https://github.com/Boomware/Boomware-ios'
s.documentation_url = 'https://boomware.com/'
s.license 		= { :type => 'MIT', :file => 'LICENSE' }
s.author 		= { 'Sergey Popov' => 'serj@boomware.com' }

s.source 		= { :http => "https://github.com/Boomware/boomware-ios/releases/download/#{s.version}/Boomware.tar.gz" }

s.requires_arc	= true
s.platform		= :ios, '8.0'

s.vendored_frameworks = 'Boomware.framework'

# Dependencies
s.dependency 'AFNetworking', '~> 3.2'
s.dependency 'UICKeyChainStore'
end
