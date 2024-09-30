;Code de base pour afficher du texte
;Pas destiner à rester dans le code, juste une base pour la suite

section .data
    string db "Voici mon texte", 10, 0   ;Chaine de caractères à afficher. Se termine par un saut de ligne et un caractère nul

section .text 
    global _start

_start:
    xor rcx, rcx                         ;Initialisation du compteur à 0

loop:
    mov al, [string + rcx]               ;Dans le registre al, on charge le caractère courant de la chaine
    cmp al, 0                            ;Comparaison avec le caractère null (0)
    je end                               ;Si le caractère nul est atteint, on jump à la fin du programme

    ; Préparer l'appel système write pour afficher un seul caractère
    mov rax, 1                           ;Write = 1
    mov rdi, 1                           ;Sortie (stdout à 1)
    mov rsi, string                      ;On charge l'adresse de la chaine
    add rsi, rcx                         ;On déplace le pointeur rsi à l'index du caractère courant
    mov rdx, 1                           ;Longueur d'affichage de 1 caractère

    push rcx                             ;On save rcx avant l'appel système qui va modifié sa valeur
    syscall                              ;Appel système qui affiche le caratère courant
    pop rcx                              ;On restaure rcx

    inc rcx                              ;incrémentation de rcx de 1
    jmp loop                             ;On boucle

end:
    ; Appel système de sortie du programme exit(0)
    mov rax, 60                          ;Numéro de l'appel système exit (60)
    xor rdi, rdi                         ;Code de retour : 0 = succès
    syscall                              ;Fin du programme
