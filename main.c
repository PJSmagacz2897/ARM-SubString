#include <stdlib.h>
#include <stdio.h>

       /**
       The main function for the substring call, written in C. sub_string is called from sub_string.s, which is written in ARM assembly. 
       **/ 

int main() {
    int start_index;
    int end_index;
    char* in_string = (char*)malloc(sizeof(char)*100);
    printf("Enter the string: ");
    scanf("%s", in_string);
    printf("Enter the start index: ");
    scanf("%d", &start_index);
    printf("Enter the end index: ");
    scanf("%d", &end_index);
    int size = end_index - start_index + 2;
    char* out_string = (char*) sub_string(in_string, start_index, end_index);
    printf("The substring of the given string is '%s'\n", out_string);
    free(in_string);
    free(out_string);
    return 0;
}
