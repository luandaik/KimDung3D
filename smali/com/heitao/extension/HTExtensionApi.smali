.class public interface abstract Lcom/heitao/extension/HTExtensionApi;
.super Ljava/lang/Object;
.source "HTExtensionApi.java"


# virtual methods
.method public abstract doExit()V
.end method

.method public abstract doLogin()V
.end method

.method public abstract doLogout()V
.end method

.method public abstract doPay(Lcom/heitao/model/HTPayInfo;)V
.end method

.method public abstract onCreate(Landroid/content/Context;)V
.end method

.method public abstract onDestroy()V
.end method

.method public abstract onEnterGame(Ljava/util/Map;)V
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
.end method

.method public abstract onGameLevelChanged(I)V
.end method

.method public abstract onHTGameExit()V
.end method

.method public abstract onHTLoginCompleted(Lcom/heitao/model/HTUser;)V
.end method

.method public abstract onHTLoginFailed(Lcom/heitao/model/HTError;)V
.end method

.method public abstract onHTLogoutCompleted()V
.end method

.method public abstract onHTLogoutFailed(Lcom/heitao/model/HTError;)V
.end method

.method public abstract onHTPayCompleted(Lcom/heitao/model/HTPayResult;Ljava/lang/String;)V
.end method

.method public abstract onHTPayFailed(Lcom/heitao/model/HTError;)V
.end method

.method public abstract onHTThirdPartyExit()V
.end method

.method public abstract onPause()V
.end method

.method public abstract onRestart()V
.end method

.method public abstract onResume()V
.end method

.method public abstract onStart()V
.end method

.method public abstract onStop()V
.end method
