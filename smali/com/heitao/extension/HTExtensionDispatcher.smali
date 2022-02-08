.class public Lcom/heitao/extension/HTExtensionDispatcher;
.super Ljava/lang/Object;
.source "HTExtensionDispatcher.java"


# static fields
.field private static mInstance:Lcom/heitao/extension/HTExtensionDispatcher;


# instance fields
.field public extensionApi:Lcom/heitao/extension/HTExtensionApi;

.field private mExtensionHandlerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/heitao/extension/HTExtensionHandler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/extension/HTExtensionDispatcher;->mInstance:Lcom/heitao/extension/HTExtensionDispatcher;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/heitao/extension/HTExtensionDispatcher;->mExtensionHandlerList:Ljava/util/List;

    .line 36
    new-instance v0, Lcom/heitao/extension/HTExtensionDispatcher$1;

    invoke-direct {v0, p0}, Lcom/heitao/extension/HTExtensionDispatcher$1;-><init>(Lcom/heitao/extension/HTExtensionDispatcher;)V

    iput-object v0, p0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    .line 250
    return-void
.end method

.method static synthetic access$000(Lcom/heitao/extension/HTExtensionDispatcher;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/extension/HTExtensionDispatcher;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/heitao/extension/HTExtensionDispatcher;->mExtensionHandlerList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$100(Lcom/heitao/extension/HTExtensionDispatcher;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/heitao/extension/HTExtensionDispatcher;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/heitao/extension/HTExtensionDispatcher;->initExtensionClass(Landroid/content/Context;)V

    return-void
.end method

.method public static getInstance()Lcom/heitao/extension/HTExtensionDispatcher;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lcom/heitao/extension/HTExtensionDispatcher;->mInstance:Lcom/heitao/extension/HTExtensionDispatcher;

    if-nez v0, :cond_0

    .line 28
    new-instance v0, Lcom/heitao/extension/HTExtensionDispatcher;

    invoke-direct {v0}, Lcom/heitao/extension/HTExtensionDispatcher;-><init>()V

    sput-object v0, Lcom/heitao/extension/HTExtensionDispatcher;->mInstance:Lcom/heitao/extension/HTExtensionDispatcher;

    .line 31
    :cond_0
    sget-object v0, Lcom/heitao/extension/HTExtensionDispatcher;->mInstance:Lcom/heitao/extension/HTExtensionDispatcher;

    return-object v0
.end method

.method private initExtensionClass(Landroid/content/Context;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 254
    new-instance v8, Lcom/heitao/extension/HTExtensionInfoReader;

    invoke-direct {v8}, Lcom/heitao/extension/HTExtensionInfoReader;-><init>()V

    invoke-virtual {v8, p1}, Lcom/heitao/extension/HTExtensionInfoReader;->getExtensionInfoFromFile(Landroid/content/Context;)Ljava/util/List;

    move-result-object v4

    .line 256
    .local v4, "extensionList":Ljava/util/List;, "Ljava/util/List<Lcom/heitao/model/HTExtension;>;"
    if-eqz v4, :cond_0

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v8

    if-gtz v8, :cond_1

    .line 320
    :cond_0
    return-void

    .line 261
    :cond_1
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/heitao/model/HTExtension;

    .line 263
    .local v3, "extension":Lcom/heitao/model/HTExtension;
    iget-object v8, v3, Lcom/heitao/model/HTExtension;->className:Ljava/lang/String;

    invoke-static {v8}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 268
    const/4 v0, 0x0

    .line 272
    .local v0, "ExtensionHandler":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    iget-object v8, v3, Lcom/heitao/model/HTExtension;->className:Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 280
    :goto_1
    if-eqz v0, :cond_4

    .line 282
    const/4 v7, 0x0

    .line 283
    .local v7, "object":Ljava/lang/Object;
    const/4 v2, 0x0

    .line 286
    .local v2, "errorMessage":Ljava/lang/String;
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v7

    .line 301
    .end local v7    # "object":Ljava/lang/Object;
    :goto_2
    if-eqz v7, :cond_3

    move-object v5, v7

    .line 303
    check-cast v5, Lcom/heitao/extension/HTExtensionHandler;

    .line 304
    .local v5, "handler":Lcom/heitao/extension/HTExtensionHandler;
    iput-object v3, v5, Lcom/heitao/extension/HTExtensionHandler;->mExtension:Lcom/heitao/model/HTExtension;

    .line 305
    iget-object v8, p0, Lcom/heitao/extension/HTExtensionDispatcher;->mExtensionHandlerList:Ljava/util/List;

    invoke-interface {v8, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u63d2\u4ef6\u300a"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, v3, Lcom/heitao/model/HTExtension;->name:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\u300b\u52a0\u8f7d\u6210\u529f"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/heitao/common/HTLog;->i(Ljava/lang/String;)V

    goto :goto_0

    .line 274
    .end local v2    # "errorMessage":Ljava/lang/String;
    .end local v5    # "handler":Lcom/heitao/extension/HTExtensionHandler;
    :catch_0
    move-exception v1

    .line 277
    .local v1, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    goto :goto_1

    .line 288
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "errorMessage":Ljava/lang/String;
    .restart local v7    # "object":Ljava/lang/Object;
    :catch_1
    move-exception v1

    .line 291
    .local v1, "e":Ljava/lang/InstantiationException;
    invoke-virtual {v1}, Ljava/lang/InstantiationException;->printStackTrace()V

    .line 292
    invoke-virtual {v1}, Ljava/lang/InstantiationException;->getMessage()Ljava/lang/String;

    move-result-object v2

    .line 299
    goto :goto_2

    .line 294
    .end local v1    # "e":Ljava/lang/InstantiationException;
    :catch_2
    move-exception v1

    .line 297
    .local v1, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    .line 298
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    .line 311
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    .end local v7    # "object":Ljava/lang/Object;
    :cond_3
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u63d2\u4ef6\u300a"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, v3, Lcom/heitao/model/HTExtension;->name:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\u300b\u52a0\u8f7d\u5931\u8d25\uff0cerror="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 312
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u9519\u8bef\u63d2\u4ef6\u4fe1\u606f\uff1a"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Lcom/heitao/model/HTExtension;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 317
    .end local v2    # "errorMessage":Ljava/lang/String;
    :cond_4
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u6269\u5c55\u8def\u5f84\uff1a"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, v3, Lcom/heitao/model/HTExtension;->className:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\u83b7\u53d6Class\u9519\u8bef"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto/16 :goto_0
.end method
