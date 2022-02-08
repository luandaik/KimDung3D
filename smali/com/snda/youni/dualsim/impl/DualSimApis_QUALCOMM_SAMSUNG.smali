.class public Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG;
.super Ljava/lang/Object;
.source "DualSimApis_QUALCOMM_SAMSUNG.java"

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
    iput-object p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG;->context:Landroid/content/Context;

    .line 21
    return-void
.end method


# virtual methods
.method public getDeviceId(I)Ljava/lang/String;
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 148
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 150
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 152
    const-string v3, "getFirst"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 157
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 158
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 159
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v3

    .line 163
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 155
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 154
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 160
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 163
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getFirstSlotSimId()I
    .locals 1

    .prologue
    .line 349
    const/4 v0, 0x0

    return v0
.end method

.method public getLine1Number(I)Ljava/lang/String;
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 190
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 192
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 193
    const-string v3, "getFirst"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 197
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 198
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 199
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v3

    .line 203
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 195
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 200
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 203
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getNetworkOperator(I)Ljava/lang/String;
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 86
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 88
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 89
    const-string v3, "getFirst"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 93
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 94
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 95
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v3

    .line 99
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 91
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 96
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 99
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getNetworkOperatorName(I)Ljava/lang/String;
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 106
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 108
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 110
    const-string v3, "getFirst"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 115
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 116
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 117
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v3

    .line 121
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 113
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 112
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 118
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 121
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getNetworkType(I)I
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 128
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 130
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 131
    const-string v3, "getFirst"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 135
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 136
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 137
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v3

    .line 141
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return v3

    .line 133
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 138
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 141
    const/4 v3, -0x1

    goto :goto_1
.end method

.method public getSecondSlotSimId()I
    .locals 1

    .prologue
    .line 354
    const/4 v0, 0x1

    return v0
.end method

.method public getSimFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 344
    const-string v0, "phonetype"

    return-object v0
.end method

.method public getSimOperator(I)Ljava/lang/String;
    .locals 6
    .param p1, "simId"    # I

    .prologue
    .line 367
    :try_start_0
    const-string v4, "android.telephony.TelephonyManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 369
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 371
    const-string v4, "getFirst"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 376
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 377
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 378
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v3

    .line 383
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 374
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v4, "getSecondary"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 373
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 380
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v4

    .line 383
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getSimOperatorName(I)Ljava/lang/String;
    .locals 6
    .param p1, "simId"    # I

    .prologue
    .line 390
    :try_start_0
    const-string v4, "android.telephony.TelephonyManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 392
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 394
    const-string v4, "getFirst"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 399
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 400
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 401
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimOperatorName()Ljava/lang/String;

    move-result-object v3

    .line 406
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 397
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v4, "getSecondary"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 396
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 403
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v4

    .line 406
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getSimSerialNumber(I)Ljava/lang/String;
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 67
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 69
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 70
    const-string v3, "getFirst"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 74
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 75
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 76
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimSerialNumber()Ljava/lang/String;

    move-result-object v3

    .line 80
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 72
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 77
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 80
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getSimState(I)I
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 47
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 49
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 50
    const-string v3, "getFirst"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 54
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 55
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 56
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v3

    .line 60
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return v3

    .line 52
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 57
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 60
    const/4 v3, -0x1

    goto :goto_1
.end method

.method public getSubscriberId(I)Ljava/lang/String;
    .locals 6
    .param p1, "simId"    # I

    .prologue
    .line 27
    :try_start_0
    const-string v4, "android.telephony.TelephonyManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 29
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 30
    const-string v4, "getFirst"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 34
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 35
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 36
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v3

    .line 41
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 32
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

    .line 38
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v4

    .line 41
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public needQuerySimIdSperately()Z
    .locals 1

    .prologue
    .line 360
    const/4 v0, 0x0

    return v0
.end method

