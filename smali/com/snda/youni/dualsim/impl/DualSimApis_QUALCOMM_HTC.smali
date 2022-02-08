.class public Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;
.super Ljava/lang/Object;
.source "DualSimApis_QUALCOMM_HTC.java"

# interfaces
.implements Lcom/snda/youni/dualsim/DualSimApis;


# instance fields
.field private context:Landroid/content/Context;

.field private mainSimId:I

.field private subSimId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, -0x1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput v0, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->mainSimId:I

    .line 18
    iput v0, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->subSimId:I

    .line 22
    iput-object p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->context:Landroid/content/Context;

    .line 23
    return-void
.end method

.method private getMainPhoneType(Landroid/content/Context;)I
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    const-string v3, "phone"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 28
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getDefMainPhoneType"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 29
    .local v0, "method_getSubscriberIdGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 34
    .end local v0    # "method_getSubscriberIdGemini":Ljava/lang/reflect/Method;
    :goto_0
    return v1

    .line 31
    :catch_0
    move-exception v3

    .line 34
    const/4 v1, -0x1

    goto :goto_0
.end method

.method private getSubPhoneType(Landroid/content/Context;)I
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    const-string v3, "phone"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 40
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getDefSubPhoneType"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 41
    .local v0, "method_getSubscriberIdGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 46
    .end local v0    # "method_getSubscriberIdGemini":Ljava/lang/reflect/Method;
    :goto_0
    return v1

    .line 43
    :catch_0
    move-exception v3

    .line 46
    const/4 v1, -0x1

    goto :goto_0
.end method


