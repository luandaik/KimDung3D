.class final Lcom/switfpass/pay/activity/C;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;


# instance fields
.field private synthetic ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/C;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleOkBtn()V
    .locals 3

    iget-object v0, p0, Lcom/switfpass/pay/activity/C;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    const-string v1, "\u4ea4\u6613\u8fdb\u884c\u4e2d\uff0c\u786e\u8ba4\u662f\u5426\u4e2d\u65ad\u4ea4\u6613\uff1f"

    iget-object v2, p0, Lcom/switfpass/pay/activity/C;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v2, v2, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->U:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-static {v0, v1, v2}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->a(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;Ljava/lang/String;Lcom/switfpass/pay/utils/ProgressInfoDialog;)V

    return-void
.end method
