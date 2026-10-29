# FoodApp

Aplicación móvil desarrollada en Flutter inspirada en la experiencia visual de una tarjeta de bebidas de café, con un estilo moderno y animado tipo Starbucks. La app presenta una galería de productos con tarjetas deslizables, animaciones suaves, gradientes, imágenes de bebidas y un diseño de interfaz premium.

## Descripción general

FoodApp es una interfaz de demostración para explorar bebidas o productos de un catálogo. Su objetivo principal es mostrar una experiencia de navegación elegante en la que el usuario puede:

- Deslizar entre distintas tarjetas de productos
- Ver detalles del producto en una tarjeta con información, precios y contenido visual
- Explorar una paleta de colores relacionada con cada tipo de bebida
- Interactuar con animaciones de entrada, rotación y desplazamiento para dar sensación de profundidad y dinamismo

Aunque el nombre del repositorio es `FoodApp`, la implementación actual se enfoca más en una experiencia de catálogo de bebidas tipo `Starbucks Card Animation`, con una estética de café y bebidas frías.

## Captura de la idea del producto

La aplicación se compone de una pantalla principal con:

- Encabezado superior con iconos de ubicación y menú
- Logotipo central animado
- `PageView` con tarjetas de productos
- Indicadores de página activos/inactivos
- Fondo con imágenes borrosas y elementos decorativos para producir un efecto tridimensional
- Tarjetas de bebidas personalizadas con nombre, descripción, precio y una ilustración de la taza

## Arquitectura del proyecto

La estructura es simple y directa, ideal para una demo de UI en Flutter:

```text
FoodApp/
├── android/                  # Configuración nativa de Android
├── ios/                      # Configuración nativa de iOS
├── assets/
│   └── images/              # Imágenes utilizadas por la UI
├── lib/
│   ├── main.dart            # Punto de entrada de la aplicación
│   ├── home.dart            # Pantalla principal y lógica de animación
│   ├── drink.dart           # Modelo de datos para cada bebida
│   ├── drinkCard.dart       # Widget visual de cada tarjeta
│   ├── colors.dart          # Paleta de colores personalizada
│   └── ...
├── test/                    # Pruebas de Flutter
├── analysis_options.yaml    # Reglas de linting
├── pubspec.yaml             # Dependencias y configuración del proyecto
├── README.md                # Documentación del proyecto
├── .gitignore
├── .metadata
└── pubspec.lock
```

### Componentes principales

#### `main.dart`
Es el punto de entrada de la app. Aquí se configura el `MaterialApp`, se desactiva la bandera de depuración y se establece la pantalla inicial:

- Título: `Starbucks`
- Tema Material 3
- Pantalla inicial: `Home`

#### `home.dart`
Contiene la lógica principal de la vista inicial:

- `PageController` para navegar entre páginas
- `AnimationController` para animaciones
- `PageView.builder` para renderizar las tarjetas dinámicamente
- Cálculo de indicadores de página
- Generación de la lista de bebidas disponibles

#### `drink.dart`
Define el modelo `Drink`, que encapsula los atributos principales de cada producto:

- nombre
- nombre complementario
- imagen de fondo
- imágenes decorativas
- imagen de la taza
- descripción
- colores claro y oscuro

#### `drinkCard.dart`
Es el widget visual más importante. Construye cada tarjeta de bebida y aplica:

- imágenes de fondo con bordes redondeados
- textos con estilo premium
- overlay de color con opacidad
- animaciones por desplazamiento y rotación
- elementos gráficos para taza, blur y decoración

#### `colors.dart`
Archivo de estilo con colores base para la temática de café y bebidas:

- tonos marrón
- verde claro y oscuro
- verde de marca

## Lógica de negocio y flujo de la app

La app no usa backend ni persistencia; es una interfaz de catálogo visual. El flujo es bastante directo:

1. La app inicia en `Home`
2. `Home` crea una lista de bebidas con `Drink`
3. `PageView` presenta una tarjeta por cada producto
4. El usuario desliza entre bebidas
5. Cada `DrinkCard` se anima con transformaciones visuales para dar una sensación dinámica
6. La vista que se está viendo cambia el indicador de página activo

Esto convierte a la app en una demostración de UI en lugar de una aplicación con lógica de negocio compleja.

## Dependencias y paquetes principales

El proyecto usa Flutter y solo cuenta con dependencias mínimas:

### Dependencias

- `flutter`: SDK principal de Flutter
- `cupertino_icons`: iconos del estilo iOS

### Dependencias de desarrollo

- `flutter_test`: herramientas para pruebas
- `flutter_lints`: reglas de calidad y estilo de Dart

Aunque la app no emplea paquetes externos avanzados, su lógica visual está implementada con widgets y animaciones nativas de Flutter, lo que mantiene el proyecto ligero y fácil de mantener.

## Assets

La carpeta `assets/images` contiene los recursos gráficos utilizados para:

- logo
- iconos de ubicación y menú
- imágenes de fondo por bebida
- tazas, toppings, elementos decorativos y desenfoques

Estas imágenes se cargan con `Image.asset(...)` y forman la base estética del diseño.

## Cómo ejecutar el proyecto

### Requisitos

Necesitas tener instalado:

- Flutter SDK (versión recomendada: 3.0.3 o superior para este proyecto)
- Android Studio o Visual Studio Code
- Un emulador o un dispositivo físico

### Instalación

1. Clona el repositorio:

```bash
git clone https://github.com/YaelHuerta1/FoodApp.git
cd FoodApp
```

2. Instala dependencias:

```bash
flutter pub get
```

3. Ejecuta la app:

```bash
flutter run
```

### Ejecutar en un dispositivo específico

Para elegir un dispositivo emulado o físico:

```bash
flutter devices
flutter run -d <device_id>
```

### Compilar para producción

```bash
flutter build apk
```

o para iOS:

```bash
flutter build ios
```

## Recomendaciones para continuar el proyecto

Este proyecto funciona bien como base para una app de catálogo visual. Algunas mejoras que podrías incorporar son:

- navegación entre pantallas de detalle
- gestión de estado con `Provider`, `Riverpod` o `Bloc`
- integración con backend para productos reales
- carrito de compras o diseño de checkout
- soporte para dark mode
- animaciones más complejas o transiciones entre productos

## Tecnologías utilizadas

- Flutter
- Dart
- Material Design 3
- Assets gráficos personalizados

## Licencia

Este proyecto se entrega como ejemplo de desarrollo frontend móvil con Flutter. Si deseas publicar o reutilizarlo, revisa la licencia del contenido gráfico y marca del repositorio antes de distribuirlo comercialmente.

## Conclusión

FoodApp es una demo visual de una app de bebidas con una interfaz moderna, animada e inspirada en el estilo premium de cafeterías. Su arquitectura es sencilla, clara y perfectamente apta para aprender diseño UI en Flutter, animaciones y composición de pantallas con widgets nativos.

Si quieres, puedo ayudarte a continuar este proyecto con una segunda versión más robusta, agregando navegación, detalle de productos y persistencia de datos.
