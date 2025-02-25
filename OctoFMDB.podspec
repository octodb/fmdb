Pod::Spec.new do |s|
  s.name = 'OctoFMDB'
  s.version = '1.1.0'
  s.summary = 'A Cocoa / Objective-C wrapper around OctoDB & SQLite'
  s.homepage = 'https://github.com/octodb/fmdb'
  s.license = 'MIT'
  s.author = { 'August Mueller' => 'gus@flyingmeat.com' }
  s.source = { :git => 'https://github.com/octodb/fmdb.git', :tag => "#{s.version}" }
  s.requires_arc = true
  s.ios.deployment_target = '12.0'
  #s.osx.deployment_target = '10.13'
  #s.watchos.deployment_target = '7.0'
  #s.tvos.deployment_target = '12.0'
  s.cocoapods_version = '>= 1.12.0'
  s.default_subspec = 'octodb'

  # build with the OctoDB static libraries
  s.subspec 'octodb' do |ss|
    ss.source_files = 'src/fmdb/FM*.{h,m}'
    ss.exclude_files = 'src/fmdb.m'
    ss.header_dir = 'fmdb'
    ss.resource_bundles = { 'FMDB_Privacy' => 'privacy/PrivacyInfo.xcprivacy' }

    ss.ios.libraries = 'octodb', 'binn', 'uv', 'secp256k1-vrf'

    ss.ios.xcconfig = {
      'OTHER_CFLAGS' => '$(inherited)',
      'LIBRARY_SEARCH_PATHS' => "$(inherited) $(PROJECT_DIR)/octodb/lib/ $(PWD)/octodb/lib/",
      'HEADER_SEARCH_PATHS' => "$(inherited) $(SRCROOT)/octodb/include/"
    }

    ss.osx.xcconfig = {
      'LIBRARY_SEARCH_PATHS' => "$(inherited) /usr/local/lib",
      'HEADER_SEARCH_PATHS' => "$(inherited) /usr/local/include/"
    }

    ss.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
    ss.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
  end
end
