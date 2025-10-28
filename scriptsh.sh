#!/bin/bash

# Linux Wargame - Apprendre les commandes Linux
# 25 niveaux pour débutants
# Auteur: Script de formation Linux

GAME_DIR="$HOME/.linux_wargame"
PROGRESS_FILE="$GAME_DIR/progress.txt"

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Initialisation
init_game() {
    if [ -d "$GAME_DIR" ]; then
        echo -e "${YELLOW}Le jeu existe déjà. Voulez-vous recommencer ? (o/n)${NC}"
        read -r answer
        if [ "$answer" = "o" ]; then
            rm -rf "$GAME_DIR"
        else
            return
        fi
    fi
    
    mkdir -p "$GAME_DIR"
    echo "1" > "$PROGRESS_FILE"
    
    # Création de la structure pour tous les niveaux
    create_level_structure
    
    echo -e "${GREEN}Jeu initialisé ! Tapez './wargame.sh' pour commencer${NC}"
}

create_level_structure() {
    # Niveau 1
    echo "FLAG{bienvenue_dans_linux}" > "$GAME_DIR/flag1.txt"
    
    # Niveau 2
    mkdir -p "$GAME_DIR/niveau2"
    echo "FLAG{ls_est_ton_ami}" > "$GAME_DIR/niveau2/flag2.txt"
    
    # Niveau 3
    mkdir -p "$GAME_DIR/niveau3/dossier_cache"
    echo "FLAG{cd_pour_naviguer}" > "$GAME_DIR/niveau3/dossier_cache/flag3.txt"
    
    # Niveau 4
    mkdir -p "$GAME_DIR/niveau4"
    echo "FLAG{cat_affiche_fichiers}" > "$GAME_DIR/niveau4/.fichier_secret"
    
    # Niveau 5
    mkdir -p "$GAME_DIR/niveau5"
    echo "Ligne 1: Du texte inutile" > "$GAME_DIR/niveau5/long_fichier.txt"
    echo "Ligne 2: Encore du texte" >> "$GAME_DIR/niveau5/long_fichier.txt"
    echo "Ligne 3: FLAG{grep_cherche_texte}" >> "$GAME_DIR/niveau5/long_fichier.txt"
    echo "Ligne 4: Plus de texte" >> "$GAME_DIR/niveau5/long_fichier.txt"
    
    # Niveau 6
    mkdir -p "$GAME_DIR/niveau6"
    echo "FLAG{head_montre_debut}" > "$GAME_DIR/niveau6/debut.txt"
    for i in {1..100}; do echo "Ligne $i" >> "$GAME_DIR/niveau6/debut.txt"; done
    
    # Niveau 7
    mkdir -p "$GAME_DIR/niveau7"
    for i in {1..50}; do echo "Ligne $i" >> "$GAME_DIR/niveau7/fin.txt"; done
    echo "FLAG{tail_montre_fin}" >> "$GAME_DIR/niveau7/fin.txt"
    
    # Niveau 8
    mkdir -p "$GAME_DIR/niveau8"
    echo "FLAG{find_trouve_fichiers}" > "$GAME_DIR/niveau8/flag8.txt"
    mkdir -p "$GAME_DIR/niveau8/a/b/c/d/e"
    mv "$GAME_DIR/niveau8/flag8.txt" "$GAME_DIR/niveau8/a/b/c/d/e/"
    
    # Niveau 9
    mkdir -p "$GAME_DIR/niveau9"
    echo "Recherche le mot 'secret' dans ce dossier" > "$GAME_DIR/niveau9/indice.txt"
    echo "Rien ici" > "$GAME_DIR/niveau9/fichier1.txt"
    echo "Le mot secret est dans ce fichier FLAG{grep_recursif}" > "$GAME_DIR/niveau9/fichier2.txt"
    echo "Pas ici non plus" > "$GAME_DIR/niveau9/fichier3.txt"
    
    # Niveau 10
    mkdir -p "$GAME_DIR/niveau10"
    echo "FLAG{wc_compte_lignes}" > "$GAME_DIR/niveau10/flag10.txt"
    chmod 000 "$GAME_DIR/niveau10/flag10.txt"
    
    # Niveau 11
    mkdir -p "$GAME_DIR/niveau11"
    echo "texte:FLAG{cut_decoupe_texte}:fin" > "$GAME_DIR/niveau11/data.txt"
    
    # Niveau 12
    mkdir -p "$GAME_DIR/niveau12"
    echo -e "pomme\nbanane\nFLAG{sort_trie_lignes}\ncerise" > "$GAME_DIR/niveau12/fruits.txt"
    
    # Niveau 13
    mkdir -p "$GAME_DIR/niveau13"
    echo "FLAG{pipes_connectent_commandes}" | base64 > "$GAME_DIR/niveau13/encoded.txt"
    
    # Niveau 14
    mkdir -p "$GAME_DIR/niveau14"
    echo "utilisateur:x:1000:1000:FLAG{awk_traite_colonnes}:/home/user:/bin/bash" > "$GAME_DIR/niveau14/passwd.txt"
    
    # Niveau 15
    mkdir -p "$GAME_DIR/niveau15"
    echo "FLAG{sed_remplace_texte}" > "$GAME_DIR/niveau15/remplacer.txt"
    sed -i 's/FLAG/XXXX/g' "$GAME_DIR/niveau15/remplacer.txt"
    
    # Niveau 16
    mkdir -p "$GAME_DIR/niveau16/zip"
    echo "FLAG{tar_gzip_archives}" > "$GAME_DIR/niveau16/zip/flag16.txt"
    tar -czf "$GAME_DIR/niveau16/archive.tar.gz" -C "$GAME_DIR/niveau16/zip" flag16.txt
    rm -rf "$GAME_DIR/niveau16/zip"
    
    # Niveau 17
    mkdir -p "$GAME_DIR/niveau17"
    echo '#!/bin/bash' > "$GAME_DIR/niveau17/script.sh"
    echo 'echo "FLAG{chmod_permissions}"' >> "$GAME_DIR/niveau17/script.sh"
    
    # Niveau 18
    mkdir -p "$GAME_DIR/niveau18"
    ln -s "$GAME_DIR/niveau18/original.txt" "$GAME_DIR/niveau18/lien.txt"
    echo "FLAG{ln_liens_symboliques}" > "$GAME_DIR/niveau18/original.txt"
    
    # Niveau 19
    mkdir -p "$GAME_DIR/niveau19"
    echo "FLAG{ps_processus}" > "$GAME_DIR/niveau19/flag19.txt"
    
    # Niveau 20
    mkdir -p "$GAME_DIR/niveau20"
    echo "export SECRET='FLAG{export_variables}'" > "$GAME_DIR/niveau20/env.sh"
    
    # Niveau 21
    mkdir -p "$GAME_DIR/niveau21"
    echo "utilisateur1 FLAG{uniq_unique}" > "$GAME_DIR/niveau21/doublons.txt"
    echo "utilisateur1 FLAG{uniq_unique}" >> "$GAME_DIR/niveau21/doublons.txt"
    echo "utilisateur2 autre_flag" >> "$GAME_DIR/niveau21/doublons.txt"
    
    # Niveau 22
    mkdir -p "$GAME_DIR/niveau22"
    echo "Fichier 1" > "$GAME_DIR/niveau22/file1.txt"
    echo "Fichier 2" > "$GAME_DIR/niveau22/file2.txt"
    echo "FLAG{xargs_arguments}" > "$GAME_DIR/niveau22/file3.txt"
    
    # Niveau 23
    mkdir -p "$GAME_DIR/niveau23"
    echo "2024-01-01 INFO: Message normal" > "$GAME_DIR/niveau23/logs.txt"
    echo "2024-01-02 ERROR: Erreur critique" >> "$GAME_DIR/niveau23/logs.txt"
    echo "2024-01-03 INFO: FLAG{regex_patterns}" >> "$GAME_DIR/niveau23/logs.txt"
    
    # Niveau 24
    mkdir -p "$GAME_DIR/niveau24"
    echo "user:password:FLAG{base64_decode}" | base64 | base64 > "$GAME_DIR/niveau24/double_encoded.txt"
    
    # Niveau 25 - Boss final
    mkdir -p "$GAME_DIR/niveau25/.hidden/deep/inside"
    echo "RkxBR3tmZWxpY2l0YXRpb25zX2NoYW1waW9ufQ==" > "$GAME_DIR/niveau25/.hidden/deep/inside/.final"
    chmod 444 "$GAME_DIR/niveau25/.hidden/deep/inside/.final"
}

