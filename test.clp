(defrule Rt1 "Test 1 de apariencia (general)"
=>
    (printout t "Cual es la apariencia del animal?, es decir:" crlf)
    (printout t "a. tiene pelo?" crlf)
    (printout t "b. tiene plumas?" crlf)
    (printout t "c. no se aprecia bien" crlf)
    (printout t "(responder a/b/c): ")
    (assert (cobertura (read))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule AgregaMamifero "Agrega caracteristica de Mamifero"
;;Pelo
    (cobertura a)
=>
    (assert (mamifero a))) 


(defrule AgregaAve "Agrega caracteristica de Ave y que pone huevos"
;;Pelo
    (cobertura b)
=>
    (assert (ave a) (huevos a))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule Rt2 "Test de Alimentación ()"
;;Es mamifero
    (mamifero a)
=>
    (printout t "Alimentación " crlf)
    (printout t "a. Esta comiendo carne" crlf)
    (printout t "b. No esta comiendo" crlf)
    (printout t "(responder a/b): ")
    (assert (alimento (read))))  

(defrule AgregaCarnivoroAlimento "Agrega caracteristica de carnivoro por comer carne"
;;Esta comiendo carne
    (alimento a)
=>
    (assert (carnivoros a))
) 



(defrule CapacidadVuelo "Capacidad de Vuelo ()"
;;Pone huevos
    (huevos a)
=>
    (printout t "a. No esta volando" crlf)
    (printout t "b. Esta volando" crlf)
    (printout t "(responder a/b): ")
    (assert (volar (read))))  

(defrule Crias "Test de Crias ()"
;; NPI
    (cobertura c)
=>
    (printout t "a. Las crias estan bebiendo leche?" crlf)
    (printout t "b. Las crias nacen por medio de huevos?" crlf)
    (printout t "c. No se sabe/ No tiene Crias" crlf)
    (printout t "(responder a/b/c): ")
    (assert (crias (read))))

;;;;;;;;;;;;;;;;;;;;;;
(defrule AgregaMamiferoLeche "Agrega caracteristica de Mamifero"
;;Beben Leche
    (crias a)
=>
    (assert (mamifero a))) 


(defrule AgregaAveHuevos "Agrega caracteristica de Ave y que pone huevos"
;;Estan en forma de huevo
    (crias b)
=>
    (assert (ave a) (huevos a))) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule Habitat "Test de Habitat ()"
;; NPI
    (cobertura c)
;; NPI Crias
    (crias c)
=>
    ;;(printout t "Test de habitat" crlf)
    (printout t "a. Se encuentra en un lugar seco?" crlf)
    (printout t "b. Se encuentra en un lugar humedo?" crlf)
    (printout t "c. El lugar no es del todo claro" crlf)
    (printout t "(responder a/b/c): ")
    (assert (habitat (read))))



(defrule AgregaNoVoladorHabitat "Agrega caracteristica de que no vuela"
;;Estan en un lugar humedo
    (habitat b)
=>
    (assert (volar a))
) 


(defrule AgregaMamiferoHabitat "Agrega caracteristica de que no vuela"
;;Estan en un lugar humedo
    (habitat a)
=>
    (assert (mamifero a))
) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule QPatas "Cantidad de patas ()"
;;No esta volando
    (volar a)
=>
    (printout t "Cantidad de patas:" crlf)
    (printout t "a.Se ve que tiene 2 patas?" crlf)
    (printout t "b.Se ve que tiene más de 2 patas?" crlf)
    (printout t "(responder a/b): ")
    (assert (patas (read))))


(defrule Cuello "Largo de cuello ()"
;;Esta volando
    (patas a )
=>
    (printout t "Que tan largo tiene el cuello?" crlf)
    (printout t "a. Es largo" crlf)
    (printout t "b. Pequeño" crlf)
    (printout t "(responder a/b): ")
    (assert (cuello (read))))


;;;;;;;
(defrule AgregaAveDosPatas "Agrega caracteristica de Ave"
;;Tienen dos patas
    (patas a)
=>
    (assert (ave a))) 


(defrule AgregaAnfibioCuatroPatas "Agrega caracteristica de Anfibio"
;;Tienen cuatro patas
    (patas b)
=>
    (assert (anfibio a))) 

