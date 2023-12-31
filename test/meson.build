project( 'CHANGEME-library-name-tests'
       , 'cpp'
       , version : 'v0.0.0'
       , default_options : [ 'buildtype=debugoptimized'
                           , 'debug=true'
                           , 'optimization=2'
                           , 'cpp_std=c++20'
                           , 'prefix=@0@/../install/CHANGEME-library-name-test'.format(meson.source_root())
                           ]
       )

install_prefix = get_option('prefix')

CHANGEME \
   = dependency('CHANGEME-library-name-must-match-AAA-in-other-meson-file'
                        , method: 'pkg-config', required: true)
c2 = dependency('catch2', method: 'pkg-config', required: true)
n4 = dependency('nain4' , method: 'pkg-config', required: true)
g4 = dependency('Geant4', method: 'cmake'     , required: true
               , components: ['ui_all', 'vis_all']
               , modules : [ 'Geant4::G4ptl'              , 'Geant4::G4analysis'    , 'Geant4::G4digits_hits'
                           , 'Geant4::G4error_propagation', 'Geant4::G4event'       , 'Geant4::G4tools'
                           , 'Geant4::G3toG4'             , 'Geant4::G4geometry'    , 'Geant4::G4global'
                           , 'Geant4::G4graphics_reps'    , 'Geant4::G4intercoms'   , 'Geant4::G4interfaces'
                           , 'Geant4::G4materials'        , 'Geant4::G4parmodels'   , 'Geant4::G4particles'
                           , 'Geant4::G4persistency'      , 'Geant4::G4physicslists', 'Geant4::G4processes'
                           , 'Geant4::G4readout'          , 'Geant4::G4run'         , 'Geant4::G4tasking'
                           , 'Geant4::G4track'            , 'Geant4::G4tracking'    , 'Geant4::G4FR'
                           , 'Geant4::G4visHepRep'        , 'Geant4::G4RayTracer'   , 'Geant4::G4Tree'
                           , 'Geant4::G4VRML'             , 'Geant4::G4gl2ps'       , 'Geant4::G4GMocren'
                           , 'Geant4::G4vis_management'   , 'Geant4::G4modeling'    , 'Geant4::G4OpenGL'
                           , 'Geant4::G4UIVisDefinitions'
                           ]
               )

CHANGEME_test_deps    = [CHANGEME, g4, n4, c2]
CHANGEME_test_include = include_directories('.')
CHANGEME_test_sources = [ 'catch2-main.cc'
                        , 'test-CHANGEME.cc'
                        ]

      g4_include = g4      .get_variable(cmake    : 'Geant4_INCLUDE_DIRS')
      n4_include = n4      .get_variable(pkgconfig: 'includedir'         )
CHANGEME_include = CHANGEME.get_variable(pkgconfig: 'includedir'         )

test_executable = 'CHANGEME-test'

executable( test_executable
          , CHANGEME_test_sources
          , include_directories: [CHANGEME_test_include, n4_include, g4_include]
          , dependencies       : CHANGEME_test_deps
          , install            : true
          )

conf_data = configuration_data({
  'install_prefix'  : install_prefix,
  'test_executable' : test_executable,
})

configure_file(
  input         : 'run-each-test-in-separate-process.sh.in',
  output        : 'run-each-test-in-separate-process.sh',
  configuration : conf_data,
  install       : true,
  install_dir   : install_prefix
)
