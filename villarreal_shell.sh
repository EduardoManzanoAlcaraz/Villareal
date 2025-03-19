#!/bin/bash

# Función para mostrar el menú
show_menu() {
    echo "⚽💛 Bienvenido a la Shell del Villarreal CF 💛⚽"
    echo "--------------------------------------------------"
    echo "Escribe 'help' para ver la lista de comandos."
    echo "--------------------------------------------------"
}

# Función para mostrar ayuda
show_help() {
    echo "📜 Lista de comandos disponibles:"
    echo " install <ruta>         - Crea un archivo o carpeta en la ruta indicada."
    echo " uninstall <ruta>       - Elimina un archivo o carpeta de la ruta indicada."
    echo " date                   - Muestra la fecha y hora actual."
    echo " ascii                  - Muestra un dibujo ASCII del escudo del Villarreal CF."
    echo " himno                  - Reproduce el himno del Villarreal CF."
    echo " game                   - Juega a un juego de adivinar el jugador."
    echo " web                    - Abre la web oficial del Villarreal CF en Lynx."
    echo " show_pid               - Muestra el PID del proceso actual."
    echo " create_aficionado      - Crea un nuevo aficionado (proceso hijo)."
    echo " kick_aficionado <PID>  - Expulsa un aficionado (mata un proceso hijo)."
    echo " help                   - Muestra esta lista de comandos."
    echo " exit                   - Sale de la shell interactiva."
}

# Función para instalar archivos o carpetas
install() {
    if [ -z "$1" ]; then
        echo "⚠️ Uso: install <ruta>"
        return
    fi
    if [ -d "$1" ] || [ -f "$1" ]; then
        echo "✅ El archivo/carpeta ya existe."
    else
        mkdir -p "$(dirname "$1")"
        touch "$1"
        echo "🏗️ Archivo/carpeta '$1' creado."
    fi
}

# Función para desinstalar archivos o carpetas
uninstall() {
    if [ -z "$1" ]; then
        echo "⚠️ Uso: uninstall <ruta>"
        return
    fi
    if [ -d "$1" ]; then
        rm -rf "$1"
        echo "🗑️ Carpeta '$1' eliminada."
    elif [ -f "$1" ]; then
        rm "$1"
        echo "🗑️ Archivo '$1' eliminado."
    else
        echo "🚫 No existe la ruta especificada."
    fi
}

# Función para mostrar la fecha y hora
show_date() {
    echo "📅 Fecha y hora actual: $(date)"
}

