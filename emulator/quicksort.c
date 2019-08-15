#include<stdio.h>

void printArray(int array[], int size){
	// prints the array on the terminal
  	for (int i = 0; i < size; ++i){
    	printf("%d  ", array[i]);
  	}
  	printf("\n");
}

void swap(int array[],int a,int b){
	// swaps two elements
	if (a==b) return;
	array[a] += array[b];
	array[b] = array[a] - array[b];
	array[a] -=array[b];
}

int partition(int array[], int left, int right){
	// partitions the array based on how elements 
	// compare with the last element
	int pivot = array[right];
	int i = left-1;
	for (int j = left;j<right;j++){
		if(array[j] <= pivot){
			i++;
			swap(array,i,j);
		}
	}
	swap(array,i+1,right);
	return i+1;
}

void quickSort(int array[], int left, int right){
	// Sorts the array using quicksort
	if(left<right){
		// partition the array on how they compare with the pivot
		int pivot = partition(array, left, right);

		// Sort left partition
		quickSort(array, left, pivot-1);

		// Sort right partition
		quickSort(array, pivot+1, right);
	}
}


int main(){
	int input[] = {12, 7, 11, 9, 3, 15, 4};
	int input_size = sizeof(input)/sizeof(input[0]);
	quickSort(input,0,input_size-1);
	printf("Array sorted in ascending order\n");
	printArray(input,input_size);
    return 0;
}