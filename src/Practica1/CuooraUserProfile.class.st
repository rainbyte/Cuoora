Class {
	#name : #CuooraUserProfile,
	#superclass : #WAComponent,
	#instVars : [
		'currentUser',
		'profileUser'
	],
	#category : #'Practica1-Web'
}

{ #category : #'as yet unclassified' }
CuooraUserProfile class >> withCurrentUser: anUser andProfileUser: otherUser [
	^CuooraUserProfile new currentUser: anUser; profileUser: otherUser; yourself
]

{ #category : #private }
CuooraUserProfile >> currentUser: anUser [
	currentUser := anUser
]

{ #category : #private }
CuooraUserProfile >> profileUser: anUser [
	profileUser := anUser
]

{ #category : #rendering }
CuooraUserProfile >> renderContentOn: html [
	self renderHeaderOn: html.
	html horizontalRule.
	self renderProfileOn: html.
]

{ #category : #private }
CuooraUserProfile >> renderHeaderOn: html [
	RenderingHelper renderHeaderViewByUser: currentUser inComponent: self usingBrush: html 
]

{ #category : #private }
CuooraUserProfile >> renderProfileOn: html [
	html heading: ('Questions by {1}' format: {(profileUser name)}).
	html anchor
		callback: [ currentUser follow: profileUser ];
		with: ('Follow {1}' format: {(profileUser name)}).
	((System getInstance) obtainQuestionsByUser: profileUser)
		do: [ :question | RenderingHelper renderQuestion: question viewByUser: currentUser inComponent: self usingBrush: html ]

]

{ #category : #hooks }
CuooraUserProfile >> style [
	^	RenderingHelper style
]
