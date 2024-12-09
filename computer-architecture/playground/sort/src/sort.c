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

int main() {
    int arr[] = {7, 4, 5, 2, 6};
    int length = sizeof(arr) / sizeof(arr[0]);
    insertion_sort(arr, length);
    return 0;
}
