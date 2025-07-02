# 📦 Delivery App - Flutter Clean Architecture Project

Una aplicación de entrega de productos construida con **Flutter** siguiendo los principios de **Clean Architecture**, implementando distintos patrones de gestión de estado (**GetX** y **Provider**), con enfoque modular, mantenible y preparado para integración con backend.

---

## 📱 Características Principales

- ✅ Splash Screen personalizada
- ✅ Pantalla de Login (sin backend, pero preparada para integración)
- ✅ Home con barra de navegación inferior
- ✅ Listado de productos (mockeado localmente)
- ✅ Carrito de compras con cálculo automático del total
- ✅ Pantalla de perfil
- ✅ Soporte para **modo claro y oscuro**
- ✅ Arquitectura limpia
- ✅ Implementaciones separadas para distintos patrones de estado

---

## 🧱 Arquitectura

El proyecto sigue el enfoque de **Clean Architecture**, dividido en las siguientes capas:

```
lib/
├── core/
├── data/
├── domain/
├── presentation/
└── main.dart
```

---

## 🗂️ Ramas del Proyecto

Este repositorio cuenta con múltiples ramas, cada una mostrando una evolución del mismo proyecto, útil para aprendizaje o comparación de arquitecturas:

| Rama                  | Descripción                                                                   |
| --------------------- | ----------------------------------------------------------------------------- |
| `no_state_management` | Implementación de solo la interfaz gráfica, sin estado complejo               |
| `getx`                | Estado manejado con **GetX**, incluyendo rutas y controladores                |
| `provider`            | Migración completa de GetX a **Provider**, manteniendo la arquitectura limpia |

---

## 🚀 Preparado para Backend

Aunque actualmente los datos son **mockeados localmente**, toda la estructura de la app está preparada para integrar un backend externo fácilmente.

---

## 🛒 Funcionalidades del Carrito

- Añadir productos al carrito desde el listado
- Visualización dinámica de productos agregados
- Cálculo automático del total del pedido
- Persistencia de datos solo en memoria (por ahora)

---

## 🎨 Temas Oscuro y Claro

Gracias a la implementación de temas centralizados en `lib/presentation/theme/`, la app cambia automáticamente entre:

- **Modo claro**
- **Modo oscuro**

Esto puede ser configurado desde la aplicación desde la pantalla de Profile.

---

## 🛠️ Tecnologías y Paquetes Usados

| Herramienta / Paquete  | Uso                                                     |
| ---------------------- | ------------------------------------------------------- |
| **Flutter** 3.32.4     | Framework base                                          |
| **GetX**               | Manejo de estado y navegación (rama `getx`)             |
| **Provider**           | Alternativa para manejo de estado (rama `provider`)     |
| **Google Fonts**       | Tipografía personalizada                                |
| **Shared Preferences** | (En preparación para persistencia de tema, login, etc.) |

---

## 🧪 Cómo Ejecutar el Proyecto

1. Clona el repositorio:

   ```bash
   git clone https://github.com/pbautistadev/flutter_delivery_app.git
   ```

2. Ingresa al proyecto:

   ```bash
   cd delivery_app_flutter
   ```

3. Cambia a la rama deseada:

   ```bash
   git checkout provider  # o getx / no_state_management
   ```

4. Instala las dependencias:

   ```bash
   flutter pub get
   ```

5. Ejecuta el proyecto:

   ```bash
   flutter run
   ```

---

## 🧑‍🏫 Agradecimientos

Este proyecto fue desarrollado siguiendo un **curso de Flutter del año 2020** impartido por [Diegoveloper](https://www.youtube.com/@diegoveloper). A pesar de los cambios significativos en Flutter desde entonces, he logrado adaptar y actualizar las partes del código que estaban deprecadas o que ya no son recomendadas en versiones recientes (Flutter 3.x en adelante).

Agradezco enormemente el contenido del curso, ya que me permitió comprender a profundidad la estructura de una aplicación profesional y cómo adaptarme a los cambios constantes del ecosistema Flutter.

---

## 📌 Consideraciones Adicionales

- El proyecto fue iniciado a partir de un curso de [Diegoveloper](https://www.youtube.com/@diegoveloper) del 2020, por lo que ciertas prácticas fueron adaptadas a versiones actuales:

  - Migración completa a **null safety**
  - Eliminación de widgets o funciones obsoletas (`FlatButton`, `RaisedButton`, etc.)
  - La estructura facilita la escalabilidad del proyecto, ideal para continuar agregando features como autenticación real, historial de órdenes o mapas.

---

## 📝 Licencia

Este proyecto se encuentra bajo la [MIT License](LICENSE), puedes usarlo libremente para fines personales o educativos.

---
