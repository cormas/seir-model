Class {
	#name : #SEIRRecoveredStateTest,
	#superclass : #SEIRStateTest,
	#category : #'SEIR-Model-Tests'
}

{ #category : #initialization }
SEIRRecoveredStateTest >> stateClass [

	^ SEIRRecoveredState
]

{ #category : #'as yet unclassified' }
SEIRRecoveredStateTest >> testIsRecovered [

	self assert: self state isRecovered
]

{ #category : #tests }
SEIRRecoveredStateTest >> testNewState [

	(individual immunityPeriod - 1) timesRepeat: [ 
		self assert: state newState isRecovered ].
	
	self assert: state newState isSusceptible.

]
