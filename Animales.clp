;-------------------------------------------------------------
; Reglas para di�logo con el usuario                         |
;-------------------------------------------------------------
;(defrule read-input
;(initial-fact)
;=>
;(printout t "Name a primary color" crlf)
;(assert (color (read))))


;-------------------------------------------------------------
;     Reglas de aplicación de las pruebas de identificación  |
;-------------------------------------------------------------
(defrule Rt1 "Test 1 de apariencia (general)"
(initial-fact)
(animal ?x)
=>
(printout t "Cual es la apariencia del animal?, es decir:" crlf)
(printout t "a. tiene pelo?" crlf)
(printout t "b. tiene plumas?" crlf)
(printout t "c. no se aprecia bien" crlf)
(printout t "(responder a/b/c): ")
(assert (cobertura (read))))

(defrule O1 "Interpretación de la opción de cobertura"
(cobertura a)
(animal ?x)
=>
(assert (pelo ?x)))

;-------------------------------------------------------------
;       Reglas para el S.E. de identificación de animales   |
;-------------------------------------------------------------
(defrule R1 "cobertura de piel 1" 
	(pelo ?x) 
	=>
	(assert (mamifero ?x)))

(defrule R2 "dar leche"
	(da_leche ?x)
	=>
	(assert (mamifero ?x)))

(defrule R3 "cobertura de piel 2"
	(plumas ?x)
	=>
	(assert (ave ?x)))

(defrule R4 "ave 2"
	(vuela ?x)
	(pone_huevos ?x)
	=>
	(assert (ave ?x)))

(defrule R5 "mamiferos carnivoros 1"
	(mamifero ?x)
	(come_carne ?x)
	=>
	(assert (carnivoro ?x)))

(defrule R6 "mamiferos carnivoros 2"
	(mamifero ?x)
	(dientes_agudos ?x)
	(garras ?x)
	(ojos_frontales ?x)
	=>
	(assert (carnivoro ?x)))

(defrule R7 "mamiferos hervivoros 1"
	(mamifero ?x)
	(pezunhas ?x)
	=>
	(assert (ungulado ?x)))

(defrule R8 "mamiferos hervivoros 2"
	(mamifero ?x)
	(rumia ?x)
	=>
	(assert (ungulado ?x)))

(defrule R9 "mamiferos carnivoros 1"
	(carnivoro ?x)
	(color_leonado ?x)
	(manchas_oscuras ?x)
	=>
	(assert (leopardo ?x)))

(defrule R10 "mamiferos carnivoros 2"
	(carnivoro ?x)
	(color_leonado ?x)
	(franjas_negras ?x)
	=>
	(assert (tigre ?x)))

(defrule R11 "mamiferos carnivoros 2"
	(ungulado ?x)
	(patas_largas ?x)
	(cuello_largo ?x)
	(color_leonado ?x)
	=>
	(assert (tigre ?x)))

(defrule R12 "mamiferos carnivoros 2"
	(ungulado ?x)
	(color_blanco ?x)
	(franjas_negras ?x)
	=>
	(assert (cebra ?x)))

(defrule R13 "aves 1"
	(ave ?x)
	(no_vuela ?x)
	(patas_largas ?x)
	(cuello_largo ?x)
	(color_blanco_negro ?x)
	=>
	(assert (avestruz ?x)))

(defrule R14 "aves 2"
	(ave ?x)
	(no_vuela ?x)
	(nada ?x)
	(cuello_largo ?x)
	(color_blanco_negro ?x)
	=>
	(assert (pinguino ?x)))

(defrule R15 "aves 3"
	(ave ?x)
	(vuela_bien ?x)
	=>
	(assert (albatroz ?x)))