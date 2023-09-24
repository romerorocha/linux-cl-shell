#!/bin/bash
testuser=UsuarioInexistente

if grep $testuser /etc/passwd; then
    echo "Se eu cheguei aqui, algo de errado não está certo."
else
    echo "Suspeitei, não existe o usuário inexistente."
fi
