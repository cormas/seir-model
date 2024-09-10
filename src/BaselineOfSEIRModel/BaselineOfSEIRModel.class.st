Class {
	#name : 'BaselineOfSEIRModel',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSEIRModel',
	#package : 'BaselineOfSEIRModel'
}

{ #category : 'baselines' }
BaselineOfSEIRModel >> baseline: spec [

	<baseline>
	spec for: #common do: [
		
		"Dependencies"
		self loadPolyMath: spec.

		"Packages"
		spec
			package: 'SEIR-Model';
			package: 'SEIR-Model-Tests' with: [ spec requires: #( 'SEIR-Model' ) ] ]
]

{ #category : 'as yet unclassified' }
BaselineOfSEIRModel >> loadPolyMath: spec [

	IceRepository registry
		detect: [ :repo | repo name = 'random-numbers' ]
		ifFound: [ :repo | repo delete ].

	spec
		baseline: 'PolyMath'
		with: [ spec repository: 'github://PolyMathOrg/PolyMath:v1.0.5/src' ]
]
