.class Lcom/heitao/platform/activity/HTPUserCenterActivity$12;
.super Ljava/lang/Object;
.source "HTPUserCenterActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPUserCenterActivity;->buildFindPWDByPhoneView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

.field private final synthetic val$countDownBt:Lcom/heitao/platform/activity/view/MyCountDownBt;

.field private final synthetic val$phoneET:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;Landroid/widget/EditText;Lcom/heitao/platform/activity/view/MyCountDownBt;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$12;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    iput-object p2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$12;->val$phoneET:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$12;->val$countDownBt:Lcom/heitao/platform/activity/view/MyCountDownBt;

    .line 451
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 455
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v0, v0, Lcom/heitao/platform/model/HTPUser;->mobile:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 456
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$12;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    const-string v1, "htp_please_bind_phone"

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 460
    :goto_0
    return-void

    .line 458
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$12;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$12;->val$phoneET:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "editpasswd"

    iget-object v3, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$12;->val$countDownBt:Lcom/heitao/platform/activity/view/MyCountDownBt;

    invoke-static {v0, v1, v2, v3}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$16(Lcom/heitao/platform/activity/HTPUserCenterActivity;Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    goto :goto_0
.end method
