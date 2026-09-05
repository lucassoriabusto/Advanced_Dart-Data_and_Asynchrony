# Estructura del proyecto

## `note.dart`

Modelo de datos de las notas.  
`Note`  
`toJson()`  
`fromJson()`

## `note_storage.dart`

Gestión del almacenamiento local.  
`writeFile()`  
`readFile()`

## `note_io.dart`

Solicita los datos al usuario desde la terminal para crear una nueva nota.  
`prompt()`

## `note_http.dart`

Comunicación con la API mediante solicitudes HTTP.  
`GET`  
`POST`

## `note_stream.dart`

Gestión del flujo de datos mediante Streams.  
`streamNotes()`
