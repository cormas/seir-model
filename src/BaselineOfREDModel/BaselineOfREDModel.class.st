Class {
	#name : #BaselineOfREDModel,
	#superclass : #BaselineOf,
	#category : #BaselineOfREDModel
}

{ #category : #baselines }
BaselineOfREDModel >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Dependencies"
		self loadCormas: spec.
		self loadPolyMath: spec.

		"Packages"
		spec
			package: 'RED-Model' with: [ spec requires: #(PolyMath) ];
			package: 'RED-Model-Tests' with: [ spec requires: #( 'RED-Model' ) ] ]
]

{ #category : #'as yet unclassified' }
BaselineOfREDModel >> loadCormas: spec [

	spec
		baseline: 'Cormas'
		with: [ spec loads: #(Core); repository: 'github://cormas/cormas:v0.5' ]
]

{ #category : #'as yet unclassified' }
BaselineOfREDModel >> loadPolyMath: spec [

	spec
		baseline: 'PolyMath'
		with: [ spec repository: 'github://PolyMathOrg/PolyMath:v1.0.5/src' ]
]
