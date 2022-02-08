.class public Lcom/switfpass/pay/bean/OrderBena;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private X:Ljava/lang/String;

.field private aM:Ljava/lang/String;

.field private appId:Ljava/lang/String;

.field private cf:Ljava/lang/String;

.field private cg:Ljava/lang/String;

.field private ch:Ljava/lang/String;

.field private ci:Ljava/lang/String;

.field private cj:Ljava/lang/String;

.field private ck:Z

.field private cl:Ljava/lang/String;

.field private cm:Ljava/lang/String;

.field private cn:Ljava/lang/String;

.field private co:Ljava/lang/String;

.field private cp:Ljava/lang/String;

.field private cq:Ljava/lang/String;

.field private cr:Ljava/lang/String;

.field private cs:Ljava/lang/String;

.field private ct:Ljava/lang/String;

.field private cu:Ljava/lang/Integer;

.field private cv:Ljava/lang/String;

.field private cw:Ljava/lang/String;

.field private cx:Z

.field private cy:Ljava/lang/String;

.field private mchId:Ljava/lang/String;

.field private message:Ljava/lang/String;

.field private nonceStr:Ljava/lang/String;

.field private sign:Ljava/lang/String;

.field private timeStamp:Ljava/lang/String;

.field private tokenId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAppId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->appId:Ljava/lang/String;

    return-object v0
.end method

.method public getBankType()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->cu:Ljava/lang/Integer;

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->co:Ljava/lang/String;

    return-object v0
.end method

.method public getCashierName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->cs:Ljava/lang/String;

    return-object v0
.end method

.method public getMchId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->mchId:Ljava/lang/String;

    return-object v0
.end method

.method public getMchName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->cr:Ljava/lang/String;

    return-object v0
.end method

.method public getMchOrderNo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->cp:Ljava/lang/String;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getMoeny()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->ci:Ljava/lang/String;

    return-object v0
.end method

.method public getNonceStr()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->nonceStr:Ljava/lang/String;

    return-object v0
.end method

.method public getOpenID()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->cv:Ljava/lang/String;

    return-object v0
.end method

.method public getOutTradeNo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->X:Ljava/lang/String;

    return-object v0
.end method

.method public getPartner()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->cm:Ljava/lang/String;

    return-object v0
.end method

.method public getPay_logo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->ct:Ljava/lang/String;

    return-object v0
.end method

.method public getPrepayid()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->cl:Ljava/lang/String;

    return-object v0
.end method

.method public getRedPack()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->cw:Ljava/lang/String;

    return-object v0
.end method

.method public getResCode()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->cy:Ljava/lang/String;

    return-object v0
.end method

.method public getService()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->cg:Ljava/lang/String;

    return-object v0
.end method

.method public getSign()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->sign:Ljava/lang/String;

    return-object v0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->aM:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeStamp()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->timeStamp:Ljava/lang/String;

    return-object v0
.end method

.method public getTokenId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->tokenId:Ljava/lang/String;

    return-object v0
.end method

.method public getTradeName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->ch:Ljava/lang/String;

    return-object v0
.end method

.method public getTradeTime()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->cj:Ljava/lang/String;

    return-object v0
.end method

.method public getTransactionId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->cq:Ljava/lang/String;

    return-object v0
.end method

.method public getUuId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->cf:Ljava/lang/String;

    return-object v0
.end method

.method public get_input_charset()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/bean/OrderBena;->cn:Ljava/lang/String;

    return-object v0
.end method

.method public isMark()Z
    .locals 1

    iget-boolean v0, p0, Lcom/switfpass/pay/bean/OrderBena;->cx:Z

    return v0
.end method

.method public isQpay()Z
    .locals 1

    iget-boolean v0, p0, Lcom/switfpass/pay/bean/OrderBena;->ck:Z

    return v0
.end method

.method public setAppId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->appId:Ljava/lang/String;

    return-void
.end method

.method public setBankType(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->cu:Ljava/lang/Integer;

    return-void
.end method

.method public setBody(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->co:Ljava/lang/String;

    return-void
.end method

.method public setCashierName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->cs:Ljava/lang/String;

    return-void
.end method

.method public setMark(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/switfpass/pay/bean/OrderBena;->cx:Z

    return-void
.end method

.method public setMchId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->mchId:Ljava/lang/String;

    return-void
.end method

.method public setMchName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->cr:Ljava/lang/String;

    return-void
.end method

.method public setMchOrderNo(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->cp:Ljava/lang/String;

    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->message:Ljava/lang/String;

    return-void
.end method

.method public setMoeny(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->ci:Ljava/lang/String;

    return-void
.end method

.method public setNonceStr(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->nonceStr:Ljava/lang/String;

    return-void
.end method

.method public setOpenID(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->cv:Ljava/lang/String;

    return-void
.end method

.method public setOutTradeNo(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->X:Ljava/lang/String;

    return-void
.end method

.method public setPartner(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->cm:Ljava/lang/String;

    return-void
.end method

.method public setPay_logo(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->ct:Ljava/lang/String;

    return-void
.end method

.method public setPrepayid(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->cl:Ljava/lang/String;

    return-void
.end method

.method public setQpay(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/switfpass/pay/bean/OrderBena;->ck:Z

    return-void
.end method

.method public setRedPack(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->cw:Ljava/lang/String;

    return-void
.end method

.method public setResCode(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->cy:Ljava/lang/String;

    return-void
.end method

.method public setService(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->cg:Ljava/lang/String;

    return-void
.end method

.method public setSign(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->sign:Ljava/lang/String;

    return-void
.end method

.method public setStatus(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->aM:Ljava/lang/String;

    return-void
.end method

.method public setTimeStamp(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->timeStamp:Ljava/lang/String;

    return-void
.end method

.method public setTokenId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->tokenId:Ljava/lang/String;

    return-void
.end method

.method public setTradeName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->ch:Ljava/lang/String;

    return-void
.end method

.method public setTradeTime(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->cj:Ljava/lang/String;

    return-void
.end method

.method public setTransactionId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->cq:Ljava/lang/String;

    return-void
.end method

.method public setUuId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->cf:Ljava/lang/String;

    return-void
.end method

.method public set_input_charset(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/bean/OrderBena;->cn:Ljava/lang/String;

    return-void
.end method
