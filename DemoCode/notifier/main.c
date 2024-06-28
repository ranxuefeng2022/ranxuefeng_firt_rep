#include <linux/init.h>
#include <linux/notifier.h>
#include <linux/module.h>
#include <linux/kern_levels.h>

static BLOCKING_NOTIFIER_HEAD(demo_notifier);
static struct notifier_block demo_nb;

static int demo_notifier_cb(struct notifier_block *nb,
	unsigned long event, void *ptr)
{
	//container_of
	int *data = ptr;

	printk(KERN_ERR "ev:%d data:%d\n", event, *data);
	return NOTIFY_OK;
}

int demo_reg_notifier(struct notifier_block *nb)
{
	return blocking_notifier_chain_register(&demo_notifier, nb);
}

void demo_unreg_notifier(struct notifier_block *nb)
{
	blocking_notifier_chain_unregister(&demo_notifier, nb);
}

void demo_notifier_broadcast(unsigned long event, void *data)
{
	blocking_notifier_call_chain(&demo_notifier,
			event, data);
}

static int __init demo_init(void) {
	int data = 2;
	demo_nb.notifier_call = demo_notifier_cb;
	demo_reg_notifier(&demo_nb);
	demo_notifier_broadcast(1, &data);

	return 0;
}

static void __exit demo_exit(void) {
	printk(KERN_ERR "%s\n", __func__);
}

module_init(demo_init);
module_exit(demo_exit);

MODULE_DESCRIPTION("demo code");
MODULE_AUTHOR("ranxuefeng");
MODULE_AUTHOR("jack.ran");
MODULE_LICENSE("GPL");
