.class public Lcom/switfpass/pay/bean/RequestMsg;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private X:Ljava/lang/String;

.field private appId:Ljava/lang/String;

.field private bW:Ljava/lang/String;

.field private cA:Ljava/lang/String;

.field private cB:Ljava/lang/String;

.field private cC:Ljava/lang/String;

.field private cD:Ljava/lang/String;

.field private cE:Ljava/lang/String;

.field private cF:Ljava/lang/String;

.field private cG:Ljava/lang/String;

.field private cH:Ljava/lang/String;

.field private ch:Ljava/lang/String;

.field private cm:Ljava/lang/String;

.field private co:Ljava/lang/String;

.field private cs:Ljava/lang/String;

.field private ct:Ljava/lang/String;

.field private cu:Ljava/lang/Integer;

.field private cz:D

.field private mchId:Ljava/lang/String;

.field private sign:Ljava/lang/String;

.field private tokenId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getApiKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->cG:Ljava/lang/String;

    return-object v0
.end method

.method public getAppId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->appId:Ljava/lang/String;

    return-object v0
.end method

.method public getAppKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->cC:Ljava/lang/String;

    return-object v0
.end method

.method public getAuthCode()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->cH:Ljava/lang/String;

    return-object v0
.end method

.method public getBankType()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->cu:Ljava/lang/Integer;

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->co:Ljava/lang/String;

    return-object v0
.end method

.method public getCashierName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->cs:Ljava/lang/String;

    return-object v0
.end method

.method public getMchId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->mchId:Ljava/lang/String;

    return-object v0
.end method

.method public getMoney()D
    .locals 2

    iget-wide v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->cz:D

    return-wide v0
.end method

.method public getNotifyUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->cA:Ljava/lang/String;

    return-object v0
.end method

.method public getOutTradeNo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->X:Ljava/lang/String;

    return-object v0
.end method

.method public getPartner()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->cm:Ljava/lang/String;

    return-object v0
.end method

.method public getPay_logo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->ct:Ljava/lang/String;

    return-object v0
.end method

.method public getSellerId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->cD:Ljava/lang/String;

    return-object v0
.end method

.method public getServerType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->cE:Ljava/lang/String;

    return-object v0
.end method

.method public getSign()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->sign:Ljava/lang/String;

    return-object v0
.end method

.method public getSignKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->cB:Ljava/lang/String;

    return-object v0
.end method

.method public getSubOpenID()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->cF:Ljava/lang/String;

    return-object v0
.end method

.method public getTokenId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->tokenId:Ljava/lang/String;

    return-object v0
.end method

.method public getTradeName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->ch:Ljava/lang/String;

    return-object v0
.end method

.method public getTradeType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/RequestMsg;->bW:Ljava/lang/String;

    return-object v0
.end method

.method public setApiKey(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->cG:Ljava/lang/String;

    return-void
.end method

.method public setAppId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->appId:Ljava/lang/String;

    return-void
.end method

.method public setAppKey(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->cC:Ljava/lang/String;

    return-void
.end method

.method public setAuthCode(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->cH:Ljava/lang/String;

    return-void
.end method

.method public setBankType(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->cu:Ljava/lang/Integer;

    return-void
.end method

.method public setBody(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->co:Ljava/lang/String;

    return-void
.end method

.method public setCashierName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->cs:Ljava/lang/String;

    return-void
.end method

.method public setMchId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->mchId:Ljava/lang/String;

    return-void
.end method

.method public setMoney(D)V
    .locals 1

    iput-wide p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->cz:D

    return-void
.end method

.method public setNotifyUrl(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->cA:Ljava/lang/String;

    return-void
.end method

.method public setOutTradeNo(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->X:Ljava/lang/String;

    return-void
.end method

.method public setPartner(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->cm:Ljava/lang/String;

    return-void
.end method

.method public setPay_logo(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->ct:Ljava/lang/String;

    return-void
.end method

.method public setSellerId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->cD:Ljava/lang/String;

    return-void
.end method

.method public setServerType(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->cE:Ljava/lang/String;

    return-void
.end method

.method public setSign(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->sign:Ljava/lang/String;

    return-void
.end method

.method public setSignKey(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->cB:Ljava/lang/String;

    return-void
.end method

.method public setSubOpenID(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->cF:Ljava/lang/String;

    return-void
.end method

.method public setTokenId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->tokenId:Ljava/lang/String;

    return-void
.end method

.method public setTradeName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->ch:Ljava/lang/String;

    return-void
.end method

.method public setTradeType(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/RequestMsg;->bW:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RequestMsg [mchId="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/switfpass/pay/bean/RequestMsg;->mchId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", money="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/switfpass/pay/bean/RequestMsg;->cz:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", body="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/bean/RequestMsg;->co:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", notifyUrl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/bean/RequestMsg;->cA:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", outTradeNo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/bean/RequestMsg;->X:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", signKey="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/bean/RequestMsg;->cB:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", sign="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/bean/RequestMsg;->sign:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", partner="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/bean/RequestMsg;->cm:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", appKey="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/bean/RequestMsg;->cC:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", appId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/bean/RequestMsg;->appId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
