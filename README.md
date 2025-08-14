# Desactivar_TurboBoost_Windows
Ejecutable .bat que restablece los valores por defecto de los planes de energía y del registro de Windows. Diseñado para portátiles que alcanzan altas frecuencias de CPU. Nota: se debe modificar la sección de energía para mostrar la opción deshabilitada.


# Restablecer Planes de Energía - Ejecutable BAT

## Descripción
Este ejecutable `.bat` restablece los valores por defecto de los planes de energía y los ajustes del registro de Windows.  
Está diseñado para portátiles que alcanzan frecuencias de CPU elevadas.  

**Importante:** se debe modificar la sección de energía para que la opción específica aparezca deshabilitada.

## Requisitos
- Windows 10 o superior
- Permisos de administrador para ejecutar el script

## Uso
1. Copiar el archivo `.bat` en el equipo portátil.
2. Ejecutar como administrador (clic derecho → "Ejecutar como administrador"). 'Si no le das no pasa nada, el propio bat te pregunta'
3. El script restaurará los planes de energía por defecto y aplicará los ajustes en el registro para hacer visible la opcion Modo de mejora del rendimiento del procesador.
4. Luego manualmente busca energia desde la barra de busqueda de windows, y editamos el plan actual 'Solo abrá uno en equilibrado'.
5. Luego en Administrar energia del procesador debera de salir la nueva opcion 'Modo de mejora del rendimiento del procesador' el cual seleccionaremos en desabilitada ya sea para con cargador o bateria 'RECOMENDACION:   Seleccionar la opcion de con bateria hara que nuestro equipo consuma menos bateria y se caliente menos, y si queremos potencia bruta cuando esta el cargador dejala en una pcion intermedia o por defecto'

## Precauciones
- Cierra cualquier aplicación antes de ejecutar el script.
- Asegúrate de tener una copia de seguridad del registro si deseas revertir cambios manualmente.
- No modificar el archivo salvo que sepas lo que haces.

## Autor
- F3LIP3X

## Licencia
- Libre albedrío
