.class public Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG3;
.super Ljava/lang/Object;
.source "DualSimApis_QUALCOMM_SAMSUNG3.java"

# interfaces
.implements Lcom/snda/youni/dualsim/DualSimApis;


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG3;->context:Landroid/content/Context;

    .line 20
    return-void
.end method


# virtual methods
.method public getDeviceId(I)Ljava/lang/String;
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 155
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 157
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 159
    const-string v3, "getFirst"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 164
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 165
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 166
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v3

    .line 170
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 162
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 161
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 167
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 170
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getFirstSlotSimId()I
    .locals 1

    .prologue
    .line 359
    const/4 v0, 0x0

    return v0
.end method

.method public getLine1Number(I)Ljava/lang/String;
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 198
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 200
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 202
    const-string v3, "getFirst"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 207
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 208
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 209
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v3

    .line 213
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 205
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 204
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 210
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 213
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getNetworkOperator(I)Ljava/lang/String;
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 89
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 91
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 93
    const-string v3, "getFirst"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 98
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 99
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 100
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v3

    .line 104
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 96
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 95
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 101
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 104
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getNetworkOperatorName(I)Ljava/lang/String;
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 111
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 113
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 115
    const-string v3, "getFirst"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 120
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 121
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 122
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v3

    .line 126
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 118
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 117
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 123
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 126
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getNetworkType(I)I
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 133
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 135
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 137
    const-string v3, "getFirst"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 142
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 143
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 144
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v3

    .line 148
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return v3

    .line 140
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 139
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 145
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 148
    const/4 v3, -0x1

    goto :goto_1
.end method

.method public getSecondSlotSimId()I
    .locals 1

    .prologue
    .line 364
    const/4 v0, 0x1

    return v0
.end method

.method public getSimFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 354
    const-string v0, "phonetype"

    return-object v0
.end method

.method public getSimOperator(I)Ljava/lang/String;
    .locals 6
    .param p1, "simId"    # I

    .prologue
    .line 377
    :try_start_0
    const-string v4, "android.telephony.TelephonyManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 379
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 381
    const-string v4, "getFirst"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 386
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 387
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 388
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v3

    .line 393
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 384
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v4, "getSecondary"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 383
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 390
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v4

    .line 393
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getSimOperatorName(I)Ljava/lang/String;
    .locals 6
    .param p1, "simId"    # I

    .prologue
    .line 399
    :try_start_0
    const-string v4, "android.telephony.TelephonyManager"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 401
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 403
    const-string v4, "getFirst"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 408
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 409
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 410
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimOperatorName()Ljava/lang/String;

    move-result-object v3

    .line 415
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 406
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v4, "getSecondary"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 405
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 412
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v4

    .line 415
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getSimSerialNumber(I)Ljava/lang/String;
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 68
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 70
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 72
    const-string v3, "getFirst"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 77
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 78
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 79
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimSerialNumber()Ljava/lang/String;

    move-result-object v3

    .line 83
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 75
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 74
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 80
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 83
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getSimState(I)I
    .locals 5
    .param p1, "simId"    # I

    .prologue
    .line 46
    :try_start_0
    const-string v3, "android.telephony.TelephonyManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 48
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 50
    const-string v3, "getFirst"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 55
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 56
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 57
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v3

    .line 61
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return v3

    .line 53
    .restart local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const-string v3, "getSecondary"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 52
    .restart local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 58
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 61
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

    .line 29
    const-string v4, "getFirst"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 33
    .local v2, "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_0
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 34
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 35
    .local v1, "instance":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v3

    .line 40
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "instance":Landroid/telephony/TelephonyManager;
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :goto_1
    return-object v3

    .line 31
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

    .line 37
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method_getDefaultGemini":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v4

    .line 40
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public needQuerySimIdSperately()Z
    .locals 1

    .prologue
    .line 370
    const/4 v0, 0x0

    return v0
.end method

.method public prepareDualSimApis()V
    .locals 0

    .prologue
    .line 349
    return-void
.end method

