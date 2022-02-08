.class public Lcom/switfpass/pay/handle/PayHandlerManager;
.super Ljava/lang/Object;


# static fields
.field private static final J:Ljava/lang/String;

.field public static final PAY_H5_FAILED:I = -0x1

.field public static final PAY_H5_RESULT:I = 0x9

.field public static final PAY_H5_SUCCES:I = 0x0

.field public static final PAY_WFT_MICRO:I = 0x6

.field public static final PAY_WFT_MICRO_FAILED:I = 0x8

.field public static final PAY_WFT_MICRO_SUCCES:I = 0x7

.field public static final PAY_WFT_SACN:I = 0x0

.field public static final WX_WFT_APP:I = 0x3

.field public static final WX_WFT_APP_FAILED:I = 0x5

.field public static final WX_WFT_APP_NOAPY:I = -0x1

.field public static final WX_WFT_APP_SUCCESS:I = 0x4

.field public static final ZFB_WFT_APP:I = 0x1

.field public static final ZFB_WFT_APP_CONFIRM:I = 0x2

.field public static final ZFB_WFT_APP_SUCCES:I

.field public static systemHandler:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/switfpass/pay/handle/PayHandlerManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->J:Ljava/lang/String;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static notifyMessage(II)V
    .locals 3

    sget-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    :cond_0
    sget-object v1, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_3

    :cond_2
    monitor-exit v1

    return-void

    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Handler;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static notifyMessage(IILjava/lang/Object;)V
    .locals 4

    sget-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    :cond_0
    sget-object v1, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_3

    :cond_2
    monitor-exit v1

    return-void

    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Handler;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static notifyMessage(ILandroid/os/Message;)V
    .locals 7

    sget-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    :cond_0
    sget-object v1, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_3

    :cond_2
    monitor-exit v1

    return-void

    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    :try_start_1
    iget v3, p1, Landroid/os/Message;->what:I

    iget v4, p1, Landroid/os/Message;->arg1:I

    iget v5, p1, Landroid/os/Message;->arg2:I

    iget-object v6, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v0, v3, v4, v5, v6}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    sget-object v3, Lcom/switfpass/pay/handle/PayHandlerManager;->J:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static registerHandler(ILandroid/os/Handler;)V
    .locals 3

    sget-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    :cond_0
    sget-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :cond_1
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v1, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static unregisterHandler(ILandroid/os/Handler;)V
    .locals 2

    sget-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    :cond_0
    sget-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_1

    sget-object v0, Lcom/switfpass/pay/handle/PayHandlerManager;->systemHandler:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-void
.end method
