"
A ContentTest is a test class for testing the behavior of Content
"
Class {
	#name : #ContentTest,
	#superclass : #TestCase,
	#instVars : [
		'auxContent',
		'auxUser'
	],
	#category : #'Practica1-Tests'
}

{ #category : #running }
ContentTest >> setUp [
	super setUp.
	auxUser := User withName: 'user' andPassword: 'pass'.
	auxContent := Content new user: auxUser.
]

{ #category : #tests }
ContentTest >> testDislikeDoNotRepeat [
	self assert: (auxContent countDislikes) equals: 0.
	self assert: (auxContent reactions size) equals: 0.
	auxContent addReaction: (Reaction dislikeByUser: auxUser).
	self assert: (auxContent countDislikes) equals: 1.
	self assert: (auxContent reactions size) equals: 1.
	auxContent addReaction: (Reaction dislikeByUser: auxUser).
	self assert: (auxContent countDislikes) equals: 1.
	self assert: (auxContent reactions size) equals: 1.
]

{ #category : #tests }
ContentTest >> testDislikeReplacedByLike [
	self assert: (auxContent countLikes) equals: 0.
	self assert: (auxContent countDislikes) equals: 0.
	self assert: (auxContent reactions size) equals: 0.
	auxContent addReaction: (Reaction dislikeByUser: auxUser).
	self assert: (auxContent countLikes) equals: 0.
	self assert: (auxContent countDislikes) equals: 1.
	self assert: (auxContent reactions size) equals: 1.
	auxContent addReaction: (Reaction likeByUser: auxUser).
	self assert: (auxContent countLikes) equals: 1.
	self assert: (auxContent countDislikes) equals: 0.
	self assert: (auxContent reactions size) equals: 1.
]

{ #category : #tests }
ContentTest >> testLikeDoNotRepeat [
	self assert: (auxContent countLikes) equals: 0.
	self assert: (auxContent reactions size) equals: 0.
	auxContent addReaction: (Reaction likeByUser: auxUser).
	self assert: (auxContent countLikes) equals: 1.
	self assert: (auxContent reactions size) equals: 1.
	auxContent addReaction: (Reaction likeByUser: auxUser).
	self assert: (auxContent countLikes) equals: 1.
	self assert: (auxContent reactions size) equals: 1.

]

{ #category : #tests }
ContentTest >> testLikeReplacedByDislike [
	self assert: (auxContent countLikes) equals: 0.
	self assert: (auxContent countDislikes) equals: 0.
	self assert: (auxContent reactions size) equals: 0.
	auxContent addReaction: (Reaction likeByUser: auxUser).
	self assert: (auxContent countLikes) equals: 1.
	self assert: (auxContent countDislikes) equals: 0.
	self assert: (auxContent reactions size) equals: 1.
	auxContent addReaction: (Reaction dislikeByUser: auxUser).
	self assert: (auxContent countLikes) equals: 0.
	self assert: (auxContent countDislikes) equals: 1.
	self assert: (auxContent reactions size) equals: 1.
]