show_banner() {
    clear
    echo -e "${CYAN}"
    echo "╔═══════════════════════════════════════════════╗"
    echo "║         LINUX WARGAME - FORMATION CLI         ║"
    echo "║              25 Niveaux à conquérir           ║"
    echo "╚═══════════════════════════════════════════════╝"
    echo -e "${NC}"
}

get_current_level() {
    if [ -f "$PROGRESS_FILE" ]; then
        cat "$PROGRESS_FILE"
    else
        echo "1"
    fi
}

update_level() {
    echo "$1" > "$PROGRESS_FILE"
}

show_level() {
    local level=$1
    
    show_banner
    echo -e "${BLUE}═══ NIVEAU $level/25 ═══${NC}\n"
    echo -e "${GREEN}Vous êtes dans:${NC} $GAME_DIR"
    echo ""
    
    case $level in
        1)
            echo -e "${YELLOW}Objectif:${NC} Afficher le contenu du fichier flag1.txt (il est dans ce dossier)"
            echo -e "${CYAN}Indice:${NC} Il existe une commande pour conCATéner et afficher des fichiers"
            echo -e "${CYAN}Astuce:${NC} Tapez 'ls' pour voir les fichiers disponibles"
            ;;
        2)
            echo -e "${YELLOW}Objectif:${NC} Lister les fichiers du dossier niveau2 et trouver le flag"
            echo -e "${CYAN}Indice:${NC} Comment faire pour LiSter le contenu d'un répertoire?"
            echo -e "${CYAN}Astuce:${NC} Vous pouvez lister un dossier avec: ls nom_dossier/"
            ;;
        3)
            echo -e "${YELLOW}Objectif:${NC} Naviguer dans niveau3/dossier_cache et lire le flag"
            echo -e "${CYAN}Indice:${NC} Pour changer de répertoire, pensez à 'Change Directory'"
            ;;
        4)
            echo -e "${YELLOW}Objectif:${NC} Trouver et lire le fichier caché dans niveau4"
            echo -e "${CYAN}Indice:${NC} Sous Linux, les fichiers commençant par '.' sont cachés. Il faut une option spéciale pour les voir"
            ;;
        5)
            echo -e "${YELLOW}Objectif:${NC} Chercher le mot 'FLAG' dans niveau5/long_fichier.txt"
            echo -e "${CYAN}Indice:${NC} Il existe un outil pour chercher des motifs de texte. Son nom évoque une recherche globale avec expressions régulières"
            ;;
        6)
            echo -e "${YELLOW}Objectif:${NC} Afficher la première ligne de niveau6/debut.txt"
            echo -e "${CYAN}Indice:${NC} Comment afficher juste le début (head) d'un fichier?"
            ;;
        7)
            echo -e "${YELLOW}Objectif:${NC} Afficher la dernière ligne de niveau7/fin.txt"
            echo -e "${CYAN}Indice:${NC} À l'inverse, comment voir la fin (tail) d'un fichier?"
            ;;
        8)
            echo -e "${YELLOW}Objectif:${NC} Trouver flag8.txt quelque part dans niveau8"
            echo -e "${CYAN}Indice:${NC} Il y a une commande pour trouver (find) des fichiers par leur nom dans une arborescence"
            ;;
        9)
            echo -e "${YELLOW}Objectif:${NC} Chercher 'FLAG' dans tous les fichiers de niveau9"
            echo -e "${CYAN}Indice:${NC} La commande de recherche de texte a une option pour chercher récursivement dans plusieurs fichiers"
            ;;
        10)
            echo -e "${YELLOW}Objectif:${NC} Lire flag10.txt (mais il n'a pas les permissions!)"
            echo -e "${CYAN}Indice:${NC} Les permissions se modifient avec une commande. Vous devez ajouter le droit de lecture (r)"
            ;;
        11)
            echo -e "${YELLOW}Objectif:${NC} Extraire le 2ème champ séparé par ':' dans niveau11/data.txt"
            echo -e "${CYAN}Indice:${NC} Il existe un outil pour découper (cut) des lignes selon un délimiteur et extraire des champs"
            ;;
        12)
            echo -e "${YELLOW}Objectif:${NC} Trier niveau12/fruits.txt et trouver le flag"
            echo -e "${CYAN}Indice:${NC} Comment trier (sort) des lignes alphabétiquement?"
            ;;
        13)
            echo -e "${YELLOW}Objectif:${NC} Décoder le contenu encodé en base64 dans niveau13/encoded.txt"
            echo -e "${CYAN}Indice:${NC} L'encodage base64 peut être décodé avec une commande du même nom. Pensez aux pipes !"
            ;;
        14)
            echo -e "${YELLOW}Objectif:${NC} Extraire le 5ème champ de niveau14/passwd.txt"
            echo -e "${CYAN}Indice:${NC} Un outil puissant pour traiter des colonnes existe. Son nom est AWK..."
            ;;
        15)
            echo -e "${YELLOW}Objectif:${NC} Le flag a été remplacé par 'XXXX'. Restaurez-le!"
            echo -e "${CYAN}Indice:${NC} L'éditeur de flux (stream editor) peut remplacer du texte. Commande en 3 lettres..."
            ;;
        16)
            echo -e "${YELLOW}Objectif:${NC} Extraire et lire l'archive niveau16/archive.tar.gz"
            echo -e "${CYAN}Indice:${NC} Les archives TAR compressées avec GZIP se décompressent avec une commande spécifique"
            ;;
        17)
            echo -e "${YELLOW}Objectif:${NC} Rendre niveau17/script.sh exécutable et le lancer"
            echo -e "${CYAN}Indice:${NC} Modifiez les permissions pour ajouter l'exécution (x), puis lancez avec ./"
            ;;
        18)
            echo -e "${YELLOW}Objectif:${NC} Lire le contenu du lien symbolique dans niveau18"
            echo -e "${CYAN}Indice:${NC} Un lien symbolique fonctionne comme un raccourci. Lisez-le comme un fichier normal"
            ;;
        19)
            echo -e "${YELLOW}Objectif:${NC} Lire flag19.txt puis trouver votre shell actuel"
            echo -e "${CYAN}Indice:${NC} Votre shell est stocké dans une variable d'environnement. Affichez les variables avec echo $"
            ;;
        20)
            echo -e "${YELLOW}Objectif:${NC} Charger les variables de niveau20/env.sh et afficher SECRET"
            echo -e "${CYAN}Indice:${NC} Pour exécuter un script dans le shell actuel (pas un sous-shell), utilisez 'source' ou '.'"
            ;;
        21)
            echo -e "${YELLOW}Objectif:${NC} Trouver les lignes uniques dans niveau21/doublons.txt"
            echo -e "${CYAN}Indice:${NC} Une commande permet de garder seulement les lignes uniques (unique). Elle travaille sur les lignes adjacentes"
            ;;
        22)
            echo -e "${YELLOW}Objectif:${NC} Lister tous les .txt de niveau22 et les passer à cat"
            echo -e "${CYAN}Indice:${NC} Comment passer des arguments à une commande depuis une liste? Pensez à xargs et aux pipes"
            ;;
        23)
            echo -e "${YELLOW}Objectif:${NC} Trouver les lignes contenant 'FLAG' dans niveau23/logs.txt"
            echo -e "${CYAN}Indice:${NC} La recherche de motifs dans du texte... vous connaissez déjà la commande!"
            ;;
        24)
            echo -e "${YELLOW}Objectif:${NC} Le fichier est encodé en base64 DEUX fois!"
            echo -e "${CYAN}Indice:${NC} Si c'est encodé deux fois, il faut décoder deux fois. Les pipes sont vos amis"
            ;;
        25)
            echo -e "${YELLOW}BOSS FINAL!${NC} Trouvez le fichier caché dans niveau25"
            echo -e "${CYAN}Indice:${NC} Le fichier est caché profondément. Utilisez vos connaissances de find, base64, et fichiers cachés"
            echo -e "${CYAN}Pistes:${NC} Cherchez les fichiers cachés (.), décodez ce que vous trouvez"
            ;;
    esac
    
    echo ""
    echo -e "${GREEN}Entrez le flag trouvé (format: FLAG{...})${NC}"
    echo -e "${CYAN}Commandes spéciales: 'shell' pour explorer, 'hint' pour un indice${NC}"
}

