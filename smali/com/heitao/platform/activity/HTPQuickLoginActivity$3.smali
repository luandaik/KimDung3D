.class Lcom/heitao/platform/activity/HTPQuickLoginActivity$3;
.super Ljava/lang/Object;
.source "HTPQuickLoginActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPQuickLoginActivity;->showDailog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$3;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 129
    :try_start_0
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$3;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$3(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/model/HTPDBUser;->password:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$3;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$3(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/model/HTPDBUser;->ltime:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 130
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$3;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$3(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/model/HTPDBUser;->ltoken:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 131
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$3;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$3;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-static {v2}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$4(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$5(Lcom/heitao/platform/activity/HTPQuickLoginActivity;Ljava/lang/String;)V

    .line 140
    :cond_0
    :goto_0
    return-void

    .line 132
    :cond_1
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$3;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$3(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/model/HTPDBUser;->password:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 133
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$3;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$3(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 134
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$3;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$6(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 136
    :catch_0
    move-exception v0

    .line 137
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$3;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$1(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)V

    goto :goto_0
.end method
