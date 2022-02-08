.class final Lorg/cocos2dx/TerransForce/HeitaoSdkManager$2;
.super Ljava/lang/Object;
.source "HeitaoSdkManager.java"

# interfaces
.implements Lcom/heitao/listener/HTLoginListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/cocos2dx/TerransForce/HeitaoSdkManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHTLoginCompleted(Lcom/heitao/model/HTUser;Ljava/util/Map;)V
    .locals 2
    .param p1, "user"    # Lcom/heitao/model/HTUser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/heitao/model/HTUser;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 159
    .local p2, "customParsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "\u767b\u5f55\u6210\u529f"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 161
    iget-object v0, p1, Lcom/heitao/model/HTUser;->userId:Ljava/lang/String;

    sput-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->userid:Ljava/lang/String;

    .line 162
    iget-object v0, p1, Lcom/heitao/model/HTUser;->platformUserId:Ljava/lang/String;

    sput-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->platformUserId:Ljava/lang/String;

    .line 163
    iget-object v0, p1, Lcom/heitao/model/HTUser;->platformId:Ljava/lang/String;

    sput-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->platformId:Ljava/lang/String;

    .line 164
    iget-object v0, p1, Lcom/heitao/model/HTUser;->token:Ljava/lang/String;

    sput-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->token:Ljava/lang/String;

    .line 165
    iget-object v0, p1, Lcom/heitao/model/HTUser;->custom:Ljava/lang/String;

    sput-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->custom:Ljava/lang/String;

    .line 167
    invoke-static {}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->access$300()I

    move-result v0

    const-string v1, "\u767b\u5f55\u6210\u529f"

    invoke-static {v0, v1}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->resultCallback(ILjava/lang/String;)V

    .line 168
    return-void
.end method

.method public onHTLoginFailed(Lcom/heitao/model/HTError;)V
    .locals 2
    .param p1, "error"    # Lcom/heitao/model/HTError;

    .prologue
    .line 151
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "\u767b\u5f55\u5931\u8d25"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 153
    invoke-static {}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->access$200()I

    move-result v0

    iget-object v1, p1, Lcom/heitao/model/HTError;->message:Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->resultCallback(ILjava/lang/String;)V

    .line 154
    return-void
.end method
