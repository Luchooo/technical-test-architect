# Description
Attendance marking by *** students through a QR code

# Índice

1. [Contexto 🌐](#contexto)
2. [Análisis / Algoritmia ⚙️](#análisis--algoritmia)
3. [Base de Datos 🛢️](#base-de-datos)
4. [Diseño 🎨](#diseño)

## Análisis / Algoritmia

1. ¿Qué información necesitaría adicional para la marcación de asistencia?

  Antes de mencionar la información adicional que llegasemos a requerir para la construcción del producto, quisiera definir la información conocida

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
   - Información de las clases
      - ID unico de cada clase
      - Tipo de la clase (Presencial | Virtual)
      - URL del video de la clase ***Si aplica***
  - Información del docente (Stakeholder)
     - ID unico de cada docente
     - Nombre
     - Apellido
     - Correo
     - Teléfono


  - Información del estudiante (Stakeholder)
     - ID unico de cada estudiante
     - Nombre
     - Apellido
     - Correo
     - Teléfono

2. Determine cuales son los actores que intervienen en el proceso 🧍
 - Los actores que identifico que se encuentran en el proceso son los estudiantes, profesores, SIS (Sistema de información estudiantil), la plataforma educativa y los código QR de la clase. Los represente en el siguiente diagrama de uso:
   
![Actores involucrados](https://github.com/Luchooo/technical-test-architect/assets/6707442/880636dd-174f-4fad-9186-728879c7c778)


3.  Defina un algoritmo que implemente la marcación de asistencia antes mencionada (Diagrama de flujo 🖼️)  

![Ejemplo de diagrama de flujo de algoritmo](https://github.com/Luchooo/technical-test-architect/assets/6707442/be741f1f-10d4-4047-bce9-8d239fffc552)


## Base de datos

4. ¿En qué motor de base de datos implementaría su modelo? ¿Por qué?. Defina sus criterios y opciones
- Lorem

5. Defina un modelo de datos que cumpla con los requerimientos antes mencionados.  
👉 Lorem

6. Realice las siguientes consultas, teniendo en cuenta el modelo previo.
a. Reporte de asistencia a una sesión de clase  
👉 Lorem  
b. Reporte de estudiantes con mayor número de tardanzas  
👉 Lorem  
c. Reporte de docentes con mayor inasistencias  
👉 Lorem  

## Diseño
7. Si tuviera que definir la interfaz de un estudiante donde pueda visualizar sus clases y asistencias que elementos incluiría.  
👉 Lorem
