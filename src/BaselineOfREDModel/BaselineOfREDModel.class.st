Class {
	#name : #BaselineOfREDModel,
	#superclass : #BaselineOf,
	#category : #BaselineOfREDModel
}

{ #category : #baselines }
BaselineOfREDModel >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Dependencies"
		self loadPolyMath: spec.

		"Packages"
		spec
			package: 'RED-Model' with: [ spec requires: #(PolyMath) ];
			package: 'RED-Model-Tests' with: [ spec requires: #( 'RED-Model' ) ] ]
]

{ #category : #'as yet unclassified' }
BaselineOfREDModel >> loadPolyMath: spec [

	spec
		baseline: 'PolyMath'
		with: [ spec repository: 'github://PolyMathOrg/PolyMath:v1.0.5/src' ]
]