# Función para mostrar un dibujo ASCII del escudo
show_ascii() {
    cat << "EOF"
                                                 ,*
                                        ,,,.   .*,,*.    ,,,
                                       *,(#,,. ,,,,,*  ,,(#,,      . 
                               ,,,,,,*    ,,    *,,*    *,    *,,,,,*
                                 ##,*,.,,,* ,,,. .. .,,. *,*, .*,(# 
                                      .*,,,,,,,,,/(,,,,,,,,,,,
                                   , *,,(@(,((*(,,,,(*,@@@@*,,/ * 
                                . #%%%%%@@%#,##(,,,,(##*/**#%%%%%# , 
                              ,.%%%//////.,####(,,,,(####,,/(((((%%%..
                            . %%%%%%@@@@@@@@@%#(,,,,(##@@@@@@@@@&%%%%% ,
                           ,*%%%%%%%%,,,,,@@@@#(,,,,(#@@@(,,,,.%%%%%%%%/
                          ,/%%%%%%%,,(#,,,,@@@@(,,,,(&@@@,,,,(#, %%%%%%%#.
                         . %%%%%%*,(##@@@@%#@@@%,,,,(@@@#,@@@@@@@,.%%%%%%,*
                         .%%%%%/,,#%@@@@&@@#&@@@,,,,@@@%#,@@@#####,,,%%%%%
                          %%%(,,,,#@@@@,,,,##@@@@,,&@@@##,@@@@@@@#,,,,(%%%
                         .%%%%%,,,#@@@@,,,,###@@@#/@@@###,@@@#####,,,/%%%%
                         ./%%%%%(,(#&@@@@@@####@@@@@@####,@@@####(,*%%%%%(.
                           %%%%%%%,,(##,,,,####&@@@@&####,,,,(#(,,%%%%%%%
                            %%%%%%%%.,(,,,,####(@@@@(####,,,,(,,%%%%%%%% . 
                             #%%%%%%%% ,,,,####(,@@,(####,,,,,%%%%%%%%%
                             . %%%%%%%%%.,,####(,((,(####,,,%%%%%%%%% . 
                               , #%%%%%%%#*(###(,,,,(####,(%%%%%%%%.*
                                  ,,%%%%%%%/*(#(,,,,(##,*%%%%%%%*.
                                     ..,%%%%%*,/,,,,(,.%%%%%, . 
                                           .*.  ,,,,  .,.
                                                 .,
                                     ⚽💛 AMUNT VILLARREAL 💛⚽
EOF
}

# Función para reproducir el himno del Villarreal
play_himno() {
    echo "🎶 Intentando reproducir el himno del Villarreal CF... 🎶"

    # Ruta al archivo MP3 en la carpeta home de tu usuario
    FILE_PATH="$HOME/Himno_Villarreal_CF.mp3"

    # Verificar si mpv está instalado
    if ! command -v mpv &> /dev/null; then
        echo "❌ mpv no está instalado. Instálalo con 'sudo apt install mpv'."
        return
    fi

    # Verificar si el archivo existe
    if [ ! -f "$FILE_PATH" ]; then
        echo "🚫 No se encuentra el archivo en: $FILE_PATH"
        return
    fi

    # Reproducir el archivo MP3 con mpv
    echo "🎧 Reproduciendo himno con mpv..."
    mpv "$FILE_PATH" >/dev/null 2>&1 &
}

# Minijuego simple: adivinar un número
play_game() {
    echo "🎮 ¡Bienvenido al juego del Villarreal CF!"
    echo "Tienes que adivinar el jugador con las pistas que te daré."

    # Lista de jugadores con sus pistas
    jugadores=(
        "Gerard Moreno|Delantero estrella del Villarreal|Máximo goleador histórico|Lleva el número 7"
        "Pau Torres|Defensa central|Canterano del Villarreal|Internacional con España"
        "Dani Parejo|Mediocampista|Gran lanzador de faltas|Juega con el dorsal 10"
        "Raúl Albiol|Defensor experimentado|Campeón de la Europa League|Ha jugado en el Real Madrid y Nápoles"
        "Yeremy Pino|Extremo joven y habilidoso|Ha marcado en finales importantes|Internacional con España"
    )

    # Seleccionar un jugador aleatorio
    seleccion="${jugadores[$((RANDOM % ${#jugadores[@]}))]}"

    # Separar datos
    IFS="|" read -r nombre pista1 pista2 pista3 <<< "$seleccion"

    echo "🔹 Pista 1: $pista1"
    echo "🔹 Pista 2: $pista2"
    echo "🔹 Pista 3: $pista3"

    # Bucle hasta que acierte
    while true; do
        read -p "⚽ ¿Quién es?: " respuesta
        if [[ "$respuesta" == "$nombre" ]]; then
            echo "🎉 ¡Correcto! Era $nombre. ¡Eres un auténtico groguet! 💛"
            break
        else
            echo "❌ Incorrecto. Intenta de nuevo..."
        fi
    done
}

# Función para abrir la web oficial del Villarreal en Lynx
open_web() {
    echo "🌍 Abriendo la web del Villarreal CF..."
    lynx "https://www.villarrealcf.es"
}

# Función para mostrar el PID del proceso actual
show_pid() {
    echo "🆔 El PID de este proceso es: $$"
}

# Función para crear un aficionado (proceso hijo)
create_aficionado() {
    (while true; do
        echo "💛 Un aficionado está animando al Villarreal..."
        sleep 10  # Espera de 10 segundos entre cada mensaje
    done) &
    echo "👤 Nuevo aficionado creado con PID $!"
}

# Función para expulsar un aficionado (matar proceso hijo)
kick_aficionado() {
    if [ -z "$1" ]; then
        echo "⚠️ Uso: kick_aficionado <PID>"
        return
    fi
    kill -9 "$1" && echo "🚫 Aficionado con PID $1 ha sido expulsado del estadio."
}

# Si se pasa un comando como argumento
if [ $# -gt 0 ]; then
    cmd=$1
    arg=$2
    case $cmd in
        install) install "$arg" ;;
        uninstall) uninstall "$arg" ;;
        date) show_date ;;
        ascii) show_ascii ;;
        himno) play_himno ;;
        game) play_game ;;
        web) open_web ;;
        show_pid) show_pid ;;
        create_aficionado) create_aficionado ;;
        kick_aficionado) kick_aficionado "$arg" ;;
        help) show_help ;;
        exit) echo "👋 ¡Hasta la próxima, groguet!"; exit ;;
        *) 
            # Si el comando no es reconocido, intentar ejecutarlo en Bash
            echo "⚠️ Comando no reconocido, intentando ejecutarlo en Bash..."
            bash -c "$cmd" 2>&1
            ;;
    esac
    exit
fi

# Bucle de la shell interactiva
while true; do
    show_menu
    read -p "⚽ Escribe un comando: " cmd arg
    case $cmd in
        install) install "$arg" ;;
        uninstall) uninstall "$arg" ;;
        date) show_date ;;
        ascii) show_ascii ;;
        himno) play_himno ;;
        game) play_game ;;
        web) open_web ;;
        show_pid) show_pid ;;
	create_aficionado) create_aficionado ;;
        kick_aficionado) kick_aficionado "$arg" ;;
        help) show_help ;;
        exit) echo "👋 ¡Hasta la próxima, groguet!"; exit ;;
        *) 
            echo "⚠️ Comando no reconocido, intentando ejecutarlo en Bash..."
            bash -c "$cmd" 2>&1
            ;;
    esac
done
