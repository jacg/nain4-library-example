project( 'CHANGEME-library-name'
       , 'cpp'
       , version : 'v0.0.0'
       , default_options : [ 'buildtype=debugoptimized'
                           , 'debug=true'
                           , 'optimization=2'
                           , 'cpp_std=c++20'
                           , 'prefix=@0@/../install/CHANGEME-library-name/'.format(meson.source_root())
                           ]
       )

n4 = dependency( 'nain4'
               , method  : 'pkg-config'
               , required: true
               )

g4 = dependency( 'Geant4'
               , method  : 'cmake'
               , required: true
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
                           ])

CHANGEME_deps     = [n4, g4]
CHANGEME_include  = include_directories('.')
CHANGEME_sources  = ['CHANGEME.cc']
CHANGEME_includes = ['CHANGEME.hh']

g4_include = g4.get_variable(cmake    : 'Geant4_INCLUDE_DIRS')
n4_include = n4.get_variable(pkgconfig: 'includedir'         )

CHANGEME_lib = shared_library( 'CHANGEME-library-name'
                             , CHANGEME_sources
                             , include_directories: [n4_include, g4_include]
                             , dependencies       : CHANGEME_deps
                             , install            : true
                             )

CHANGEME_dep = declare_dependency( include_directories: CHANGEME_include
                                 , link_with          : CHANGEME_lib)

install_headers(CHANGEME_includes)

pkg = import('pkgconfig')
pkg.generate( CHANGEME_lib
            , description: 'TODO: write your library description here'
            , name       : 'CHANGEME-library-name'
            , filebase   : 'CHANGEME-library-name-must-match-AAA-in-other-meson-file'
            )
