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
	^CuooraUserProfile new _currentUser: anUser; _profileUser: otherUser; yourself
]

{ #category : #accessing }
CuooraUserProfile >> _currentUser: anUser [
	currentUser := anUser
]

{ #category : #accessing }
CuooraUserProfile >> _profileUser: anUser [
	profileUser := anUser
]

{ #category : #rendering }
CuooraUserProfile >> _renderHeaderOn: html [
	RenderingHelper renderHeaderViewByUser: currentUser inComponent: self usingBrush: html 
]

{ #category : #rendering }
CuooraUserProfile >> _renderProfileOn: html [
	html heading: ('Questions by {1}' format: {(profileUser name)}).
	html anchor
		callback: [ currentUser follow: profileUser ];
		with: ('Follow {1}' format: {(profileUser name)}).
	((System getInstance) obtainQuestionsByUser: profileUser)
		do: [ :question | RenderingHelper renderQuestion: question viewByUser: currentUser inComponent: self usingBrush: html ]

]

{ #category : #rendering }
CuooraUserProfile >> renderContentOn: html [
	self _renderHeaderOn: html.
	html horizontalRule.
	self _renderProfileOn: html.
]

{ #category : #hooks }
CuooraUserProfile >> style [
	^	RenderingHelper style
]
