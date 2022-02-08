.class Lcom/heitao/extension/HTExtensionDispatcher$1;
.super Ljava/lang/Object;
.source "HTExtensionDispatcher.java"

# interfaces
.implements Lcom/heitao/extension/HTExtensionApi;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/extension/HTExtensionDispatcher;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/extension/HTExtensionDispatcher;


# direct methods
.method constructor <init>(Lcom/heitao/extension/HTExtensionDispatcher;)V
    .locals 0

    .prologue
    .line 37
    iput-object p1, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doExit()V
    .locals 3

    .prologue
    .line 244
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 246
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0}, Lcom/heitao/extension/HTExtensionHandler;->doExit()V

    goto :goto_0

    .line 248
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public doLogin()V
    .locals 3

    .prologue
    .line 234
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 236
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0}, Lcom/heitao/extension/HTExtensionHandler;->doLogin()V

    goto :goto_0

    .line 238
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public doLogout()V
    .locals 3

    .prologue
    .line 224
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 226
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0}, Lcom/heitao/extension/HTExtensionHandler;->doLogout()V

    goto :goto_0

    .line 228
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public doPay(Lcom/heitao/model/HTPayInfo;)V
    .locals 3
    .param p1, "payInfo"    # Lcom/heitao/model/HTPayInfo;

    .prologue
    .line 214
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 216
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0, p1}, Lcom/heitao/extension/HTExtensionHandler;->doPay(Lcom/heitao/model/HTPayInfo;)V

    goto :goto_0

    .line 218
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 202
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2, p1}, Lcom/heitao/extension/HTExtensionDispatcher;->access$100(Lcom/heitao/extension/HTExtensionDispatcher;Landroid/content/Context;)V

    .line 204
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 206
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0, p1}, Lcom/heitao/extension/HTExtensionHandler;->onCreate(Landroid/content/Context;)V

    goto :goto_0

    .line 208
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 192
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 194
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0}, Lcom/heitao/extension/HTExtensionHandler;->onDestroy()V

    goto :goto_0

    .line 196
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public onEnterGame(Ljava/util/Map;)V
    .locals 3
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
    .line 182
    .local p1, "customParsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 184
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0, p1}, Lcom/heitao/extension/HTExtensionHandler;->onEnterGame(Ljava/util/Map;)V

    goto :goto_0

    .line 186
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public onGameLevelChanged(I)V
    .locals 3
    .param p1, "newLevel"    # I

    .prologue
    .line 172
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 174
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0, p1}, Lcom/heitao/extension/HTExtensionHandler;->onGameLevelChanged(I)V

    goto :goto_0

    .line 176
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public onHTGameExit()V
    .locals 3

    .prologue
    .line 162
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 164
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0}, Lcom/heitao/extension/HTExtensionHandler;->onHTGameExit()V

    goto :goto_0

    .line 166
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public onHTLoginCompleted(Lcom/heitao/model/HTUser;)V
    .locals 3
    .param p1, "user"    # Lcom/heitao/model/HTUser;

    .prologue
    .line 152
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 154
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0, p1}, Lcom/heitao/extension/HTExtensionHandler;->onHTLoginCompleted(Lcom/heitao/model/HTUser;)V

    goto :goto_0

    .line 156
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public onHTLoginFailed(Lcom/heitao/model/HTError;)V
    .locals 3
    .param p1, "error"    # Lcom/heitao/model/HTError;

    .prologue
    .line 142
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 144
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0, p1}, Lcom/heitao/extension/HTExtensionHandler;->onHTLoginFailed(Lcom/heitao/model/HTError;)V

    goto :goto_0

    .line 146
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public onHTLogoutCompleted()V
    .locals 3

    .prologue
    .line 132
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 134
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0}, Lcom/heitao/extension/HTExtensionHandler;->onHTLogoutCompleted()V

    goto :goto_0

    .line 136
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public onHTLogoutFailed(Lcom/heitao/model/HTError;)V
    .locals 3
    .param p1, "error"    # Lcom/heitao/model/HTError;

    .prologue
    .line 122
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 124
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0, p1}, Lcom/heitao/extension/HTExtensionHandler;->onHTLogoutFailed(Lcom/heitao/model/HTError;)V

    goto :goto_0

    .line 126
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public onHTPayCompleted(Lcom/heitao/model/HTPayResult;Ljava/lang/String;)V
    .locals 3
    .param p1, "result"    # Lcom/heitao/model/HTPayResult;
    .param p2, "customOrderNumber"    # Ljava/lang/String;

    .prologue
    .line 112
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 114
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0, p1, p2}, Lcom/heitao/extension/HTExtensionHandler;->onHTPayCompleted(Lcom/heitao/model/HTPayResult;Ljava/lang/String;)V

    goto :goto_0

    .line 116
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public onHTPayFailed(Lcom/heitao/model/HTError;)V
    .locals 3
    .param p1, "error"    # Lcom/heitao/model/HTError;

    .prologue
    .line 102
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 104
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0, p1}, Lcom/heitao/extension/HTExtensionHandler;->onHTPayFailed(Lcom/heitao/model/HTError;)V

    goto :goto_0

    .line 106
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public onHTThirdPartyExit()V
    .locals 3

    .prologue
    .line 92
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 94
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0}, Lcom/heitao/extension/HTExtensionHandler;->onHTThirdPartyExit()V

    goto :goto_0

    .line 96
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 3

    .prologue
    .line 82
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 84
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0}, Lcom/heitao/extension/HTExtensionHandler;->onPause()V

    goto :goto_0

    .line 86
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public onRestart()V
    .locals 3

    .prologue
    .line 72
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 74
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0}, Lcom/heitao/extension/HTExtensionHandler;->onRestart()V

    goto :goto_0

    .line 76
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 62
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 64
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0}, Lcom/heitao/extension/HTExtensionHandler;->onResume()V

    goto :goto_0

    .line 66
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 3

    .prologue
    .line 42
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 44
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0}, Lcom/heitao/extension/HTExtensionHandler;->onStart()V

    goto :goto_0

    .line 46
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 3

    .prologue
    .line 52
    iget-object v2, p0, Lcom/heitao/extension/HTExtensionDispatcher$1;->this$0:Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-static {v2}, Lcom/heitao/extension/HTExtensionDispatcher;->access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/extension/HTExtensionHandler;

    .line 54
    .local v0, "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    invoke-virtual {v0}, Lcom/heitao/extension/HTExtensionHandler;->onStop()V

    goto :goto_0

    .line 56
    .end local v0    # "extensionHandler":Lcom/heitao/extension/HTExtensionHandler;
    :cond_0
    return-void
.end method
