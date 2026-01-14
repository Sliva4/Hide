#include <stdio.h>
#include <string.h>
#include <str.h>
#include <res.h>

void prop_set_status(char* status) {
    FILE *fptr;
    fptr = fopen("module.prop", "w");
    fprintf(fptr, str_replace(module_temp, "Waiting...", status));
    fclose(fptr); 
}

int main(int argc, char *argv[]) {
    if (argc > 1) {
        if (strcmp(argv[1], "boot-completed") == 0) {
            prop_set_status("OK :)");
            goto out;
        } else if (strcmp(argv[1], "status") == 0) {
            prop_set_status(argv[2]);
            goto out;
        }
    } else {
        printf("Error\n");
        goto out;
    }

out:
    return 0;
}