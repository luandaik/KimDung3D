.class public Lcom/switfpass/pay/utils/PayDialogInfo;
.super Landroid/app/Dialog;


# static fields
.field private static dG:Ljava/lang/String;


# instance fields
.field private W:Landroid/app/AlertDialog;

.field private Y:Z

.field private ac:Lcom/switfpass/pay/bean/RequestMsg;

.field private dA:Landroid/widget/RelativeLayout;

.field private dB:Lcom/switfpass/pay/utils/ProgressInfoDialog;

.field private dC:Ljava/util/List;

.field private dD:Landroid/widget/TextView;

.field private dE:Lcom/tencent/mm/sdk/openapi/IWXAPI;

.field private dF:Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;

.field private dh:Landroid/view/ViewGroup;

.field private ds:Landroid/app/Activity;

.field private dt:Landroid/widget/RelativeLayout;

.field private du:Landroid/widget/RelativeLayout;

.field private dv:Landroid/widget/RelativeLayout;

.field private dw:Landroid/widget/RelativeLayout;

.field private dx:Landroid/widget/RelativeLayout;

.field private dy:Landroid/widget/RelativeLayout;

.field private dz:Landroid/widget/RelativeLayout;

.field protected isResumed:Z

.field protected loadingDialog:Landroid/app/ProgressDialog;

.field mHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/switfpass/pay/MainApplication;->ZFB_SCAN_TYPE:Ljava/lang/String;

    sput-object v0, Lcom/switfpass/pay/utils/PayDialogInfo;->dG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->Y:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->loadingDialog:Landroid/app/ProgressDialog;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->isResumed:Z

    new-instance v0, Lcom/switfpass/pay/utils/j;

    invoke-direct {v0}, Lcom/switfpass/pay/utils/j;-><init>()V

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->mHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/util/List;)V
    .locals 4

    const/4 v3, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-boolean v1, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->Y:Z

    iput-object v3, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->loadingDialog:Landroid/app/ProgressDialog;

    iput-boolean v2, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->isResumed:Z

    new-instance v0, Lcom/switfpass/pay/utils/j;

    invoke-direct {v0}, Lcom/switfpass/pay/utils/j;-><init>()V

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->mHandler:Landroid/os/Handler;

    invoke-virtual {p0, v1}, Lcom/switfpass/pay/utils/PayDialogInfo;->requestWindowFeature(I)Z

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/PayDialogInfo;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/PayDialogInfo;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_pay_dialog_check()I

    move-result v1

    invoke-virtual {v0, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dh:Landroid/view/ViewGroup;

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dh:Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->setContentView(Landroid/view/View;)V

    iput-object p1, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    iput-object p2, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dC:Ljava/util/List;

    invoke-direct {p0}, Lcom/switfpass/pay/utils/PayDialogInfo;->t()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dy:Landroid/widget/RelativeLayout;

    new-instance v1, Lcom/switfpass/pay/utils/G;

    invoke-direct {v1, p0}, Lcom/switfpass/pay/utils/G;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dt:Landroid/widget/RelativeLayout;

    new-instance v1, Lcom/switfpass/pay/utils/H;

    invoke-direct {v1, p0}, Lcom/switfpass/pay/utils/H;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->du:Landroid/widget/RelativeLayout;

    new-instance v1, Lcom/switfpass/pay/utils/I;

    invoke-direct {v1, p0}, Lcom/switfpass/pay/utils/I;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dw:Landroid/widget/RelativeLayout;

    new-instance v1, Lcom/switfpass/pay/utils/J;

    invoke-direct {v1, p0}, Lcom/switfpass/pay/utils/J;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dx:Landroid/widget/RelativeLayout;

    new-instance v1, Lcom/switfpass/pay/utils/K;

    invoke-direct {v1, p0}, Lcom/switfpass/pay/utils/K;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dv:Landroid/widget/RelativeLayout;

    new-instance v1, Lcom/switfpass/pay/utils/L;

    invoke-direct {v1, p0}, Lcom/switfpass/pay/utils/L;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dz:Landroid/widget/RelativeLayout;

    new-instance v1, Lcom/switfpass/pay/utils/M;

    invoke-direct {v1, p0}, Lcom/switfpass/pay/utils/M;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dA:Landroid/widget/RelativeLayout;

    new-instance v1, Lcom/switfpass/pay/utils/O;

    invoke-direct {v1, p0}, Lcom/switfpass/pay/utils/O;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/utils/PayDialogInfo;)Lcom/switfpass/pay/utils/ProgressInfoDialog;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dB:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    return-object v0
