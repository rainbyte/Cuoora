"
A SystemTest is a test class for testing the behavior of System
"
Class {
	#name : #SystemTest,
	#superclass : #TestCase,
	#category : #'Practica1-Tests'
}

{ #category : #tests }
SystemTest >> testAgregarRespuesta [
	| auxSys auxUser1 auxUser2 auxPreg auxResp |

	auxSys := System new.
	auxUser1 := User withName: 'usuario1' andPassword: 'password1'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'usuario2' andPassword: 'password2'.
	auxSys addUser: auxUser2.
	auxPreg := Question withTitle: '¿Para que sirve x?' andUser: auxUser1 andRawTopics: '' andText: ''.
	auxSys addQuestion: auxPreg.
	self assert: ((auxSys obtainAnswersToQuestion: auxPreg) size) equals: 0.
	auxResp := Answer withUser: auxUser2 andText: 'Sirve para ...'.
	auxPreg addAnswer: auxResp.
	self assert: ((auxSys obtainAnswersToQuestion: auxPreg) size) equals: 1.


]

{ #category : #tests }
SystemTest >> testAgregarUser [
	| auxSys auxUser1 auxUser2 |

	auxSys := System new.
	auxUser1 := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.

	self assert: (auxSys obtainUsers size ) equals: 2. 


]

{ #category : #tests }
SystemTest >> testBorrarPregunta [
	| auxSys auxUser1 auxUser2 auxPreg auxResp |

	auxSys := System new.
	auxUser1 := User withName: 'usuario1' andPassword: 'password1'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'usuario2' andPassword: 'password2'.
	auxSys addUser: auxUser2.
	auxPreg := Question withTitle: '¿Para que sirve x?' andUser: auxUser1 andRawTopics: '' andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser2  andText: 'Sirve para ...'.
	auxPreg addAnswer: auxResp.
	auxSys deleteQuestion: auxPreg.
	self assert: ((auxSys obtainQuestionsByUser: auxUser1) size) equals: 0
]

{ #category : #tests }
SystemTest >> testCrearTopico [
	| auxSys |
	
	auxSys := System new.
	auxSys addTopic: (Topic withName: 'OO1' andDescription: 'Objetos 1' ).
	auxSys addTopic: (Topic withName: 'OO1' andDescription: 'Objetos 1' ).
	auxSys addTopic: (Topic withName: 'TDD' andDescription: 'Test Driven Development' ).
	
	self assert: ((auxSys topics) size) equals: 2
]

{ #category : #tests }
SystemTest >> testLoginWithName [
	| auxSys auxUser1 auxUser2 |

	auxSys := System new.
	auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.
	
	self assert: ((auxSys loginWithUsername: 'Pedro@cuoora.com'  andPassword: 'Pedro@cuoora.com') name) equals: auxUser1 name.
	self assert: ((auxSys loginWithUsername: 'Diego@cuoora.com'  andPassword: 'Diego@cuoora.com') name) equals: auxUser2 name 


]

{ #category : #tests }
SystemTest >> testLoginWithObject [
	| auxSys auxUser1 auxUser2 |

	auxSys := System new.
	auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.
	
	self assert: (auxSys loginWithUsername: 'Pedro@cuoora.com'  andPassword: 'Pedro@cuoora.com') equals: auxUser1.
	self assert: (auxSys loginWithUsername: 'Diego@cuoora.com'  andPassword: 'Diego@cuoora.com') equals: auxUser2


]

{ #category : #tests }
SystemTest >> testPregunta [
	| auxSys auxUser1 auxPreg |

	auxSys := System new.
	auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxPreg := Question withTitle: '¿Para que sirve el metodo SetUp?' andUser: auxUser1 andRawTopics: '' andText: ''.
	auxSys addQuestion: auxPreg.
	
	self assert: ((auxSys obtainQuestionsByUser: auxUser1) size) equals: 1


]

{ #category : #tests }
SystemTest >> testPreguntasDeInteresPorSiguindo [
	| auxSys auxUser1 auxUser2 auxPreg1 auxPreg2 auxPreg3 |

	auxSys := System new.
	auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.
	auxUser1 follow: auxUser2.
	auxPreg1 := Question withTitle: '¿Para que sirve x?' andUser: auxUser1 andRawTopics: 'AAA,BBB' andText: ''.
	auxSys addQuestion: auxPreg1.
	auxPreg2 := Question withTitle: '¿Qué significa x? ' andUser: auxUser2 andRawTopics: 'BBB,CCC' andText: ''.
	auxSys addQuestion: auxPreg2.
	auxPreg3 := Question withTitle: '¿Qué es un x? ' andUser: auxUser2 andRawTopics: 'CCC,DDD' andText: ''.
	auxSys addQuestion: auxPreg3.
	self assert: ((auxSys obtainQuestionsRelevantToUser: auxUser1) size) equals: 3.
]

{ #category : #tests }
SystemTest >> testPreguntasDeInteresPorTopico [
	| auxSys auxUser1 auxUser2 auxPreg1 auxPreg2 auxPreg3 |

	auxSys := System new.
	auxUser1 := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxUser1 addInterestInTopic: 'BBB'. 
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.
	auxPreg1 := Question withTitle: '¿Para que sirve x?' andUser: auxUser1 andRawTopics: 'AAA,BBB' andText: ''.
	auxSys addQuestion: auxPreg1.
	auxPreg2 := Question withTitle: '¿Qué significa x? ' andUser: auxUser2 andRawTopics: 'BBB,CCC' andText: ''.
	auxSys addQuestion: auxPreg2.
	auxPreg3 := Question withTitle: '¿Qué es un x? ' andUser: auxUser2 andRawTopics: 'CCC,DDD' andText: ''.
	auxSys addQuestion: auxPreg3.
	self assert: ((auxSys obtainQuestionsRelevantToUser: auxUser1) size) equals: 2.
]

{ #category : #tests }
SystemTest >> testPreguntasDeTopico [
	| auxSys auxUser1 auxUser2 auxPreg1 auxPreg2 auxPreg3 |

	auxSys := System new.
	auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.
	auxUser1 follow: auxUser2.
	auxPreg1 := Question withTitle: '¿Para que sirve x?' andUser: auxUser1 andRawTopics: 'AAA,BBB' andText: ''.
	auxSys addQuestion: auxPreg1.
	auxPreg2 := Question withTitle: '¿Qué significa x? ' andUser: auxUser2 andRawTopics: 'BBB,CCC' andText: ''.
	auxSys addQuestion: auxPreg2.
	auxPreg3 := Question withTitle: '¿Qué es un x? ' andUser: auxUser2 andRawTopics: 'CCC,DDD' andText: ''.
	auxSys addQuestion: auxPreg3.
	self assert: ((auxSys obtainQuestionsByTopic: (Topic withName: 'BBB')) size) equals: 2.
]

{ #category : #tests }
SystemTest >> testPreguntasDeUsuario [
	| auxSys auxUser1 auxUser2 auxPreg auxResp |

	auxSys := System new.
	auxUser1 := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.
	auxPreg := Question withTitle: '¿Para que sirve x?' andUser: auxUser1 andTopics: '' andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser2  andText: 'Sirve para ...'.
	auxPreg addAnswer: auxResp.
	self assert: ((auxSys obtainQuestionsByUser: auxUser1) size) equals: 1.
	self assert: ((auxSys obtainQuestionsByUser: auxUser1) includes: auxPreg) equals: true

]

{ #category : #tests }
SystemTest >> testRespuestaAPregunta [
	| auxSys auxUser1 auxUser2 auxPreg auxResp |

	auxSys := System new.
	auxUser1 := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.
	auxPreg := Question withTitle: '¿Para que sirve x?' andUser: auxUser1 andRawTopics: '' andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser2  andText: 'Sirve para ...'.
	auxPreg  addAnswer: auxResp.
	self assert: ((auxSys obtainAnswersToQuestion: auxPreg) size) equals: 1.
	self assert: ((auxSys obtainAnswersToQuestion: auxPreg) includes: auxResp) equals: true.


]

{ #category : #tests }
SystemTest >> testRespuestaDeUsuario [
	| auxSys auxUser1 auxUser2 auxPreg auxResp |

	auxSys := System new.
	auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.
	auxPreg := Question withTitle: '¿Para que sirve x?' andUser: auxUser1  andRawTopics: '' andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser2  andText: 'Sirve para ...'.
	auxPreg  addAnswer: auxResp.
	self assert: ((auxSys obtainAnswersByUser: auxUser2) size) equals: 1


]
