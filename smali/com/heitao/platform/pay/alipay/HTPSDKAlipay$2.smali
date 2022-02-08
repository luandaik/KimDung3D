.class Lcom/heitao/platform/pay/alipay/HTPSDKAlipay$2;
.super Ljava/lang/Thread;
.source "HTPSDKAlipay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->pay(Landroid/app/Activity;Lcom/heitao/platform/model/HTPPayInfo;Ljava/lang/String;Lcom/heitao/platform/listener/HTPPayListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$orderInfo:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay$2;->val$orderInfo:Ljava/lang/String;

    .line 33
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 37
    new-instance v0, Lcom/alipay/sdk/app/PayTask;

    invoke-static {}, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->access$1()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/alipay/sdk/app/PayTask;-><init>(Landroid/app/Activity;)V

    .line 38
    .local v0, "alipay":Lcom/alipay/sdk/app/PayTask;
    iget-object v3, p0, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay$2;->val$orderInfo:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/alipay/sdk/app/PayTask;->pay(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 40
    .local v2, "result":Ljava/lang/String;
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 41
    .local v1, "msg":Landroid/os/Message;
    const/4 v3, 0x1

    iput v3, v1, Landroid/os/Message;->what:I

    .line 42
    iput-object v2, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 43
    invoke-static {}, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->access$2()Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 44
    return-void
.end method
