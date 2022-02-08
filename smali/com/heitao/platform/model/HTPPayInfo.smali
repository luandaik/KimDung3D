.class public Lcom/heitao/platform/model/HTPPayInfo;
.super Ljava/lang/Object;
.source "HTPPayInfo.java"


# instance fields
.field public amount:Ljava/lang/String;

.field public channelId:Ljava/lang/String;

.field public description:Ljava/lang/String;

.field public extendInfo:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public orderId:Ljava/lang/String;

.field public serverId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/platform/model/HTPPayInfo;->amount:Ljava/lang/String;

    .line 72
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/platform/model/HTPPayInfo;->name:Ljava/lang/String;

    .line 73
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/platform/model/HTPPayInfo;->serverId:Ljava/lang/String;

    .line 74
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/platform/model/HTPPayInfo;->channelId:Ljava/lang/String;

    .line 75
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/platform/model/HTPPayInfo;->description:Ljava/lang/String;

    .line 76
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/platform/model/HTPPayInfo;->extendInfo:Ljava/lang/String;

    .line 77
    return-void
.end method


# virtual methods
.method public getAmount()Ljava/lang/String;
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lcom/heitao/platform/model/HTPPayInfo;->amount:Ljava/lang/String;

    return-object v0
.end method

.method public getChannelId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/heitao/platform/model/HTPPayInfo;->channelId:Ljava/lang/String;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/heitao/platform/model/HTPPayInfo;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getExtendInfo()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/heitao/platform/model/HTPPayInfo;->extendInfo:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/heitao/platform/model/HTPPayInfo;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOrderId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/heitao/platform/model/HTPPayInfo;->orderId:Ljava/lang/String;

    return-object v0
.end method

.method public getServerId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/heitao/platform/model/HTPPayInfo;->serverId:Ljava/lang/String;

    return-object v0
.end method

.method public setAmount(Ljava/lang/String;)V
    .locals 0
    .param p1, "amount"    # Ljava/lang/String;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/heitao/platform/model/HTPPayInfo;->amount:Ljava/lang/String;

    .line 19
    return-void
.end method

.method public setChannelId(Ljava/lang/String;)V
    .locals 0
    .param p1, "channelId"    # Ljava/lang/String;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/heitao/platform/model/HTPPayInfo;->channelId:Ljava/lang/String;

    .line 43
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 0
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/heitao/platform/model/HTPPayInfo;->description:Ljava/lang/String;

    .line 59
    return-void
.end method

.method public setExtendInfo(Ljava/lang/String;)V
    .locals 0
    .param p1, "extendInfo"    # Ljava/lang/String;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/heitao/platform/model/HTPPayInfo;->extendInfo:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/heitao/platform/model/HTPPayInfo;->name:Ljava/lang/String;

    .line 27
    return-void
.end method

.method public setOrderId(Ljava/lang/String;)V
    .locals 0
    .param p1, "orderId"    # Ljava/lang/String;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/heitao/platform/model/HTPPayInfo;->orderId:Ljava/lang/String;

    .line 51
    return-void
.end method

.method public setServerId(Ljava/lang/String;)V
    .locals 0
    .param p1, "serverId"    # Ljava/lang/String;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/heitao/platform/model/HTPPayInfo;->serverId:Ljava/lang/String;

    .line 35
    return-void
.end method
