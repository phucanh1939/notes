// #include <stdio.h>
// #include <stdint.h>
// #include <mach/mach_time.h>

// This not work with clang: clang doesn't support the rdtsc instruction directly in the inline assembly as GCC does.
// Need to test on gcc
// static inline uint64_t get_cpu_cycles() {
//     uint32_t low, high;
//     // Reading the TSC (Time Stamp Counter)
//     __asm__ volatile("rdtsc" : "=a"(low), "=d"(high));
//     return ((uint64_t)high << 32) | low;
// }


// uint64_t get_cpu_cycles() {
//     return mach_absolute_time();
// }

// Find the correct index for 'value' in the sorted portion of the array,
// shift all elements from that index to the right by one position, 
// and place 'value' at the found index.
void insert_value(int arr[], int n, int value) {
    int i = n - 1;
    while (i >= 0 && arr[i] > value) {
        arr[i + 1] = arr[i];
        i--;
    }
    arr[i+1] = value;
}

// Perform insertion sort on an array
void insertion_sort(int arr[], int length) {
    for (int i = 1; i < length; i++) {
        int value = arr[i];
        insert_value(arr, i, value);
    }
}

// void print_array(int arr[], int length) {
//     for (int i = 0; i < length; i++) {
//         printf("%d ", arr[i]);
//     }
//     printf("\n");
// }


int main() {
    int arr[] = {7, 4, 5, 2, 6};
    int length = sizeof(arr) / sizeof(arr[0]);

    // printf("Original array: ");
    // print_array(arr, length);

    // This rdtsc will count all CPU clock cycles (include other background tasks, not just from this program)
    // So, this will not be the right amout of CPU clock cycles taken by this code
    // uint64_t start_cycles = get_cpu_cycles();  // Start measuring CPU cycles
    insertion_sort(arr, length);
    // uint64_t end_cycles = get_cpu_cycles();    // End measuring CPU cycles


    // printf("Sorted array: ");
    // print_array(arr, length);

    // printf("Sorting took %llu CPU cycles.\n", end_cycles - start_cycles);

    return 0;
}
