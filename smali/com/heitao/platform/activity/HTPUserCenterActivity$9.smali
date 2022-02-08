.class Lcom/heitao/platform/activity/HTPUserCenterActivity$9;
.super Ljava/lang/Object;
.source "HTPUserCenterActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPUserCenterActivity;->buildChangePWDView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

.field private final synthetic val$mNewPwdEdit:Landroid/widget/EditText;

.field private final synthetic val$mOldPwdEdit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;Landroid/widget/EditText;Landroid/widget/EditText;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$9;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    iput-object p2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$9;->val$mNewPwdEdit:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$9;->val$mOldPwdEdit:Landroid/widget/EditText;

    .line 396
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 400
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$9;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$9;->val$mNewPwdEdit:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$9;->val$mOldPwdEdit:Landroid/widget/EditText;

    invoke-static {v0, v1, v2}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$15(Lcom/heitao/platform/activity/HTPUserCenterActivity;Landroid/widget/EditText;Landroid/widget/EditText;)V

    .line 401
    return-void
.end method
