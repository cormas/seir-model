Class {
	#name : #REDExposedStateTest,
	#superclass : #REDStateTest,
	#category : #'RED-Model-Tests'
}

{ #category : #initialization }
REDExposedStateTest >> stateClass [

	^ REDExposedState
]

{ #category : #'as yet unclassified' }
REDExposedStateTest >> testIsExposed [

	self assert: self state isExposed
]

{ #category : #tests }
REDExposedStateTest >> testNewState [

	(individual incubationPeriod - 1) timesRepeat: [ 
		self assert: state newState isExposed ].
	
	self assert: state newState isInfectious.

]
