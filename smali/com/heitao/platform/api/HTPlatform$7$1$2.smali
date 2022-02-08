.class Lcom/heitao/platform/api/HTPlatform$7$1$2;
.super Ljava/lang/Object;
.source "HTPlatform.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/api/HTPlatform$7$1;->onCompleted(Lcom/heitao/platform/model/HTPHttpEntity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/heitao/platform/api/HTPlatform$7$1;

.field private final synthetic val$dailog:Lcom/heitao/platform/activity/view/version/HTAlertDailog;


# direct methods
.method constructor <init>(Lcom/heitao/platform/api/HTPlatform$7$1;Lcom/heitao/platform/activity/view/version/HTAlertDailog;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/api/HTPlatform$7$1$2;->this$2:Lcom/heitao/platform/api/HTPlatform$7$1;

    iput-object p2, p0, Lcom/heitao/platform/api/HTPlatform$7$1$2;->val$dailog:Lcom/heitao/platform/activity/view/version/HTAlertDailog;

    .line 532
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 537
    iget-object v0, p0, Lcom/heitao/platform/api/HTPlatform$7$1$2;->val$dailog:Lcom/heitao/platform/activity/view/version/HTAlertDailog;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->dismiss()V

    .line 538
    return-void
.end method
