(defrule Rt1 "Test 1 de apariencia (general)"
=>
    (printout t "Cual es la apariencia del animal?, es decir:" crlf)
    (printout t "a. tiene pelo?" crlf)
    (printout t "b. tiene plumas?" crlf)
    (printout t "c. no se aprecia bien" crlf)
    (printout t "(responder a/b/c): ")
    (assert (cobertura (read))))


(defrule Rt2 "Test de Alimentación ()"
;;Pelo
    (cobertura a)
=>
    (printout t "Alimentación " crlf)
    (printout t "a. Esta comiendo carne" crlf)
    (printout t "b. No esta comiendo" crlf)
    (printout t "(responder a/b): ")
    (assert (alimento (read))))  


(defrule AparienciaCarnivoro "Test de Apariencia Carnivoro ()"
;;Pelo
    (cobertura a)

;;Alimentacion
    (cobertura b )
=>
    (printout t "Apariencia " crlf)
    (printout t "a. manchas_oscuras" crlf)
    (printout t "b. franjas_negras" crlf)
    (printout t "(responder a/b): ")
    (assert (Apariencia (read))))  


(defrule CapacidadVuelo "Capacidad de Vuelo ()"
;;Plumas
    (cobertura b)
=>
    (printout t "a. No esta volando" crlf)
    (printout t "b. Esta volando" crlf)
    (printout t "(responder a/b): ")
    (assert (volar (read))))  

(defrule Crias "Test de Crias ()"
;; NPI
    (cobertura c)
=>
    (printout t "a. Las crias beben leche al nacer" crlf)
    (printout t "b. Las crias nacen por medio de huevos" crlf)
    (printout t "c. No se sabe/ No tiene Crias" crlf)
    (printout t "(responder a/b/c): ")
    (assert (crias (read))))




(defrule QPatas "Cantidad de patas ()"
;;Plumas
    (cobertura b)

;;Vuela
    (volar a )
=>
    (printout t "Cantidad de patas" crlf)
    (assert (patas (read))))

(defrule VelMax "Velocidad maxima ()"
;;Plumas
    (cobertura b)

;;Vuela
    (volar b )
=>
    (printout t "Velocidad maxima" crlf)
    (assert (velocidad (read))))

;;;;;;;;;;;;;;;;;;

(defrule InterAparienciaMamifero "Intermedio de Apariencia de mamiferos para solucionar incongruencias"
;;Pelo
    (cobertura c)
;; Crias
    (crias a)
=>
    (assert (cobertura a) (alimento b) )) 

;;;;;;;;;;;;;;;;;;;

(defrule InterAparienciaNoMamifero "Intermedio de Apariencia de no mamiferos para solucionar incongruencias"
;;Pelo
    (cobertura c)
;; Crias
    (crias b)
=>
    (assert (cobertura b))) 


;;;;;;;;;;;;;;;;;;;

(defrule Rt3 "Test de apariencia Pezuñas o dientes afilados "
;;Pelo
    (cobertura a)
;;NPI
    (alimento b)
=>

    (printout t "Que apariencia tienen? " crlf)
    (printout t "a. tiene pezuñas unguladas" crlf)
    (printout t "b. posee dientes afilados " crlf)
    (printout t "(responder a/b): ")
    (assert (apariencia (read))))  




(defrule Rt5 "Test de apariencia Sin franjas o Franjas negras "
;;Pelo
    (cobertura a)
;;NPI
    (alimento b)
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



;-------------------------------------------------------------
;       Reglas para el S.E. de identificación de animales   |
;-------------------------------------------------------------

(defrule RR1 "Jirafa" 
;;Pelo
    (cobertura a)
;;NPI
    (alimento b)
;;Pezuñas Unguladas
    (apariencia a)
;;Sin franjas
    (franjas a)
=>
    (printout t " Es una jirafa " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónJirafa1()
    (printout t "Tiene pelo" crlf)
    (printout t "Tiene pezuñas Unguladas" crlf)
    (printout t "No posee franjas" crlf)
)

(defrule RR1E "Jirafa Explicación 1" 
;;Pelo
    (cobertura a)
;;NPI
    (alimento b)
;;Pezuñas Unguladas
    (apariencia a)
;;Sin franjas
    (franjas a)
;;Quiso la explicación
    (explicar a)
=>
    (explicaciónJirafa1))


(defrule RR2 "Cebra" 
;;Pelo
    (cobertura a)
;;NPI
    (alimento b)
;;Pezuñas Unguladas
    (apariencia a)
;;Sin franjas
    (franjas b)
=>
    (printout t " Es una cebra " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónCebra1()
    (printout t "Tiene pelo" crlf)
    (printout t "Tiene pezuñas Unguladas" crlf)
    (printout t "Posee franjas" crlf)
)

(defrule RR2E "Cebra Explicación 1" 
;;Pelo
    (cobertura a)
;;NPI
    (alimento b)
;;Pezuñas Unguladas
    (apariencia a)
;;Sin franjas
    (franjas b)
;;Quiso la explicación
    (explicar a)
=>
    (explicaciónCebra1))


(defrule AG1 "Leopardo" 
;;Pelo
    (cobertura a)
;;NPI
    (alimento a)
;;Manchas Oscuras
    (apariencia a)
;;Sin franjas
    (franjas a)
=>
    (printout t " Es un Leopardo " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónLeopardo1()
    (printout t "Tiene pelo" crlf)
    (printout t "Come carne" crlf)
    (printout t "Tiene dientes afilados" crlf)
    (printout t "Tiene manchas oscuras" crlf)
    (printout t "No posee franjas" crlf)
)

(defrule AG1E "Leopardo Explicación 1" 
;;Pelo
    (cobertura a)
;;NPI
    (alimento a)
;;Dientes afilados
    (apariencia b)
;;Manchas Oscuras
    (manchas_oscuras a)
;;Sin franjas
    (franjas a)
;;Quiso la explicación
    (explicar a)
=>
    (explicaciónLeopardo1))

(defrule AG2 "Tigre" 
;;Pelo
    (cobertura a)
;;NPI
    (alimento a)
;;Manchas Oscuras
    (apariencia b)
;;Sin franjas
    (franjas b)
=>
    (printout t " Es un Tigre " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónTigre1()
    (printout t "Tiene pelo" crlf)
    (printout t "Come carne" crlf)
    (printout t "Tiene dientes afilados" crlf)
    (printout t "No tiene manchas oscuras" crlf)
    (printout t "Posee franjas" crlf)
)

(defrule AG2E "Tigre Explicación 1" 
;;Pelo
    (cobertura a)
;;NPI
    (alimento a)
;;Dientes afilados
    (apariencia b)
;;sin Manchas Oscuras
    (manchas_oscuras b)
;;Con franjas
    (franjas b)
;;Quiso la explicación
    (explicar a)
=>
    (explicaciónTigre1))    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule Desconocido1 "Desconocido" 
;;Pelo
    (cobertura c)
;;NPI
    (crias c)
=>
    (printout t " Es un animal desconocido " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónUnk1()
    (printout t "No se puede apreciar bien la cobertura del animal" crlf)
    (printout t "No se posee información sobre las crias" crlf)
    (printout t "Por lo tanto es un animal desconocido" crlf)
)

(defrule UnkExp1 "Desconocido Explicación 1" 
;;Pelo
    (cobertura c)
;;NPI
    (crias c)
;;Quiso la explicación
    (explicar a)
=>
    (explicaciónUnk1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

