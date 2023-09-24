#!/bin/bash
if grep 'System Administrator' /etc/passwd; then
    echo 'Entrei no if:'
    echo '"System Administrator" was found!'
fi

if grep 'Texto Inexistente' /etc/passwd; then
    echo 'Se passou aqui, algo de errado não está certo!'
fi
