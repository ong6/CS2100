#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

int multiple(char);

int main(void)
{

    int array[5] = {1.0, 2.0, 3.0, 4.0, 5.0};
    int multiple;
    scanf("%d", &multiple);
    int count = 0;

    for (int i = 0; i < 5; i++) {
        int temp = array[i] % multiple;

        if (temp == 0) {
            count++;
        }
    }

	printf("Count = %d\n", count);

	return 0;
}

