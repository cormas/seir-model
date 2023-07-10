Class {
	#name : #SEIRCell,
	#superclass : #CMSpatialEntityElement,
	#category : #'SEIR-Model-Core'
}

{ #category : #accessing }
SEIRCell class >> entityName [

	^ 'Cell'
]

{ #category : #pov }
SEIRCell >> pov [

	^ Color black
]
