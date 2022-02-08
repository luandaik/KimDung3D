.class public Lcom/switfpass/pay/bean/MchBean;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private bU:Ljava/lang/Integer;

.field private bV:Ljava/lang/Integer;

.field private bW:Ljava/lang/String;

.field private bX:Ljava/lang/String;

.field private bY:Ljava/lang/String;

.field private bZ:Ljava/lang/Integer;

.field private ca:Ljava/lang/Integer;

.field private cb:Ljava/lang/Integer;

.field private cc:Ljava/lang/Integer;

.field private cd:Ljava/util/Date;

.field private ce:Ljava/util/Date;

.field private tokenId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBillRate()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/MchBean;->bZ:Ljava/lang/Integer;

    return-object v0
.end method

.method public getCenterId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/MchBean;->bX:Ljava/lang/String;

    return-object v0
.end method

.method public getCreatedAt()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/MchBean;->cd:Ljava/util/Date;

    return-object v0
.end method

.method public getDayLimit()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/MchBean;->cc:Ljava/lang/Integer;

    return-object v0
.end method

.method public getEnabled()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/MchBean;->bY:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/MchBean;->bU:Ljava/lang/Integer;

    return-object v0
.end method

.method public getMchId()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/MchBean;->bV:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPreLimit()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/MchBean;->ca:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPreMinLimit()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/MchBean;->cb:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTokenId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/MchBean;->tokenId:Ljava/lang/String;

    return-object v0
.end method

.method public getTradeType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/MchBean;->bW:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdatedAt()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/MchBean;->ce:Ljava/util/Date;

    return-object v0
.end method

.method public setBillRate(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/MchBean;->bZ:Ljava/lang/Integer;

    return-void
.end method

.method public setCenterId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/MchBean;->bX:Ljava/lang/String;

    return-void
.end method

.method public setCreatedAt(Ljava/util/Date;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/MchBean;->cd:Ljava/util/Date;

    return-void
.end method

.method public setDayLimit(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/MchBean;->cc:Ljava/lang/Integer;

    return-void
.end method

.method public setEnabled(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/MchBean;->bY:Ljava/lang/String;

    return-void
.end method

.method public setId(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/MchBean;->bU:Ljava/lang/Integer;

    return-void
.end method

.method public setMchId(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/MchBean;->bV:Ljava/lang/Integer;

    return-void
.end method

.method public setPreLimit(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/MchBean;->ca:Ljava/lang/Integer;

    return-void
.end method

.method public setPreMinLimit(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/MchBean;->cb:Ljava/lang/Integer;

    return-void
.end method

.method public setTokenId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/MchBean;->tokenId:Ljava/lang/String;

    return-void
.end method

.method public setTradeType(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/MchBean;->bW:Ljava/lang/String;

    return-void
.end method

.method public setUpdatedAt(Ljava/util/Date;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/MchBean;->ce:Ljava/util/Date;

    return-void
.end method
