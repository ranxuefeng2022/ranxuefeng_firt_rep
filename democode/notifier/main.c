#include <linux/init.h>
#include <linux/notifier.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/kern_levels.h>

#include <linux/slab.h>
#include <linux/device.h>
#include <linux/platform_device.h>
#include <linux/err.h>
#include <linux/interrupt.h>
#include <linux/workqueue.h>
#include <linux/time.h>
#include <linux/jiffies.h>
#include "voter.h"

#define LOG(fmt, ...) printk(KERN_ERR "%s[%d]: " fmt, __func__, __LINE__, ##__VA_ARGS__)

/*
#define LOG(fmt, ...) \
	do { \
		struct timeval tv; \
		do_gettimeofday(&tv); \
		printk(KERN_ERR "[%ld.%06ld] %s[%d]: " fmt, tv.tv_sec, tv.tv_usec, __func__, __LINE__, ##__VA_ARGS__); \
	} while (0)
*/

static BLOCKING_NOTIFIER_HEAD(demo_notifier);
static struct platform_device g_pdev;

struct demo_chip {
	struct notifier_block demo_nb;
	struct device *dev;
	int debug_level;

	struct work_struct sys_work;
	struct delayed_work dwork;
	struct delayed_work event_work;
	struct workqueue_struct *event_wq;

};
static struct demo_chip *this_chip;

static int demo_notifier_cb(struct notifier_block *nb,
	unsigned long event, void *ptr)
{
	struct demo_chip *chip = container_of(nb, struct demo_chip, demo_nb);
	int *data = ptr;

	LOG("ev:%d data:%d debug_level:%d\n", event, *data, chip->debug_level);
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

static void demo_work(struct work_struct *work)
{
	struct demo_chip *chip = container_of(work, struct demo_chip, sys_work);

	LOG("demo work execed! log level:%d\n", chip->debug_level);
}

static void demo_delayed_work(struct work_struct *work)
{
	struct demo_chip *chip = container_of(work, struct demo_chip,
			dwork.work);

	LOG("demo work execed! log level:%d\n", chip->debug_level);
	schedule_delayed_work(&this_chip->dwork, msecs_to_jiffies(1000));
}

static void demo_event_work(struct work_struct *work)
{
	struct demo_chip *chip = container_of(work, struct demo_chip,
			event_work.work);

	LOG("demo work execed! log level:%d\n", chip->debug_level);
}
/*************************************************************************************/
static int __init demo_init(void) {
	struct platform_device *pdev = &g_pdev; 
	int data = 2;

	this_chip = kmalloc(sizeof(*this_chip), GFP_KERNEL);

	if (IS_ERR_OR_NULL(this_chip)) {
		LOG("alloc mem failed!!!!\n");
		return -ENOMEM;
	}

	this_chip->dev = &pdev->dev;
	this_chip->demo_nb.notifier_call = demo_notifier_cb;
	this_chip->debug_level = 3;
	platform_set_drvdata(pdev, this_chip);

	/*notifier*/
	demo_reg_notifier(&this_chip->demo_nb);
	demo_notifier_broadcast(1, &data);

	/*work*/
	INIT_WORK(&this_chip->sys_work, demo_work);
	INIT_DELAYED_WORK(&this_chip->dwork, demo_delayed_work);
	INIT_DELAYED_WORK(&this_chip->event_work, demo_event_work);

	this_chip->event_wq = alloc_ordered_workqueue("demo_event",
			WQ_FREEZABLE);

	queue_delayed_work(this_chip->event_wq, &this_chip->event_work,
			msecs_to_jiffies(1000));

	schedule_delayed_work(&this_chip->dwork, msecs_to_jiffies(20000));
	queue_work(system_long_wq, &this_chip->sys_work);
	flush_work(&this_chip->sys_work);

	/*set pri data*/
	platform_set_drvdata(pdev, this_chip);

	//WARN_ON(1);
	//dump_stack();

	return 0;
}

static void __exit demo_exit(void) {
	LOG("%s\n", __func__);
	if (this_chip) {
		LOG("free this_chip !!!!\n");
		kfree(this_chip);
	}
	cancel_delayed_work_sync(&this_chip->dwork);
	flush_work(&this_chip->sys_work);
	//cancel_delayed_work_sync(&this_chip->event_work);
	flush_workqueue(this_chip->event_wq);
	destroy_workqueue(this_chip->event_wq);
}

module_init(demo_init);
module_exit(demo_exit);

MODULE_DESCRIPTION("demo code");
MODULE_AUTHOR("ranxuefeng");
MODULE_AUTHOR("jack.ran");
MODULE_LICENSE("GPL");
