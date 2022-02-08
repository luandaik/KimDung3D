.class Lcom/heitao/platform/activity/HTPQuickLoginActivity$7;
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
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$7;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    iput-object p2, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$7;->val$user:Lcom/heitao/platform/model/HTPUser;

    .line 277
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 281
    sget-object v0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mLoginListener:Lcom/heitao/platform/listener/HTPLoginListener;

    if-eqz v0, :cond_0

    .line 282
    sget-object v0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mLoginListener:Lcom/heitao/platform/listener/HTPLoginListener;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$7;->val$user:Lcom/heitao/platform/model/HTPUser;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/listener/HTPLoginListener;->onLoginCompleted(Lcom/heitao/platform/model/HTPUser;)V

    .line 284
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$7;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->finish()V

    .line 285
    return-void
.end method
