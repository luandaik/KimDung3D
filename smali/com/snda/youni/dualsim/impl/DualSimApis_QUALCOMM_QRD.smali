.class public Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;
.super Ljava/lang/Object;
.source "DualSimApis_QUALCOMM_QRD.java"

# interfaces
.implements Lcom/snda/youni/dualsim/DualSimApis;


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->context:Landroid/content/Context;

    .line 18
    return-void
.end method


# virtual methods
.method public getDeviceId(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 114
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 116
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getDeviceId"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 117
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

    .line 122
    .end local v1    # "method_getDeviceIdGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v0

    .line 119
    :catch_0
    move-exception v3

    .line 122
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getFirstSlotSimId()I
    .locals 1

    .prologue
    .line 308
    const/4 v0, 0x0

    return v0
.end method

.method public getLine1Number(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 127
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 129
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getLine1Number"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 130
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

    .line 135
    .end local v1    # "method_getLine1NumberGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v0

    .line 132
    :catch_0
    move-exception v3

    .line 135
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getNetworkOperator(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 48
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 50
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getNetworkOperator"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 51
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

    .line 56
    .end local v0    # "method_getNetworkOperatorGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v1

    .line 53
    :catch_0
    move-exception v3

    .line 56
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getNetworkOperatorName(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 61
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 63
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getNetworkOperatorName"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 64
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

    .line 69
    .end local v0    # "method_getNetworkOperatorNameGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v1

    .line 66
    :catch_0
    move-exception v3

    .line 69
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getNetworkType(I)I
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 101
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 103
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getNetworkType"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 104
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

    .line 109
    .end local v0    # "method_getNetworkTypeGemini":Ljava/lang/reflect/Method;
    :goto_0
    return v1

    .line 106
    :catch_0
    move-exception v3

    .line 109
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public getSecondSlotSimId()I
    .locals 1

    .prologue
    .line 313
    const/4 v0, 0x1

    return v0
.end method

.method public getSimFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 303
    const-string v0, "sub_id"

    return-object v0
.end method

.method public getSimOperator(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 324
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 326
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getSimOperator"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 327
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

    .line 332
    .end local v0    # "method_getSimOperatorGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v1

    .line 329
    :catch_0
    move-exception v3

    .line 332
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getSimOperatorName(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 337
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 339
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getSimOperatorName"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 340
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

    .line 345
    .end local v0    # "method_getSimOperatorNameGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v1

    .line 342
    :catch_0
    move-exception v3

    .line 345
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getSimSerialNumber(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 88
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 90
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getSimSerialNumber"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 91
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

    .line 96
    .end local v0    # "method_getSimSerialNumberGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v1

    .line 93
    :catch_0
    move-exception v3

    .line 96
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getSimState(I)I
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 35
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 37
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getSimState"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 38
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

    .line 43
    .end local v0    # "method_getSimStateGemini":Ljava/lang/reflect/Method;
    :goto_0
    return v1

    .line 40
    :catch_0
    move-exception v3

    .line 43
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public getSubscriberId(I)Ljava/lang/String;
    .locals 8
    .param p1, "simId"    # I

    .prologue
    .line 22
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 24
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-class v3, Landroid/telephony/TelephonyManager;

    const-string v4, "getSubscriberId"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 25
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

    .line 30
    .end local v0    # "method_getSubscriberIdGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v1

    .line 27
    :catch_0
    move-exception v3

    .line 30
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public needQuerySimIdSperately()Z
    .locals 1

    .prologue
    .line 319
    const/4 v0, 0x0

    return v0
.end method

.method public prepareDualSimApis()V
    .locals 0

    .prologue
    .line 299
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
    .line 77
    :try_start_0
    invoke-static {}, Landroid/telephony/SmsManager;->getDefault()Landroid/telephony/SmsManager;

    move-result-object v1

    .line 78
    .local v1, "smsManager":Landroid/telephony/SmsManager;
    const-class v2, Landroid/telephony/SmsManager;

    const-string v3, "sendTextMessage"

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

    const-class v6, Landroid/app/PendingIntent;

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-class v6, Landroid/app/PendingIntent;

    aput-object v6, v4, v5

    const/4 v5, 0x5

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 79
    .local v0, "method_sendTextMessageGemini":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 80
    const/4 v2, 0x6

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

    const/4 v3, 0x5

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    .end local v0    # "method_sendTextMessageGemini":Ljava/lang/reflect/Method;
    .end local v1    # "smsManager":Landroid/telephony/SmsManager;
    :goto_0
    return-void

    .line 81
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public testDeviceId()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 214
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getDeviceId"

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

.method public testDualSimApis()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 249
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->testPrerequist()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 251
    const/4 v0, 0x0

    .line 252
    .local v0, "count":I
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->testSubscriberId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 253
    add-int/lit8 v0, v0, 0x1

    .line 256
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->testSimState()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 257
    add-int/lit8 v0, v0, 0x1

    .line 260
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->testSimSerialNumber()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 261
    add-int/lit8 v0, v0, 0x1

    .line 264
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->testNetworkOperator()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 265
    add-int/lit8 v0, v0, 0x1

    .line 268
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->tstNetworkOperatorName()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 269
    add-int/lit8 v0, v0, 0x1

    .line 272
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->testNetworkType()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 273
    add-int/lit8 v0, v0, 0x1

    .line 276
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->testDeviceId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 277
    add-int/lit8 v0, v0, 0x1

    .line 280
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->testLine1Number()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 281
    add-int/lit8 v0, v0, 0x1

    .line 284
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->testSendTextMessage()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 285
    add-int/lit8 v0, v0, 0x1

    .line 288
    const/16 v2, 0x9

    if-lt v0, v2, :cond_0

    .line 289
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;->prepareDualSimApis()V

    .line 290
    const/4 v1, 0x1

    .line 293
    .end local v0    # "count":I
    :cond_0
    return v1
.end method

.method public testLine1Number()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 225
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getLine1Number"

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

.method public testNetworkOperator()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 180
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getNetworkOperator"

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

.method public testNetworkType()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 203
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getNetworkType"

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

.method public testPrerequist()Z
    .locals 1

    .prologue
    .line 141
    const/4 v0, 0x1

    return v0
.end method

.method public testSendTextMessage()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 237
    :try_start_0
    const-class v2, Landroid/telephony/SmsManager;

    const-string v3, "sendTextMessage"

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

    const-class v6, Landroid/app/PendingIntent;

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-class v6, Landroid/app/PendingIntent;

    aput-object v6, v4, v5

    const/4 v5, 0x5

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 242
    :goto_0
    return v0

    .line 239
    :catch_0
    move-exception v0

    move v0, v1

    .line 242
    goto :goto_0
.end method

.method public testSimSerialNumber()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 169
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getSimSerialNumber"

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

.method public testSimState()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 158
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getSimState"

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

.method public testSubscriberId()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 147
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getSubscriberId"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    :goto_0
    return v0

    .line 149
    :catch_0
    move-exception v0

    move v0, v1

    .line 152
    goto :goto_0
.end method

.method public tstNetworkOperatorName()Z
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 192
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    const-string v3, "getNetworkOperatorName"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    :goto_0
    return v0

    .line 194
    :catch_0
    move-exception v0

    move v0, v1

    .line 197
    goto :goto_0
.end method
