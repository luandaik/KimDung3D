.class Lcom/heitao/channel/HTChannel$3$1;
.super Ljava/lang/Object;
.source "HTChannel.java"

# interfaces
.implements Lcom/heitao/listener/HTPayOrderListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannel$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/heitao/channel/HTChannel$3;


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannel$3;)V
    .locals 0

    .prologue
    .line 205
    iput-object p1, p0, Lcom/heitao/channel/HTChannel$3$1;->this$1:Lcom/heitao/channel/HTChannel$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHTPayOrderNumberCompleted(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "orderNumber"    # Ljava/lang/String;
    .param p2, "customServerId"    # Ljava/lang/String;
    .param p3, "customData"    # Lorg/json/JSONObject;

    .prologue
    .line 225
    iget-object v1, p0, Lcom/heitao/channel/HTChannel$3$1;->this$1:Lcom/heitao/channel/HTChannel$3;

    iget-object v1, v1, Lcom/heitao/channel/HTChannel$3;->this$0:Lcom/heitao/channel/HTChannel;

    iput-object p1, v1, Lcom/heitao/channel/HTChannel;->mCustomOrderNumber:Ljava/lang/String;

    .line 226
    iget-object v1, p0, Lcom/heitao/channel/HTChannel$3$1;->this$1:Lcom/heitao/channel/HTChannel$3;

    iget-object v1, v1, Lcom/heitao/channel/HTChannel$3;->this$0:Lcom/heitao/channel/HTChannel;

    iput-object p2, v1, Lcom/heitao/channel/HTChannel;->mCustomServerId:Ljava/lang/String;

    .line 227
    iget-object v1, p0, Lcom/heitao/channel/HTChannel$3$1;->this$1:Lcom/heitao/channel/HTChannel$3;

    iget-object v1, v1, Lcom/heitao/channel/HTChannel$3;->this$0:Lcom/heitao/channel/HTChannel;

    iput-object p3, v1, Lcom/heitao/channel/HTChannel;->mCustomOrderData:Lorg/json/JSONObject;

    .line 229
    new-instance v0, Lcom/heitao/platform/model/HTPPayInfo;

    invoke-direct {v0}, Lcom/heitao/platform/model/HTPPayInfo;-><init>()V

    .line 230
    .local v0, "payInfo":Lcom/heitao/platform/model/HTPPayInfo;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/heitao/channel/HTChannel$3$1;->this$1:Lcom/heitao/channel/HTChannel$3;

    iget-object v2, v2, Lcom/heitao/channel/HTChannel$3;->this$0:Lcom/heitao/channel/HTChannel;

    iget-object v2, v2, Lcom/heitao/channel/HTChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v2, v2, Lcom/heitao/model/HTPayInfo;->price:F

    iget-object v3, p0, Lcom/heitao/channel/HTChannel$3$1;->this$1:Lcom/heitao/channel/HTChannel$3;

    iget-object v3, v3, Lcom/heitao/channel/HTChannel$3;->this$0:Lcom/heitao/channel/HTChannel;

    iget-object v3, v3, Lcom/heitao/channel/HTChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v3, v3, Lcom/heitao/model/HTPayInfo;->count:I

    int-to-float v3, v3

    mul-float/2addr v2, v3

    float-to-int v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/heitao/platform/model/HTPPayInfo;->setAmount(Ljava/lang/String;)V

    .line 231
    iget-object v1, p0, Lcom/heitao/channel/HTChannel$3$1;->this$1:Lcom/heitao/channel/HTChannel$3;

    iget-object v1, v1, Lcom/heitao/channel/HTChannel$3;->this$0:Lcom/heitao/channel/HTChannel;

    iget-object v1, v1, Lcom/heitao/channel/HTChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget-object v1, v1, Lcom/heitao/model/HTPayInfo;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/model/HTPPayInfo;->setName(Ljava/lang/String;)V

    .line 232
    iget-object v1, p0, Lcom/heitao/channel/HTChannel$3$1;->this$1:Lcom/heitao/channel/HTChannel$3;

    iget-object v1, v1, Lcom/heitao/channel/HTChannel$3;->this$0:Lcom/heitao/channel/HTChannel;

    iget-object v1, v1, Lcom/heitao/channel/HTChannel;->mServerId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/model/HTPPayInfo;->setServerId(Ljava/lang/String;)V

    .line 233
    iget-object v1, p0, Lcom/heitao/channel/HTChannel$3$1;->this$1:Lcom/heitao/channel/HTChannel$3;

    iget-object v1, v1, Lcom/heitao/channel/HTChannel$3;->this$0:Lcom/heitao/channel/HTChannel;

    iget-object v1, v1, Lcom/heitao/channel/HTChannel;->mSDKInfo:Lcom/heitao/model/HTSDKInfo;

    iget-object v1, v1, Lcom/heitao/model/HTSDKInfo;->extendKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/model/HTPPayInfo;->setChannelId(Ljava/lang/String;)V

    .line 234
    iget-object v1, p0, Lcom/heitao/channel/HTChannel$3$1;->this$1:Lcom/heitao/channel/HTChannel$3;

    iget-object v1, v1, Lcom/heitao/channel/HTChannel$3;->this$0:Lcom/heitao/channel/HTChannel;

    iget-object v1, v1, Lcom/heitao/channel/HTChannel;->mCustomOrderNumber:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/model/HTPPayInfo;->setOrderId(Ljava/lang/String;)V

    .line 235
    iget-object v1, p0, Lcom/heitao/channel/HTChannel$3$1;->this$1:Lcom/heitao/channel/HTChannel$3;

    iget-object v1, v1, Lcom/heitao/channel/HTChannel$3;->this$0:Lcom/heitao/channel/HTChannel;

    iget-object v1, v1, Lcom/heitao/channel/HTChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget-object v1, v1, Lcom/heitao/model/HTPayInfo;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/model/HTPPayInfo;->setDescription(Ljava/lang/String;)V

    .line 236
    iget-object v1, p0, Lcom/heitao/channel/HTChannel$3$1;->this$1:Lcom/heitao/channel/HTChannel$3;

    iget-object v1, v1, Lcom/heitao/channel/HTChannel$3;->this$0:Lcom/heitao/channel/HTChannel;

    iget-object v1, v1, Lcom/heitao/channel/HTChannel;->mCustomOrderNumber:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/model/HTPPayInfo;->setExtendInfo(Ljava/lang/String;)V

    .line 238
    invoke-static {}, Lcom/heitao/platform/api/HTPlatform;->getInstance()Lcom/heitao/platform/api/HTPlatform;

    move-result-object v1

    new-instance v2, Lcom/heitao/channel/HTChannel$3$1$1;

    invoke-direct {v2, p0}, Lcom/heitao/channel/HTChannel$3$1$1;-><init>(Lcom/heitao/channel/HTChannel$3$1;)V

    invoke-virtual {v1, v0, v2}, Lcom/heitao/platform/api/HTPlatform;->doPay(Lcom/heitao/platform/model/HTPPayInfo;Lcom/heitao/platform/listener/HTPPayListener;)V

    .line 256
    return-void
.end method

.method public onHTPayOrderNumberFailed(Lcom/heitao/model/HTError;)V
    .locals 2
    .param p1, "error"    # Lcom/heitao/model/HTError;

    .prologue
    const/4 v1, 0x0

    .line 211
    iget-object v0, p0, Lcom/heitao/channel/HTChannel$3$1;->this$1:Lcom/heitao/channel/HTChannel$3;

    iget-object v0, v0, Lcom/heitao/channel/HTChannel$3;->this$0:Lcom/heitao/channel/HTChannel;

    iput-object v1, v0, Lcom/heitao/channel/HTChannel;->mCustomOrderNumber:Ljava/lang/String;

    .line 212
    iget-object v0, p0, Lcom/heitao/channel/HTChannel$3$1;->this$1:Lcom/heitao/channel/HTChannel$3;

    iget-object v0, v0, Lcom/heitao/channel/HTChannel$3;->this$0:Lcom/heitao/channel/HTChannel;

    iput-object v1, v0, Lcom/heitao/channel/HTChannel;->mCustomServerId:Ljava/lang/String;

    .line 213
    iget-object v0, p0, Lcom/heitao/channel/HTChannel$3$1;->this$1:Lcom/heitao/channel/HTChannel$3;

    iget-object v0, v0, Lcom/heitao/channel/HTChannel$3;->this$0:Lcom/heitao/channel/HTChannel;

    iput-object v1, v0, Lcom/heitao/channel/HTChannel;->mCustomOrderData:Lorg/json/JSONObject;

    .line 215
    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/heitao/model/HTError;->message:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 217
    iget-object v0, p1, Lcom/heitao/model/HTError;->message:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/common/HTUtils;->doShowToast(Ljava/lang/String;)V

    .line 219
    :cond_0
    return-void
.end method
