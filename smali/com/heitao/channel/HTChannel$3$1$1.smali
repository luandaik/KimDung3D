.class Lcom/heitao/channel/HTChannel$3$1$1;
.super Lcom/heitao/platform/listener/HTPPayListener;
.source "HTChannel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannel$3$1;->onHTPayOrderNumberCompleted(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/heitao/channel/HTChannel$3$1;


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannel$3$1;)V
    .locals 0

    .prologue
    .line 239
    iput-object p1, p0, Lcom/heitao/channel/HTChannel$3$1$1;->this$2:Lcom/heitao/channel/HTChannel$3$1;

    invoke-direct {p0}, Lcom/heitao/platform/listener/HTPPayListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onPayCompleted()V
    .locals 2

    .prologue
    .line 252
    const-string v0, "\u652f\u4ed8\u6210\u529f"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 253
    iget-object v0, p0, Lcom/heitao/channel/HTChannel$3$1$1;->this$2:Lcom/heitao/channel/HTChannel$3$1;

    iget-object v0, v0, Lcom/heitao/channel/HTChannel$3$1;->this$1:Lcom/heitao/channel/HTChannel$3;

    iget-object v0, v0, Lcom/heitao/channel/HTChannel$3;->this$0:Lcom/heitao/channel/HTChannel;

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/heitao/model/HTPayResult;->getPayCompleteResult(Ljava/util/Map;)Lcom/heitao/model/HTPayResult;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/heitao/channel/HTChannel;->doPayCompleted(Lcom/heitao/model/HTPayResult;)V

    .line 254
    return-void
.end method

.method public onPayFailed(Lcom/heitao/platform/model/HTPError;)V
    .locals 2
    .param p1, "error"    # Lcom/heitao/platform/model/HTPError;

    .prologue
    .line 244
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u652f\u4ed8\u5931\u8d25\uff0c"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/heitao/platform/model/HTPError;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 245
    iget-object v0, p0, Lcom/heitao/channel/HTChannel$3$1$1;->this$2:Lcom/heitao/channel/HTChannel$3$1;

    iget-object v0, v0, Lcom/heitao/channel/HTChannel$3$1;->this$1:Lcom/heitao/channel/HTChannel$3;

    iget-object v0, v0, Lcom/heitao/channel/HTChannel$3;->this$0:Lcom/heitao/channel/HTChannel;

    invoke-static {}, Lcom/heitao/model/HTError;->getPayFailError()Lcom/heitao/model/HTError;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/heitao/channel/HTChannel;->doPayFailed(Lcom/heitao/model/HTError;)V

    .line 246
    return-void
.end method
