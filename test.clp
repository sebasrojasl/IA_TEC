(deftemplate animal
   (slot pelo)
   (slot hardness)
   (slot density)
   (multislot colors))


(defrule Rt1 "Test 1 de apariencia (general)"
=>
    (printout t "Cual es la apariencia del animal?, es decir:" crlf)
    (printout t "a. tiene pelo?" crlf)
    (printout t "b. tiene plumas?" crlf)
    (printout t "c. no se aprecia bien" crlf)
    (printout t "(responder a/b/c): ")
    (assert (cobertura (read))))


(defrule Rt2 "Test 2 de apariencia ()"
(cobertura a)
=>
    (printout t "Opción A" crlf)
    (assert (cobertura (read))))


(defrule Rt3 "Test 3 de apariencia ()"
(cobertura b)
=>
    (printout t "Opción B" crlf)
    (assert (cobertura (read))))


(defrule O1 "Interpretación de la opción de cobertura"
(cobertura a)
=>
(assert (pelo)))