check_flag() {
    local level=$1
    local input=$2
    local expected=""
    
    case $level in
        1) expected="FLAG{bienvenue_dans_linux}" ;;
        2) expected="FLAG{ls_est_ton_ami}" ;;
        3) expected="FLAG{cd_pour_naviguer}" ;;
        4) expected="FLAG{cat_affiche_fichiers}" ;;
        5) expected="FLAG{grep_cherche_texte}" ;;
        6) expected="FLAG{head_montre_debut}" ;;
        7) expected="FLAG{tail_montre_fin}" ;;
        8) expected="FLAG{find_trouve_fichiers}" ;;
        9) expected="FLAG{grep_recursif}" ;;
        10) expected="FLAG{wc_compte_lignes}" ;;
        11) expected="FLAG{cut_decoupe_texte}" ;;
        12) expected="FLAG{sort_trie_lignes}" ;;
        13) expected="FLAG{pipes_connectent_commandes}" ;;
        14) expected="FLAG{awk_traite_colonnes}" ;;
        15) expected="FLAG{sed_remplace_texte}" ;;
        16) expected="FLAG{tar_gzip_archives}" ;;
        17) expected="FLAG{chmod_permissions}" ;;
        18) expected="FLAG{ln_liens_symboliques}" ;;
        19) expected="FLAG{ps_processus}" ;;
        20) expected="FLAG{export_variables}" ;;
        21) expected="FLAG{uniq_unique}" ;;
        22) expected="FLAG{xargs_arguments}" ;;
        23) expected="FLAG{regex_patterns}" ;;
        24) expected="FLAG{base64_decode}" ;;
        25) expected="FLAG{felicitations_champion}" ;;
    esac
    
    if [ "$input" = "$expected" ]; then
        return 0
    else
        return 1
    fi
}

