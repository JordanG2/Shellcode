#include <unistd.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
    // Lance la commande "ls -la"
    execl("/bin/ls", "ls", "-la", NULL);
    return 0;
}
