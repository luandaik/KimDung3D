.class public Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG2;
.super Ljava/lang/Object;
.source "DualSimApis_QUALCOMM_SAMSUNG2.java"

# interfaces
.implements Lcom/snda/youni/dualsim/DualSimApis;


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG2;->context:Landroid/content/Context;

    .line 21
    return-void
.end method


# virtual methods
.method public getDeviceId(I)Ljava/lang/String;
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 157
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 159
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 161
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 166
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 167
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 168
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v3

    .line 172
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 164
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 163
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 169
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 172
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getFirstSlotSimId()I
    .locals 1

    .prologue
    .line 358
    const/4 v0, 0x0

    return v0
.end method

.method public getLine1Number(I)Ljava/lang/String;
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 197
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 199
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 201
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 206
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 207
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 208
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v3

    .line 212
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 204
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 203
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 209
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 212
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getNetworkOperator(I)Ljava/lang/String;
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 91
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 93
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 95
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 100
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 101
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 102
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v3

    .line 106
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 98
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 97
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 103
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 106
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getNetworkOperatorName(I)Ljava/lang/String;
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 113
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 115
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 117
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 122
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 123
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 124
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v3

    .line 128
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 120
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 119
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 125
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 128
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getNetworkType(I)I
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 135
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 137
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 139
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 144
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 145
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 146
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v3

    .line 150
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return v3

    .line 142
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 141
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 147
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 150
    const/4 v3, -0x1

    goto :goto_1
.end method

.method public getSecondSlotSimId()I
    .locals 1

    .prologue
    .line 363
    const/4 v0, 0x1

    return v0
.end method

.method public getSimFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 353
    const-string v0, "phonetype"

    return-object v0
.end method

.method public getSimOperator(I)Ljava/lang/String;
    .locals 6
    .param p1, "simId"    # I

    .prologue
    .line 376
    :try_start_0
    const-string v4, "android.telephony.TelephonyManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 378
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 379
    const-string v4, "getDefault"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 383
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 384
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 385
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v3

    .line 390
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 381
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v4, "getSecondary"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 387
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v4

    .line 390
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getSimOperatorName(I)Ljava/lang/String;
    .locals 6
    .param p1, "simId"    # I

    .prologue
    .line 397
    :try_start_0
    const-string v4, "android.telephony.TelephonyManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 399
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 400
    const-string v4, "getDefault"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 404
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 405
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 406
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimOperatorName()Ljava/lang/String;

    move-result-object v3

    .line 411
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 402
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v4, "getSecondary"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 408
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v4

    .line 411
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getSimSerialNumber(I)Ljava/lang/String;
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 70
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 72
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 74
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 79
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 80
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 81
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimSerialNumber()Ljava/lang/String;

    move-result-object v3

    .line 85
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 77
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 76
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 82
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 85
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getSimState(I)I
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 48
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 50
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 52
    const-string v3, "getDefault"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 57
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 58
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 59
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v3

    .line 63
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return v3

    .line 55
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 54
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 60
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 63
    const/4 v3, -0x1

    goto :goto_1
.end method

.method public getSubscriberId(I)Ljava/lang/String;
    .locals 6
    .param p1, "simId"    # I

    .prologue
    .line 26
    :try_start_0
    const-string v4, "android.telephony.TelephonyManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 28
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 30
    const-string v4, "getDefault"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 35
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 36
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 37
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v3

    .line 42
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 33
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v4, "getSecondary"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 32
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 39
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v4

    .line 42
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public needQuerySimIdSperately()Z
    .locals 1

    .prologue
    .line 369
    const/4 v0, 0x0

    return v0
.end method

.method public prepareDualSimApis()V
    .locals 0

    .prologue
    .line 348
    return-void
.end method

