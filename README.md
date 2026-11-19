# Villarreal Shell

Shell temática escrita en Bash para practicar funciones, argumentos, archivos, procesos y entrada interactiva. Código en `villarreal_shell.sh`; sin gestor de paquetes, base de datos ni servicio backend.

## Requisitos y ejecución

Bash con utilidades Unix (`date`, `mkdir`, `touch`, `rm`, `kill`, `sleep`). `lynx` es opcional para `web`; `mpv` y un MP3 obtenido legítimamente son opcionales para `himno`. No necesitas esos programas para consultar ayuda.

En Bash, desde la raíz:

```sh
bash -n villarreal_shell.sh
bash villarreal_shell.sh help
bash villarreal_shell.sh
```

El primer comando solo comprueba sintaxis. El segundo muestra ayuda y sale; el último abre el bucle interactivo. Los ejemplos originales con `./` requieren permiso de ejecución en sistemas Unix. En Windows usa un entorno Bash compatible, no PowerShell como intérprete del script.

## Comportamientos que conviene conocer

- `install` crea un archivo y los directorios padre necesarios; su nombre no significa instalar paquetes.
- `uninstall` puede borrar directorios recursivamente. `kick_aficionado` envía SIGKILL al PID indicado y no comprueba que sea hijo propio.
- Los comandos desconocidos se pasan a `bash -c`: no es un entorno de comandos restringido ni un aislamiento seguro.
- `create_aficionado` deja un bucle hijo en segundo plano; no se ve limpieza explícita de hijos al salir.
- Pistas y datos deportivos son contenido del ejercicio, no información actual contrastada.

No pruebes borrados sobre carpetas personales ni envíes señales a procesos ajenos. Estas son propiedades observadas del código, no cambios introducidos por la documentación.

## Estado y próximos pasos

Revisión del 2026-11-19 sobre `ca51281a419e1bea003dd64004dbc2b5cfdd4499`. Las observaciones del código se distinguen de las pruebas ejecutadas y de los informes históricos. Esta revisión solo modifica documentación.

`bash -n villarreal_shell.sh` aprobó. No se ejecutaron comandos del script, procesos hijos, borrados, reproductor ni acceso web; no hay suite automatizada. Próximos pasos propuestos: probar ayuda/fecha en una sesión controlada, después diseñar limpieza y validación de PIDs/rutas antes de ampliar su uso. No atribuir a la revisión sintáctica una validación funcional.

[Instrucciones para agentes](AGENTS.md).

## Referencia original de comandos

Comandos disponibles en la Villarreal Shell
install <ruta>
Crea un archivo o carpeta en la ruta indicada.
Ejemplo: ./villarreal_shell.sh install /ruta/del/archivo

uninstall <ruta>
Elimina un archivo o carpeta de la ruta indicada.
Ejemplo: ./villarreal_shell.sh uninstall /ruta/del/archivo

date
Muestra la fecha y hora actual.
Ejemplo: ./villarreal_shell.sh date

ascii
Muestra un dibujo ASCII del escudo del Villarreal CF.
Ejemplo: ./villarreal_shell.sh ascii

himno
Reproduce el himno del Villarreal CF (se necesita el archivo ~/Himno_Villarreal_CF.mp3).
Ejemplo: ./villarreal_shell.sh himno

game
Juega a un juego de adivinanza sobre jugadores del Villarreal CF, respondiendo a las pistas proporcionadas.
Ejemplo: ./villarreal_shell.sh game

web
Abre la web oficial del Villarreal CF en el navegador de texto lynx (se necesita tener lynx instalado).
Ejemplo: ./villarreal_shell.sh web

show_pid
Muestra el PID del proceso actual.
Ejemplo: ./villarreal_shell.sh show_pid

create_aficionado
Crea un proceso hijo que simula a un aficionado animando al Villarreal CF.
Ejemplo: ./villarreal_shell.sh create_aficionado

kick_aficionado <PID>
Expulsa un aficionado (mata el proceso hijo con el PID especificado).
Ejemplo: ./villarreal_shell.sh kick_aficionado <PID>

help
Muestra la lista de comandos disponibles con su descripción.
Ejemplo: ./villarreal_shell.sh help

exit
Sale de la shell interactiva.
Ejemplo: ./villarreal_shell.sh exit
