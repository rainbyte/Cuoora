Class {
	#name : #Reaction,
	#superclass : #Object,
	#instVars : [
		'emotion',
		'user',
		'creation'
	],
	#category : #'Practica1-Core'
}

{ #category : #'instance creation' }
Reaction class >> fromUser: anUser withEmotion: anEmotion [
	^Reaction new _user: anUser; _emotion: anEmotion; yourself
]

{ #category : #accessing }
Reaction >> _emotion: anEmotion [
	emotion := anEmotion
]

{ #category : #accessing }
Reaction >> _user: anUser [
	user := anUser
]

{ #category : #accessing }
Reaction >> creation [
	^ creation
]

{ #category : #accessing }
Reaction >> emotion [
	^ emotion
]

{ #category : #initialization }
Reaction >> initialize [
	creation := DateAndTime now.
]

{ #category : #accessing }
Reaction >> user [
	^ user
]