.method public sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;I)V
    .locals 12
    .param p1, "destinationAddress"    # Ljava/lang/String;
    .param p2, "scAddress"    # Ljava/lang/String;
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "sentIntent"    # Landroid/app/PendingIntent;
    .param p5, "deliveryIntent"    # Landroid/app/PendingIntent;
    .param p6, "simId"    # I

    .prologue
    .line 179
    const-string v11, "isms"

    .line 180
    .local v11, "service_name":Ljava/lang/String;
    const/4 v1, 0x1

    move/from16 v0, p6

    if-ne v0, v1, :cond_0

    .line 181
    const-string v11, "isms2"

    .line 184
    :cond_0
    :try_start_0
    const-string v1, "android.os.ServiceManager"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    .line 185
    .local v7, "ServiceManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v1, "getService"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v7, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    .line 186
    .local v9, "method_getService":Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v11, v1, v2

    invoke-virtual {v9, v7, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 187
    .local v10, "service":Ljava/lang/Object;
    check-cast v10, Landroid/os/IBinder;

    .end local v10    # "service":Ljava/lang/Object;
    invoke-static {v10}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v8

    .line 188
    .local v8, "localObject":Lcom/android/internal/telephony/ISms;
    move-object v0, v8

    check-cast v0, Lcom/android/internal/telephony/ISms;

    move-object v1, v0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    invoke-interface/range {v1 .. v6}, Lcom/android/internal/telephony/ISms;->sendText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 192
    .end local v7    # "ServiceManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v8    # "localObject":Lcom/android/internal/telephony/ISms;
    .end local v9    # "method_getService":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 189
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public testDeviceId()Z
    .locals 1

    .prologue
    .line 260
    const/4 v0, 0x1

    return v0
.end method

.method public testDualSimApis()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 298
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG2;->testPrerequist()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 300
    const/4 v0, 0x0

    .line 301
    .local v0, "count":I
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG2;->testSubscriberId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 302
    add-int/lit8 v0, v0, 0x1

    .line 305
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG2;->testSimState()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 306
    add-int/lit8 v0, v0, 0x1

    .line 309
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG2;->testSimSerialNumber()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 310
    add-int/lit8 v0, v0, 0x1

    .line 313
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG2;->testNetworkOperator()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 314
    add-int/lit8 v0, v0, 0x1

    .line 317
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG2;->tstNetworkOperatorName()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 318
    add-int/lit8 v0, v0, 0x1

    .line 321
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG2;->testNetworkType()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 322
    add-int/lit8 v0, v0, 0x1

    .line 325
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG2;->testDeviceId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 326
    add-int/lit8 v0, v0, 0x1

    .line 329
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG2;->testLine1Number()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 330
    add-int/lit8 v0, v0, 0x1

    .line 333
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG2;->testSendTextMessage()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 334
    add-int/lit8 v0, v0, 0x1

    .line 337
    const/16 v2, 0x9

    if-lt v0, v2, :cond_0

    .line 338
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG2;->prepareDualSimApis()V

    .line 339
    const/4 v1, 0x1

    .line 342
    .end local v0    # "count":I
    :cond_0
    return v1
.end method

.method public testLine1Number()Z
    .locals 1

    .prologue
    .line 265
    const/4 v0, 0x1

    return v0
.end method

.method public testNetworkOperator()Z
    .locals 1

    .prologue
    .line 245
    const/4 v0, 0x1

    return v0
.end method

.method public testNetworkType()Z
    .locals 1

    .prologue
    .line 255
    const/4 v0, 0x1

    return v0
.end method

.method public testPrerequist()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 218
    :try_start_0
    const-string v2, "android.telephony.TelephonyManager"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 219
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "getDefault"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 220
    const-string v2, "getSecondary"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 221
    const/4 v1, 0x1

    .line 225
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 222
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public testSendTextMessage()Z
    .locals 12

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 270
    const-string v5, "isms2"

    .line 271
    .local v5, "service_name":Ljava/lang/String;
    const/4 v2, 0x0

    .line 272
    .local v2, "flag1":Z
    const/4 v3, 0x0

    .line 274
    .local v3, "flag2":Z
    :try_start_0
    const-string v8, "android.os.ServiceManager"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 276
    .local v0, "ServiceManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v8, "getService"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    const-class v11, Ljava/lang/String;

    aput-object v11, v9, v10

    invoke-virtual {v0, v8, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 277
    .local v4, "method_getService":Ljava/lang/reflect/Method;
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v5, v8, v9

    invoke-virtual {v4, v0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 278
    const/4 v2, 0x1

    .line 283
    .end local v0    # "ServiceManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "method_getService":Ljava/lang/reflect/Method;
    :goto_0
    :try_start_1
    const-string v8, "com.android.internal.telephony.ISms"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 284
    .local v1, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v8, "sendText"

    const/4 v9, 0x5

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    const-class v11, Ljava/lang/String;

    aput-object v11, v9, v10

    const/4 v10, 0x1

    const-class v11, Ljava/lang/String;

    aput-object v11, v9, v10

    const/4 v10, 0x2

    const-class v11, Ljava/lang/String;

    aput-object v11, v9, v10

    const/4 v10, 0x3

    const-class v11, Landroid/app/PendingIntent;

    aput-object v11, v9, v10

    const/4 v10, 0x4

    const-class v11, Landroid/app/PendingIntent;

    aput-object v11, v9, v10

    invoke-virtual {v1, v8, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 285
    const/4 v3, 0x1

    .line 289
    .end local v1    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    if-eqz v2, :cond_0

    if-eqz v3, :cond_0

    .line 292
    :goto_2
    return v6

    :cond_0
    move v6, v7

    goto :goto_2

    .line 286
    :catch_0
    move-exception v8

    goto :goto_1

    .line 279
    :catch_1
    move-exception v8

    goto :goto_0
.end method

.method public testSimSerialNumber()Z
    .locals 1

    .prologue
    .line 240
    const/4 v0, 0x1

    return v0
.end method

.method public testSimState()Z
    .locals 1

    .prologue
    .line 235
    const/4 v0, 0x1

    return v0
.end method

.method public testSubscriberId()Z
    .locals 1

    .prologue
    .line 230
    const/4 v0, 0x1

    return v0
.end method

.method public tstNetworkOperatorName()Z
    .locals 1

    .prologue
    .line 250
    const/4 v0, 0x1

    return v0
.end method
