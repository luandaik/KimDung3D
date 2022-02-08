.class public Lcom/heitao/platform/activity/HTUserWebViewActivity$JsToJava;
.super Ljava/lang/Object;
.source "HTUserWebViewActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/platform/activity/HTUserWebViewActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "JsToJava"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTUserWebViewActivity;


# direct methods
.method public constructor <init>(Lcom/heitao/platform/activity/HTUserWebViewActivity;)V
    .locals 0

    .prologue
    .line 131
    iput-object p1, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity$JsToJava;->this$0:Lcom/heitao/platform/activity/HTUserWebViewActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public javaMethod(Ljava/lang/String;)V
    .locals 2
    .param p1, "paramFromJS"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 134
    const-string v0, "logout"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 136
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/platform/common/HTPDataCenter;->mLogoutListener:Lcom/heitao/platform/listener/HTPLogoutListener;

    invoke-virtual {v0}, Lcom/heitao/platform/listener/HTPLogoutListener;->onLogoutCompleted()V

    .line 137
    iget-object v0, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity$JsToJava;->this$0:Lcom/heitao/platform/activity/HTUserWebViewActivity;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTUserWebViewActivity;->finish()V

    .line 144
    :goto_0
    return-void

    .line 138
    :cond_0
    const-string v0, "close"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 139
    iget-object v0, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity$JsToJava;->this$0:Lcom/heitao/platform/activity/HTUserWebViewActivity;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTUserWebViewActivity;->finish()V

    goto :goto_0

    .line 141
    :cond_1
    iget-object v0, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity$JsToJava;->this$0:Lcom/heitao/platform/activity/HTUserWebViewActivity;

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
