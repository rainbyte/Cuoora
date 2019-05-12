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
Reaction class >> dislikeByUser: anUser [
	^Reaction new user: anUser; emotion: #dislike; yourself
]

{ #category : #'instance creation' }
Reaction class >> likeByUser: anUser [
	^Reaction new user: anUser; emotion: #like; yourself
]

{ #category : #accessing }
Reaction >> creation [
	^ creation
]

{ #category : #accessing }
Reaction >> emotion [
	^ emotion
]

{ #category : #'private ' }
Reaction >> emotion: anEmotion [
	emotion := anEmotion
]

{ #category : #initialization }
Reaction >> initialize [
	creation := DateAndTime now.
]

{ #category : #accessing }
Reaction >> user [
	^ user
]

{ #category : #'private ' }
Reaction >> user: anUser [
	user := anUser
]
