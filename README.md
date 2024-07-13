# Rick and Morty

Este proyecto utiliza la API de Rick and Morty. Puedes encontrar más información sobre esta API en [Rick and Morty API](https://rickandmortyapi.com).

1. **Pantalla Principal**
   - Infinite scroll con el listado de personajes.
   - Permite filtrar personajes por nombre.

2. **Vista Detalle del Personaje**
   - Muestra la foto del personaje.
   - Datos personales: nombre, estado, especie, tipo y género.
   - Datos sobre su origen: nombre, tipo y dimensión.
   - Datos sobre su ubicación: nombre, tipo y dimensión.

## Requisitos

Antes de poder ejecutar este proyecto, asegúrate de tener instalados los siguientes requisitos:

- [Flutter](https://flutter.dev/docs/get-started/install) (al menos la versión 2.0.0)
- [Dart](https://dart.dev/get-dart)
- Un editor de texto o IDE, como [VS Code](https://code.visualstudio.com/) o [Android Studio](https://developer.android.com/studio)
- Un dispositivo físico o emulador para probar la aplicación

## Configuración del Entorno

Sigue estos pasos para configurar tu entorno y ejecutar el proyecto:

### 1. Clonar el Repositorio

Clona el repositorio en tu máquina local utilizando Git:

```sh
git clone https://github.com/EmmanuelBazan/flutter_rick_morty.git
cd flutter_rick_morty
```

### 2. Instalar Dependencias

Instala las dependencias del proyecto ejecutando el siguiente comando en la raíz del proyecto:

```sh
flutter pub get
```

### 3. Ejecutar el Proyecto

Para ejecutar el proyecto en un dispositivo emulado o físico, utiliza el siguiente comando:

```sh
flutter run
```

Si tienes múltiples dispositivos conectados, puedes especificar el dispositivo de destino con el siguiente comando:

```sh
flutter run -d <device_id>
```

## Estructura del Proyecto

El proyecto sigue una arquitectura basada en capas: `data`, `domain`, y `presentation`. Aquí hay una breve descripción de cada una:

- **data**: Contiene las implementaciones de las fuentes de datos y repositorios.
- **domain**: Contiene los modelos y abstracciones de los repositorios.
- **presentation**: Contiene las páginas, widgets y viewmodels.

```
lib/
|-- app/
|   |-- data/
|   |   |-- http/
|   |   |-- repository_implementations/
|   |   |-- services/
|   |   |   |-- local/
|   |   |   |-- remote/
|   |   |       |-- rick_morty_api.dart
|   |-- domain/
|   |   |-- models/
|   |   |   |-- character.dart
|   |   |   |-- full_location.dart
|   |   |-- repositories/
|   |   |   |-- characters_repository.dart
|   |   |-- either.dart
|   |-- presentation/
|   |   |-- pages/
|   |   |   |-- character/
|   |   |   |-- home/
|   |   |       |-- viewModel/
|   |   |           |-- home_view_model.dart
|   |   |-- views/
|   |       |-- widgets/
|   |           |-- home_view.dart
|-- routes/
|   |-- my_app.dart
|-- helpers/
|   |-- debouncer.dart
|-- main.dart
```

## Dependencias

El proyecto utiliza varias dependencias que están definidas en el archivo `pubspec.yaml`. Aquí hay algunas de las principales dependencias utilizadas:

- `flutter`
- `provider`

## Contacto

Para más información, sugerencias o preguntas, no dudes en contactar al [mantainer del proyecto](mailto:emmanuelbazan99@gmail.com).

## Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue o un pull request para discutir los cambios que deseas realizar.

---

¡Gracias por visitar mi proyecto!
