#!/bin/bash

# Ścieżka do pliku Config.plist
CONFIG_FILE="Ścieżka/do/Twojego/Pliku/Config.plist"

# Aktualizacja wartości w pliku Config.plist
/usr/libexec/PlistBuddy -c "Set :SUPABASE_URL $SUPABASE_URL" "$CONFIG_FILE"
/usr/libexec/PlistBuddy -c "Set :SUPABASE_ANON_KEY $SUPABASE_ANON_KEY" "$CONFIG_FILE"
