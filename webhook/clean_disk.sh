#!/bin/bash

# Configuration
TARGET_DIR="/home/alma/grafana-ascent/load_test/disk_test"
LOG_FILE="/home/alma/grafana-ascent/clean_txt.log"

# Calcul : 3 heures = 180 minutes
MINUTES=180

echo "$(date): Lancement du nettoyage des .bin de plus de 3h dans $TARGET_DIR" >> $LOG_FILE

# 1. Vérifier si le répertoire existe
if [ ! -d "$TARGET_DIR" ]; then
    echo "Erreur : Le répertoire $TARGET_DIR n'existe pas." >> $LOG_FILE
    exit 1
fi

# 2. Trouver et supprimer les fichiers .bin
# -type f : uniquement les fichiers
# -name "*.bin" : extension .bin uniquement
# -mmin +180 : modifiés il y a plus de 180 minutes
# -delete : action de suppression
find "$TARGET_DIR" -type f -name "*.bin" -mmin +$MINUTES -delete -print >> $LOG_FILE 2>&1

echo "Nettoyage terminé." >> $LOG_FILE