.method public sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;I)V
    .locals 13
    .param p1, "destinationAddress"    # Ljava/lang/String;
    .param p2, "scAddress"    # Ljava/lang/String;
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "sentIntent"    # Landroid/app/PendingIntent;
    .param p5, "deliveryIntent"    # Landroid/app/PendingIntent;
    .param p6, "simId"    # I

    .prologue
    .line 177
    const-string v8, "isms"

    .line 178
    .local v8, "service_name":Ljava/lang/String;
    const/4 v9, 0x1

    move/from16 v0, p6

    if-ne v0, v9, :cond_0

    .line 179
    const-string v8, "isms2"

    .line 182
    :cond_0
    :try_start_0
    const-string v9, "android.os.ServiceManager"

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 183
    .local v1, "ServiceManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v9, "getService"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Class;

    const/4 v11, 0x0

    const-class v12, Ljava/lang/String;

    aput-object v12, v10, v11

    invoke-virtual {v1, v9, v10}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 184
    .local v4, "method_getService":Ljava/lang/reflect/Method;
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v8, v9, v10

    invoke-virtual {v4, v1, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 185
    .local v7, "service":Ljava/lang/Object;
    iget-object v9, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG3;->context:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    .line 186
    .local v6, "package_name":Ljava/lang/String;
    check-cast v7, Landroid/os/IBinder;

    .end local v7    # "service":Ljava/lang/Object;
    invoke-static {v7}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v3

    .line 187
    .local v3, "localObject":Lcom/android/internal/telephony/ISms;
    const-string v9, "com.android.internal.telephony.ISms"

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 188
    .local v2, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v9, "sendText"

    const/4 v10, 0x6

    new-array v10, v10, [Ljava/lang/Class;

    const/4 v11, 0x0

    const-class v12, Ljava/lang/String;

    aput-object v12, v10, v11

    const/4 v11, 0x1

    const-class v12, Ljava/lang/String;

    aput-object v12, v10, v11

    const/4 v11, 0x2

    const-class v12, Ljava/lang/String;

    aput-object v12, v10, v11

    const/4 v11, 0x3

    const-class v12, Ljava/lang/String;

    aput-object v12, v10, v11

    const/4 v11, 0x4

    const-class v12, Landroid/app/PendingIntent;

    aput-object v12, v10, v11

    const/4 v11, 0x5

    const-class v12, Landroid/app/PendingIntent;

    aput-object v12, v10, v11

    invoke-virtual {v2, v9, v10}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 189
    .local v5, "method_sendText":Ljava/lang/reflect/Method;
    const/4 v9, 0x6

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v6, v9, v10

    const/4 v10, 0x1

    aput-object p1, v9, v10

    const/4 v10, 0x2

    aput-object p2, v9, v10

    const/4 v10, 0x3

    aput-object p3, v9, v10

    const/4 v10, 0x4

    aput-object p4, v9, v10

    const/4 v10, 0x5

    aput-object p5, v9, v10

    invoke-virtual {v5, v3, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 193
    .end local v1    # "ServiceManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "localObject":Lcom/android/internal/telephony/ISms;
    .end local v4    # "method_getService":Ljava/lang/reflect/Method;
    .end local v5    # "method_sendText":Ljava/lang/reflect/Method;
    .end local v6    # "package_name":Ljava/lang/String;
    :goto_0
    return-void

    .line 190
    :catch_0
    move-exception v9

    goto :goto_0
.end method

.method public testDeviceId()Z
    .locals 1

    .prologue
    .line 261
    const/4 v0, 0x1

    return v0
.end method

.method public testDualSimApis()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 299
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG3;->testPrerequist()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 301
    const/4 v0, 0x0

    .line 302
    .local v0, "count":I
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG3;->testSubscriberId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 303
    add-int/lit8 v0, v0, 0x1

    .line 306
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG3;->testSimState()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 307
    add-int/lit8 v0, v0, 0x1

    .line 310
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG3;->testSimSerialNumber()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 311
    add-int/lit8 v0, v0, 0x1

    .line 314
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG3;->testNetworkOperator()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 315
    add-int/lit8 v0, v0, 0x1

    .line 318
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG3;->tstNetworkOperatorName()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 319
    add-int/lit8 v0, v0, 0x1

    .line 322
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG3;->testNetworkType()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 323
    add-int/lit8 v0, v0, 0x1

    .line 326
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG3;->testDeviceId()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 327
    add-int/lit8 v0, v0, 0x1

    .line 330
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG3;->testLine1Number()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 331
    add-int/lit8 v0, v0, 0x1

    .line 334
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG3;->testSendTextMessage()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 335
    add-int/lit8 v0, v0, 0x1

    .line 338
    const/16 v2, 0x9

    if-lt v0, v2, :cond_0

    .line 339
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG3;->prepareDualSimApis()V

    .line 340
    const/4 v1, 0x1

    .line 343
    .end local v0    # "count":I
    :cond_0
    return v1
.end method

.method public testLine1Number()Z
    .locals 1

    .prologue
    .line 266
    const/4 v0, 0x1

    return v0
.end method

.method public testNetworkOperator()Z
    .locals 1

    .prologue
    .line 246
    const/4 v0, 0x1

    return v0
.end method

.method public testNetworkType()Z
    .locals 1

    .prologue
    .line 256
    const/4 v0, 0x1

    return v0
.end method

.method public testPrerequist()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 219
    :try_start_0
    const-string v2, "android.telephony.TelephonyManager"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 220
    .local v0, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "getFirst"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 221
    const-string v2, "getSecondary"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    const/4 v1, 0x1

    .line 226
    .end local v0    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v1

    .line 223
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public testSendTextMessage()Z
    .locals 12

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 271
    const-string v5, "isms2"

    .line 272
    .local v5, "service_name":Ljava/lang/String;
    const/4 v2, 0x0

    .line 273
    .local v2, "flag1":Z
    const/4 v3, 0x0

    .line 275
    .local v3, "flag2":Z
    :try_start_0
    const-string v8, "android.os.ServiceManager"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 277
    .local v0, "ServiceManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v8, "getService"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    const-class v11, Ljava/lang/String;

    aput-object v11, v9, v10

    invoke-virtual {v0, v8, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 278
    .local v4, "method_getService":Ljava/lang/reflect/Method;
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v5, v8, v9

    invoke-virtual {v4, v0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 279
    const/4 v2, 0x1

    .line 284
    .end local v0    # "ServiceManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "method_getService":Ljava/lang/reflect/Method;
    :goto_0
    :try_start_1
    const-string v8, "com.android.internal.telephony.ISms"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 285
    .local v1, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v8, "sendText"

    const/4 v9, 0x6

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

    const-class v11, Ljava/lang/String;

    aput-object v11, v9, v10

    const/4 v10, 0x4

    const-class v11, Landroid/app/PendingIntent;

    aput-object v11, v9, v10

    const/4 v10, 0x5

    const-class v11, Landroid/app/PendingIntent;

    aput-object v11, v9, v10

    invoke-virtual {v1, v8, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 286
    const/4 v3, 0x1

    .line 290
    .end local v1    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    if-eqz v2, :cond_0

    if-eqz v3, :cond_0

    .line 293
    :goto_2
    return v6

    :cond_0
    move v6, v7

    goto :goto_2

    .line 287
    :catch_0
    move-exception v8

    goto :goto_1

    .line 280
    :catch_1
    move-exception v8

    goto :goto_0
.end method

.method public testSimSerialNumber()Z
    .locals 1

    .prologue
    .line 241
    const/4 v0, 0x1

    return v0
.end method

.method public testSimState()Z
    .locals 1

    .prologue
    .line 236
    const/4 v0, 0x1

    return v0
.end method

.method public testSubscriberId()Z
    .locals 1

    .prologue
    .line 231
    const/4 v0, 0x1

    return v0
.end method

.method public tstNetworkOperatorName()Z
    .locals 1

    .prologue
    .line 251
    const/4 v0, 0x1

    return v0
.end method
