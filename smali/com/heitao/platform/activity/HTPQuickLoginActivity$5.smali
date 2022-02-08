.class Lcom/heitao/platform/activity/HTPQuickLoginActivity$5;
.super Lcom/heitao/platform/listener/HTPRequestListener;
.source "HTPQuickLoginActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPQuickLoginActivity;->doLoginGame()V
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
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$5;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    .line 221
    invoke-direct {p0}, Lcom/heitao/platform/listener/HTPRequestListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/heitao/platform/model/HTPHttpEntity;)V
    .locals 3
    .param p1, "httpEntity"    # Lcom/heitao/platform/model/HTPHttpEntity;

    .prologue
    .line 233
    iget-boolean v2, p1, Lcom/heitao/platform/model/HTPHttpEntity;->isCompleted:Z

    if-eqz v2, :cond_1

    .line 234
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$5;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-static {v2}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$7(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 256
    :goto_0
    return-void

    .line 237
    :cond_0
    iget-object v1, p1, Lcom/heitao/platform/model/HTPHttpEntity;->object:Ljava/lang/Object;

    check-cast v1, Lcom/heitao/platform/model/HTPUser;

    .line 238
    .local v1, "user":Lcom/heitao/platform/model/HTPUser;
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v2

    iput-object v1, v2, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    .line 240
    new-instance v0, Lcom/heitao/platform/model/HTPDBUser;

    invoke-direct {v0}, Lcom/heitao/platform/model/HTPDBUser;-><init>()V

    .line 241
    .local v0, "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->userId:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    .line 242
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->userName:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    .line 243
    const-string v2, ""

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->password:Ljava/lang/String;

    .line 244
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->ltime:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->ltime:Ljava/lang/String;

    .line 245
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->ltoken:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->ltoken:Ljava/lang/String;

    .line 246
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->mobile:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->mobile:Ljava/lang/String;

    .line 248
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/heitao/platform/common/HTPDBHelper;->update(Lcom/heitao/platform/model/HTPDBUser;)V

    .line 250
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$5;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-static {v2, v1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$9(Lcom/heitao/platform/activity/HTPQuickLoginActivity;Lcom/heitao/platform/model/HTPUser;)V

    goto :goto_0

    .line 253
    .end local v0    # "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    .end local v1    # "user":Lcom/heitao/platform/model/HTPUser;
    :cond_1
    iget-object v2, p1, Lcom/heitao/platform/model/HTPHttpEntity;->message:Ljava/lang/String;

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 254
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$5;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-static {v2}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$1(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)V

    goto :goto_0
.end method

.method public onFailed(Lcom/heitao/platform/model/HTPError;)V
    .locals 1
    .param p1, "error"    # Lcom/heitao/platform/model/HTPError;

    .prologue
    .line 224
    iget-object v0, p1, Lcom/heitao/platform/model/HTPError;->message:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 226
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$5;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$1(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)V

    .line 227
    return-void
.end method
