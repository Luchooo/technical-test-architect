# Description
Attendance marking by *** students through a QR code

# Índice

1. [Contexto 🌐](#contexto)
2. [Análisis / Algoritmia ⚙️](#análisis--algoritmia)
3. [Base de Datos 🛢️](#base-de-datos)
4. [Diseño 🎨](#diseño)

## Contexto

<details>
  <summary>Click para ver detalles</summary>
  "***" es una institución educativa en la cual se presta un servicio de formación a los
  estudiantes para mejorar sus oportunidades laborales, de esta manera uno de los
  programas de formación es bachillerato para adultos en donde los estudiantes tienen la
  posibilidad de asistir a clases presenciales y a clases virtuales durante el mismo periodo.

  El equipo académico encuentra la necesidad de medir la asistencia de los estudiantes a
  cada una de las clases programadas tanto virtuales como presenciales, para ello ha
  pensado en el caso de las clases presenciales en la instalación de códigos QR en la
  entrada de cada uno de los salones para que los estudiantes al ingresar al mismo puedan
  leerlo y mediante una validación se marque la asistencia en el sistema de información
  estudiantil (SIS), en esto el equipo académico ha decidido que si un estudiante se presenta
  hasta 15 minutos luego de iniciada la clase se le marque la asistencia con criterio puntual,
  entre 15 minutos y hasta 30 minutos criterio tardanza y de 30 minutos en adelante como
  NO asistencia.

  En el caso de las clases virtuales esta asistencia deberá registrarse cuando el estudiante
  acceda al link de la clase desde la plataforma educativa y se deberán tener en cuenta los
  mismos criterios de las clases presenciales con la salvedad que un estudiante podrá ver la
  grabación de la clase y se marcará su asistencia con un criterio llamado grabación vista.

  Con esto el equipo académico quiere recibir como producto un reporte en el que puedan
  ver por cada una de las clases el listado de estudiantes y cada uno de los criterios de
  asistencia con los que contaron, junto con un resumen estadístico que les permita tomar
  decisiones rápidamente. 📚📷🤳
</details>

## Análisis / Algoritmia

<details>
  <summary>1. ¿Qué información necesitaría adicional para la marcación de asistencia?</summary>
  <br>
  <p>👉 Antes de mencionar la información adicional que llegasemos a requerir para la construcción del producto, quisiera definir la información conocida
  </p>

 **Información obtenida**
  - Tipo de clases
      - Presencial: se registra mediante códigos QR en la entrada del salón
      - Virtual: se registra cuando los estudiantes acceden al enlace de la clase desde la plataforma educativa.
  - Criterios de asistencia
    - Puntual, tardanza, grabación vista, no asistencia.

  - Reglas de asistencia
    - Menor a 15 min: se establece un límite de tiempo de 15 minutos para registrar asistencia puntual indiferente de la clase tomada presencial o virtual. 
    - Entre 15 y 30 minutos: se considera tardanza. 
    - Después de 30 minutos: se registra como no asistencia indiferente de la clase tomada presencial o virtual.
    - Un estudiante podrá ver la grabación de la clase y se marcará su asistencia como grabación vista.

 **Información adicional**
   - Información de materias
      - ID unico de cada materia
      - Nombre de la materia
  - Información del docente (***Stakeholder***)
     - ID unico de cada docente
     - Nombre
     - Apellido
     - Correo
     - Teléfono
  - Información del estudiante (***Stakeholder***)
     - ID unico de cada estudiante
     - Nombre
     - Apellido
     - Correo
     - Teléfono
  - Lista de materias_por_estudiante
  - Lista de materias_por_docente   
</details>   
<br>

<details>
  <summary>2. Determine cuales son los actores que intervienen en el proceso 🧍</summary>   
 <br>
 <p>👉 Los actores que identifico que se encuentran en el proceso son los estudiantes, profesores, SIS (Sistema de información estudiantil), la plataforma educativa y los código QR de la clase. Los represente en el siguiente diagrama de uso:
 </p>
   
![Actores involucrados](https://github.com/Luchooo/technical-test-architect/assets/6707442/880636dd-174f-4fad-9186-728879c7c778)

</details>   
<br>
<details>
  <summary>3.  Defina un algoritmo que implemente la marcación de asistencia antes mencionada (Diagrama de flujo 🖼️)</summary>   
 
 <br>
 <p>👉 Diagrama de flujo del algoritmo</p>

![Diagrama de flujo del algoritmo](https://github.com/Luchooo/technical-test-architect/assets/6707442/be741f1f-10d4-4047-bce9-8d239fffc552)

</details> 

## Base de datos

<details>
  <summary>4. ¿En qué motor de base de datos implementaría su modelo? ¿Por qué?. Defina sus criterios y opciones</summary>  
<br>
<p>👉 Lorem</p>
</details> 
<br>
<details>
  <summary>5. Defina un modelo de datos que cumpla con los requerimientos antes mencionados.</summary>  
<br>
<p>👉 Lorem</p>
</details> 

<br>
<details>
  <summary>6. Realice las siguientes consultas, teniendo en cuenta el modelo previo.</summary>  
<br>
<ul>
<li>a. Reporte de asistencia a una sesión de clase
 <ul>
    <li>👉 Lorem</li>
  </ul>
</li>
<li>b. Reporte de estudiantes con mayor número de tardanzas
 <ul>
    <li>👉 Lorem</li>
  </ul>
</li>
<li>c. Reporte de docentes con mayor inasistencias
 <ul>
    <li>👉 Lorem</li>
  </ul>
</li>
</ul>
</details> 
<br>
  


## Diseño

<details>
  <summary>7. Si tuviera que definir la interfaz de un estudiante donde pueda visualizar sus clases y asistencias que elementos incluiría.</summary>
  <br>
  <p>👉 Lorem
  </p>
</details> 

