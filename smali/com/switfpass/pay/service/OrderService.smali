.class public Lcom/switfpass/pay/service/OrderService;
.super Ljava/lang/Object;


# static fields
.field private static final J:Ljava/lang/String;

.field private static cK:Lcom/switfpass/pay/service/OrderService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/switfpass/pay/service/OrderService;

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/switfpass/pay/service/OrderService;->J:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/switfpass/pay/service/OrderService;
    .locals 1

    sget-object v0, Lcom/switfpass/pay/service/OrderService;->cK:Lcom/switfpass/pay/service/OrderService;

    if-nez v0, :cond_0

    new-instance v0, Lcom/switfpass/pay/service/OrderService;

    invoke-direct {v0}, Lcom/switfpass/pay/service/OrderService;-><init>()V

    sput-object v0, Lcom/switfpass/pay/service/OrderService;->cK:Lcom/switfpass/pay/service/OrderService;

    :cond_0
    sget-object v0, Lcom/switfpass/pay/service/OrderService;->cK:Lcom/switfpass/pay/service/OrderService;

    return-object v0
.end method

.method static synthetic o()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/switfpass/pay/service/OrderService;->J:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public createNativeOrder(Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V
    .locals 1

    new-instance v0, Lcom/switfpass/pay/service/i;

    invoke-direct {v0, p1, p2, p3}, Lcom/switfpass/pay/service/i;-><init>(Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V

    invoke-static {v0, p3}, Lcom/switfpass/pay/thread/ThreadHelper;->executeWithCallback(Lcom/switfpass/pay/thread/Executable;Lcom/switfpass/pay/thread/NotifyListener;)V

    return-void
.end method

.method public createWxAppOrder(Lcom/switfpass/pay/bean/RequestMsg;Lcom/switfpass/pay/thread/UINotifyListener;)V
    .locals 1

    new-instance v0, Lcom/switfpass/pay/service/j;

    invoke-direct {v0, p1, p2}, Lcom/switfpass/pay/service/j;-><init>(Lcom/switfpass/pay/bean/RequestMsg;Lcom/switfpass/pay/thread/UINotifyListener;)V

    invoke-static {v0, p2}, Lcom/switfpass/pay/thread/ThreadHelper;->executeWithCallback(Lcom/switfpass/pay/thread/Executable;Lcom/switfpass/pay/thread/NotifyListener;)V

    return-void
.end method

.method public createzfbAppOrder(Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V
    .locals 1

    new-instance v0, Lcom/switfpass/pay/service/b;

    invoke-direct {v0, p1, p2, p3}, Lcom/switfpass/pay/service/b;-><init>(Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V

    invoke-static {v0, p3}, Lcom/switfpass/pay/thread/ThreadHelper;->executeWithCallback(Lcom/switfpass/pay/thread/Executable;Lcom/switfpass/pay/thread/NotifyListener;)V

    return-void
.end method

.method public qqWapPay(Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V
    .locals 1

    new-instance v0, Lcom/switfpass/pay/service/h;

    invoke-direct {v0, p1, p2, p3}, Lcom/switfpass/pay/service/h;-><init>(Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V

    invoke-static {v0, p3}, Lcom/switfpass/pay/thread/ThreadHelper;->executeWithCallback(Lcom/switfpass/pay/thread/Executable;Lcom/switfpass/pay/thread/NotifyListener;)V

    return-void
.end method

.method public queryByMchId(Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V
    .locals 1

    new-instance v0, Lcom/switfpass/pay/service/g;

    invoke-direct {v0, p1, p2}, Lcom/switfpass/pay/service/g;-><init>(Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V

    invoke-static {v0, p2}, Lcom/switfpass/pay/thread/ThreadHelper;->executeWithCallback(Lcom/switfpass/pay/thread/Executable;Lcom/switfpass/pay/thread/NotifyListener;)V

    return-void
.end method

.method public queryOrder(Ljava/lang/String;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V
    .locals 1

    new-instance v0, Lcom/switfpass/pay/service/d;

    invoke-direct {v0, p2, p1, p3}, Lcom/switfpass/pay/service/d;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V

    invoke-static {v0, p3}, Lcom/switfpass/pay/thread/ThreadHelper;->executeWithCallback(Lcom/switfpass/pay/thread/Executable;Lcom/switfpass/pay/thread/NotifyListener;)V

    return-void
.end method

.method public unfiedQueryOrder(Lcom/switfpass/pay/bean/RequestMsg;Lcom/switfpass/pay/thread/UINotifyListener;)V
    .locals 1

    new-instance v0, Lcom/switfpass/pay/service/c;

    invoke-direct {v0, p1, p2}, Lcom/switfpass/pay/service/c;-><init>(Lcom/switfpass/pay/bean/RequestMsg;Lcom/switfpass/pay/thread/UINotifyListener;)V

    invoke-static {v0, p2}, Lcom/switfpass/pay/thread/ThreadHelper;->executeWithCallback(Lcom/switfpass/pay/thread/Executable;Lcom/switfpass/pay/thread/NotifyListener;)V

    return-void
.end method

.method public unifiedMicroPay(Lcom/switfpass/pay/bean/RequestMsg;Lcom/switfpass/pay/thread/UINotifyListener;)V
    .locals 1

    new-instance v0, Lcom/switfpass/pay/service/e;

    invoke-direct {v0, p1, p2}, Lcom/switfpass/pay/service/e;-><init>(Lcom/switfpass/pay/bean/RequestMsg;Lcom/switfpass/pay/thread/UINotifyListener;)V

    invoke-static {v0, p2}, Lcom/switfpass/pay/thread/ThreadHelper;->executeWithCallback(Lcom/switfpass/pay/thread/Executable;Lcom/switfpass/pay/thread/NotifyListener;)V

    return-void
.end method

.method public unifiedReverse(Lcom/switfpass/pay/bean/RequestMsg;Lcom/switfpass/pay/thread/UINotifyListener;)V
    .locals 1

    new-instance v0, Lcom/switfpass/pay/service/f;

    invoke-direct {v0, p1, p2}, Lcom/switfpass/pay/service/f;-><init>(Lcom/switfpass/pay/bean/RequestMsg;Lcom/switfpass/pay/thread/UINotifyListener;)V

    invoke-static {v0, p2}, Lcom/switfpass/pay/thread/ThreadHelper;->executeWithCallback(Lcom/switfpass/pay/thread/Executable;Lcom/switfpass/pay/thread/NotifyListener;)V

    return-void
.end method

.method public wxRedpack(Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V
    .locals 1

    new-instance v0, Lcom/switfpass/pay/service/a;

    invoke-direct {v0, p1, p2}, Lcom/switfpass/pay/service/a;-><init>(Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V

    invoke-static {v0, p2}, Lcom/switfpass/pay/thread/ThreadHelper;->executeWithCallback(Lcom/switfpass/pay/thread/Executable;Lcom/switfpass/pay/thread/NotifyListener;)V

    return-void
.end method