.end method

.method static synthetic a(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/bean/OrderBena;)V
    .locals 1

    new-instance v0, Lcom/switfpass/pay/utils/P;

    invoke-direct {v0, p0, p1}, Lcom/switfpass/pay/utils/P;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/bean/OrderBena;)V

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/P;->start()V

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/bean/OrderBena;Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 6

    const/4 v1, 0x0

    new-instance v2, Lcom/tencent/mm/sdk/modelpay/PayReq;

    invoke-direct {v2}, Lcom/tencent/mm/sdk/modelpay/PayReq;-><init>()V

    invoke-virtual {p2}, Lcom/switfpass/pay/bean/RequestMsg;->getAppId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/tencent/mm/sdk/modelpay/PayReq;->appId:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getPrepayid()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/tencent/mm/sdk/modelpay/PayReq;->prepayId:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getPartner()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/tencent/mm/sdk/modelpay/PayReq;->partnerId:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getNonceStr()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/tencent/mm/sdk/modelpay/PayReq;->nonceStr:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getTimeStamp()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/tencent/mm/sdk/modelpay/PayReq;->timeStamp:Ljava/lang/String;

    const-string v0, "Sign=WXPay"

    iput-object v0, v2, Lcom/tencent/mm/sdk/modelpay/PayReq;->packageValue:Ljava/lang/String;

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    invoke-virtual {p2}, Lcom/switfpass/pay/bean/RequestMsg;->getAppId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/tencent/mm/sdk/openapi/WXAPIFactory;->createWXAPI(Landroid/content/Context;Ljava/lang/String;)Lcom/tencent/mm/sdk/openapi/IWXAPI;

    move-result-object v0

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dE:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dE:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    invoke-virtual {p2}, Lcom/switfpass/pay/bean/RequestMsg;->getAppId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/tencent/mm/sdk/openapi/IWXAPI;->registerApp(Ljava/lang/String;)Z

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getSign()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/tencent/mm/sdk/modelpay/PayReq;->sign:Ljava/lang/String;

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dE:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    invoke-interface {v0}, Lcom/tencent/mm/sdk/openapi/IWXAPI;->getWXAppSupportAPI()I

    move-result v0

    const v3, 0x22000001

    if-lt v0, v3, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string v3, "PayDialogInfo"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "isPaySupported-->"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v3, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dE:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    invoke-interface {v3}, Lcom/tencent/mm/sdk/openapi/IWXAPI;->openWXApp()Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v2, "\u624b\u673a\u6ca1\u6709\u5b89\u88c5\u5fae\u4fe1\uff0c\u8bf7\u5148\u5b89\u88c5\u5fae\u4fe1"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :goto_1
    return-void

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dE:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    invoke-interface {v0, v2}, Lcom/tencent/mm/sdk/openapi/IWXAPI;->sendReq(Lcom/tencent/mm/sdk/modelbase/BaseReq;)Z

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v2, "\u5fae\u4fe1\u7248\u672c\u592a\u4f4e\u4e86\uff0c\u8bf7\u5347\u7ea7\u540e\u518d\u4f7f\u7528"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_1
.end method

