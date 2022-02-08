.class public Lcom/heitao/platform/pay/smc/HTPSmcPAy;
.super Ljava/lang/Object;
.source "HTPSmcPAy.java"


# static fields
.field private static mPayListener:Lcom/heitao/platform/listener/HTPPayListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/pay/smc/HTPSmcPAy;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p0, "requestCode"    # I
    .param p1, "resultCode"    # I
    .param p2, "data"    # Landroid/content/Intent;

    .prologue
    .line 102
    const/16 v1, 0x3e9

    if-ne p0, v1, :cond_0

    const/16 v1, 0x3ea

    if-ne p1, v1, :cond_0

    .line 103
    const-string v1, "returnValue"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 105
    .local v0, "returnValue":Ljava/lang/String;
    sget-object v1, Lcom/heitao/platform/pay/smc/HTPSmcPAy;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    if-eqz v1, :cond_0

    .line 106
    invoke-static {v0}, Lcom/shengpay/express/smc/enums/TransStatus;->isSuccess(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 107
    const-string v1, "smc\u652f\u4ed8\u6210\u529f"

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 108
    sget-object v1, Lcom/heitao/platform/pay/smc/HTPSmcPAy;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    invoke-virtual {v1}, Lcom/heitao/platform/listener/HTPPayListener;->onPayCompleted()V

    .line 119
    .end local v0    # "returnValue":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 109
    .restart local v0    # "returnValue":Ljava/lang/String;
    :cond_1
    invoke-static {v0}, Lcom/shengpay/express/smc/enums/TransStatus;->isFailed(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 110
    const-string v1, "smc\u652f\u4ed8\u5931\u8d25"

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 111
    sget-object v1, Lcom/heitao/platform/pay/smc/HTPSmcPAy;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    invoke-static {v0}, Lcom/heitao/platform/model/HTPError;->getCustomError(Ljava/lang/String;)Lcom/heitao/platform/model/HTPError;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    goto :goto_0

    .line 113
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "smc\u672a\u5b8c\u6210\u652f\u4ed8,returnValue=="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static pay(Landroid/app/Activity;Lorg/json/JSONObject;Lcom/heitao/platform/listener/HTPPayListener;)V
    .locals 29
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "params"    # Lorg/json/JSONObject;
    .param p2, "listener"    # Lcom/heitao/platform/listener/HTPPayListener;

    .prologue
    .line 27
    sput-object p2, Lcom/heitao/platform/pay/smc/HTPSmcPAy;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 29
    :try_start_0
    const-string v25, "merchantNo"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 30
    .local v8, "merchantNo":Ljava/lang/String;
    const-string v25, "charset"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 31
    .local v3, "charset":Ljava/lang/String;
    const-string v25, "requestTime"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 32
    .local v20, "requestTime":Ljava/lang/String;
    const-string v25, "outMemberId"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 33
    .local v12, "outMemberId":Ljava/lang/String;
    const-string v25, "outMemberRegistTime"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 34
    .local v16, "outMemberRegistTime":Ljava/lang/String;
    const-string v25, "outMemberRegistIP"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 35
    .local v15, "outMemberRegistIP":Ljava/lang/String;
    const-string v25, "outMemberVerifyStatus"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 36
    .local v17, "outMemberVerifyStatus":Ljava/lang/String;
    const-string v25, "outMemberName"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 37
    .local v14, "outMemberName":Ljava/lang/String;
    const-string v25, "outMemberMobile"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 38
    .local v13, "outMemberMobile":Ljava/lang/String;
    const-string v25, "merchantOrderNo"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 39
    .local v9, "merchantOrderNo":Ljava/lang/String;
    const-string v25, "productName"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 40
    .local v19, "productName":Ljava/lang/String;
    const-string v25, "productDesc"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 41
    .local v18, "productDesc":Ljava/lang/String;
    const-string v25, "currency"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 42
    .local v4, "currency":Ljava/lang/String;
    const-string v25, "amount"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 43
    .local v2, "amount":Ljava/lang/String;
    const-string v25, "notifyUrl"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 44
    .local v10, "notifyUrl":Ljava/lang/String;
    const-string v25, "userIP"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 45
    .local v24, "userIP":Ljava/lang/String;
    const-string v25, "signType"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 46
    .local v22, "signType":Ljava/lang/String;
    const-string v25, "signMsg"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 48
    .local v21, "signMsg":Ljava/lang/String;
    new-instance v11, Lcom/shengpay/express/smc/vo/OrderInfo;

    invoke-direct {v11}, Lcom/shengpay/express/smc/vo/OrderInfo;-><init>()V

    .line 49
    .local v11, "orderInfo":Lcom/shengpay/express/smc/vo/OrderInfo;
    invoke-virtual {v11, v3}, Lcom/shengpay/express/smc/vo/OrderInfo;->setCharset(Ljava/lang/String;)V

    .line 51
    invoke-virtual {v11, v8}, Lcom/shengpay/express/smc/vo/OrderInfo;->setMerchantNo(Ljava/lang/String;)V

    .line 53
    invoke-virtual {v11, v9}, Lcom/shengpay/express/smc/vo/OrderInfo;->setMerchantOrderNo(Ljava/lang/String;)V

    .line 54
    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Lcom/shengpay/express/smc/vo/OrderInfo;->setProductName(Ljava/lang/String;)V

    .line 56
    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lcom/shengpay/express/smc/vo/OrderInfo;->setProductDesc(Ljava/lang/String;)V

    .line 58
    invoke-virtual {v11, v4}, Lcom/shengpay/express/smc/vo/OrderInfo;->setCurrency(Ljava/lang/String;)V

    .line 59
    invoke-virtual {v11, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->setAmount(Ljava/lang/String;)V

    .line 60
    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Lcom/shengpay/express/smc/vo/OrderInfo;->setRequestTime(Ljava/lang/String;)V

    .line 62
    invoke-virtual {v11, v12}, Lcom/shengpay/express/smc/vo/OrderInfo;->setOutMemberId(Ljava/lang/String;)V

    .line 63
    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Lcom/shengpay/express/smc/vo/OrderInfo;->setOutMemberRegistTime(Ljava/lang/String;)V

    .line 64
    invoke-virtual {v11, v15}, Lcom/shengpay/express/smc/vo/OrderInfo;->setOutMemberRegistIP(Ljava/lang/String;)V

    .line 65
    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Lcom/shengpay/express/smc/vo/OrderInfo;->setOutMemberVerifyStatus(Ljava/lang/String;)V

    .line 66
    invoke-virtual {v11, v14}, Lcom/shengpay/express/smc/vo/OrderInfo;->setOutMemberName(Ljava/lang/String;)V

    .line 67
    invoke-virtual {v11, v13}, Lcom/shengpay/express/smc/vo/OrderInfo;->setOutMemberMobile(Ljava/lang/String;)V

    .line 69
    invoke-virtual {v11, v10}, Lcom/shengpay/express/smc/vo/OrderInfo;->setNotifyUrl(Ljava/lang/String;)V

    .line 70
    move-object/from16 v0, v24

    invoke-virtual {v11, v0}, Lcom/shengpay/express/smc/vo/OrderInfo;->setUserIP(Ljava/lang/String;)V

    .line 74
    const-string v25, ""

    move-object/from16 v0, v25

    invoke-virtual {v11, v0}, Lcom/shengpay/express/smc/vo/OrderInfo;->setExts(Ljava/lang/String;)V

    .line 75
    move-object/from16 v0, v22

    invoke-virtual {v11, v0}, Lcom/shengpay/express/smc/vo/OrderInfo;->setSignType(Ljava/lang/String;)V

    .line 79
    invoke-virtual {v11}, Lcom/shengpay/express/smc/vo/OrderInfo;->getSignOriginal()Ljava/lang/String;

    .line 80
    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v11, v0}, Lcom/shengpay/express/smc/vo/OrderInfo;->setSignMsg(Ljava/lang/String;)V

    .line 82
    invoke-virtual {v11}, Lcom/shengpay/express/smc/vo/OrderInfo;->getOrderJson()Lorg/json/JSONObject;

    move-result-object v7

    .line 84
    .local v7, "jo":Lorg/json/JSONObject;
    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v23

    .line 85
    .local v23, "smc_info":Ljava/lang/String;
    new-instance v6, Landroid/content/Intent;

    invoke-direct {v6}, Landroid/content/Intent;-><init>()V

    .line 86
    .local v6, "intent":Landroid/content/Intent;
    const-string v25, "orderInfo"

    move-object/from16 v0, v25

    move-object/from16 v1, v23

    invoke-virtual {v6, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 87
    const-string v25, "stage"

    sget-object v26, Lcom/shengpay/express/smc/enums/Stage;->PROD:Lcom/shengpay/express/smc/enums/Stage;

    invoke-virtual/range {v26 .. v26}, Lcom/shengpay/express/smc/enums/Stage;->toString()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-virtual {v6, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 88
    const-string v25, "isDebug"

    const/16 v26, 0x1

    move-object/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v6, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 89
    const-class v25, Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v6, v0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 90
    const/16 v25, 0x3e9

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-virtual {v0, v6, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    .end local v2    # "amount":Ljava/lang/String;
    .end local v3    # "charset":Ljava/lang/String;
    .end local v4    # "currency":Ljava/lang/String;
    .end local v6    # "intent":Landroid/content/Intent;
    .end local v7    # "jo":Lorg/json/JSONObject;
    .end local v8    # "merchantNo":Ljava/lang/String;
    .end local v9    # "merchantOrderNo":Ljava/lang/String;
    .end local v10    # "notifyUrl":Ljava/lang/String;
    .end local v11    # "orderInfo":Lcom/shengpay/express/smc/vo/OrderInfo;
    .end local v12    # "outMemberId":Ljava/lang/String;
    .end local v13    # "outMemberMobile":Ljava/lang/String;
    .end local v14    # "outMemberName":Ljava/lang/String;
    .end local v15    # "outMemberRegistIP":Ljava/lang/String;
    .end local v16    # "outMemberRegistTime":Ljava/lang/String;
    .end local v17    # "outMemberVerifyStatus":Ljava/lang/String;
    .end local v18    # "productDesc":Ljava/lang/String;
    .end local v19    # "productName":Ljava/lang/String;
    .end local v20    # "requestTime":Ljava/lang/String;
    .end local v21    # "signMsg":Ljava/lang/String;
    .end local v22    # "signType":Ljava/lang/String;
    .end local v23    # "smc_info":Ljava/lang/String;
    .end local v24    # "userIP":Ljava/lang/String;
    :goto_0
    return-void

    .line 91
    :catch_0
    move-exception v5

    .line 92
    .local v5, "e":Ljava/lang/Exception;
    const-string v25, "JSONObject params null"

    invoke-static/range {v25 .. v25}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 93
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    .line 94
    const/16 p1, 0x0

    .line 95
    sget-object v25, Lcom/heitao/platform/pay/smc/HTPSmcPAy;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    new-instance v26, Lcom/heitao/platform/model/HTPError;

    const/16 v27, -0x2710

    const-string v28, "JSONObject params null"

    invoke-direct/range {v26 .. v28}, Lcom/heitao/platform/model/HTPError;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    goto :goto_0
.end method
