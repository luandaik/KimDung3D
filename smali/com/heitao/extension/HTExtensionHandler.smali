.class public Lcom/heitao/extension/HTExtensionHandler;
.super Ljava/lang/Object;
.source "HTExtensionHandler.java"

# interfaces
.implements Lcom/heitao/extension/HTExtensionApi;


# instance fields
.field protected mContext:Landroid/content/Context;

.field protected mCustomOrderNumber:Ljava/lang/String;

.field protected mEnterGameParsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mExtension:Lcom/heitao/model/HTExtension;

.field protected mIsNewRole:Ljava/lang/String;

.field protected mPayInfo:Lcom/heitao/model/HTPayInfo;

.field protected mRoleId:Ljava/lang/String;

.field protected mRoleLevel:I

.field protected mRoleName:Ljava/lang/String;

.field protected mServerId:Ljava/lang/String;

.field protected mServerName:Ljava/lang/String;

.field protected mUser:Lcom/heitao/model/HTUser;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mExtension:Lcom/heitao/model/HTExtension;

    .line 23
    iput-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mContext:Landroid/content/Context;

    .line 26
    iput-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    .line 28
    iput-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mCustomOrderNumber:Ljava/lang/String;

    .line 36
    iput-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mServerId:Ljava/lang/String;

    .line 38
    iput-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mServerName:Ljava/lang/String;

    .line 40
    iput-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mRoleName:Ljava/lang/String;

    .line 44
    iput-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mUser:Lcom/heitao/model/HTUser;

    return-void
.end method


# virtual methods
.method public doExit()V
    .locals 1

    .prologue
    .line 180
    const-string v0, "Extension doExit=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 181
    return-void
.end method

.method public doLogin()V
    .locals 1

    .prologue
    .line 107
    const-string v0, "Extension doLogin=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 108
    return-void
.end method

.method public doLogout()V
    .locals 1

    .prologue
    .line 131
    const-string v0, "Extension doLogout=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 132
    return-void
.end method

.method public doPay(Lcom/heitao/model/HTPayInfo;)V
    .locals 1
    .param p1, "payInfo"    # Lcom/heitao/model/HTPayInfo;

    .prologue
    .line 155
    const-string v0, "Extension doPay=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 156
    return-void
.end method

.method protected doRunnableOnMainLooper(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 236
    iget-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 237
    return-void
.end method

.method public onCreate(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/heitao/extension/HTExtensionHandler;->mContext:Landroid/content/Context;

    .line 53
    const-string v0, "Extension onCreate=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 88
    const-string v0, "Extension onDestroy=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 89
    return-void
.end method

.method public onEnterGame(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 204
    .local p1, "customParsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "Extension onEnterGame=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 205
    iput-object p1, p0, Lcom/heitao/extension/HTExtensionHandler;->mEnterGameParsMap:Ljava/util/Map;

    .line 207
    iget-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mEnterGameParsMap:Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 209
    iget-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mEnterGameParsMap:Ljava/util/Map;

    const-string v1, "cp_server_id"

    invoke-static {v0, v1}, Lcom/heitao/common/HTMapHelper;->getString(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mServerId:Ljava/lang/String;

    .line 210
    iget-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mEnterGameParsMap:Ljava/util/Map;

    const-string v1, "cp_server_name"

    invoke-static {v0, v1}, Lcom/heitao/common/HTMapHelper;->getString(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mServerName:Ljava/lang/String;

    .line 211
    iget-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mEnterGameParsMap:Ljava/util/Map;

    const-string v1, "role_id"

    invoke-static {v0, v1}, Lcom/heitao/common/HTMapHelper;->getString(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mRoleId:Ljava/lang/String;

    .line 212
    iget-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mEnterGameParsMap:Ljava/util/Map;

    const-string v1, "role_name"

    invoke-static {v0, v1}, Lcom/heitao/common/HTMapHelper;->getString(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mRoleName:Ljava/lang/String;

    .line 213
    iget-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mEnterGameParsMap:Ljava/util/Map;

    const-string v1, "role_level"

    invoke-static {v0, v1}, Lcom/heitao/common/HTMapHelper;->getInt(Ljava/util/Map;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mRoleLevel:I

    .line 214
    iget-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mEnterGameParsMap:Ljava/util/Map;

    const-string v1, "is_new_role"

    invoke-static {v0, v1}, Lcom/heitao/common/HTMapHelper;->getString(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/extension/HTExtensionHandler;->mIsNewRole:Ljava/lang/String;

    .line 216
    :cond_0
    return-void
.end method

.method public onGameLevelChanged(I)V
    .locals 1
    .param p1, "newLevel"    # I

    .prologue
    .line 225
    const-string v0, "Extension onGameLevelChanged=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 226
    iput p1, p0, Lcom/heitao/extension/HTExtensionHandler;->mRoleLevel:I

    .line 227
    return-void
.end method

.method public onHTGameExit()V
    .locals 1

    .prologue
    .line 187
    const-string v0, "Extension onHTGameExit=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 188
    return-void
.end method

.method public onHTLoginCompleted(Lcom/heitao/model/HTUser;)V
    .locals 1
    .param p1, "user"    # Lcom/heitao/model/HTUser;

    .prologue
    .line 114
    const-string v0, "Extension onHTLoginCompleted=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 115
    return-void
.end method

.method public onHTLoginFailed(Lcom/heitao/model/HTError;)V
    .locals 1
    .param p1, "error"    # Lcom/heitao/model/HTError;

    .prologue
    .line 121
    const-string v0, "Extension onHTLoginFailed=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 122
    return-void
.end method

.method public onHTLogoutCompleted()V
    .locals 1

    .prologue
    .line 138
    const-string v0, "Extension onHTLogoutCompleted=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 139
    return-void
.end method

.method public onHTLogoutFailed(Lcom/heitao/model/HTError;)V
    .locals 1
    .param p1, "error"    # Lcom/heitao/model/HTError;

    .prologue
    .line 145
    const-string v0, "Extension onHTLogoutFailed=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 146
    return-void
.end method

.method public onHTPayCompleted(Lcom/heitao/model/HTPayResult;Ljava/lang/String;)V
    .locals 1
    .param p1, "result"    # Lcom/heitao/model/HTPayResult;
    .param p2, "customOrderNumber"    # Ljava/lang/String;

    .prologue
    .line 162
    const-string v0, "Extension onHTPayCompleted=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 163
    iput-object p2, p0, Lcom/heitao/extension/HTExtensionHandler;->mCustomOrderNumber:Ljava/lang/String;

    .line 164
    return-void
.end method

.method public onHTPayFailed(Lcom/heitao/model/HTError;)V
    .locals 1
    .param p1, "error"    # Lcom/heitao/model/HTError;

    .prologue
    .line 170
    const-string v0, "Extension onHTPayFailed=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 171
    return-void
.end method

.method public onHTThirdPartyExit()V
    .locals 1

    .prologue
    .line 194
    const-string v0, "Extension onHTThirdPartyExit=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 195
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 60
    const-string v0, "Extension onPause=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method public onRestart()V
    .locals 1

    .prologue
    .line 95
    const-string v0, "Extension onRestart=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 96
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 67
    const-string v0, "Extensio onResume=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 68
    return-void
.end method

.method public onStart()V
    .locals 1

    .prologue
    .line 74
    const-string v0, "Extension onStart=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 75
    return-void
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 81
    const-string v0, "Extension onStop=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 82
    return-void
.end method
