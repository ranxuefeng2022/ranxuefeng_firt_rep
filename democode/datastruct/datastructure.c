#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
#define TO_STR(_str) #_str
#define LOG_D(_val) printf("value of "#_val" is:%d\n", _val)
结构体地址 = container_of(成员地址，结构体定义名称，成员名称)

int (*fn)(struct device *, void *)

while (!mutex_trylock(&mutex)) {
	msleep(10);
}

struct demo_struct {
	int a;
	int b;
} demo_table[] = {
	[0] = {.a = 1, .b = 2},
	[1] = {.a = 3, .b = 4},
	[2] = {.a = 5, .b = 6},
};
struct demo_struct data = {
	.a = 1,
	.b = 2,
};

static const char * const str_array[] = {
	[0] = "aaa",
	[1] = "bbb",
	[3] = "ccc",
};
"abcde"[2]

ptr = ERR_PTR(-ENODEV);
PRT_ERR(ptr)
if (IS_ERR(psy->tzd))
	return PTR_ERR(psy->tzd);
IS_ERR_OR_NULL(psy)

char *str = kasprintf(GFP_KERNEL, "ocv-capacity-table-%d", index);
kfree(str);

struct power_supply_battery_info *info = devm_kzalloc(&psy->dev, sizeof(*info), GFP_KERNEL);
devm_kfree(&psy->dev, info);

snprintf()


switch (index) {
case 1:
	break;
default:
	break;
}

if () {
} else if () {
} else {
}
