#include <stdio.h>

/*
   Your name and honor code : 
   Harry Wang 
   I pledge my honor that I have abided by the Stevens Honor System.
   State the sorting algorithm you chose in task 3: Selection Sort
   State if you want to be considered for bonus points in task 3: 
   No I do not want to be considered for the bonus ponts in task 3.
*/

void copy_str(char* src, char* dst) {
    /* Your code here */

    label: // adds a label here

    if (*src == '\0') { // if a null terminator is seen, stop the method
        *dst = *src; // copies the null terminator
    }

    else {
        *dst = *src; // copies the letter from src to dst

        dst++;  // itterate to the next letter
        src++;// itterate to the next letter

        goto label; // go to line 15 

    }
    
}

int dot_prod(char* vec_a, char* vec_b, int length, int size_elem) {
    /* Your code here
       Do not cast the vectors directly, such as
       int* va = (int*)vec_a;
    */

   int dot = 0; // dot stores the dot product
   int i = 0; 
   
   label: // a label

    if (i ==length){ // if i reaches the length, stop the method
        return dot; // return the dot product
    }

    else {
    
        int* num1 = (int*)(vec_a + i * size_elem); // num1 iterates through vec1
        int* num2 = (int*)(vec_b + i * size_elem); // num 2 iterates through vec2
        dot += (*num1) * (*num2); // dot will now stores the corresponding elements from vec1 * vec2
        i++; // go to the next element in each vectors
        goto label;
    }

}






void sort_nib(int* arr, int length) {
    /* Your code here */

    char nibs[length * 8]; // create a char array and the length of it will be length * 8 because there are 8 nibbles in one integer

    for (int i = 0; i < length; i++){ // this section will make each 8 nibbles in each integer or each digit in each hexadecimal into an element in the char array, nibbles
        int k = 0;  
        for (int j = 0; j < 8; j += 1){ // i will iterate through the integer array and j will iterate through the char array. 
            nibs[(i * 8) + j] = 0xF & arr[i] >> k; // there are 4 binary numbers in each nibble so we would have to shift the long 32 bit binary number 4 times to the right each time to make one nibble
            k += 4; // each nibble is 4 bits so we would shift the 32 long binary number to the right 4 times
        }
    }

    for (int i = 0; i < length * 8; i++ ){ // this is selection sort algorithm
        int min = i; // min will be the smallest number so far
        for (int j = i; j < length * 8; j++){
            if (nibs[j] < nibs[min]){ // if it finds a number that is smaller than the current smallest number, it will update min
                min = j;
            }
        }
        if (min != i){ // if it detects that min got updated, it will do a swap
                char curr = nibs[min];
                nibs[min] = nibs[i];
                nibs[i] = curr;
            }
    }


    for (int i = 0; i < length; i++){ // the i will iterate through the integer array once again
        int k = 28; // now we will shift left so we should start with the first 4 binary so 32-4 = 28
        arr[i] = 0;
        for (int j = 0; j < 8; j++){
            arr[i] = (nibs[j+8*i] << k) | arr[i]; // shift each nib element left n amount of times depending on which element its on... 
            k -= 4; // increments of 4 because each nibble is 4 binary.
        }
    }

    // 24 nibbles 
    // each nibble = 4 binary number
    // each index of nibble = 4 binary number
    // each index of integer array = 8 nibbles = 32 binary numbers

}


int main(int argc, char** argv) {

    /**
     * Task 1
     */

    char str1[] = "382 is the best!";
    char str2[100] = {0};

    copy_str(str1,str2);
    puts(str1);
    puts(str2);

    /**
     * Task 2
     */

    int vec_a[3] = {12, 34, 10};
    int vec_b[3] = {10, 20, 30};
    int dot = dot_prod((char*)vec_a, (char*)vec_b, 3, sizeof(int));
    
    printf("%d\n",dot);

    /**
     * Task 3
     */

    int arr[3] = {0x12BFDA09, 0x9089CDBA, 0x56788910};
    sort_nib(arr, 3);
    for(int i = 0; i<3; i++) {
        printf("0x%08x ", arr[i]);
    }
    puts(" ");

    return 0;
}