.method public prepareDualSimApis()V
    .locals 0

    .prologue
    .line 339
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
    .line 172
    const-string v11, "isms"

    .line 173
    .local v11, "service_name":Ljava/lang/String;
    const/4 v1, 0x1

    move/from16 v0, p6

    if-ne v0, v1, :cond_0

    .line 174
    const-string v11, "isms2"

    .line 177
    :cond_0
    :try_start_0
    const-string v1, "android.os.ServiceManager"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    .line 178
    .local v7, "ServiceManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v1, "getService"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v7, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    .line 179
    .local v9, "method_getService":Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v11, v1, v2

    invoke-virtual {v9, v7, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 180
    .local v10, "service":Ljava/lang/Object;
    check-cast v10, Landroid/os/IBinder;

    .end local v10    # "service":Ljava/lang/Object;
    invoke-static {v10}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v8

    .line 181
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

    .line 185
    .end local v7    # "ServiceManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v8    # "localObject":Lcom/android/internal/telephony/ISms;
    .end local v9    # "method_getService":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 182
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public testDeviceId()Z
    .locals 1

    .prologue
    .line 251
    const/4 v0, 0x1

    return v0
.end method

.method public testDualSimApis()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 289
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG;->testPrerequist()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 291
    const/4 v0, 0x0

    .line 292
    .local v0, "count":I
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG;->testSubscriberId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 293
    add-int/lit8 v0, v0, 0x1

    .line 296
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG;->testSimState()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 297
    add-int/lit8 v0, v0, 0x1

    .line 300
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG;->testSimSerialNumber()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 301
    add-int/lit8 v0, v0, 0x1

    .line 304
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG;->testNetworkOperator()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 305
    add-int/lit8 v0, v0, 0x1

    .line 308
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG;->tstNetworkOperatorName()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 309
    add-int/lit8 v0, v0, 0x1

    .line 312
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG;->testNetworkType()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 313
    add-int/lit8 v0, v0, 0x1

    .line 316
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG;->testDeviceId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 317
    add-int/lit8 v0, v0, 0x1

    .line 320
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG;->testLine1Number()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 321
    add-int/lit8 v0, v0, 0x1

    .line 324
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG;->testSendTextMessage()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 325
    add-int/lit8 v0, v0, 0x1

    .line 328
    const/16 v2, 0x9

    if-lt v0, v2, :cond_0

    .line 329
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG;->prepareDualSimApis()V

    .line 330
    const/4 v1, 0x1

    .line 333
    .end local v0    # "count":I
    :cond_0
    return v1
.end method

.method public testLine1Number()Z
    .locals 1

    .prologue
    .line 256
    const/4 v0, 0x1

    return v0
.end method

.method public testNetworkOperator()Z
    .locals 1

    .prologue
    .line 236
    const/4 v0, 0x1

    return v0
.end method

.method public testNetworkType()Z
    .locals 1

    .prologue
    .line 246
    const/4 v0, 0x1

    return v0
.end method

.method public testPrerequist()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 209
    :try_start_0
    const-string v2, "android.telephony.TelephonyManager"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 210
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "getFirst"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 211
    const-string v2, "getSecondary"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 212
    const/4 v1, 0x1

    .line 216
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 213
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public testSendTextMessage()Z
    .locals 12

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 261
    const-string v5, "isms2"

    .line 262
    .local v5, "service_name":Ljava/lang/String;
    const/4 v2, 0x0

    .line 263
    .local v2, "flag1":Z
    const/4 v3, 0x0

    .line 265
    .local v3, "flag2":Z
    :try_start_0
    const-string v8, "android.os.ServiceManager"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 267
    .local v0, "ServiceManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v8, "getService"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    const-class v11, Ljava/lang/String;

    aput-object v11, v9, v10

    invoke-virtual {v0, v8, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 268
    .local v4, "method_getService":Ljava/lang/reflect/Method;
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v5, v8, v9

    invoke-virtual {v4, v0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 269
    const/4 v2, 0x1

    .line 274
    .end local v0    # "ServiceManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "method_getService":Ljava/lang/reflect/Method;
    :goto_0
    :try_start_1
    const-string v8, "com.android.internal.telephony.ISms"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 275
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

    .line 276
    const/4 v3, 0x1

    .line 280
    .end local v1    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    if-eqz v2, :cond_0

    if-eqz v3, :cond_0

    .line 283
    :goto_2
    return v6

    :cond_0
    move v6, v7

    goto :goto_2

    .line 277
    :catch_0
    move-exception v8

    goto :goto_1

    .line 270
    :catch_1
    move-exception v8

    goto :goto_0
.end method

.method public testSimSerialNumber()Z
    .locals 1

    .prologue
    .line 231
    const/4 v0, 0x1

    return v0
.end method

.method public testSimState()Z
    .locals 1

    .prologue
    .line 226
    const/4 v0, 0x1

    return v0
.end method

.method public testSubscriberId()Z
    .locals 1

    .prologue
    .line 221
    const/4 v0, 0x1

    return v0
.end method

.method public tstNetworkOperatorName()Z
    .locals 1

    .prologue
    .line 241
    const/4 v0, 0x1

    return v0
.end method
