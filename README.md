# App Dogs

Prueba Técnica - App Rick&Morty

# Descripción
Esta aplicación iOS es una demostración técnica que muestra información de la API de graphql de Rick&Morty.
El proyecto implementa principios de Clean Architecture con el patrón mvvm, enfatizando la calidad del código, la capacidad de prueba y la mantenibilidad.

# Especificaciones Técnicas

- Plataforma: iOS 15.6+
- Lenguaje: Swift 5
- Framework UI: SwiftUI
- Arquitectura: Clean Architecture + mvvm
- UrlSession peticiones http
- Inyección de Dependencias: Contenedor DI personalizado, Resolver

# Arquitectura

Clean Architecture con el patron arquitectonico mvvm

- Capa de Datos: Maneja operaciones de datos y servicios externos
- Capa de Dominio: Contiene la lógica de negocio y entidades
- Capa de Presentación: Implementa módulos mvvm y componentes UI

# Implementación MVVM

- Vista: Maneja elementos UI e interacciones del usuario
- Use case: Contiene lógica de negocio
- ViewModel: Gestiona la lógica de la Vista y el formato de datos
- Entidad: Representa modelos de datos

# Características

- Vista buscar personaje
- Vista detalle de personaje

# Dependencias

- Resolver
- SkeletonUI

# Estrategia de Pruebas

- Pruebas Unitarias (XCTest)
- Cobertura completa para todos los modulos 

# Cobertura de Código
  
  Cobertura general: 64.4%
  ![Screenshot 2025-06-09 at 9 41 45 PM](https://github.com/user-attachments/assets/c1358e1d-56b7-4642-b586-f03aad2895e4)



# Instrucciones de Instalación

1. Clonar el repositorio
2. Abrir el proyecto AppRick&Morty.xcodeproj
3. Esperar que se descargen las dependencias de spm
4. Compilar y ejecutar

# Ejecución de Pruebas

1. Abrir el proyecto AppRick&Morty.xcodeproj
2. Seleccionar el esquema de pruebas AppRick&MortyTests
3. Presionar Cmd + U para ejecutar las pruebas
4. Ver el informe de cobertura en Xcode

# Prácticas de Desarrollo

- Implementación de principios SOLID
- Inyección de Dependencias para mejor capacidad de prueba
- Programación orientada a protocolos
- Arquitectura modular (Mvvm + Clean Arquitecture)
- Inyeccion de dependencias
- POO
- Vistas con SwiftUi y NavigationStack 

# PrintScreen App
![Simulator Screenshot - Clone 2 of iPhone 16 Pro Max - 2025-06-09 at 21 34 41](https://github.com/user-attachments/assets/a8cb05f8-74fb-404f-b5bd-b8cf747e2d6c)
![Simulator Screenshot - Clone 2 of iPhone 16 Pro Max - 2025-06-09 at 21 34 43](https://github.com/user-attachments/assets/51f070a3-992b-40a3-adcb-5fc7b7244b30)




