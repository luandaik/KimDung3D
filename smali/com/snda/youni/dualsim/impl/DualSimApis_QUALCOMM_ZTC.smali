.class public Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_ZTC;
.super Ljava/lang/Object;
.source "DualSimApis_QUALCOMM_ZTC.java"

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
    iput-object p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_ZTC;->context:Landroid/content/Context;

    .line 17
    return-void
.end method


# virtual methods
.method public getDeviceId(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 100
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 101
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 102
    .local v1, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const-string v3, "getDeviceId"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 103
    .local v2, "method_getDeviceIdGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    .end local v2    # "method_getDeviceIdGemini":Ljava/lang/reflect/Method;
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
    .line 325
    const/4 v0, 0x1

    return v0
.end method

.method public getLine1Number(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 131
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 132
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 133
    .local v1, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const-string v3, "getLine1Number"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 134
    .local v2, "method_getLine1NumberGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 138
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    .end local v2    # "method_getLine1NumberGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 135
    :catch_0
    move-exception v3

    .line 138
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getNetworkOperator(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 61
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 62
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 63
    .local v1, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const-string v3, "getNetworkOperator"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 64
    .local v2, "method_getNetworkOperatorGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    .end local v2    # "method_getNetworkOperatorGemini":Ljava/lang/reflect/Method;
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
    .line 74
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 75
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 76
    .local v1, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const-string v3, "getNetworkOperatorName"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 77
    .local v2, "method_getNetworkOperatorNameGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    .end local v2    # "method_getNetworkOperatorNameGemini":Ljava/lang/reflect/Method;
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
    .line 87
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 88
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 89
    .local v1, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const-string v3, "getNetworkType"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 90
    .local v2, "method_getNetworkTypeGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 94
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    .end local v2    # "method_getNetworkTypeGemini":Ljava/lang/reflect/Method;
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
    .line 330
    const/4 v0, 0x2

    return v0
.end method

.method public getSimFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 320
    const-string v0, "sub_id"

    return-object v0
.end method

.method public getSimOperator(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 342
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 343
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 344
    .local v1, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const-string v3, "getSimOperator"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 345
    .local v2, "method_getSubscriberIdGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 349
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    .end local v2    # "method_getSubscriberIdGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 346
    :catch_0
    move-exception v3

    .line 349
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getSimOperatorName(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 355
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 356
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 357
    .local v1, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const-string v3, "getSimOperatorName"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 358
    .local v2, "method_getSubscriberIdGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 362
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    .end local v2    # "method_getSubscriberIdGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 359
    :catch_0
    move-exception v3

    .line 362
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getSimSerialNumber(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 48
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 49
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 50
    .local v1, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const-string v3, "getSimSerialNumber"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 51
    .local v2, "method_getSimSerialNumberGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    .end local v2    # "method_getSimSerialNumberGemini":Ljava/lang/reflect/Method;
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
    .line 35
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 36
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 37
    .local v1, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const-string v3, "getSimState"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 38
    .local v2, "method_getSimStateGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 42
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    .end local v2    # "method_getSimStateGemini":Ljava/lang/reflect/Method;
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
    .line 22
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 23
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 24
    .local v1, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const-string v3, "getSubscriberId"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 25
    .local v2, "method_getSubscriberIdGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    .end local v2    # "method_getSubscriberIdGemini":Ljava/lang/reflect/Method;
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
    .line 336
    const/4 v0, 0x1

    return v0
.end method

.method public prepareDualSimApis()V
    .locals 0

    .prologue
    .line 316
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
    .line 115
    :try_start_0
    const-string v4, "android.telephony.MSimSmsManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 116
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "getDefault"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 117
    .local v2, "method_getDefault":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 118
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

    .line 119
    .local v3, "method_sendTextMessageGemini":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 120
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 121
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

    .line 126
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Ljava/lang/Object;
    .end local v2    # "method_getDefault":Ljava/lang/reflect/Method;
    .end local v3    # "method_sendTextMessageGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 122
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method public testDeviceId()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 228
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 229
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDeviceId"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 234
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 231
    :catch_0
    move-exception v1

    move v1, v2

    .line 234
    goto :goto_0
.end method

.method public testDualSimApis()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 266
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_ZTC;->testPrerequist()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 268
    const/4 v0, 0x0

    .line 269
    .local v0, "count":I
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_ZTC;->testSendTextMessage()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 270
    add-int/lit8 v0, v0, 0x1

    .line 273
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_ZTC;->testSubscriberId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 274
    add-int/lit8 v0, v0, 0x1

    .line 277
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_ZTC;->testSimState()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 278
    add-int/lit8 v0, v0, 0x1

    .line 281
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_ZTC;->testSimSerialNumber()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 282
    add-int/lit8 v0, v0, 0x1

    .line 285
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_ZTC;->testNetworkOperator()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 286
    add-int/lit8 v0, v0, 0x1

    .line 289
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_ZTC;->tstNetworkOperatorName()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 290
    add-int/lit8 v0, v0, 0x1

    .line 293
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_ZTC;->testNetworkType()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 294
    add-int/lit8 v0, v0, 0x1

    .line 297
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_ZTC;->testDeviceId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 298
    add-int/lit8 v0, v0, 0x1

    .line 301
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_ZTC;->testLine1Number()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 302
    add-int/lit8 v0, v0, 0x1

    .line 305
    const/16 v2, 0x9

    if-lt v0, v2, :cond_0

    .line 306
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_ZTC;->prepareDualSimApis()V

    .line 307
    const/4 v1, 0x1

    .line 310
    .end local v0    # "count":I
    :cond_0
    return v1
.end method

.method public testLine1Number()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 240
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 241
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getLine1Number"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 246
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 243
    :catch_0
    move-exception v1

    move v1, v2

    .line 246
    goto :goto_0
.end method

.method public testNetworkOperator()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 192
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 193
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getNetworkOperator"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 198
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 195
    :catch_0
    move-exception v1

    move v1, v2

    .line 198
    goto :goto_0
.end method

.method public testNetworkType()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 216
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 217
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getNetworkType"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 219
    :catch_0
    move-exception v1

    move v1, v2

    .line 222
    goto :goto_0
.end method

.method public testPrerequist()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 144
    :try_start_0
    const-string v2, "android.telephony.MSimTelephonyManager"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 145
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "getDefault"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    const/4 v1, 0x1

    .line 150
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 147
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public testSendTextMessage()Z
    .locals 9

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 252
    :try_start_0
    const-string v5, "android.telephony.MSimSmsManager"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 253
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v5, "getDefault"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Class;

    invoke-virtual {v0, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 254
    .local v1, "method_getDefault":Ljava/lang/reflect/Method;
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 255
    const-string v5, "sendTextMessage"

    const/4 v6, 0x6

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x3

    const-class v8, Landroid/app/PendingIntent;

    aput-object v8, v6, v7

    const/4 v7, 0x4

    const-class v8, Landroid/app/PendingIntent;

    aput-object v8, v6, v7

    const/4 v7, 0x5

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    invoke-virtual {v0, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 256
    .local v2, "method_sendTextMessageGemini":Ljava/lang/reflect/Method;
    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 261
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getDefault":Ljava/lang/reflect/Method;
    .end local v2    # "method_sendTextMessageGemini":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 258
    :catch_0
    move-exception v3

    move v3, v4

    .line 261
    goto :goto_0
.end method

.method public testSimSerialNumber()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 180
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 181
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getSimSerialNumber"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 183
    :catch_0
    move-exception v1

    move v1, v2

    .line 186
    goto :goto_0
.end method

.method public testSimState()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 168
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 169
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getSimState"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 174
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 171
    :catch_0
    move-exception v1

    move v1, v2

    .line 174
    goto :goto_0
.end method

.method public testSubscriberId()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 156
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 157
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getSubscriberId"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 159
    :catch_0
    move-exception v1

    move v1, v2

    .line 162
    goto :goto_0
.end method

.method public tstNetworkOperatorName()Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 204
    :try_start_0
    const-string v3, "android.telephony.MSimTelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 205
    .local v0, "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getNetworkOperatorName"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 210
    .end local v0    # "MSimTelephonyManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 207
    :catch_0
    move-exception v1

    move v1, v2

    .line 210
    goto :goto_0
.end method
