.class public Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;
.super Ljava/lang/Object;
.source "HTPSDKAlipay.java"


# static fields
.field public static final RSA_PUBLIC:Ljava/lang/String; = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCl1cdV/BP3Mutegi2Fxs7Vy1TnA8AjM6WKZC7okj2WpICBxxSSMSAuKFQMf39Xe5Jf9Dq3vwNzu5uz20aByc3HT3lR1CaZs7LW80uyTmiJlD3X4VZvtg+E33K6aoQxNXCKaCp/1i3ML2C/vUoIoW61XZUgB/pCrHSgxlK2bA6/GwIDAQAB"

.field private static final SDK_CHECK_FLAG:I = 0x2

.field private static final SDK_PAY_FLAG:I = 0x1

.field private static mActivity:Landroid/app/Activity;

.field private static mHandler:Landroid/os/Handler;

.field private static mPayListener:Lcom/heitao/platform/listener/HTPPayListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 25
    sput-object v0, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->mActivity:Landroid/app/Activity;

    .line 26
    sput-object v0, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 48
    new-instance v0, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay$1;

    invoke-direct {v0}, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay$1;-><init>()V

    sput-object v0, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->mHandler:Landroid/os/Handler;

    .line 105
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Lcom/heitao/platform/listener/HTPPayListener;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    return-object v0
.end method

.method static synthetic access$1()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$2()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public static pay(Landroid/app/Activity;Lcom/heitao/platform/model/HTPPayInfo;Ljava/lang/String;Lcom/heitao/platform/listener/HTPPayListener;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "payInfo"    # Lcom/heitao/platform/model/HTPPayInfo;
    .param p2, "orderInfo"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/heitao/platform/listener/HTPPayListener;

    .prologue
    .line 30
    sput-object p0, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->mActivity:Landroid/app/Activity;

    .line 31
    sput-object p3, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 33
    new-instance v0, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay$2;

    invoke-direct {v0, p2}, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay$2;-><init>(Ljava/lang/String;)V

    .line 45
    invoke-virtual {v0}, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay$2;->start()V

    .line 46
    return-void
.end method