.method static synthetic a(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 4

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/PayDialogInfo;->cancel()V

    const-string v0, "\u5fae\u4fe1\u652f\u4ed8"

    invoke-virtual {p1, v0}, Lcom/switfpass/pay/bean/RequestMsg;->setTradeName(Ljava/lang/String;)V

    new-instance v0, Lcom/switfpass/pay/utils/ProgressInfoDialog;

    iget-object v1, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v2, "\u8bf7\u7a0d\u5019\uff0c\u6b63\u5728\u8bf7\u6c42\u5fae\u4fe1"

    new-instance v3, Lcom/switfpass/pay/utils/x;

    invoke-direct {v3, p0}, Lcom/switfpass/pay/utils/x;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-direct {v0, v1, v2, v3}, Lcom/switfpass/pay/utils/ProgressInfoDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;)V

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dB:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-static {}, Lcom/switfpass/pay/service/OrderService;->getInstance()Lcom/switfpass/pay/service/OrderService;

    move-result-object v0

    new-instance v1, Lcom/switfpass/pay/utils/y;

    invoke-direct {v1, p0, p1}, Lcom/switfpass/pay/utils/y;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/bean/RequestMsg;)V

    invoke-virtual {v0, p1, v1}, Lcom/switfpass/pay/service/OrderService;->createWxAppOrder(Lcom/switfpass/pay/bean/RequestMsg;Lcom/switfpass/pay/thread/UINotifyListener;)V

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/utils/PayDialogInfo;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->Y:Z

    return-void
.end method

.method static synthetic a(Landroid/content/Context;)Z
    .locals 5

    const/4 v2, 0x0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_0

    move v1, v2

    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    if-lt v1, v0, :cond_1

    :cond_0
    :goto_1
    return v2

    :cond_1
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    const-string v4, "com.tencent.mm"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v2, 0x1

    goto :goto_1

    :cond_2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0
.end method

