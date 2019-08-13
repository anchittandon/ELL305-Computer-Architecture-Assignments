#include <stdio.h>

void swap(int array[],int a,int b){
	// swaps two elements 
	array[a] += array[b];
	array[b] = array[a] - array[b];
	array[a] -=array[b];
}

void printArray(int array[], int size){
	// prints the array on the terminal
  	for (int i = 0; i < size; ++i){
    	printf("%d  ", array[i]);
  	}
  	printf("\n");
}

void bubbleSort(int array[], int size){
	// function for bubblesort
	for(int i=0;i<size-1;i++){
		for(int j=0;j<size-i-1;j++){
			if(array[j]>array[j+1]){
				swap(array,j,j+1);
			}
		}
		// printArray(array,size);
	}
}

int main(){
	int input[] = {12, 7, 11, 9, 3, 15, 4};
	int input_size = sizeof(input)/sizeof(input[0]);
	bubbleSort(input,input_size);
	printf("Array sorted in ascending order\n");
	printArray(input,input_size);
    return 0;
}