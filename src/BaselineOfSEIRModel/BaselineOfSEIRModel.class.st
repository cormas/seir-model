Class {
	#name : 'BaselineOfSEIRModel',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSEIRModel',
	#package : 'BaselineOfSEIRModel'
}

{ #category : 'baselines' }
BaselineOfSEIRModel >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Dependencies"

		"Packages"
		spec
			package: 'SEIR-Model';
			package: 'SEIR-Model-Tests' with: [ spec requires: #( 'SEIR-Model' ) ] ]
]