.method static synthetic b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic b(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 4

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/PayDialogInfo;->cancel()V

    const-string v0, "\u652f\u4ed8\u5b9d\u652f\u4ed8"

    invoke-virtual {p1, v0}, Lcom/switfpass/pay/bean/RequestMsg;->setTradeName(Ljava/lang/String;)V

    new-instance v0, Lcom/switfpass/pay/utils/ProgressInfoDialog;

    iget-object v1, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v2, "\u8bf7\u7a0d\u5019\uff0c\u6b63\u5728\u8bf7\u6c42\u652f\u4ed8\u5b9d"

    new-instance v3, Lcom/switfpass/pay/utils/B;

    invoke-direct {v3, p0}, Lcom/switfpass/pay/utils/B;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-direct {v0, v1, v2, v3}, Lcom/switfpass/pay/utils/ProgressInfoDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;)V

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dB:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-static {}, Lcom/switfpass/pay/service/OrderService;->getInstance()Lcom/switfpass/pay/service/OrderService;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->ZFB_APP_TYPE:Ljava/lang/String;

    new-instance v2, Lcom/switfpass/pay/utils/C;

    invoke-direct {v2, p0}, Lcom/switfpass/pay/utils/C;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-virtual {v0, p1, v1, v2}, Lcom/switfpass/pay/service/OrderService;->createzfbAppOrder(Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V

    return-void
.end method

.method static synthetic c(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/AlertDialog;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->W:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic d(Lcom/switfpass/pay/utils/PayDialogInfo;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->Y:Z

    return v0
.end method

.method static synthetic e(Lcom/switfpass/pay/utils/PayDialogInfo;)Lcom/switfpass/pay/bean/RequestMsg;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ac:Lcom/switfpass/pay/bean/RequestMsg;

    return-object v0
.end method

.method public static isQQClientAvailable(Landroid/content/Context;)Z
    .locals 5

    const/4 v2, 0x0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_0

    move v1, v2

    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    if-lt v1, v0, :cond_1

    :cond_0
    :goto_1
    return v2

    :cond_1
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    const-string v4, "com.tencent.mobileqq"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v2, 0x1

    goto :goto_1

    :cond_2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0
.end method

.method private t()V
    .locals 5

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dh:Landroid/view/ViewGroup;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_pay_wx_wap()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dA:Landroid/widget/RelativeLayout;

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dh:Landroid/view/ViewGroup;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_pay_qq_wap()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dz:Landroid/widget/RelativeLayout;

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dh:Landroid/view/ViewGroup;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_dialog_prompt()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dD:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dh:Landroid/view/ViewGroup;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_wx_scan()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dt:Landroid/widget/RelativeLayout;

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dh:Landroid/view/ViewGroup;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_qq_scan()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->du:Landroid/widget/RelativeLayout;

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dh:Landroid/view/ViewGroup;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_zfb_scan()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dv:Landroid/widget/RelativeLayout;

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dh:Landroid/view/ViewGroup;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_wx_app()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dw:Landroid/widget/RelativeLayout;

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dh:Landroid/view/ViewGroup;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_zfb_app()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dx:Landroid/widget/RelativeLayout;

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dh:Landroid/view/ViewGroup;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_pay_scan()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dy:Landroid/widget/RelativeLayout;

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dC:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dC:Ljava/util/List;

    if-nez v0, :cond_2

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dD:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_1
    return-void

    :cond_2
    move v1, v2

    :goto_0
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dC:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_1

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dC:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/switfpass/pay/bean/MchBean;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/MchBean;->getTradeType()Ljava/lang/String;

    move-result-object v3

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dC:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/switfpass/pay/bean/MchBean;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/MchBean;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sget-object v4, Lcom/switfpass/pay/MainApplication;->QQ_SACN_TYPE:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->du:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    :cond_3
    :goto_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dC:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/switfpass/pay/bean/MchBean;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/MchBean;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sget-object v4, Lcom/switfpass/pay/MainApplication;->WX_SACN_TYPE:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dt:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto :goto_1

    :cond_5
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dC:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/switfpass/pay/bean/MchBean;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/MchBean;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sget-object v4, Lcom/switfpass/pay/MainApplication;->WX_APP_TYPE:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dw:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto :goto_1

    :cond_6
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dC:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/switfpass/pay/bean/MchBean;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/MchBean;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sget-object v4, Lcom/switfpass/pay/MainApplication;->ZFB_SCAN_TYPE:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dC:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/switfpass/pay/bean/MchBean;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/MchBean;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sget-object v4, Lcom/switfpass/pay/MainApplication;->ZFB_SCAN_TYPE2:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    :cond_7
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dC:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/switfpass/pay/bean/MchBean;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/MchBean;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/switfpass/pay/utils/PayDialogInfo;->dG:Ljava/lang/String;

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dv:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto :goto_1

    :cond_8
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dC:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/switfpass/pay/bean/MchBean;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/MchBean;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sget-object v4, Lcom/switfpass/pay/MainApplication;->ZFB_APP_TYPE:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dx:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_1

    :cond_9
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dC:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/switfpass/pay/bean/MchBean;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/MchBean;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sget-object v4, Lcom/switfpass/pay/MainApplication;->PAY_QQ_WAP:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dz:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_1

    :cond_a
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dC:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/switfpass/pay/bean/MchBean;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/MchBean;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sget-object v4, Lcom/switfpass/pay/MainApplication;->PAY_WX_WAP:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dA:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_1

    :cond_b
    sget-object v0, Lcom/switfpass/pay/MainApplication;->PAY_QQ_MICROPAY:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c

    sget-object v0, Lcom/switfpass/pay/MainApplication;->PAY_QQ_PROXY_MICROPAY:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c

    sget-object v0, Lcom/switfpass/pay/MainApplication;->PAY_ZFB_MICROPAY:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c

    sget-object v0, Lcom/switfpass/pay/MainApplication;->PAY_WX_MICROPAY:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_c
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dy:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_1
.end method

.method static synthetic u()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/switfpass/pay/utils/PayDialogInfo;->dG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public dismissMyLoading()V
    .locals 4

    :try_start_0
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->loadingDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->loadingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->loadingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->loadingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->loadingDialog:Landroid/app/ProgressDialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v1, "ProgressDialog"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "dismissMyLoading "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getMsg()Lcom/switfpass/pay/bean/RequestMsg;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ac:Lcom/switfpass/pay/bean/RequestMsg;

    return-object v0
.end method

.method public qqSacndPay(Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 4

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/PayDialogInfo;->cancel()V

    const-string v0, "\u624bQ\u626b\u7801\u652f\u4ed8"

    invoke-virtual {p1, v0}, Lcom/switfpass/pay/bean/RequestMsg;->setTradeName(Ljava/lang/String;)V

    new-instance v0, Lcom/switfpass/pay/utils/ProgressInfoDialog;

    iget-object v1, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v2, "\u8bf7\u7a0d\u5019\uff0c\u6b63\u5728\u8bf7\u6c42\u624bQ\u4e8c\u7ef4\u7801"

    new-instance v3, Lcom/switfpass/pay/utils/T;

    invoke-direct {v3, p0}, Lcom/switfpass/pay/utils/T;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-direct {v0, v1, v2, v3}, Lcom/switfpass/pay/utils/ProgressInfoDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;)V

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dB:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-static {}, Lcom/switfpass/pay/service/OrderService;->getInstance()Lcom/switfpass/pay/service/OrderService;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->QQ_SACN_TYPE:Ljava/lang/String;

    new-instance v2, Lcom/switfpass/pay/utils/U;

    invoke-direct {v2, p0}, Lcom/switfpass/pay/utils/U;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-virtual {v0, p1, v1, v2}, Lcom/switfpass/pay/service/OrderService;->createNativeOrder(Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V

    return-void
.end method

.method public qqWapPay(Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 4

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/PayDialogInfo;->cancel()V

    new-instance v0, Lcom/switfpass/pay/utils/ProgressInfoDialog;

    iget-object v1, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v2, "\u8bf7\u7a0d\u5019\uff0c\u6b63\u5728\u8bf7\u6c42QQ\u94b1\u5305H5\u652f\u4ed8"

    new-instance v3, Lcom/switfpass/pay/utils/p;

    invoke-direct {v3, p0}, Lcom/switfpass/pay/utils/p;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-direct {v0, v1, v2, v3}, Lcom/switfpass/pay/utils/ProgressInfoDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;)V

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dB:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    const-string v0, "QQwap\u652f\u4ed8"

    invoke-virtual {p1, v0}, Lcom/switfpass/pay/bean/RequestMsg;->setTradeName(Ljava/lang/String;)V

    invoke-static {}, Lcom/switfpass/pay/service/OrderService;->getInstance()Lcom/switfpass/pay/service/OrderService;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->PAY_QQ_WAP:Ljava/lang/String;

    new-instance v2, Lcom/switfpass/pay/utils/q;

    invoke-direct {v2, p0, p1}, Lcom/switfpass/pay/utils/q;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/bean/RequestMsg;)V

    invoke-virtual {v0, p1, v1, v2}, Lcom/switfpass/pay/service/OrderService;->qqWapPay(Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V

    return-void
.end method

.method public qqWapPays(Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 3

    invoke-static {}, Lcom/switfpass/pay/service/OrderService;->getInstance()Lcom/switfpass/pay/service/OrderService;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->PAY_QQ_WAP:Ljava/lang/String;

    new-instance v2, Lcom/switfpass/pay/utils/n;

    invoke-direct {v2, p0, p1}, Lcom/switfpass/pay/utils/n;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/bean/RequestMsg;)V

    invoke-virtual {v0, p1, v1, v2}, Lcom/switfpass/pay/service/OrderService;->qqWapPay(Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V

    return-void
.end method

.method public setMsg(Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ac:Lcom/switfpass/pay/bean/RequestMsg;

    return-void
.end method

.method public setmOnSubmitCouponListener(Lcom/switfpass/pay/utils/PayDialogInfo$OnSubmitCouponListener;)V
    .locals 0

    return-void
.end method

.method public showConfirm(Ljava/lang/String;Lcom/switfpass/pay/utils/ProgressInfoDialog;)V
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u6e29\u99a8\u63d0\u793a"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "\u786e\u5b9a"

    new-instance v2, Lcom/switfpass/pay/utils/A;

    invoke-direct {v2, p0, p2}, Lcom/switfpass/pay/utils/A;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/utils/ProgressInfoDialog;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string v1, "\u53d6\u6d88"

    new-instance v2, Lcom/switfpass/pay/utils/N;

    invoke-direct {v2}, Lcom/switfpass/pay/utils/N;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->W:Landroid/app/AlertDialog;

    return-void
.end method

.method public showLoading(Landroid/content/Context;ZLjava/lang/String;)V
    .locals 4

    :try_start_0
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->loadingDialog:Landroid/app/ProgressDialog;

    if-nez v0, :cond_0

    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->loadingDialog:Landroid/app/ProgressDialog;

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->loadingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->loadingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->loadingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v1, "PayDialogInfo"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "showLoading "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public unifiedAppPay(Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 3

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, ""

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v1, "\u53c2\u6570\u652f\u4ed8\u7c7b\u578btradeType\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTokenId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string v0, ""

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTokenId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v1, "\u53c2\u6570tokenId\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->ZFB_APP_TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/PayDialogInfo;->cancel()V

    const-string v0, "\u652f\u4ed8\u5b9d\u652f\u4ed8"

    invoke-virtual {p1, v0}, Lcom/switfpass/pay/bean/RequestMsg;->setTradeName(Ljava/lang/String;)V

    invoke-static {}, Lcom/switfpass/pay/service/OrderService;->getInstance()Lcom/switfpass/pay/service/OrderService;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->ZFB_APP_TYPE:Ljava/lang/String;

    new-instance v2, Lcom/switfpass/pay/utils/E;

    invoke-direct {v2, p0}, Lcom/switfpass/pay/utils/E;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-virtual {v0, p1, v1, v2}, Lcom/switfpass/pay/service/OrderService;->createzfbAppOrder(Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->WX_APP_TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getAppId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/switfpass/pay/MainApplication;->APP_ID:Ljava/lang/String;

    invoke-static {}, Lcom/switfpass/pay/service/OrderService;->getInstance()Lcom/switfpass/pay/service/OrderService;

    move-result-object v0

    new-instance v1, Lcom/switfpass/pay/utils/v;

    invoke-direct {v1, p0, p1}, Lcom/switfpass/pay/utils/v;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/bean/RequestMsg;)V

    invoke-virtual {v0, p1, v1}, Lcom/switfpass/pay/service/OrderService;->createWxAppOrder(Lcom/switfpass/pay/bean/RequestMsg;Lcom/switfpass/pay/thread/UINotifyListener;)V

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v1, "\u652f\u4ed8\u7c7b\u578b\u9519\u8bef,\u6216\u8005\u4e0d\u652f\u6301\u6b64\u652f\u4ed8\u7c7b\u578b"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method public unifiedH5Pay(Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 3

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, ""

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v1, "\u53c2\u6570\u652f\u4ed8\u7c7b\u578btradeType\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTokenId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string v0, ""

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTokenId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v1, "\u53c2\u6570tokenId\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->PAY_QQ_WAP:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0, p1}, Lcom/switfpass/pay/utils/PayDialogInfo;->qqWapPays(Lcom/switfpass/pay/bean/RequestMsg;)V

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->PAY_WX_WAP:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p0, p1}, Lcom/switfpass/pay/utils/PayDialogInfo;->wxWapPays(Lcom/switfpass/pay/bean/RequestMsg;)V

    goto :goto_0

    :cond_5
    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->PAY_ZFB_WAP:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0, p1}, Lcom/switfpass/pay/utils/PayDialogInfo;->zfbWapPay(Lcom/switfpass/pay/bean/RequestMsg;)V

    goto :goto_0

    :cond_6
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v1, "\u652f\u4ed8\u7c7b\u578b\u9519\u8bef,\u6216\u8005\u4e0d\u652f\u6301\u6b64\u652f\u4ed8\u7c7b\u578b"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method public unifiedSacndPay(Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 3

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, ""

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v1, "\u53c2\u6570\u652f\u4ed8\u7c7b\u578btradeType\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTokenId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string v0, ""

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTokenId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v1, "\u53c2\u6570tokenId\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->QQ_SACN_TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0, p1}, Lcom/switfpass/pay/utils/PayDialogInfo;->qqSacndPay(Lcom/switfpass/pay/bean/RequestMsg;)V

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->WX_SACN_TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p0, p1}, Lcom/switfpass/pay/utils/PayDialogInfo;->wxSacndPay(Lcom/switfpass/pay/bean/RequestMsg;)V

    goto :goto_0

    :cond_5
    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->ZFB_SCAN_TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->ZFB_SCAN_TYPE2:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    :cond_6
    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/switfpass/pay/utils/PayDialogInfo;->dG:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/switfpass/pay/utils/PayDialogInfo;->zfbSacndPay(Lcom/switfpass/pay/bean/RequestMsg;)V

    goto :goto_0

    :cond_7
    iget-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v1, "\u652f\u4ed8\u7c7b\u578b\u9519\u8bef,\u6216\u8005\u4e0d\u652f\u6301\u6b64\u652f\u4ed8\u7c7b\u578b"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method public wxSacndPay(Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 4

    new-instance v0, Lcom/switfpass/pay/utils/Q;

    invoke-direct {v0, p0}, Lcom/switfpass/pay/utils/Q;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dF:Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/PayDialogInfo;->cancel()V

    const-string v0, "\u5fae\u4fe1\u626b\u7801\u652f\u4ed8"

    invoke-virtual {p1, v0}, Lcom/switfpass/pay/bean/RequestMsg;->setTradeName(Ljava/lang/String;)V

    new-instance v0, Lcom/switfpass/pay/utils/ProgressInfoDialog;

    iget-object v1, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v2, "\u8bf7\u7a0d\u5019\uff0c\u6b63\u5728\u8bf7\u6c42\u5fae\u4fe1\u4e8c\u7ef4\u7801"

    iget-object v3, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dF:Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;

    invoke-direct {v0, v1, v2, v3}, Lcom/switfpass/pay/utils/ProgressInfoDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;)V

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dB:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-static {}, Lcom/switfpass/pay/service/OrderService;->getInstance()Lcom/switfpass/pay/service/OrderService;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->WX_SACN_TYPE:Ljava/lang/String;

    new-instance v2, Lcom/switfpass/pay/utils/R;

    invoke-direct {v2, p0}, Lcom/switfpass/pay/utils/R;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-virtual {v0, p1, v1, v2}, Lcom/switfpass/pay/service/OrderService;->createNativeOrder(Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V

    return-void
.end method

.method public wxWapPay(Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 4

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/PayDialogInfo;->cancel()V

    new-instance v0, Lcom/switfpass/pay/utils/ProgressInfoDialog;

    iget-object v1, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v2, "\u8bf7\u7a0d\u5019\uff0c\u6b63\u5728\u8bf7\u6c42\u5fae\u4fe1\u652f\u4ed8"

    new-instance v3, Lcom/switfpass/pay/utils/k;

    invoke-direct {v3, p0}, Lcom/switfpass/pay/utils/k;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-direct {v0, v1, v2, v3}, Lcom/switfpass/pay/utils/ProgressInfoDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;)V

    iput-object v0, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dB:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    const-string v0, "\u5fae\u4fe1WAP\u652f\u4ed8"

    invoke-virtual {p1, v0}, Lcom/switfpass/pay/bean/RequestMsg;->setTradeName(Ljava/lang/String;)V

    invoke-static {}, Lcom/switfpass/pay/service/OrderService;->getInstance()Lcom/switfpass/pay/service/OrderService;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->PAY_WX_WAP:Ljava/lang/String;

    new-instance v2, Lcom/switfpass/pay/utils/l;

    invoke-direct {v2, p0, p1}, Lcom/switfpass/pay/utils/l;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/bean/RequestMsg;)V

    invoke-virtual {v0, p1, v1, v2}, Lcom/switfpass/pay/service/OrderService;->qqWapPay(Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V

    return-void
.end method

.method public wxWapPays(Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 3

    const-string v0, "\u5fae\u4fe1WAP\u652f\u4ed8"

    invoke-virtual {p1, v0}, Lcom/switfpass/pay/bean/RequestMsg;->setTradeName(Ljava/lang/String;)V

    invoke-static {}, Lcom/switfpass/pay/service/OrderService;->getInstance()Lcom/switfpass/pay/service/OrderService;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->PAY_WX_WAP:Ljava/lang/String;

    new-instance v2, Lcom/switfpass/pay/utils/Y;

    invoke-direct {v2, p0, p1}, Lcom/switfpass/pay/utils/Y;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/bean/RequestMsg;)V

    invoke-virtual {v0, p1, v1, v2}, Lcom/switfpass/pay/service/OrderService;->qqWapPay(Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V

    return-void
.end method

.method public zfbSacndPay(Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 5

    sget-object v0, Lcom/switfpass/pay/MainApplication;->ZFB_SCAN_TYPE:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v1, ""

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v1

    const-string v2, "null"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTradeType()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/switfpass/pay/MainApplication;->ZFB_SCAN_TYPE2:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v0, Lcom/switfpass/pay/MainApplication;->ZFB_SCAN_TYPE2:Ljava/lang/String;

    :cond_0
    invoke-virtual {p0}, Lcom/switfpass/pay/utils/PayDialogInfo;->cancel()V

    new-instance v1, Lcom/switfpass/pay/utils/ProgressInfoDialog;

    iget-object v2, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->ds:Landroid/app/Activity;

    const-string v3, "\u8bf7\u7a0d\u5019\uff0c\u6b63\u5728\u8bf7\u6c42\u652f\u4ed8\u5b9d\u4e8c\u7ef4\u7801"

    new-instance v4, Lcom/switfpass/pay/utils/s;

    invoke-direct {v4, p0}, Lcom/switfpass/pay/utils/s;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-direct {v1, v2, v3, v4}, Lcom/switfpass/pay/utils/ProgressInfoDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;)V

    iput-object v1, p0, Lcom/switfpass/pay/utils/PayDialogInfo;->dB:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    const-string v1, "\u652f\u4ed8\u5b9d\u626b\u7801\u652f\u4ed8"

    invoke-virtual {p1, v1}, Lcom/switfpass/pay/bean/RequestMsg;->setTradeName(Ljava/lang/String;)V

    invoke-static {}, Lcom/switfpass/pay/service/OrderService;->getInstance()Lcom/switfpass/pay/service/OrderService;

    move-result-object v1

    new-instance v2, Lcom/switfpass/pay/utils/t;

    invoke-direct {v2, p0}, Lcom/switfpass/pay/utils/t;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V

    invoke-virtual {v1, p1, v0, v2}, Lcom/switfpass/pay/service/OrderService;->createNativeOrder(Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V

    return-void
.end method

.method public zfbWapPay(Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 3

    invoke-static {}, Lcom/switfpass/pay/service/OrderService;->getInstance()Lcom/switfpass/pay/service/OrderService;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->PAY_ZFB_WAP:Ljava/lang/String;

    new-instance v2, Lcom/switfpass/pay/utils/W;

    invoke-direct {v2, p0, p1}, Lcom/switfpass/pay/utils/W;-><init>(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/bean/RequestMsg;)V

    invoke-virtual {v0, p1, v1, v2}, Lcom/switfpass/pay/service/OrderService;->qqWapPay(Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V

    return-void
.end method
