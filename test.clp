(defrule Rt1 "Test 1 de apariencia (general)"
=>
    (printout t "Cual es la apariencia del animal?, es decir:" crlf)
    (printout t "a. tiene pelo?" crlf)
    (printout t "b. tiene plumas?" crlf)
    (printout t "c. no se aprecia bien" crlf)
    (printout t "(responder a/b/c): ")
    (assert (cobertura (read))))


(defrule Rt2 "Test de comida ()"
;;Pelo
    (cobertura a)
=>
    (printout t "Alimentación " crlf)
    (printout t "a. Come carne" crlf)
    (printout t "b. No se posee la información" crlf)
    (printout t "(responder a/b): ")
    (assert (alimento (read))))  


(defrule Rt3 "Test de apariencia Pezuñas o dientes afilados "
;;Pelo
    (cobertura a)
;;NPI
    (alimento a)
=>

    (printout t "Que apariencia tienen? " crlf)
    (printout t "a. Pezuñas unguladas" crlf)
    (printout t "b. Dientes afilados " crlf)
    (printout t "(responder a/b): ")
    (assert (apariencia (read))))  


(defrule Rt5 "Test de apariencia Sin franjas o Franjas negras "
;;Pelo
    (cobertura a)
;;NPI
    (alimento a)
;;Pezuñas Unguladas
    (apariencia a)
=>

    (printout t "Posee franjas? De que tipo" crlf)
    (printout t "a. No tiene franjas" crlf)
    (printout t "b. Franjas negras " crlf)
    (printout t "(responder a/b): ")
    (assert (franjas (read))))  
    


(defrule Rt4 "Test 3 de apariencia ()"
;;Plumas
(cobertura b)
=>
    (printout t "Opción B" crlf)
    (assert (cobertura (read))))


(defrule O1 "Interpretación de la opción de cobertura"
    (cobertura a)
=>
    (assert (pelo)))


;-------------------------------------------------------------
;       Reglas para el S.E. de identificación de animales   |
;-------------------------------------------------------------

(defrule RR1 "Jirafa" 
;;Pelo
    (cobertura a)
;;NPI
    (alimento a)
;;Pezuñas Unguladas
    (apariencia a)
;;Sin franjas
    (franjas a)
=>
    (printout t " Es una jirafa " crlf)
	(assert (animal Jirafa)))
    (facts)