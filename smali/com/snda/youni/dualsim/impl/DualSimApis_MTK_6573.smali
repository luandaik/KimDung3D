.class public Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;
.super Ljava/lang/Object;
.source "DualSimApis_MTK_6573.java"

# interfaces
.implements Lcom/snda/youni/dualsim/DualSimApis;


# instance fields
.field private context:Landroid/content/Context;

.field private mFirstSlotSimId:I

.field private mSecondSlotSimId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, -0x1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput v0, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->mFirstSlotSimId:I

    .line 18
    iput v0, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->mSecondSlotSimId:I

    .line 22
    iput-object p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->context:Landroid/content/Context;

    .line 23
    return-void
.end method


# virtual methods
.method public getDeviceId(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 124
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 126
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getDeviceIdGemini"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 127
    .local v1, "method_getDeviceIdGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    .end local v1    # "method_getDeviceIdGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v0

    .line 129
    :catch_0
    move-exception v3

    .line 132
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getFirstSlotSimId()I
    .locals 1

    .prologue
    .line 331
    iget v0, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->mFirstSlotSimId:I

    return v0
.end method

.method public getLine1Number(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 137
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 139
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getLine1NumberGemini"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 140
    .local v1, "method_getLine1NumberGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    .end local v1    # "method_getLine1NumberGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v0

    .line 142
    :catch_0
    move-exception v3

    .line 146
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getNetworkOperator(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 54
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 56
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getNetworkOperatorGemini"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 57
    .local v0, "method_getNetworkOperatorGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .end local v0    # "method_getNetworkOperatorGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v1

    .line 59
    :catch_0
    move-exception v3

    .line 62
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getNetworkOperatorName(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 67
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 69
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getNetworkOperatorNameGemini"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 70
    .local v0, "method_getNetworkOperatorNameGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .end local v0    # "method_getNetworkOperatorNameGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v1

    .line 72
    :catch_0
    move-exception v3

    .line 75
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getNetworkType(I)I
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 109
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 111
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getNetworkTypeGemini"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 112
    .local v0, "method_getNetworkTypeGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 118
    .end local v0    # "method_getNetworkTypeGemini":Ljava/lang/reflect/Method;
    :goto_0
    return v1

    .line 114
    :catch_0
    move-exception v3

    .line 118
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public getSecondSlotSimId()I
    .locals 1

    .prologue
    .line 336
    iget v0, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->mSecondSlotSimId:I

    return v0
.end method

.method public getSimFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 326
    const-string v0, "sim_id"

    return-object v0
.end method

.method public getSimOperator(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 346
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 348
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getSimOperatorGemini"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 349
    .local v0, "method_getSimOperatorGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 355
    .end local v0    # "method_getSimOperatorGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v1

    .line 351
    :catch_0
    move-exception v3

    .line 355
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getSimOperatorName(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 360
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 362
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getSimOperatorNameGemini"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 363
    .local v0, "method_getSimOperatorNameGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 368
    .end local v0    # "method_getSimOperatorNameGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v1

    .line 365
    :catch_0
    move-exception v3

    .line 368
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getSimSerialNumber(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 95
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 97
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getSimSerialNumberGemini"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 98
    .local v0, "method_getSimSerialNumberGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    .end local v0    # "method_getSimSerialNumberGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v1

    .line 100
    :catch_0
    move-exception v3

    .line 104
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getSimState(I)I
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 41
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 43
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getSimStateGemini"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 44
    .local v0, "method_getSimStateGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 49
    .end local v0    # "method_getSimStateGemini":Ljava/lang/reflect/Method;
    :goto_0
    return v1

    .line 46
    :catch_0
    move-exception v3

    .line 49
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public getSubscriberId(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 27
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 30
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getSubscriberIdGemini"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 31
    .local v0, "method_getSubscriberIdGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .end local v0    # "method_getSubscriberIdGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v1

    .line 33
    :catch_0
    move-exception v3

    .line 36
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public needQuerySimIdSperately()Z
    .locals 1

    .prologue
    .line 341
    const/4 v0, 0x0

    return v0
.end method

.method public prepareDualSimApis()V
    .locals 6

    .prologue
    .line 307
    iget-object v2, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/snda/youni/dualsim/impl/SimInfo;->getAllSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 308
    .local v0, "mAllSims":Ljava/util/List;, "Ljava/util/List<Lcom/snda/youni/dualsim/impl/SimInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 322
    return-void

    .line 308
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/snda/youni/dualsim/impl/SimInfo;

    .line 310
    .local v1, "sim":Lcom/snda/youni/dualsim/impl/SimInfo;
    iget v3, v1, Lcom/snda/youni/dualsim/impl/SimInfo;->mSlot:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    .line 312
    iget v3, v1, Lcom/snda/youni/dualsim/impl/SimInfo;->mSlot:I

    if-nez v3, :cond_2

    .line 314
    iget-wide v4, v1, Lcom/snda/youni/dualsim/impl/SimInfo;->mSimId:J

    long-to-int v3, v4

    iput v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->mFirstSlotSimId:I

    goto :goto_0

    .line 316
    :cond_2
    iget v3, v1, Lcom/snda/youni/dualsim/impl/SimInfo;->mSlot:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 318
    iget-wide v4, v1, Lcom/snda/youni/dualsim/impl/SimInfo;->mSimId:J

    long-to-int v3, v4

    iput v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->mSecondSlotSimId:I

    goto :goto_0
.end method

.method public sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;I)V
    .locals 6
    .param p1, "destinationAddress"    # Ljava/lang/String;
    .param p2, "scAddress"    # Ljava/lang/String;
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "sentIntent"    # Landroid/app/PendingIntent;
    .param p5, "deliveryIntent"    # Landroid/app/PendingIntent;
    .param p6, "simId"    # I

    .prologue
    .line 84
    :try_start_0
    const-string v2, "android.telephony.gemini.GeminiSmsManager"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 85
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "sendTextMessageGemini"

    const/4 v3, 0x6

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-class v5, Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-class v5, Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x3

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    const/4 v4, 0x4

    const-class v5, Landroid/app/PendingIntent;

    aput-object v5, v3, v4

    const/4 v4, 0x5

    const-class v5, Landroid/app/PendingIntent;

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 86
    .local v1, "method_sendTextMessageGemini":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 87
    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    const/4 v3, 0x2

    aput-object p3, v2, v3

    const/4 v3, 0x3

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    aput-object p4, v2, v3

    const/4 v3, 0x5

    aput-object p5, v2, v3

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_sendTextMessageGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 88
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public testDeviceId()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 225
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getDeviceIdGemini"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    :goto_0
    return v0

    .line 227
    :catch_0
    move-exception v0

    move v0, v1

    .line 230
    goto :goto_0
.end method

.method public testDualSimApis()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 258
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->testPrerequist()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 260
    const/4 v0, 0x0

    .line 261
    .local v0, "count":I
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->testSubscriberId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 262
    add-int/lit8 v0, v0, 0x1

    .line 265
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->testSimState()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 266
    add-int/lit8 v0, v0, 0x1

    .line 269
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->testSimSerialNumber()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 270
    add-int/lit8 v0, v0, 0x1

    .line 273
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->testNetworkOperator()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 274
    add-int/lit8 v0, v0, 0x1

    .line 277
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->tstNetworkOperatorName()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 278
    add-int/lit8 v0, v0, 0x1

    .line 281
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->testNetworkType()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 282
    add-int/lit8 v0, v0, 0x1

    .line 285
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->testDeviceId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 286
    add-int/lit8 v0, v0, 0x1

    .line 289
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->testLine1Number()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 290
    add-int/lit8 v0, v0, 0x1

    .line 293
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->testSendTextMessage()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 294
    add-int/lit8 v0, v0, 0x1

    .line 297
    const/16 v2, 0x9

    if-lt v0, v2, :cond_0

    .line 298
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;->prepareDualSimApis()V

    .line 299
    const/4 v1, 0x1

    .line 302
    .end local v0    # "count":I
    :cond_0
    return v1
.end method

.method public testLine1Number()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 236
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getLine1NumberGemini"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 241
    :goto_0
    return v0

    .line 238
    :catch_0
    move-exception v0

    move v0, v1

    .line 241
    goto :goto_0
.end method

.method public testNetworkOperator()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 191
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getNetworkOperatorGemini"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 198
    :goto_0
    return v0

    .line 195
    :catch_0
    move-exception v0

    :goto_1
    move v0, v1

    .line 198
    goto :goto_0

    .line 193
    :catch_1
    move-exception v0

    goto :goto_1
.end method

.method public testNetworkType()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 214
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getNetworkTypeGemini"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 219
    :goto_0
    return v0

    .line 216
    :catch_0
    move-exception v0

    move v0, v1

    .line 219
    goto :goto_0
.end method

.method public testPrerequist()Z
    .locals 1

    .prologue
    .line 152
    const/4 v0, 0x1

    return v0
.end method

.method public testSendTextMessage()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 247
    :try_start_0
    const-string v3, "android.telephony.gemini.GeminiSmsManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 248
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "sendTextMessageGemini"

    const/4 v4, 0x6

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-class v6, Landroid/app/PendingIntent;

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const-class v6, Landroid/app/PendingIntent;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 250
    :catch_0
    move-exception v1

    move v1, v2

    .line 253
    goto :goto_0
.end method

.method public testSimSerialNumber()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 180
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getSimSerialNumberGemini"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 185
    :goto_0
    return v0

    .line 182
    :catch_0
    move-exception v0

    move v0, v1

    .line 185
    goto :goto_0
.end method

.method public testSimState()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 169
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getSimStateGemini"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 174
    :goto_0
    return v0

    .line 171
    :catch_0
    move-exception v0

    move v0, v1

    .line 174
    goto :goto_0
.end method

.method public testSubscriberId()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 158
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getSubscriberIdGemini"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    :goto_0
    return v0

    .line 160
    :catch_0
    move-exception v0

    move v0, v1

    .line 163
    goto :goto_0
.end method

.method public tstNetworkOperatorName()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 204
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getNetworkOperatorNameGemini"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 208
    :goto_0
    return v0

    .line 205
    :catch_0
    move-exception v0

    move v0, v1

    .line 208
    goto :goto_0
.end method