;;;;;;;;;;;;;;;;;;;

(defrule Tamaño "Tamaño ()"
;;Esta volando
    (volar b )
=>
    (printout t "Que tamaño tiene?" crlf)
    (printout t "a. Grande" crlf)
    (printout t "b. Pequeño" crlf)
    (printout t "(responder a/b): ")
    (assert (tamaño (read))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule Rt3 "Test de apariencia Pezuñas o dientes afilados "
;;NPI
    (alimento b)
=>

    (printout t "Que apariencia tienen? " crlf)
    (printout t "a. tiene pezuñas unguladas" crlf)
    (printout t "b. posee dientes afilados " crlf)
    (printout t "(responder a/b): ")
    (assert (apariencia (read))))  


(defrule AgregaCarnivoro "Agrega caracteristica de carnivoro"
;;Tienen dientes filoso
    (apariencia b)
=>
    (assert (carnivoros a))
) 


(defrule Franjas "Test de apariencia Sin franjas o Franjas negras "
;;Pezuñas Unguladas
    (apariencia a)
=>

    (printout t "Posee franjas? De que tipo" crlf)
    (printout t "a. No tiene franjas" crlf)
    (printout t "b. Franjas negras " crlf)
    (printout t "(responder a/b): ")
    (assert (franjas (read))))  

(defrule Carnivoros "Test de apariencia carnivoros "
;;carnivoros
    (carnivoros a)
=>

    (printout t "Que aspecto tiene? De que tipo" crlf)
    (printout t "a. Manchas oscuras" crlf)
    (printout t "b. Franjas negras " crlf)
    (printout t "(responder a/b): ")
    (assert (piel (read))))  
    

;-------------------------------------------------------------
;       Reglas para el S.E. de identificación de animales   |
;-------------------------------------------------------------

;-------------------------------------------------------------
;                           Jirafa   |
;-------------------------------------------------------------

(defrule Jirafa1 "Jirafa1" 

    (cobertura a)

    (alimento b)

    (mamifero a)

    (apariencia a)

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

(defrule Jirafa1E "Jirafa Explicación 1" 

    (cobertura a)

    (alimento b)

    (mamifero a)

    (apariencia a)

    (franjas a)

    (explicar a)
=>
    (explicaciónJirafa1))

(defrule Jirafa2 "Jirafa2" 

    (cobertura c)

    (crias a)

    (mamifero a)

    (alimento b)

    (apariencia a)

    (franjas a)
=>
    (printout t " Es una jirafa " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónJirafa2()
    (printout t "Sus bebes bebían leche por lo tanto es un mamífero" crlf)
    (printout t "Tiene pezuñas Unguladas" crlf)
    (printout t "No posee franjas" crlf)
)

(defrule Jirafa2E "Jirafa Explicación 2" 

    (cobertura c)

    (crias a)

    (mamifero a)

    (alimento b)

    (apariencia a)

    (franjas a)

    (explicar a)
=>
    (explicaciónJirafa2))


(defrule Jirafa3 "Jirafa3" 

    (cobertura c)

    (crias c)

    (habitat a)

    (mamifero a)

    (alimento b)

    (apariencia a)

    (franjas a)
=>
    (printout t " Es una jirafa " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónJirafa3()
    (printout t "Se encuentra en un habitat seco" crlf)
    (printout t "Tiene pezuñas Unguladas" crlf)
    (printout t "No posee franjas" crlf)
)

(defrule Jirafa3E "Jirafa Explicación 3" 

    (cobertura c)

    (crias c)

    (habitat a)

    (mamifero a)

    (alimento b)

    (apariencia a)

    (franjas a)

    (explicar a)
=>
    (explicaciónJirafa3))


;-------------------------------------------------------------
;                           Cebra   |
;-------------------------------------------------------------


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

(defrule Cebra2 "Cebra2" 
    (cobertura c)

    (crias a)

    (mamifero a)

    (alimento b)

    (apariencia a)

    (franjas b)
=>
    (printout t " Es una cebra " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónCebra2()
    (printout t "Sus bebes bebían leche por lo tanto es un mamífero" crlf)
    (printout t "Tiene pezuñas Unguladas" crlf)
    (printout t "Posee franjas" crlf)
)

(defrule CebraE2 "Cebra Explicación 2" 

    (cobertura c)

    (crias a)

    (mamifero a)

    (alimento b)

    (apariencia a)

    (franjas b)

    (explicar a)
=>
    (explicaciónCebra2))

(defrule Cebra3 "Cebra3" 
    (cobertura c)

    (crias c)

    (habitat a)

    (mamifero a)

    (alimento b)

    (apariencia a)

    (franjas b)
=>
    (printout t " Es una cebra " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónCebra3()
    (printout t "Se encuentra en un habitat seco" crlf)
    (printout t "Tiene pezuñas Unguladas" crlf)
    (printout t "Posee franjas" crlf)
)

(defrule CebraE3 "Cebra Explicación 3" 

    (cobertura c)

    (crias c)

    (habitat a)

    (mamifero a)

    (alimento b)

    (apariencia a)

    (franjas b)

    (explicar a)
=>
    (explicaciónCebra3)
)


;-------------------------------------------------------------
;                          Leopardo
;-------------------------------------------------------------

(defrule Leopardo1 "Leopardo1" 
    (cobertura a)

    (mamifero a)

    (alimento b)

    (apariencia b)

    (piel a)
=>
    (printout t " Es un Leopardo " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónLeopardo1()
    (printout t "Tiene pelo" crlf)
    (printout t "Tiene dientes afilados" crlf)
    (printout t "Posee manchas oscuras" crlf)
)

(defrule LeopardoE1 "Leopardo Explicación 1" 

    (cobertura a)

    (mamifero a)

    (alimento b)

    (apariencia b)

    (piel a)

    (explicar a)
=>
    (explicaciónLeopardo1)
)

(defrule Leopardo2 "Leopardo2" 
    (cobertura a)

    (mamifero a)

    (alimento a)

    (piel a)
=>
    (printout t " Es un Leopardo " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónLeopardo2()
    (printout t "Tiene pelo" crlf)
    (printout t "Esta comiendo carne" crlf)
    (printout t "Posee manchas oscuras" crlf)
)

(defrule LeopardoE2 "Leopardo Explicación 2" 

    (cobertura a)

    (mamifero a)

    (alimento a)

    (piel a)

    (explicar a)
=>
    (explicaciónLeopardo2)
)

(defrule Leopardo3 "Leopardo3" 
    (cobertura c)

    (crias a)

    (mamifero a)

    (alimento b)

    (apariencia b)

    (piel a)
=>
    (printout t " Es un Leopardo " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónLeopardo3()
    (printout t "Tienen crías que toman leche" crlf)
    (printout t "Poseen dientes afilados" crlf)
    (printout t "Posee manchas oscuras" crlf)
)

(defrule LeopardoE3 "Leopardo Explicación 3" 

    (cobertura c)

    (crias a)

    (mamifero a)

    (alimento b)

    (apariencia b)

    (piel a)

    (explicar a)
=>
    (explicaciónLeopardo3)
)

(defrule Leopardo4 "Leopardo4" 
    (cobertura c)

    (crias a)

    (mamifero a)

    (alimento a)

    (piel a)
=>
    (printout t " Es un Leopardo " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónLeopardo4()
    (printout t "Tienen crías que toman leche" crlf)
    (printout t "Esta comiendo carne" crlf)
    (printout t "Posee manchas oscuras" crlf)
)

(defrule LeopardoE4 "Leopardo Explicación 4" 

    (cobertura c)

    (crias a)

    (mamifero a)

    (alimento a)

    (piel a)

    (explicar a)
=>
    (explicaciónLeopardo4)
)

(defrule Leopardo5 "Leopardo5" 
    (cobertura c)

    (crias c)

    (habitat a)

    (mamifero a)

    (alimento a)

    (piel a)
=>
    (printout t " Es un Leopardo " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónLeopardo5()
    (printout t "Esta en un habitat seco" crlf)
    (printout t "Esta comiendo carne" crlf)
    (printout t "Posee manchas oscuras" crlf)
)

(defrule LeopardoE5 "Leopardo Explicación 5" 

    (cobertura c)

    (crias c)

    (habitat a)

    (mamifero a)

    (alimento a)

    (piel a)

    (explicar a)
=>
    (explicaciónLeopardo5)
)

(defrule Leopardo6 "Leopardo6" 
    (cobertura c)

    (crias c)

    (habitat a)

    (mamifero a)

    (alimento b)

    (apariencia b)

    (piel a)
=>
    (printout t " Es un Leopardo " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónLeopardo6()
    (printout t "Esta en un habitat seco" crlf)
    (printout t "Tiene dientes afilados por lo tanto es carnivoro" crlf)
    (printout t "Posee manchas oscuras" crlf)
)

(defrule LeopardoE6 "Leopardo Explicación 6" 

    (cobertura c)

    (crias c)

    (habitat a)

    (mamifero a)

    (alimento b)

    (apariencia b)

    (piel a)
=>
    (explicaciónLeopardo6)
)


;-------------------------------------------------------------
;                          Tigre
;-------------------------------------------------------------

(defrule Tigre1 "Tigre1" 
    (cobertura a)

    (mamifero a)

    (alimento b)

    (apariencia b)

    (piel b)
=>
    (printout t " Es un Tigre " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónTigre1()
    (printout t "Tiene pelo" crlf)
    (printout t "Tiene dientes afilados" crlf)
    (printout t "Posee franjas negras" crlf)
)

(defrule TigreE1 "Tigre Explicación 1" 

    (cobertura a)

    (mamifero a)

    (alimento b)

    (apariencia b)

    (piel b)

    (explicar a)
=>
    (explicaciónTigre1)
)

(defrule Tigre2 "Tigre2" 
    (cobertura a)

    (mamifero a)

    (alimento a)

    (piel b)
=>
    (printout t " Es un Tigre " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónTigre2()
    (printout t "Tiene pelo" crlf)
    (printout t "Esta comiendo carne" crlf)
     (printout t "Posee franjas negras" crlf)
)

(defrule TigreE2 "Tigre Explicación 2" 

    (cobertura a)

    (mamifero a)

    (alimento a)

    (piel b)

    (explicar a)
=>
    (explicaciónTigre2)
)

(defrule Tigre3 "Tigre3" 
    (cobertura c)

    (crias a)

    (mamifero a)

    (alimento b)

    (apariencia b)

    (piel b)
=>
    (printout t " Es un Tigre " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónTigre3()
    (printout t "Tienen crías que toman leche" crlf)
    (printout t "Poseen dientes afilados" crlf)
     (printout t "Posee franjas negras" crlf)
)

(defrule TigreE3 "Tigre Explicación 3" 

    (cobertura c)

    (crias a)

    (mamifero a)

    (alimento b)

    (apariencia b)

    (piel b)

    (explicar a)
=>
    (explicaciónTigre3)
)

(defrule Tigre4 "Tigre4" 
    (cobertura c)

    (crias a)

    (mamifero a)

    (alimento a)

    (piel b)
=>
    (printout t " Es un Tigre " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónTigre4()
    (printout t "Tienen crías que toman leche" crlf)
    (printout t "Esta comiendo carne" crlf)
     (printout t "Posee franjas negras" crlf)
)

(defrule TigreE4 "Tigre Explicación 4" 

    (cobertura c)

    (crias a)

    (mamifero a)

    (alimento a)

    (piel b)

    (explicar a)
=>
    (explicaciónTigre4)
)

(defrule Tigre5 "Tigre5" 
    (cobertura c)

    (crias c)

    (habitat a)

    (mamifero a)

    (alimento a)

    (piel b)
=>
    (printout t " Es un Tigre " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónTigre5()
    (printout t "Esta en un habitat seco" crlf)
    (printout t "Esta comiendo carne" crlf)
     (printout t "Posee franjas negras" crlf)
)

(defrule TigreE5 "Tigre Explicación 5" 

    (cobertura c)

    (crias c)

    (habitat a)

    (mamifero a)

    (alimento a)

    (piel b)

    (explicar a)
=>
    (explicaciónTigre5)
)

(defrule Tigre6 "Tigre6" 
    (cobertura c)

    (crias c)

    (habitat a)

    (mamifero a)

    (alimento b)

    (apariencia b)

    (piel b)
=>
    (printout t " Es un Tigre " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónTigre6()
    (printout t "Esta en un habitat seco" crlf)
    (printout t "Tiene dientes afilados por lo tanto es carnivoro" crlf)
     (printout t "Posee franjas negras" crlf)
)

(defrule TigreE6 "Tigre Explicación 6" 

    (cobertura c)

    (crias c)

    (habitat a)

    (mamifero a)

    (alimento b)

    (apariencia b)

    (piel b)
=>
    (explicaciónTigre6)
)

;-------------------------------------------------------------
;                          Desconocidos
;-------------------------------------------------------------

(defrule Desconocido1 "Desconocido" 
;;Pelo
    (cobertura c)
;;NPI
    (crias c)

    (habitat c)
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

    (habitat c)

;;Quiso la explicación
    (explicar a)
=>
    (explicaciónUnk1))

;-------------------------------------------------------------
;                          Albatros
;-------------------------------------------------------------
;;

(defrule Albatros1 "Albatros1" 
;;Plumas
    (cobertura b)
;;Vuela
    (volar b)
;;Tamaño
    (tamaño a)

=>
    (printout t " Es un albatros " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónAlbatros1()
    (printout t "Tiene plumas" crlf)
    (printout t "Esta volando" crlf)
    (printout t "Es grande" crlf)
)


(defrule AlbatrosE1 "Albatros Explicación 1" 
;;Plumas
    (cobertura b)
;;Vuela
    (volar b)
;;Tamaño
    (tamaño a)
;;Quiso la explicación
    (explicar a)
=>
    (explicaciónAlbatros1))

(defrule Albatros2 "Albatros2" 

    (cobertura c)

    (crias b)

    (volar b)

    (tamaño a)

=>
    (printout t " Es un albatros " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónAlbatros2()
    (printout t "Sus hijos nacen en huevos" crlf)
    (printout t "Esta volando" crlf)
    (printout t "Es grande" crlf)
)


(defrule AlbatrosE2 "Albatros Explicación 2" 

    (cobertura c)

    (crias b)

    (volar b)

    (tamaño a)

    (explicar a)
=>
    (explicaciónAlbatros2))

;-------------------------------------------------------------
;                          Halcón
;-------------------------------------------------------------

(defrule Halcon1 "Halcón1" 
;;Plumas
    (cobertura b)
;;Vuela
    (volar b)
;;Tamaño
    (tamaño b)

=>
    (printout t " Es un halcón peregrino" crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónHalcón1()
    (printout t "Tiene plumas" crlf)
    (printout t "Puede volar" crlf)
    (printout t "Es pequeño" crlf)
)

(defrule HalconE1 "Halcón Explicación 1" 
;;Plumas
    (cobertura b)
;;Vuela
    (volar b)
;;Tamaño
    (tamaño b)
;;Quiso la explicación
    (explicar a)
=>
    (explicaciónHalcón1))



(defrule Halcon2 "Halcón2" 

    (cobertura c)

    (crias b)

    (volar b)

    (tamaño b)

=>
    (printout t " Es un halcón peregrino" crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónHalcón2()
    (printout t "Las crias nacen por medio de huevo" crlf)
    (printout t "Puede volar" crlf)
    (printout t "Es pequeño" crlf)
)

(defrule HalconE2 "Halcón Explicación 2" 

    (cobertura c)

    (crias b)

    (volar b)

    (tamaño b)

    (explicar a)
=>
    (explicaciónHalcón2))



;-------------------------------------------------------------
;                          Pinguino
;-------------------------------------------------------------   

(defrule Pinguino1 "Pinguino1" 

    (cobertura b)

    (volar a)

    (patas a)

    (cuello b)

=>
    (printout t " Es un Pinguino " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónPinguino1()
    (printout t "Tiene plumas" crlf)
    (printout t "No vuela" crlf)
    (printout t "Tiene dos patas" crlf)
    (printout t "Tiene el cuello corto" crlf)
)

(defrule PinguinoExp1 "Pinguino Explicación 1" 

    (cobertura b)

    (volar a)

    (patas a)

    (cuello b)

    (explicar a)
=>
    (explicaciónPinguino1))


(defrule Pinguino2 "Pinguino2" 

    (cobertura c)

    (crias b)

    (volar a)

    (patas a)

    (cuello b)

=>
    (printout t " Es un Pinguino " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónPinguino2()
    (printout t "Tiene a sus hijos por medio de huevos" crlf)
    (printout t "No vuela" crlf)
    (printout t "Tiene dos patas" crlf)
    (printout t "Tiene el cuello corto" crlf)
)

(defrule PinguinoExp2 "Pinguino Explicación 2" 

    (cobertura c)

    (crias b)

    (volar a)

    (patas a)

    (cuello b)

    (explicar a)
=>
    (explicaciónPinguino2))

(defrule Pinguino3 "Pinguino3" 

    (cobertura c)

    (crias c)

    (habitat b)

    (patas a)

    (cuello b)

=>
    (printout t " Es un Pinguino " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónPinguino3()
    (printout t "Vive en un ambiente humedo" crlf)
    (printout t "Tiene dos patas" crlf)
    (printout t "Tiene el cuello corto" crlf)
)

(defrule PinguinoExp3 "Pinguino Explicación 3" 

    (cobertura c)

    (crias c)

    (habitat b)

    (patas a)

    (cuello b)

    (explicar a)
=>
    (explicaciónPinguino3))


;-------------------------------------------------------------
;                          Avestruz
;-------------------------------------------------------------

(defrule Avestruz1 "Avestruz1" 

    (cobertura b)

    (volar a)

    (patas a)

    (cuello a)

=>
    (printout t " Es una Avestruz " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónAvestruz1()
    (printout t "Tiene plumas" crlf)
    (printout t "No vuela" crlf)
    (printout t "Tiene dos patas" crlf)
    (printout t "Tiene el cuello corto" crlf)
)

(defrule AvestruzExp1 "Avestruz Explicación 1" 

    (cobertura b)

    (volar a)

    (patas a)

    (cuello a)

    (explicar a)
=>
    (explicaciónAvestruz1))


(defrule Avestruz2 "Avestruz2" 

    (cobertura c)

    (crias b)

    (volar a)

    (patas a)

    (cuello a)

=>
    (printout t " Es una Avestruz " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónAvestruz2()
    (printout t "Tiene a sus hijos por medio de huevos" crlf)
    (printout t "No vuela" crlf)
    (printout t "Tiene dos patas" crlf)
    (printout t "Tiene el cuello corto" crlf)
)

(defrule AvestruzExp2 "Avestruz Explicación 2" 

    (cobertura c)

    (crias b)

    (volar a)

    (patas a)

    (cuello a)

    (explicar a)
=>
    (explicaciónAvestruz2))

(defrule Avestruz3 "Avestruz3" 

    (cobertura c)

    (crias c)

    (habitat b)

    (patas a)

    (cuello a)

=>
    (printout t " Es una Avestruz " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónAvestruz3()
    (printout t "Vive en un ambiente humedo" crlf)
    (printout t "Tiene dos patas" crlf)
    (printout t "Tiene el cuello corto" crlf)
)

(defrule AvestruzExp3 "Avestruz Explicación 3" 

    (cobertura c)

    (crias c)

    (habitat b)

    (patas a)

    (cuello a)

    (explicar a)
=>
    (explicaciónAvestruz3))

;-------------------------------------------------------------
;                          Salamandra
;-------------------------------------------------------------


(defrule Salamandra1 "Salamandra" 

    (habitat b)
    
    (crias c)

    (patas b)

    (cobertura c)

    (anfibio a)

=>
    (printout t " Es una Salamandra " crlf)
	(printout t "Desea ver la explicación ?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)
    (assert (explicar (read))))

(deffunction explicaciónSalamandra1()
    (printout t "No tiene ni plumas ni pelo" crlf)
    (printout t "Esta en un ambiente húmedo" crlf)
    (printout t "Tiene más de dos patas" crlf)
)

(defrule SalamandraExp1 "Salamandra Explicación 1" 

    (habitat b)
    
    (crias c)

    (patas b)

    (cobertura c)

    (anfibio a)

    (explicar a)
=>
    (explicaciónSalamandra1))

    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

