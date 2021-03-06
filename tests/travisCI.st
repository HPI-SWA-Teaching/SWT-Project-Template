| gitPath gitCache |
Transcript cr; show: 'travis---->travisCI.st'.

gitCache := 'git_cache'.
gitPath := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ ((Smalltalk at: #'FileSystem') workingDirectory / gitCache) pathString ]
  ifNotNil: [:fileDirectoryClass | (fileDirectoryClass default directoryNamed: gitCache ) fullName].

Metacello new
  baseline: 'ProjectXX';
  repository: 'filetree://', gitPath, '/SWT-Project-Template/packages';
  get.

Metacello new
  baseline: 'ProjectXX';
  repository: 'filetree://', gitPath, '/SWT-Project-Template/packages';
  load: 'TravisCI'.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfProjectXX' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.
