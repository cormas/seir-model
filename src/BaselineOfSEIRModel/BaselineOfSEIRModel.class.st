Class {
	#name : #BaselineOfSEIRModel,
	#superclass : #BaselineOf,
	#category : #BaselineOfSEIRModel
}

{ #category : #baselines }
BaselineOfSEIRModel >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Dependencies"
		self loadCormas: spec.
		self loadPolyMath: spec.

		"Packages"
		spec
			package: 'SEIR-Model' with: [ spec requires: #(PolyMath) ];
			package: 'SEIR-Model-Tests' with: [ spec requires: #( 'SEIR-Model' ) ] ]
]

{ #category : #'as yet unclassified' }
BaselineOfSEIRModel >> loadCormas: spec [

	spec
		baseline: 'Cormas'
		with: [ spec loads: #(Core); repository: 'github://cormas/cormas:v0.5' ]
]

{ #category : #'as yet unclassified' }
BaselineOfSEIRModel >> loadPolyMath: spec [

	spec
		baseline: 'PolyMath'
		with: [ spec repository: 'github://PolyMathOrg/PolyMath:v1.0.5/src' ]
]
