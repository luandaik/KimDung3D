.class public Lcom/snda/youni/dualsim/impl/DualSimApis_Spreadtrum_2;
.super Ljava/lang/Object;
.source "DualSimApis_Spreadtrum_2.java"

# interfaces
.implements Lcom/snda/youni/dualsim/DualSimApis;


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_Spreadtrum_2;->context:Landroid/content/Context;

    .line 19
    return-void
.end method


# virtual methods
.method public getDeviceId(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 108
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 109
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 110
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 111
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 112
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 116
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 113
    :catch_0
    move-exception v3

    .line 116
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getFirstSlotSimId()I
    .locals 1

    .prologue
    .line 275
    const/4 v0, 0x0

    return v0
.end method

.method public getLine1Number(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 122
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 123
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 124
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 125
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 126
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 130
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 127
    :catch_0
    move-exception v3

    .line 130
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getNetworkOperator(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 66
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 67
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 68
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 69
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 70
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 74
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 71
    :catch_0
    move-exception v3

    .line 74
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getNetworkOperatorName(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 80
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 81
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 82
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 83
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 84
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 88
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 85
    :catch_0
    move-exception v3

    .line 88
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getNetworkType(I)I
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 94
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 95
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 96
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 97
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 98
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getNetworkType()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 102
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 99
    :catch_0
    move-exception v3

    .line 102
    const/4 v3, -0x1

    goto :goto_0
.end method

.method public getSecondSlotSimId()I
    .locals 1

    .prologue
    .line 280
    const/4 v0, 0x1

    return v0
.end method

.method public getSimFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 270
    const-string v0, "phone_id"

    return-object v0
.end method

.method public getSimOperator(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 291
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 292
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 293
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 294
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 295
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 299
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 296
    :catch_0
    move-exception v3

    .line 299
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getSimOperatorName(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 305
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 306
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 307
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 308
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 309
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimOperatorName()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 313
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 310
    :catch_0
    move-exception v3

    .line 313
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getSimSerialNumber(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 52
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 53
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 54
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 55
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 56
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimSerialNumber()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 60
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 57
    :catch_0
    move-exception v3

    .line 60
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getSimState(I)I
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 38
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 39
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 40
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 41
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 42
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimState()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 46
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 43
    :catch_0
    move-exception v3

    .line 46
    const/4 v3, -0x1

    goto :goto_0
.end method

.method public getSubscriberId(I)Ljava/lang/String;
    .locals 7
    .param p1, "simId"    # I

    .prologue
    .line 24
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 25
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "getDefault"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 26
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 27
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 28
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 32
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 29
    :catch_0
    move-exception v3

    .line 32
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public needQuerySimIdSperately()Z
    .locals 1

    .prologue
    .line 285
    const/4 v0, 0x0

    return v0
.end method

.method public prepareDualSimApis()V
    .locals 0

    .prologue
    .line 266
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
    .line 138
    :try_start_0
    const-string v1, "android.telephony.SmsManager"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 139
    .local v6, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v1, "getDefault"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    invoke-virtual {v6, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    .line 140
    .local v7, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    invoke-virtual {v7, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 141
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v7, v6, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/SmsManager;

    .local v0, "instance":Landroid/telephony/SmsManager;
    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 142
    invoke-virtual/range {v0 .. v5}, Landroid/telephony/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    .end local v0    # "instance":Landroid/telephony/SmsManager;
    .end local v6    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 143
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public testDeviceId()Z
    .locals 1

    .prologue
    .line 193
    const/4 v0, 0x1

    return v0
.end method

.method public testDualSimApis()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 216
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_Spreadtrum_2;->testPrerequist()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 218
    const/4 v0, 0x0

    .line 219
    .local v0, "count":I
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_Spreadtrum_2;->testSendTextMessage()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 220
    add-int/lit8 v0, v0, 0x1

    .line 223
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_Spreadtrum_2;->testSubscriberId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 224
    add-int/lit8 v0, v0, 0x1

    .line 227
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_Spreadtrum_2;->testSimState()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 228
    add-int/lit8 v0, v0, 0x1

    .line 231
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_Spreadtrum_2;->testSimSerialNumber()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 232
    add-int/lit8 v0, v0, 0x1

    .line 235
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_Spreadtrum_2;->testNetworkOperator()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 236
    add-int/lit8 v0, v0, 0x1

    .line 239
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_Spreadtrum_2;->tstNetworkOperatorName()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 240
    add-int/lit8 v0, v0, 0x1

    .line 243
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_Spreadtrum_2;->testNetworkType()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 244
    add-int/lit8 v0, v0, 0x1

    .line 247
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_Spreadtrum_2;->testDeviceId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 248
    add-int/lit8 v0, v0, 0x1

    .line 251
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_Spreadtrum_2;->testLine1Number()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 252
    add-int/lit8 v0, v0, 0x1

    .line 255
    const/16 v2, 0x9

    if-lt v0, v2, :cond_0

    .line 256
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_Spreadtrum_2;->prepareDualSimApis()V

    .line 257
    const/4 v1, 0x1

    .line 260
    .end local v0    # "count":I
    :cond_0
    return v1
.end method

.method public testLine1Number()Z
    .locals 1

    .prologue
    .line 198
    const/4 v0, 0x1

    return v0
.end method

.method public testNetworkOperator()Z
    .locals 1

    .prologue
    .line 178
    const/4 v0, 0x1

    return v0
.end method

.method public testNetworkType()Z
    .locals 1

    .prologue
    .line 188
    const/4 v0, 0x1

    return v0
.end method

.method public testPrerequist()Z
    .locals 8

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 151
    :try_start_0
    const-string v4, "android.telephony.TelephonyManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 152
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "getDefault"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 153
    .local v1, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    return v2

    .line 155
    :catch_0
    move-exception v2

    move v2, v3

    .line 158
    goto :goto_0
.end method

.method public testSendTextMessage()Z
    .locals 8

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 204
    :try_start_0
    const-string v4, "android.telephony.SmsManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 205
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "getDefault"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 206
    .local v1, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 211
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    return v2

    .line 208
    :catch_0
    move-exception v2

    move v2, v3

    .line 211
    goto :goto_0
.end method

.method public testSimSerialNumber()Z
    .locals 1

    .prologue
    .line 173
    const/4 v0, 0x1

    return v0
.end method

.method public testSimState()Z
    .locals 1

    .prologue
    .line 168
    const/4 v0, 0x1

    return v0
.end method

.method public testSubscriberId()Z
    .locals 1

    .prologue
    .line 163
    const/4 v0, 0x1

    return v0
.end method

.method public tstNetworkOperatorName()Z
    .locals 1

    .prologue
    .line 183
    const/4 v0, 0x1

    return v0
.end method
