"
An UserTest is a test class for testing the behavior of User
"
Class {
	#name : #UserTest,
	#superclass : #TestCase,
	#instVars : [
		'auxUser'
	],
	#category : #'Practica1-Tests'
}

{ #category : #running }
UserTest >> setUp [
	auxUser := User withName: 'Pepe' andPassword: 'pass'.
]

{ #category : #tests }
UserTest >> testCreacion [
	self assert: (auxUser name) equals: 'Pepe'.
	self assert: (auxUser password) equals: 'pass'
]

{ #category : #tests }
UserTest >> testFollow [
	auxUser follow: (User withName: 'Pepe2' andPassword: 'pass').
	auxUser follow: (User withName: 'Pepe3' andPassword: 'pass').
	self assert: (auxUser followList size) equals: 3 "because user follows itself by default"
	
]
