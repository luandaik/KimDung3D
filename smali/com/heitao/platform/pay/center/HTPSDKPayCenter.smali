.class public Lcom/heitao/platform/pay/center/HTPSDKPayCenter;
.super Ljava/lang/Object;
.source "HTPSDKPayCenter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;,
        Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;
    }
.end annotation


# static fields
.field private static mInstance:Lcom/heitao/platform/pay/center/HTPSDKPayCenter;


# instance fields
.field private mCardNo:Ljava/lang/String;

.field private mCardPWD:Ljava/lang/String;

.field private mCardValue:I

.field private mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

.field private mYeepayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mInstance:Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    sget-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->none:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    iput-object v0, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    .line 66
    sget-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->none:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    iput-object v0, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mYeepayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    .line 67
    iput-object v1, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mCardNo:Ljava/lang/String;

    .line 68
    iput-object v1, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mCardPWD:Ljava/lang/String;

    .line 69
    const/4 v0, 0x0

    iput v0, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mCardValue:I

    .line 32
    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/pay/center/HTPSDKPayCenter;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    return-object v0
.end method

.method public static getInstance()Lcom/heitao/platform/pay/center/HTPSDKPayCenter;
    .locals 1

    .prologue
    .line 76
    sget-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mInstance:Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    if-nez v0, :cond_0

    .line 78
    new-instance v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    invoke-direct {v0}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;-><init>()V

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mInstance:Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    .line 81
    :cond_0
    sget-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mInstance:Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    return-object v0
.end method


