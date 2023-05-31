Class {
	#name : #REDStateTest,
	#superclass : #TestCase,
	#instVars : [
		'individual',
		'state'
	],
	#category : #'RED-Model-Tests'
}

{ #category : #testing }
REDStateTest class >> isAbstract [

	^ self = REDStateTest
]

{ #category : #testing }
REDStateTest class >> shouldInheritSelectors [

	^ true
]

{ #category : #initialization }
REDStateTest >> setUp [
	
	| fixture |
	super setUp.
	
	fixture := REDModelFixture new.
	individual := fixture individual.
	state := self stateClass forIndividual: individual.
	
	individual incubationPeriod: 3.
	individual infectiousPeriod: 40.
	individual immunityPeriod: 100.
]

{ #category : #accessing }
REDStateTest >> state [

	^ state
]

{ #category : #initialization }
REDStateTest >> stateClass [

	self subclassResponsibility
]

{ #category : #tests }
REDStateTest >> testColor [

	self assert: (self state color isKindOf: Color)
]

{ #category : #tests }
REDStateTest >> testIsExposed [

	self deny: self state isExposed
]

{ #category : #tests }
REDStateTest >> testIsInfectious [

	self deny: self state isInfectious 
]

{ #category : #tests }
REDStateTest >> testIsRecovered [

	self deny: self state isRecovered
]

{ #category : #tests }
REDStateTest >> testIsSusceptible [

	self deny: self state isSusceptible
]

{ #category : #'instance creation' }
REDStateTest >> testNewState [

	self subclassResponsibility
]
