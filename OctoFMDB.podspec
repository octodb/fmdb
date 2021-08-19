Pod::Spec.new do |s|
  s.name = 'OctoFMDB'
  s.version = '1.0.0'
  s.summary = 'A Cocoa / Objective-C wrapper around OctoDB & SQLite'
  s.homepage = 'https://github.com/octodb/fmdb'
  s.license = 'MIT'
  s.author = { 'August Mueller' => 'gus@flyingmeat.com' }
  s.source = { :git => 'https://github.com/octodb/fmdb.git', :tag => "#{s.version}" }
  s.requires_arc = true
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.watchos.deployment_target = '2.0'
  s.default_subspec = 'octodb'

  # build with the OctoDB static libraries
  s.subspec 'octodb' do |ss|
    ss.source_files = 'src/fmdb/FM*.{h,m}'
    ss.preserve_paths = 'src/octodb/**/*.{h,m,a}'
    ss.exclude_files = 'src/fmdb.m'
    ss.header_dir = 'fmdb'
    ss.libraries = 'octodb', 'binn', 'uv', 'secp256k1-vrf'
    ss.vendored_libraries = 'src/octodb/lib/*.a'
    # ss.vendored_libraries = 'src/octodb/lib/liboctodb.a', 'src/octodb/lib/libbinn.a', 'src/octodb/lib/libuv.a', 'src/octodb/lib/libsecp256k1-vrf.a'
    ss.xcconfig = { 
      'LIBRARY_SEARCH_PATHS' => "$(inherited) ${PODS_ROOT}/#{s.name}/octodb/octodb/lib/**", 
      'HEADER_SEARCH_PATHS' => "$(inherited) ${PODS_ROOT}/#{s.name}/octodb/octodb/include/**" 
    }
    ss.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
    ss.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
  end

end