# virtual methods
.method public init(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 89
    invoke-static {}, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->getInstance()Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->init(Landroid/content/Context;)V

    .line 90
    return-void
.end method

.method public onActivityResult(Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;IILandroid/content/Intent;)V
    .locals 2
    .param p1, "channel"    # Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;
    .param p2, "requestCode"    # I
    .param p3, "resultCode"    # I
    .param p4, "data"    # Landroid/content/Intent;

    .prologue
    .line 334
    iget-object v0, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->alipay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-eq v0, v1, :cond_0

    .line 338
    iget-object v0, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->unionpay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v0, v1, :cond_1

    .line 341
    invoke-static {p2, p3, p4}, Lcom/heitao/platform/pay/unionpay/HTPSDKUnionPay;->onActivityResult(IILandroid/content/Intent;)V

    .line 371
    :cond_0
    :goto_0
    return-void

    .line 343
    :cond_1
    iget-object v0, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->mo9:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-eq v0, v1, :cond_0

    .line 347
    iget-object v0, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->yeepay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-eq v0, v1, :cond_0

    .line 351
    iget-object v0, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->weixin:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-eq v0, v1, :cond_0

    .line 355
    iget-object v0, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->heitao:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-eq v0, v1, :cond_0

    .line 359
    iget-object v0, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->wft:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v0, v1, :cond_2

    .line 361
    invoke-static {}, Lcom/heitao/platform/pay/wft/HTPWftPAy;->getInstance()Lcom/heitao/platform/pay/wft/HTPWftPAy;

    move-result-object v0

    invoke-virtual {v0, p2, p3, p4}, Lcom/heitao/platform/pay/wft/HTPWftPAy;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0

    .line 363
    :cond_2
    iget-object v0, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->smc:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v0, v1, :cond_3

    .line 365
    invoke-static {p2, p3, p4}, Lcom/heitao/platform/pay/smc/HTPSmcPAy;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0

    .line 367
    :cond_3
    iget-object v0, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->wapwx:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v0, v1, :cond_0

    .line 369
    invoke-static {}, Lcom/heitao/platform/pay/smc/HTPSMCWXPay;->getInstance()Lcom/heitao/platform/pay/smc/HTPSMCWXPay;

    move-result-object v0

    invoke-virtual {v0, p2, p3, p4}, Lcom/heitao/platform/pay/smc/HTPSMCWXPay;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0
.end method

.method public pay(Landroid/app/Activity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;Lcom/heitao/platform/model/HTPPayInfo;Lcom/heitao/platform/listener/HTPPayListener;)V
    .locals 14
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "channel"    # Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;
    .param p3, "payInfo"    # Lcom/heitao/platform/model/HTPPayInfo;
    .param p4, "listener"    # Lcom/heitao/platform/listener/HTPPayListener;

    .prologue
    .line 101
    move-object/from16 v0, p2

    iput-object v0, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    .line 103
    iget-object v10, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v11, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->none:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v10, v11, :cond_0

    .line 105
    const-string v10, "pay_channel_null"

    invoke-static {v10}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 311
    :goto_0
    return-void

    .line 110
    :cond_0
    const/4 v2, 0x0

    .line 111
    .local v2, "intPayChannel":I
    iget-object v10, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v11, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->alipay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v10, v11, :cond_4

    .line 114
    const/4 v2, 0x2

    .line 173
    :cond_1
    :goto_1
    const-string v10, "order_is_requesting"

    invoke-static {v10}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {p1, v10}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 176
    const-string v9, "http://pay.heitao.com/mpay/order"

    .line 179
    .local v9, "url":Ljava/lang/String;
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v10

    iget-object v4, v10, Lcom/heitao/platform/common/HTPDataCenter;->mAppKey:Ljava/lang/String;

    .line 180
    .local v4, "publicKey":Ljava/lang/String;
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v10

    iget-object v10, v10, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    invoke-virtual {v10}, Lcom/heitao/platform/model/HTPUser;->getUserId()Ljava/lang/String;

    move-result-object v8

    .line 181
    .local v8, "uid":Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 182
    .local v5, "time":Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p3 .. p3}, Lcom/heitao/platform/model/HTPPayInfo;->getAmount()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual/range {p3 .. p3}, Lcom/heitao/platform/model/HTPPayInfo;->getServerId()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->getDeviceId()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 183
    .local v7, "tokenFrom":Ljava/lang/String;
    invoke-static {v7}, Lcom/heitao/platform/common/HTPUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 185
    .local v6, "token":Ljava/lang/String;
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 187
    .local v3, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v10, "pub_key"

    invoke-interface {v3, v10, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    const-string v10, "psid"

    invoke-virtual/range {p3 .. p3}, Lcom/heitao/platform/model/HTPPayInfo;->getServerId()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v3, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    const-string v10, "uid"

    invoke-interface {v3, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    const-string v10, "mid"

    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->getDeviceId()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v3, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    const-string v10, "amount"

    invoke-virtual/range {p3 .. p3}, Lcom/heitao/platform/model/HTPPayInfo;->getAmount()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v3, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    const-string v10, "chid"

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v11

    iget-object v11, v11, Lcom/heitao/platform/common/HTPDataCenter;->mChannelId:Ljava/lang/String;

    invoke-interface {v3, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    const-string v10, "time"

    invoke-interface {v3, v10, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    const-string v10, "token"

    invoke-interface {v3, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    const-string v10, "extra"

    invoke-virtual/range {p3 .. p3}, Lcom/heitao/platform/model/HTPPayInfo;->getExtendInfo()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v3, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    const-string v10, "orderno_app"

    invoke-virtual/range {p3 .. p3}, Lcom/heitao/platform/model/HTPPayInfo;->getOrderId()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v3, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    const-string v10, "type"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v3, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    iget-object v10, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v11, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->yeepay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v10, v11, :cond_2

    .line 200
    const-string v10, "card_val"

    new-instance v11, Ljava/lang/StringBuilder;

    iget v12, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mCardValue:I

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v3, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    :cond_2
    iget-object v10, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v11, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->yeepay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v10, v11, :cond_3

    iget-object v10, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mYeepayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    sget-object v11, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->none:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    if-eq v10, v11, :cond_3

    .line 205
    const-string v10, "card_num"

    iget-object v11, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mCardNo:Ljava/lang/String;

    invoke-interface {v3, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    const-string v10, "card_key"

    iget-object v11, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mCardPWD:Ljava/lang/String;

    invoke-interface {v3, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    :cond_3
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "pay map="

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 211
    new-instance v10, Lcom/heitao/platform/request/HTPNullResponeParser;

    invoke-direct {v10}, Lcom/heitao/platform/request/HTPNullResponeParser;-><init>()V

    const/4 v11, 0x0

    new-instance v12, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;

    move-object/from16 v0, p4

    move-object/from16 v1, p3

    invoke-direct {v12, p0, p1, v0, v1}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;-><init>(Lcom/heitao/platform/pay/center/HTPSDKPayCenter;Landroid/app/Activity;Lcom/heitao/platform/listener/HTPPayListener;Lcom/heitao/platform/model/HTPPayInfo;)V

    invoke-virtual {v10, v9, v3, v11, v12}, Lcom/heitao/platform/request/HTPNullResponeParser;->get(Ljava/lang/String;Ljava/util/Map;ZLcom/heitao/platform/listener/HTPRequestListener;)V

    goto/16 :goto_0

    .line 116
    .end local v3    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v4    # "publicKey":Ljava/lang/String;
    .end local v5    # "time":Ljava/lang/String;
    .end local v6    # "token":Ljava/lang/String;
    .end local v7    # "tokenFrom":Ljava/lang/String;
    .end local v8    # "uid":Ljava/lang/String;
    .end local v9    # "url":Ljava/lang/String;
    :cond_4
    iget-object v10, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v11, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->unionpay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v10, v11, :cond_5

    .line 119
    const/4 v2, 0x3

    .line 120
    goto/16 :goto_1

    .line 121
    :cond_5
    iget-object v10, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v11, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->mo9:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v10, v11, :cond_6

    .line 124
    const/16 v2, 0x8

    .line 125
    goto/16 :goto_1

    .line 126
    :cond_6
    iget-object v10, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v11, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->yeepay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v10, v11, :cond_a

    .line 129
    iget-object v10, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mYeepayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    sget-object v11, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->CHA:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    if-ne v10, v11, :cond_7

    .line 131
    const/4 v2, 0x6

    .line 132
    goto/16 :goto_1

    .line 133
    :cond_7
    iget-object v10, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mYeepayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    sget-object v11, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->CHU:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    if-ne v10, v11, :cond_8

    .line 135
    const/4 v2, 0x5

    .line 136
    goto/16 :goto_1

    .line 137
    :cond_8
    iget-object v10, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mYeepayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    sget-object v11, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->CHL:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    if-ne v10, v11, :cond_9

    .line 139
    const/4 v2, 0x4

    .line 140
    goto/16 :goto_1

    .line 143
    :cond_9
    const/4 v2, 0x0

    .line 145
    goto/16 :goto_1

    .line 146
    :cond_a
    iget-object v10, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v11, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->weixin:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v10, v11, :cond_b

    .line 149
    const/4 v2, 0x7

    .line 150
    goto/16 :goto_1

    .line 151
    :cond_b
    iget-object v10, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v11, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->heitao:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v10, v11, :cond_c

    .line 154
    const/4 v2, 0x1

    .line 155
    goto/16 :goto_1

    .line 156
    :cond_c
    iget-object v10, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v11, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->smc:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v10, v11, :cond_d

    .line 159
    const/16 v2, 0xf

    .line 160
    goto/16 :goto_1

    .line 161
    :cond_d
    iget-object v10, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v11, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->wft:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v10, v11, :cond_e

    .line 164
    const/16 v2, 0x10

    .line 165
    goto/16 :goto_1

    .line 166
    :cond_e
    iget-object v10, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v11, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->wapwx:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v10, v11, :cond_1

    .line 169
    const/16 v2, 0x11

    goto/16 :goto_1
.end method

.method public yeepay(Landroid/app/Activity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;Ljava/lang/String;Ljava/lang/String;ILcom/heitao/platform/model/HTPPayInfo;Lcom/heitao/platform/listener/HTPPayListener;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "yeepayChannel"    # Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;
    .param p3, "cardNo"    # Ljava/lang/String;
    .param p4, "cardPWD"    # Ljava/lang/String;
    .param p5, "cardValue"    # I
    .param p6, "payInfo"    # Lcom/heitao/platform/model/HTPPayInfo;
    .param p7, "listener"    # Lcom/heitao/platform/listener/HTPPayListener;

    .prologue
    .line 324
    iput-object p2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mYeepayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    .line 325
    iput-object p3, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mCardNo:Ljava/lang/String;

    .line 326
    iput-object p4, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mCardPWD:Ljava/lang/String;

    .line 327
    iput p5, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->mCardValue:I

    .line 329
    sget-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->yeepay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-virtual {p0, p1, v0, p6, p7}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->pay(Landroid/app/Activity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;Lcom/heitao/platform/model/HTPPayInfo;Lcom/heitao/platform/listener/HTPPayListener;)V

    .line 330
    return-void
.end method
