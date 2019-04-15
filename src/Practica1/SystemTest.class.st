"
A SystemTest is a test class for testing the behavior of System
"
Class {
	#name : #SystemTest,
	#superclass : #TestCase,
	#category : #'Practica1-Tests'
}

{ #category : #tests }
SystemTest >> testAgegarRespuesta [
	| auxSys auxUser1 auxUser2 auxPreg auxResp |

	auxSys := System new.
	auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.
	auxPreg := Question withTitle: '¿Para que sirve el metodo SetUp?' andUser: auxUser1  andTopics: nil andText: ''.
	auxSys addQuestion: auxPreg.
	self assert: ((auxSys obtainAnswersToQuestion: auxPreg) size) equals: 0.
	auxResp := Answer withUser: auxUser2  andText: 'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de 	test.'.
	auxPreg  addAnswer: auxResp.
	auxPreg := Question withTitle: '¿Qué significa #messageNotUnderstood? ' andUser: auxUser2 andTopics: nil  andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser1  andText: 'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en respuesta.'.	
	auxPreg addAnswer: auxResp.
	self assert: ((auxSys obtainAnswersToQuestion: auxPreg) size) equals: 1.


]

{ #category : #tests }
SystemTest >> testAgregarUser [
	| auxSys auxUser1 auxUser2 |

	auxSys := System new.
	auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.

	self assert: (auxSys obtainUsers size ) equals: 2. 


]

{ #category : #tests }
SystemTest >> testBorrarPregunta [
	| auxSys auxUser1 auxUser2 auxPreg auxResp |

	auxSys := System new.
	auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.
	auxPreg := Question withTitle: '¿Para que sirve el metodo SetUp?' andUser: auxUser1  andTopics: nil andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser2  andText: 'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de 	test.'.
	auxPreg  addAnswer: auxResp.
	auxPreg := Question withTitle: '¿Qué significa #messageNotUnderstood? ' andUser: auxUser2 andTopics: nil  andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser1  andText: 'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en respuesta.'.	
	auxPreg addAnswer: auxResp.
	auxSys deleteQuestion: auxPreg.
	self assert: ((auxSys obtainQuestionsByUser: auxUser2) size) equals: 0


]

{ #category : #tests }
SystemTest >> testCrearTopic: sys [
	| auxTopics |
	
	auxTopics := Bag new.
	auxTopics add: (Topic withName: 'OO1' andDescription: '' ).
	auxTopics add: (Topic withName: 'Test de Unidad' andDescription: '' ).
	^auxTopics
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
	auxPreg := Question withTitle: '¿Para que sirve el metodo SetUp?' andUser: auxUser1  andTopics: nil andText: ''.
	auxSys addQuestion: auxPreg.
	
	self assert: ((auxSys obtainQuestionsByUser: auxUser1) size) equals: 1


]

{ #category : #tests }
SystemTest >> testPreguntaDeUsuario [
	| auxSys auxUser1 auxUser2 auxPreg auxResp |

	auxSys := System new.
	auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.
	auxPreg := Question withTitle: '¿Para que sirve el metodo SetUp?' andUser: auxUser1  andTopics: nil andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser2  andText: 'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de 	test.'.
	auxPreg  addAnswer: auxResp.
	auxPreg := Question withTitle: '¿Qué significa #messageNotUnderstood? ' andUser: auxUser2 andTopics: nil  andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser1  andText: 'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en respuesta.'.	
	auxPreg addAnswer: auxResp.
	self assert: ((auxSys obtainQuestionsByUser: auxUser1) size) equals: 1


]

{ #category : #tests }
SystemTest >> testPreguntasDeInteresPorSiguindo [
	| auxSys auxUser1 auxUser2 auxPreg auxResp auxTopics findTopic lista |

	auxSys := System new.
	findTopic := Topic withName: 'OO1' andDescription: ''.
	auxTopics := Bag new.
	auxTopics add: findTopic.
	auxTopics add: (Topic withName: 'Test de Unidad' andDescription: '' ).
	auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.
	auxUser1 follow: auxUser2.
	auxPreg := Question withTitle: '¿Para que sirve el metodo SetUp?' andUser: auxUser1  andTopics: auxTopics andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser2  andText: 'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de 	test.'.
	auxPreg  addAnswer: auxResp.
	auxTopics removeAll.
	auxTopics add: findTopic.
	auxTopics add: (Topic withName: 'Smalltalk' andDescription: '' ).
	auxPreg := Question withTitle: '¿Qué significa #messageNotUnderstood? ' andUser: auxUser2 andTopics: auxTopics  andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser1  andText: 'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en respuesta.'.	
	auxPreg addAnswer: auxResp.
	lista := auxSys obtainQuestionsRelevantToUser: auxUser1.
	self assert: (lista size ) equals: 1.
	 


]

{ #category : #tests }
SystemTest >> testPreguntasDeInteresPorTopico [
	| auxSys auxUser1 auxUser2 auxPreg auxResp auxTopics findTopic lista |

	auxSys := System new.
	findTopic := Topic withName: 'OO1' andDescription: ''.
	auxTopics := Bag new.
	auxTopics add: findTopic.
	auxTopics add: (Topic withName: 'Test de Unidad' andDescription: '' ).
	auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.
	auxPreg := Question withTitle: '¿Para que sirve el metodo SetUp?' andUser: auxUser1  andTopics: auxTopics andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser2  andText: 'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de 	test.'.
	auxPreg  addAnswer: auxResp.
	auxTopics removeAll.
	auxTopics add: findTopic.
	auxTopics add: (Topic withName: 'Smalltalk' andDescription: '' ).
	auxPreg := Question withTitle: '¿Qué significa #messageNotUnderstood? ' andUser: auxUser2 andTopics: auxTopics  andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser1  andText: 'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en respuesta.'.	
	auxPreg addAnswer: auxResp.
	lista := auxSys obtainQuestionsByTopic: findTopic.
	self assert: (lista size ) equals: 2.
	 


]

{ #category : #tests }
SystemTest >> testPreguntasDeTopico [
	| auxSys auxUser1 auxUser2 auxPreg auxResp auxTopics findTopic lista |

	auxSys := System new.
	findTopic := Topic withName: 'OO1' andDescription: ''.
	auxTopics := Bag new.
	auxTopics add: findTopic.
	auxTopics add: (Topic withName: 'Test de Unidad' andDescription: '' ).
	auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.
	auxPreg := Question withTitle: '¿Para que sirve el metodo SetUp?' andUser: auxUser1  andTopics: auxTopics andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser2  andText: 'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de 	test.'.
	auxPreg  addAnswer: auxResp.
	auxTopics removeAll.
	auxTopics add: findTopic.
	auxTopics add: (Topic withName: 'Smalltalk' andDescription: '' ).
	auxPreg := Question withTitle: '¿Qué significa #messageNotUnderstood? ' andUser: auxUser2 andTopics: auxTopics  andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser1  andText: 'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en respuesta.'.	
	auxPreg addAnswer: auxResp.
	lista := auxSys obtainQuestionsByTopic: findTopic.
	self assert: (lista size ) equals: 2.
	 


]

{ #category : #tests }
SystemTest >> testRespuestaAPregunta [
	| auxSys auxUser1 auxUser2 auxPreg auxResp |

	auxSys := System new.
	auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.
	auxPreg := Question withTitle: '¿Para que sirve el metodo SetUp?' andUser: auxUser1  andTopics: nil andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser2  andText: 'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de 	test.'.
	auxPreg  addAnswer: auxResp.
	auxPreg := Question withTitle: '¿Qué significa #messageNotUnderstood? ' andUser: auxUser2 andTopics: nil  andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser1  andText: 'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en respuesta.'.	
	auxPreg addAnswer: auxResp.
	self assert: ((auxSys obtainAnswersToQuestion: auxPreg) size) equals: 1.
	"self assert: ((auxSys obtainAnswersByUser: auxUser1) size) equals: 1"


]

{ #category : #tests }
SystemTest >> testRespuestaDeUsuario [
	| auxSys auxUser1 auxUser2 auxPreg auxResp |

	auxSys := System new.
	auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.
	auxPreg := Question withTitle: '¿Para que sirve el metodo SetUp?' andUser: auxUser1  andTopics: nil andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser2  andText: 'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de 	test.'.
	auxPreg  addAnswer: auxResp.
	auxPreg := Question withTitle: '¿Qué significa #messageNotUnderstood? ' andUser: auxUser2 andTopics: nil  andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser1  andText: 'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en respuesta.'.	
	auxPreg addAnswer: auxResp.
	self assert: ((auxSys obtainAnswersByUser: auxUser1) size) equals: 1


]

{ #category : #tests }
SystemTest >> testSistema [
	| auxSys auxUser1 auxUser2 auxPreg auxResp auxTopics findTopic lista |

	auxSys := System new.
	findTopic := Topic withName: 'OO1' andDescription: ''.
	auxTopics := Bag new.
	auxTopics add: findTopic.
	auxTopics add: (Topic withName: 'Test de Unidad' andDescription: '' ).
	auxUser1  := User withName: 'Pedro@cuoora.com' andPassword: 'Pedro@cuoora.com'.
	auxSys addUser: auxUser1.
	auxUser2 := User withName: 'Diego@cuoora.com' andPassword: 'Diego@cuoora.com'.
	auxSys addUser: auxUser2.
	auxPreg := Question withTitle: '¿Para que sirve el metodo SetUp?' andUser: auxUser1  andTopics: auxTopics andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser2  andText: 'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de 	test.'.
	auxPreg  addAnswer: auxResp.
	auxTopics removeAll.
	auxTopics add: findTopic.
	auxTopics add: (Topic withName: 'Smalltalk' andDescription: '' ).
	auxPreg := Question withTitle: '¿Qué significa #messageNotUnderstood? ' andUser: auxUser2 andTopics: auxTopics  andText: ''.
	auxSys addQuestion: auxPreg.
	auxResp := Answer withUser: auxUser1  andText: 'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en respuesta.'.	
	auxPreg addAnswer: auxResp.
	lista := auxSys obtainQuestionsByTopic: findTopic.
	self assert: (lista size ) equals: 2.
	 


]
