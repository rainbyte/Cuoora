Class {
	#name : #Topic,
	#superclass : #Object,
	#instVars : [
		'name',
		'description'
	],
	#category : #'Practica1-Core'
}

{ #category : #'as yet unclassified' }
Topic class >> withName: nombre [

	^self new name: nombre; yourself 
]

{ #category : #'as yet unclassified' }
Topic class >> withName: nombre andDescription: descr [
	
	^self new name: nombre; description: descr; yourself 
]

{ #category : #accessing }
Topic >> description [
	^ description
]

{ #category : #private }
Topic >> description: descr [

	description := descr
]

{ #category : #initialization }
Topic >> initialize [
	super initialize.
	name := ''.
	description := ''.
]

{ #category : #accessing }
Topic >> name [
	^ name
]

{ #category : #private }
Topic >> name: eName [
	name := eName
]
