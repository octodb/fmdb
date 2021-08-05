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
    ss.exclude_files = 'src/fmdb.m'
    ss.header_dir = 'fmdb'
    ss.xcconfig = { 'OTHER_CFLAGS' => '$(inherited)', 'LIBRARY_SEARCH_PATHS' => "$(SRCROOT)/octodb/lib/", 'HEADER_SEARCH_PATHS' => "$(SRCROOT)/octodb/include/" }
  end

end
