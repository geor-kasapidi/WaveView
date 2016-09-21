Pod::Spec.new do |s|
  s.name                    = 'WaveView'
  s.version                 = '0.0.1'
  s.summary                 = 'UIView subclass that reproduces the waveform effect seen in Siri on iOS 7'
  s.homepage                = 'https://github.com/geor-kasapidi/WaveView'
  s.license                 = 'MIT'

  s.author                  = { 'Geor Kasapidi' => 'geor.kasapidi@icloud.com' }
  s.source                  = { :git => 'https://github.com/geor-kasapidi/WaveView.git', :tag => "v#{s.version}" }

  s.ios.deployment_target   = '8.0'
  s.requires_arc            = true

  s.source_files            = 'Source'

  s.frameworks              = 'Foundation', 'UIKit'
end
