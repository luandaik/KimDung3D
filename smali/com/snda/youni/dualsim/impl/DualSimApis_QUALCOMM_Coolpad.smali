.class public Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;
.super Ljava/lang/Object;
.source "DualSimApis_QUALCOMM_Coolpad.java"

# interfaces
.implements Lcom/snda/youni/dualsim/DualSimApis;


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->context:Landroid/content/Context;

    .line 17
    return-void
.end method


# virtual methods
.method public getDeviceId(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 99
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 101
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 102
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDualDeviceId"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 103
    .local v1, "method_getDeviceIdGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getDeviceIdGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 104
    :catch_0
    move-exception v3

    .line 107
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getFirstSlotSimId()I
    .locals 1

    .prologue
    .line 338
    const/4 v0, 0x1

    return v0
.end method

.method public getLine1Number(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 112
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 114
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 115
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDualLine1Number"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 116
    .local v1, "method_getLine1NumberGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getLine1NumberGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 117
    :catch_0
    move-exception v3

    .line 120
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getNetworkOperator(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 60
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 62
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 63
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDualNetworkOperator"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 64
    .local v1, "method_getNetworkOperatorGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getNetworkOperatorGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 65
    :catch_0
    move-exception v3

    .line 68
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getNetworkOperatorName(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 73
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 75
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 76
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDualNetworkOperatorName"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 77
    .local v1, "method_getNetworkOperatorNameGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getNetworkOperatorNameGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 78
    :catch_0
    move-exception v3

    .line 81
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getNetworkType(I)I
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 86
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 88
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 89
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDualNetworkType"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 90
    .local v1, "method_getNetworkTypeGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 94
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getNetworkTypeGemini":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 91
    :catch_0
    move-exception v3

    .line 94
    const/4 v3, -0x1

    goto :goto_0
.end method

.method public getSecondSlotSimId()I
    .locals 1

    .prologue
    .line 343
    const/4 v0, 0x2

    return v0
.end method

.method public getSimFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 333
    const-string v0, "network_type"

    return-object v0
.end method

.method public getSimOperator(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 354
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 356
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 357
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getSimOperator"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 358
    .local v1, "method_getSimOperatorGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 362
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getSimOperatorGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 359
    :catch_0
    move-exception v3

    .line 362
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getSimOperatorName(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 367
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 370
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 371
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getSimOperatorName"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 372
    .local v1, "method_getSimOperatorNameGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 376
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getSimOperatorNameGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 373
    :catch_0
    move-exception v3

    .line 376
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getSimSerialNumber(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 47
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 49
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 50
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDualSimSerialNumber"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 51
    .local v1, "method_getSimSerialNumberGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getSimSerialNumberGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 52
    :catch_0
    move-exception v3

    .line 55
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getSimState(I)I
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 34
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 36
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 37
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDualSimState"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 38
    .local v1, "method_getSimStateGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 42
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getSimStateGemini":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 39
    :catch_0
    move-exception v3

    .line 42
    const/4 v3, -0x1

    goto :goto_0
.end method

.method public getSubscriberId(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 21
    iget-object v3, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 23
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 24
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDualSubscriberId"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 25
    .local v1, "method_getSubscriberIdGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getSubscriberIdGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 26
    :catch_0
    move-exception v3

    .line 29
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public needQuerySimIdSperately()Z
    .locals 1

    .prologue
    .line 349
    const/4 v0, 0x1

    return v0
.end method

.method public prepareDualSimApis()V
    .locals 0

    .prologue
    .line 329
    return-void
.end method

.method public sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;I)V
    .locals 8
    .param p1, "destinationAddress"    # Ljava/lang/String;
    .param p2, "scAddress"    # Ljava/lang/String;
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "sentIntent"    # Landroid/app/PendingIntent;
    .param p5, "deliveryIntent"    # Landroid/app/PendingIntent;
    .param p6, "simId"    # I

    .prologue
    .line 128
    :try_start_0
    const-string v4, "com.yulong.android.telephony.CPSmsManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 143
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "getDefault"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 144
    .local v2, "method_getDefault":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 145
    const-string v4, "sendTextMessage"

    const/4 v5, 0x6

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-class v7, Landroid/app/PendingIntent;

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const-class v7, Landroid/app/PendingIntent;

    aput-object v7, v5, v6

    const/4 v6, 0x5

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 146
    .local v3, "method_sendTextMessageGemini":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 147
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 148
    .local v1, "instance":Ljava/lang/Object;
    const/4 v4, 0x6

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x1

    aput-object p2, v4, v5

    const/4 v5, 0x2

    aput-object p3, v4, v5

    const/4 v5, 0x3

    aput-object p4, v4, v5

    const/4 v5, 0x4

    aput-object p5, v4, v5

    const/4 v5, 0x5

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v3, v1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Ljava/lang/Object;
    .end local v2    # "method_getDefault":Ljava/lang/reflect/Method;
    .end local v3    # "method_sendTextMessageGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 149
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method public testDeviceId()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 243
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 244
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDualDeviceId"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 249
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 246
    :catch_0
    move-exception v1

    move v1, v2

    .line 249
    goto :goto_0
.end method

.method public testDualSimApis()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 279
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->testPrerequist()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 281
    const/4 v0, 0x0

    .line 282
    .local v0, "count":I
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->testSubscriberId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 283
    add-int/lit8 v0, v0, 0x1

    .line 286
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->testSimState()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 287
    add-int/lit8 v0, v0, 0x1

    .line 290
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->testSimSerialNumber()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 291
    add-int/lit8 v0, v0, 0x1

    .line 294
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->testNetworkOperator()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 295
    add-int/lit8 v0, v0, 0x1

    .line 298
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->tstNetworkOperatorName()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 299
    add-int/lit8 v0, v0, 0x1

    .line 302
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->testNetworkType()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 303
    add-int/lit8 v0, v0, 0x1

    .line 306
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->testDeviceId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 307
    add-int/lit8 v0, v0, 0x1

    .line 310
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->testLine1Number()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 311
    add-int/lit8 v0, v0, 0x1

    .line 314
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->testSendTextMessage()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 315
    add-int/lit8 v0, v0, 0x1

    .line 318
    const/16 v2, 0x9

    if-lt v0, v2, :cond_0

    .line 319
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;->prepareDualSimApis()V

    .line 320
    const/4 v1, 0x1

    .line 323
    .end local v0    # "count":I
    :cond_0
    return v1
.end method

.method public testLine1Number()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 255
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 256
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDualLine1Number"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 261
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 258
    :catch_0
    move-exception v1

    move v1, v2

    .line 261
    goto :goto_0
.end method

.method public testNetworkOperator()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 206
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 207
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDualNetworkOperator"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 212
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 209
    :catch_0
    move-exception v1

    move v1, v2

    .line 212
    goto :goto_0
.end method

.method public testNetworkType()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 230
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 231
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDualNetworkType"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 236
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 233
    :catch_0
    move-exception v1

    move v1, v2

    .line 236
    goto :goto_0
.end method

.method public testPrerequist()Z
    .locals 1

    .prologue
    .line 159
    :try_start_0
    const-string v0, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 160
    const/4 v0, 0x1

    .line 164
    :goto_0
    return v0

    .line 161
    :catch_0
    move-exception v0

    .line 164
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public testSendTextMessage()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 267
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPSmsManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 268
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 269
    const-string v3, "sendDualTextMessage"

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

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 274
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 271
    :catch_0
    move-exception v1

    move v1, v2

    .line 274
    goto :goto_0
.end method

.method public testSimSerialNumber()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 194
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 195
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDualSimSerialNumber"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 197
    :catch_0
    move-exception v1

    move v1, v2

    .line 200
    goto :goto_0
.end method

.method public testSimState()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 182
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 183
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDualSimState"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 188
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 185
    :catch_0
    move-exception v1

    move v1, v2

    .line 188
    goto :goto_0
.end method

.method public testSubscriberId()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 170
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 171
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDualSubscriberId"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 173
    :catch_0
    move-exception v1

    move v1, v2

    .line 176
    goto :goto_0
.end method

.method public tstNetworkOperatorName()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 218
    :try_start_0
    const-string v3, "com.yulong.android.telephony.CPTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 219
    .local v0, "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDualNetworkOperatorName"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 224
    .end local v0    # "DSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 221
    :catch_0
    move-exception v1

    move v1, v2

    .line 224
    goto :goto_0
.end method
