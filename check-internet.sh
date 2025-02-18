PUBLIC_IP='8.8.8.8'

function log () {
    echo >&2 "${1}"
}

log "checking if there is internet access"

while ! ping -c 1 -W 1 "${PUBLIC_IP}" &>/dev/null
do
    log "no internet access"
    sleep 1
done

log "internet access is available, successfully connected to ${PUBLIC_IP}"
