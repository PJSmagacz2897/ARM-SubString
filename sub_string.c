#include <stdlib.h>
#include <stdio.h>

       /**
       Performs the sub_string operation on the given arguments, written in C.
       **/ 

char* sub_string(char *in_string, int start_index, int end_index) {
        int size = end_index - start_index + 2;
        char *out_string = (char*)malloc(sizeof(char)*size);
        int i = 0;
        for(; i < size - 1; i++) {
                out_string[i] = in_string[start_index - 1 + i];
        }
        out_string[size - 1] = '\0';
        return out_string;
}
