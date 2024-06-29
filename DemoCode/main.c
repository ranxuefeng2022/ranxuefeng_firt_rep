#include "stdio.h"
#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
static const char * const str_array[] = {
	[0] = "aaa",
	[1] = "bbb",
	[3] = "ccc",
};
int main()
{
	struct demo_struct {
		int a;
		int b;
	} demo_table[] = {
		[0] = {.a = 1, .b = 2},
		[1] = {.a = 3, .b = 4},
		[2] = {.a = 5, .b = 6},
	};
	int i = 0;
	for (i = 0; i < ARRAY_SIZE(demo_table); i++) {
		printf("%d %d\n", demo_table[i].a, demo_table[i].b);
	}
	return 0;
}
