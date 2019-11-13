Pod::Spec.new do |spec|
  spec.name = "SwiftUIInfinityScroll"
  spec.version = "0.0.1"
  spec.summary = "Infinity scrollview using SwiftUI"
  spec.homepage = "https://github.com/kazuooooo/SwiftUIInfinityScroll"

  spec.license = { :type => "MIT", :file => "LICENSE" }

  spec.author = "Kazuya Matsumoto"
  spec.ios.deployment_target = "13.0"
  spec.swift_version = '5.1'

  spec.source = { :git => "https://github.com/kazuooooo/SwiftUIInfinityScroll.git", :tag => "#{spec.version}" }

  spec.source_files = "Sources/**/*"

  spec.frameworks = "Foundation", "SwiftUI"
end
