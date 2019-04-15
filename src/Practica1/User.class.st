Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'name',
		'password',
		'creation',
		'topics',
		'followList'
	],
	#category : #'Practica1-Core'
}

{ #category : #'as yet unclassified' }
User class >> withName: aName andPassword: aPassword [
	^self new _name: aName; _password: aPassword; yourself
]

{ #category : #accessing }
User >> _name: anObject [
	name := anObject
]

{ #category : #accessing }
User >> _password: anObject [
	password := anObject
]

{ #category : #accessing }
User >> creation [
	^ creation
]

{ #category : #accessing }
User >> follow: aUser [
	followList add: aUser

]

{ #category : #accessing }
User >> followList [
	^followList
]

{ #category : #initialization }
User >> initialize [
	creation := DateAndTime now.
	followList := Set new.
	topics := Set new.
	self follow: self.
]

{ #category : #accessing }
User >> name [
	^ name
]

{ #category : #accessing }
User >> password [
	^ password
]

{ #category : #accessing }
User >> topics [
	^topics
]
