#include<stdio.h>

void printArray(int array[], int size){
	// prints the array on the terminal
  	for (int i = 0; i < size; ++i){
    	printf("%d  ", array[i]);
  	}
  	printf("\n");
}

void merge(int array[], int left, int mid, int right){
	int left_size = mid - left + 1;
	int right_size = right- mid;

	int LArray[left_size], RArray[right_size];

	for (int i=0;i<left_size;i++){
		LArray[i] = array[left+i];
	}

	for (int i=0;i<right_size;i++){
		RArray[i] = array[mid + i + 1];
	}
	int indL = 0, indR = 0, ind = left;

	while(indL < left_size && indR < right_size){
		if(LArray[indL] < RArray[indR]){
			array[ind] = LArray[indL];
			indL++;  
		}
		else{
			array[ind] = RArray[indR];
			indR++;
		}
		ind++;
	}

	while(indL<left_size){
		array[ind] = LArray[indL];
		ind++;
		indL++;
	}

	while(indR<right_size){
		array[ind] = RArray[indR];
		ind++;
		indR++;	
	}

}

void mergeSort(int array[], int left, int right){
	if(left < right){
		int mid = left + (right-left)/2; //avoids overflow for large left and right
 
		// sort first half
		mergeSort(array,left,mid);

		// sort second half
		mergeSort(array,mid+1,right);

		merge(array,left,mid,right);
	}
}

int main(){
	int input[] = {12, 7, 11, 9, 3, 15, 4};
	int input_size = sizeof(input)/sizeof(input[0]);
	mergeSort(input,0,input_size);
	printf("Array sorted in ascending order\n");
	printArray(input,input_size);
    return 0;
}