main() {
    if [ ! -d "$GAME_DIR" ]; then
        echo -e "${RED}Le jeu n'est pas initialisé!${NC}"
        echo -e "${YELLOW}Lancement de l'initialisation...${NC}"
        init_game
        echo ""
        echo -e "${GREEN}Maintenant, relancez le script:${NC}"
        echo "./wargame.sh"
        exit 0
    fi
    
    cd "$GAME_DIR" || exit 1
    
    local current_level=$(get_current_level)
    
    if [ $current_level -gt 25 ]; then
        show_banner
        echo -e "${GREEN}╔═══════════════════════════════════════════════╗${NC}"
        echo -e "${GREEN}║  FÉLICITATIONS! Vous avez terminé le jeu!     ║${NC}"
        echo -e "${GREEN}║  Vous maîtrisez maintenant les bases de Linux ║${NC}"
        echo -e "${GREEN}╚═══════════════════════════════════════════════╝${NC}"
        exit 0
    fi
    
    while true; do
        show_level $current_level
        
        read -r input
        
        # Commande shell
        if [ "$input" = "shell" ]; then
            echo -e "${CYAN}=== MODE SHELL INTERACTIF ===${NC}"
            echo -e "${CYAN}Explorez librement! Tapez 'exit' pour revenir au jeu${NC}"
            echo ""
            bash
            continue
        fi
        
        # Hint
        if [ "$input" = "hint" ]; then
            echo -e "${CYAN}Relisez bien les indices ci-dessus! 😉${NC}"
            sleep 2
            continue
        fi
        
        # Vérification du flag
        if check_flag $current_level "$input"; then
            echo -e "${GREEN}✓ CORRECT! Passage au niveau suivant...${NC}"
            current_level=$((current_level + 1))
            update_level $current_level
            sleep 2
            
            if [ $current_level -gt 25 ]; then
                show_banner
                echo -e "${GREEN}╔═══════════════════════════════════════════════╗${NC}"
                echo -e "${GREEN}║  FÉLICITATIONS! Vous avez terminé le jeu!     ║${NC}"
                echo -e "${GREEN}║  Vous maîtrisez maintenant les bases de Linux ║${NC}"
                echo -e "${GREEN}╚═══════════════════════════════════════════════╝${NC}"
                exit 0
            fi
        else
            echo -e "${RED}✗ Incorrect! Réessayez.${NC}"
            sleep 2
        fi
    done
}

# Point d'entrée
if [ "$1" = "init" ]; then
    init_game
else
    main
fi
