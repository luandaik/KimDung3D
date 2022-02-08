.class Lcom/heitao/platform/activity/HTPQuickLoginActivity$6;
.super Ljava/lang/Object;
.source "HTPQuickLoginActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPQuickLoginActivity;->hideDailog(Lcom/heitao/platform/model/HTPUser;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

.field private final synthetic val$user:Lcom/heitao/platform/model/HTPUser;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPQuickLoginActivity;Lcom/heitao/platform/model/HTPUser;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$6;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    iput-object p2, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$6;->val$user:Lcom/heitao/platform/model/HTPUser;

    .line 262
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 267
    :try_start_0
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$6;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$2(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)Landroid/widget/PopupWindow;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/PopupWindow;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 275
    :goto_0
    return-void

    .line 268
    :catch_0
    move-exception v0

    .line 269
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mLoginListener:Lcom/heitao/platform/listener/HTPLoginListener;

    if-eqz v1, :cond_0

    .line 270
    sget-object v1, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mLoginListener:Lcom/heitao/platform/listener/HTPLoginListener;

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$6;->val$user:Lcom/heitao/platform/model/HTPUser;

    invoke-virtual {v1, v2}, Lcom/heitao/platform/listener/HTPLoginListener;->onLoginCompleted(Lcom/heitao/platform/model/HTPUser;)V

    .line 272
    :cond_0
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$6;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->finish()V

    goto :goto_0
.end method
