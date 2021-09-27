(deftemplate animal
   (slot pelo)
   (slot alimento)
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


(defrule Rt2 "Test de comida ()"
    (cobertura a)
=>
    (printout t "Alimentación " crlf)
    (printout t "a. Come carne" crlf)
    (printout t "b. No se posee la información" crlf)
    (printout t "(responder a/b): ")
    (assert (alimento (read))))  


(defrule Rt4 "Test de apariencia ()"
    (cobertura a)
    (alimento a)
=>

    (printout t "Es carnivoro " crlf)
    (assert (alimento (read))))  


(defrule Rt3 "Test 3 de apariencia ()"
(cobertura b)
=>
    (printout t "Opción B" crlf)
    (assert (cobertura (read))))


(defrule O1 "Interpretación de la opción de cobertura"
    (cobertura a)
=>
    (assert (pelo)))
