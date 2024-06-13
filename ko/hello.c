#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/delay.h>
#include <linux/workqueue.h>

static struct delayed_work my_delayed_work;

static void work_handler(struct work_struct *work)
{
    printk(KERN_INFO "%d Delayed work function executed.\n", 100);

    // 重新安排下一次的延迟工作
    schedule_delayed_work(&my_delayed_work, HZ); // 每秒执行一次
}

static int __init simple_delayed_work_init(void)
{
    printk(KERN_INFO "Simple delayed work module loaded.\n");

    // 初始化延迟工作，并将其与工作处理函数关联
    INIT_DELAYED_WORK(&my_delayed_work, work_handler);

    // 安排第一次延迟工作，1秒后执行
    schedule_delayed_work(&my_delayed_work, HZ);

    return 0;
}

static void __exit simple_delayed_work_exit(void)
{
    printk(KERN_INFO "Simple delayed work module unloaded.\n");

    // 取消所有待处理的延迟工作
    cancel_delayed_work_sync(&my_delayed_work);
}

module_init(simple_delayed_work_init);
module_exit(simple_delayed_work_exit);

MODULE_LICENSE("GPL");