# virtual methods
.method public getDeviceId(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 160
    if-nez p1, :cond_0

    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->mainSimId:I

    .line 161
    :goto_0
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 163
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getDeviceIdExt"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 164
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

    .line 169
    .end local v1    # "method_getDeviceIdGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v0

    .line 160
    .end local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :cond_0
    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->subSimId:I

    goto :goto_0

    .line 166
    .restart local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    .line 169
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public getFirstSlotSimId()I
    .locals 1

    .prologue
    .line 362
    const/4 v0, 0x1

    return v0
.end method

.method public getLine1Number(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 174
    if-nez p1, :cond_0

    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->mainSimId:I

    .line 175
    :goto_0
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 177
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getLine1NumberExt"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 178
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

    .line 184
    .end local v1    # "method_getLine1NumberGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v0

    .line 174
    .end local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :cond_0
    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->subSimId:I

    goto :goto_0

    .line 180
    .restart local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    .line 184
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public getNetworkOperator(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 80
    if-nez p1, :cond_0

    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->mainSimId:I

    .line 81
    :goto_0
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 83
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getNetworkOperatorExt"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 84
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

    .line 90
    .end local v0    # "method_getNetworkOperatorGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v1

    .line 80
    .end local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :cond_0
    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->subSimId:I

    goto :goto_0

    .line 86
    .restart local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    .line 90
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getNetworkOperatorName(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 95
    if-nez p1, :cond_0

    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->mainSimId:I

    .line 96
    :goto_0
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 98
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getNetworkOperatorNameExt"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 99
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

    .line 104
    .end local v0    # "method_getNetworkOperatorNameGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v1

    .line 95
    .end local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :cond_0
    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->subSimId:I

    goto :goto_0

    .line 101
    .restart local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    .line 104
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getNetworkType(I)I
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 145
    if-nez p1, :cond_0

    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->mainSimId:I

    .line 146
    :goto_0
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 148
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getNetworkTypeExt"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 149
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

    .line 154
    .end local v0    # "method_getNetworkTypeGemini":Ljava/lang/reflect/Method;
    :goto_1
    return v1

    .line 145
    .end local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :cond_0
    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->subSimId:I

    goto :goto_0

    .line 151
    .restart local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    .line 154
    const/4 v1, -0x1

    goto :goto_1
.end method

.method public getSecondSlotSimId()I
    .locals 1

    .prologue
    .line 367
    const/4 v0, 0x2

    return v0
.end method

.method public getSimFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 357
    const-string v0, "sim_slot"

    return-object v0
.end method

.method public getSimOperator(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 378
    if-nez p1, :cond_0

    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->mainSimId:I

    .line 379
    :goto_0
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 381
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getSimOperatorExt"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 382
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

    .line 387
    .end local v0    # "method_getSimOperatorGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v1

    .line 378
    .end local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :cond_0
    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->subSimId:I

    goto :goto_0

    .line 384
    .restart local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    .line 387
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getSimOperatorName(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 392
    if-nez p1, :cond_0

    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->mainSimId:I

    .line 393
    :goto_0
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 395
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getSimOperatorNameExt"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 396
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

    .line 401
    .end local v0    # "method_getSimOperatorNameGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v1

    .line 392
    .end local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :cond_0
    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->subSimId:I

    goto :goto_0

    .line 398
    .restart local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    .line 401
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getSimSerialNumber(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 131
    if-nez p1, :cond_0

    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->mainSimId:I

    .line 132
    :goto_0
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 134
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getIccSerialNumber"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 135
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

    .line 140
    .end local v0    # "method_getSimSerialNumberGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v1

    .line 131
    .end local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :cond_0
    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->subSimId:I

    goto :goto_0

    .line 137
    .restart local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    .line 140
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getSimState(I)I
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 65
    if-nez p1, :cond_0

    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->mainSimId:I

    .line 66
    :goto_0
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 68
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getIccState"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 69
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

    .line 75
    .end local v0    # "method_getSimStateGemini":Ljava/lang/reflect/Method;
    :goto_1
    return v1

    .line 65
    .end local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :cond_0
    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->subSimId:I

    goto :goto_0

    .line 71
    .restart local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    .line 75
    const/4 v1, -0x1

    goto :goto_1
.end method

.method public getSubscriberId(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 51
    if-nez p1, :cond_0

    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->mainSimId:I

    .line 52
    :goto_0
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 54
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getSubscriberIdExt"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 55
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

    .line 60
    .end local v0    # "method_getSubscriberIdGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v1

    .line 51
    .end local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :cond_0
    iget p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->subSimId:I

    goto :goto_0

    .line 57
    .restart local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    .line 60
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public needQuerySimIdSperately()Z
    .locals 1

    .prologue
    .line 373
    const/4 v0, 0x1

    return v0
.end method

.method public prepareDualSimApis()V
    .locals 1

    .prologue
    .line 351
    iget-object v0, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->context:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->getMainPhoneType(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->mainSimId:I

    .line 352
    iget-object v0, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->context:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->getSubPhoneType(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->subSimId:I

    .line 353
    return-void
.end method

.method public sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;I)V
    .locals 7
    .param p1, "destinationAddress"    # Ljava/lang/String;
    .param p2, "scAddress"    # Ljava/lang/String;
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "sentIntent"    # Landroid/app/PendingIntent;
    .param p5, "deliveryIntent"    # Landroid/app/PendingIntent;
    .param p6, "simId"    # I

    .prologue
    .line 118
    if-nez p6, :cond_0

    iget p6, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->mainSimId:I

    .line 120
    :goto_0
    :try_start_0
    invoke-static {}, Landroid/telephony/SmsManager;->getDefault()Landroid/telephony/SmsManager;

    move-result-object v1

    .line 121
    .local v1, "smsManager":Landroid/telephony/SmsManager;
    const-class v2, Landroid/telephony/SmsManager;

    const-string v3, "sendTextMessageExt"

    const/4 v4, 0x7

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

    const-class v6, Landroid/app/PendingIntent;

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-class v6, Landroid/app/PendingIntent;

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const-class v6, Landroid/os/Bundle;

    aput-object v6, v4, v5

    const/4 v5, 0x6

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 122
    .local v0, "method_sendTextMessageGemini":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 123
    const/4 v2, 0x7

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    const/4 v3, 0x2

    aput-object p3, v2, v3

    const/4 v3, 0x3

    aput-object p4, v2, v3

    const/4 v3, 0x4

    aput-object p5, v2, v3

    const/4 v3, 0x6

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .end local v0    # "method_sendTextMessageGemini":Ljava/lang/reflect/Method;
    .end local v1    # "smsManager":Landroid/telephony/SmsManager;
    :goto_1
    return-void

    .line 118
    :cond_0
    iget p6, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->subSimId:I

    goto :goto_0

    .line 124
    :catch_0
    move-exception v2

    goto :goto_1
.end method

.method public testDeviceId()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 269
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getDeviceIdExt"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 274
    :goto_0
    return v0

    .line 271
    :catch_0
    move-exception v0

    move v0, v1

    .line 274
    goto :goto_0
.end method

.method public testDualSimApis()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 302
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->testPrerequist()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 304
    const/4 v0, 0x0

    .line 305
    .local v0, "count":I
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->testSubscriberId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 306
    add-int/lit8 v0, v0, 0x1

    .line 309
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->testSimState()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 310
    add-int/lit8 v0, v0, 0x1

    .line 313
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->testSimSerialNumber()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 314
    add-int/lit8 v0, v0, 0x1

    .line 317
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->testNetworkOperator()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 318
    add-int/lit8 v0, v0, 0x1

    .line 321
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->tstNetworkOperatorName()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 322
    add-int/lit8 v0, v0, 0x1

    .line 325
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->testNetworkType()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 326
    add-int/lit8 v0, v0, 0x1

    .line 329
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->testDeviceId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 330
    add-int/lit8 v0, v0, 0x1

    .line 333
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->testLine1Number()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 334
    add-int/lit8 v0, v0, 0x1

    .line 337
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->testSendTextMessage()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 338
    add-int/lit8 v0, v0, 0x1

    .line 341
    const/16 v2, 0x9

    if-lt v0, v2, :cond_0

    .line 342
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;->prepareDualSimApis()V

    .line 343
    const/4 v1, 0x1

    .line 346
    .end local v0    # "count":I
    :cond_0
    return v1
.end method

.method public testLine1Number()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 280
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getLine1NumberExt"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 285
    :goto_0
    return v0

    .line 282
    :catch_0
    move-exception v0

    move v0, v1

    .line 285
    goto :goto_0
.end method

.method public testNetworkOperator()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 235
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getNetworkOperatorExt"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 240
    :goto_0
    return v0

    .line 237
    :catch_0
    move-exception v0

    move v0, v1

    .line 240
    goto :goto_0
.end method

.method public testNetworkType()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 257
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getNetworkTypeExt"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 262
    :goto_0
    return v0

    .line 259
    :catch_0
    move-exception v0

    move v0, v1

    .line 262
    goto :goto_0
.end method

.method public testPrerequist()Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 190
    :try_start_0
    const-class v1, Landroid/telephony/TelephonyManager;

    const-string v2, "getDefMainPhoneType"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 191
    const-class v1, Landroid/telephony/TelephonyManager;

    const-string v2, "getDefSubPhoneType"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 192
    const/4 v0, 0x1

    .line 196
    :goto_0
    return v0

    .line 193
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public testSendTextMessage()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 292
    :try_start_0
    const-class v2, Landroid/telephony/SmsManager;

    const-string v3, "sendTextMessageExt"

    const/4 v4, 0x7

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

    const-class v6, Landroid/app/PendingIntent;

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-class v6, Landroid/app/PendingIntent;

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const-class v6, Landroid/os/Bundle;

    aput-object v6, v4, v5

    const/4 v5, 0x6

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 297
    :goto_0
    return v0

    .line 294
    :catch_0
    move-exception v0

    move v0, v1

    .line 297
    goto :goto_0
.end method

.method public testSimSerialNumber()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 224
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getIccSerialNumber"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 229
    :goto_0
    return v0

    .line 226
    :catch_0
    move-exception v0

    move v0, v1

    .line 229
    goto :goto_0
.end method

.method public testSimState()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 213
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getIccState"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 218
    :goto_0
    return v0

    .line 215
    :catch_0
    move-exception v0

    move v0, v1

    .line 218
    goto :goto_0
.end method

.method public testSubscriberId()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 202
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getSubscriberIdExt"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 207
    :goto_0
    return v0

    .line 204
    :catch_0
    move-exception v0

    move v0, v1

    .line 207
    goto :goto_0
.end method

.method public tstNetworkOperatorName()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 246
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getNetworkOperatorNameExt"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 251
    :goto_0
    return v0

    .line 248
    :catch_0
    move-exception v0

    move v0, v1

    .line 251
    goto :goto_0
.end method
