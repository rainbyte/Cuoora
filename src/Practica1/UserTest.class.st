"
An UserTest is a test class for testing the behavior of User
"
Class {
	#name : #UserTest,
	#superclass : #TestCase,
	#category : #'Practica1-Tests'
}

{ #category : #tests }
UserTest >> testCreacion [
	| auxUser |
	auxUser := User withName: 'Pepe' andPassword: 'pass'.
	self assert: (auxUser name) equals: 'Pepe'.
	self assert: (auxUser password) equals: 'pass'
]

{ #category : #tests }
UserTest >> testFollow [
	| auxUser |
	auxUser := User withName: 'algo' andPassword: 'pass'. 
	auxUser follow: (User withName: 'Pepe2' andPassword: 'pass').
	auxUser follow: (User withName: 'Pepe3' andPassword: 'pass').
	self assert: (auxUser followList size) equals: 2
	
]
