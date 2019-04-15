"
A ContentTest is a test class for testing the behavior of Content
"
Class {
	#name : #ContentTest,
	#superclass : #TestCase,
	#category : #'Practica1-Tests'
}

{ #category : #tests }
ContentTest >> testDislikeDoNotRepeat [
	| auxUser auxContent auxReaction1 auxReaction2 |
	auxUser := User withName: 'user' andPassword: 'pass'.
	auxContent := Content new user: auxUser.
	self assert: (auxContent countDislikes) equals: 0.
	self assert: (auxContent reactions size) equals: 0.
	auxReaction1 := Reaction fromUser: auxUser withEmotion: (Emotion dislike).
	auxContent addReaction: auxReaction1.
	self assert: (auxContent countDislikes) equals: 1.
	self assert: (auxContent reactions size) equals: 1.
	auxReaction2 := Reaction fromUser: auxUser withEmotion: (Emotion dislike).
	auxContent addReaction: auxReaction2.
	self assert: (auxContent countDislikes) equals: 1.
	self assert: (auxContent reactions size) equals: 1.
]

{ #category : #tests }
ContentTest >> testDislikeReplacedByLike [
	| auxUser auxContent auxReaction1 auxReaction2 |
	auxUser := User withName: 'user' andPassword: 'pass'.
	auxContent := Content new user: auxUser.
	self assert: (auxContent countLikes) equals: 0.
	self assert: (auxContent countDislikes) equals: 0.
	self assert: (auxContent reactions size) equals: 0.
	auxReaction1 := Reaction fromUser: auxUser withEmotion: (Emotion dislike).
	auxContent addReaction: auxReaction1.
	self assert: (auxContent countLikes) equals: 0.
	self assert: (auxContent countDislikes) equals: 1.
	self assert: (auxContent reactions size) equals: 1.
	auxReaction2 := Reaction fromUser: auxUser withEmotion: (Emotion like).
	auxContent addReaction: auxReaction2.
	self assert: (auxContent countLikes) equals: 1.
	self assert: (auxContent countDislikes) equals: 0.
	self assert: (auxContent reactions size) equals: 1.
]

{ #category : #tests }
ContentTest >> testLikeDoNotRepeat [
	| auxUser auxContent auxReaction1 auxReaction2 |
	auxUser := User withName: 'user' andPassword: 'pass'.
	auxContent := Content new user: auxUser.
	self assert: (auxContent countLikes) equals: 0.
	self assert: (auxContent reactions size) equals: 0.
	auxReaction1 := Reaction fromUser: auxUser withEmotion: (Emotion like).
	auxContent addReaction: auxReaction1.
	self assert: (auxContent countLikes) equals: 1.
	self assert: (auxContent reactions size) equals: 1.
	auxReaction2 := Reaction fromUser: auxUser withEmotion: (Emotion like).
	auxContent addReaction: auxReaction2.
	self assert: (auxContent countLikes) equals: 1.
	self assert: (auxContent reactions size) equals: 1.

]

{ #category : #tests }
ContentTest >> testLikeReplacedByDislike [
	| auxUser auxContent auxReaction1 auxReaction2 |
	auxUser := User withName: 'user' andPassword: 'pass'.
	auxContent := Content new user: auxUser.
	self assert: (auxContent countLikes) equals: 0.
	self assert: (auxContent countDislikes) equals: 0.
	self assert: (auxContent reactions size) equals: 0.
	auxReaction1 := Reaction fromUser: auxUser withEmotion: (Emotion like).
	auxContent addReaction: auxReaction1.
	self assert: (auxContent countLikes) equals: 1.
	self assert: (auxContent countDislikes) equals: 0.
	self assert: (auxContent reactions size) equals: 1.
	auxReaction2 := Reaction fromUser: auxUser withEmotion: (Emotion dislike).
	auxContent addReaction: auxReaction2.
	self assert: (auxContent countLikes) equals: 0.
	self assert: (auxContent countDislikes) equals: 1.
	self assert: (auxContent reactions size) equals: 1.
]
