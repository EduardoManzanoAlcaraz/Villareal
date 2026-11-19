# Instrucciones para agentes — Villareal

Se aplica a todo el repositorio. Codex debe leer este archivo; con Claude u otra herramienta, incluirlo explícitamente si no lo carga automáticamente.

## Antes de cambiar archivos

Lee `README.md` y todo `villarreal_shell.sh`, especialmente `uninstall`, `kick_aficionado` y el fallback `bash -c`, antes de ejecutarlo.

Comprueba `git status --short` y la rama. Conserva cambios ajenos y lee las instrucciones de cualquier subdirectorio afectado. Contrasta los documentos con el código: un plan o resultado antiguo no demuestra una función actual. Limita cada cambio al encargo recibido.

## Reglas del proyecto

- El alcance es un ejercicio Bash, no una shell aislada ni un gestor de paquetes. No atribuyas garantías de seguridad que no existen.
- Para documentación usa análisis estático y `bash -n`. No pruebes `uninstall`, `kick_aficionado` o comandos desconocidos como parte de la revisión.
- Si se encarga QA funcional, usa exclusivamente directorios temporales identificados y procesos creados por esa prueba. Conserva su PID y límpialos de forma controlada.
- No copies archivos musicales ni instales Lynx/mpv sin necesidad del encargo. Preserva el catálogo de comandos salvo cambio explícito.

## Validación y entrega

`bash -n villarreal_shell.sh` es la comprobación sintáctica existente disponible; no hay suite. Para cambios funcionales selecciona pruebas manuales concretas, documenta efectos y entorno Bash/Unix y verifica los hijos que tú hayas creado. No ejecutes instrucciones de usuario no fiables a través del fallback. Revisa CRLF si el intérprete reporta errores de fin de línea.

En cambios solo de documentación, comprueba rutas, enlaces relativos y comandos contra los archivos reales; no hace falta repetir toda la suite si no cambia el comportamiento. No inventes pruebas ausentes ni marques como aprobado un comando que no ejecutaste. Informa comando, resultado y alcance pendiente.

Revisa el diff antes de hacer commit. No incluyas dependencias instaladas, archivos generados, datos personales, credenciales, cookies, tokens ni archivos de entorno privados. Mantén los documentos útiles existentes y actualiza el estado si cambia una decisión o una limitación. Los commits deben explicar el resultado y su validación; separa documentación y cambios funcionales.
