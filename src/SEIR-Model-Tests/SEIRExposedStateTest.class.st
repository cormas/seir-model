Class {
	#name : #SEIRExposedStateTest,
	#superclass : #SEIRStateTest,
	#category : #'SEIR-Model-Tests'
}

{ #category : #initialization }
SEIRExposedStateTest >> stateClass [

	^ SEIRExposedState
]

{ #category : #'as yet unclassified' }
SEIRExposedStateTest >> testIsExposed [

	self assert: self state isExposed
]

{ #category : #tests }
SEIRExposedStateTest >> testNewState [

	(individual incubationPeriod - 1) timesRepeat: [ 
		self assert: state newState isExposed ].
	
	self assert: state newState isInfectious.

]
