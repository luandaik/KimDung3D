.class public Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;
.super Ljava/lang/Object;
.source "DualSimApis_Standard_Default.java"

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
    iput-object p1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;->context:Landroid/content/Context;

    .line 19
    return-void
.end method


# virtual methods
.method public getDeviceId(I)Ljava/lang/String;
    .locals 3
    .param p1, "simId"    # I

    .prologue
    .line 59
    iget-object v1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;->context:Landroid/content/Context;

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 60
    .local v0, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getFirstSlotSimId()I
    .locals 1

    .prologue
    .line 165
    const/4 v0, 0x0

    return v0
.end method

.method public getLine1Number(I)Ljava/lang/String;
    .locals 3
    .param p1, "simId"    # I

    .prologue
    .line 65
    iget-object v1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;->context:Landroid/content/Context;

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 66
    .local v0, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getNetworkOperator(I)Ljava/lang/String;
    .locals 3
    .param p1, "simId"    # I

    .prologue
    .line 41
    iget-object v1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;->context:Landroid/content/Context;

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 42
    .local v0, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getNetworkOperatorName(I)Ljava/lang/String;
    .locals 3
    .param p1, "simId"    # I

    .prologue
    .line 47
    iget-object v1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;->context:Landroid/content/Context;

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 48
    .local v0, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getNetworkType(I)I
    .locals 3
    .param p1, "simId"    # I

    .prologue
    .line 53
    iget-object v1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;->context:Landroid/content/Context;

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 54
    .local v0, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v1

    return v1
.end method

.method public getSecondSlotSimId()I
    .locals 1

    .prologue
    .line 170
    const/4 v0, 0x0

    return v0
.end method

.method public getSimFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 160
    const-string v0, "sim_id"

    return-object v0
.end method

.method public getSimOperator(I)Ljava/lang/String;
    .locals 3
    .param p1, "simId"    # I

    .prologue
    .line 181
    iget-object v1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;->context:Landroid/content/Context;

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 182
    .local v0, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getSimOperatorName(I)Ljava/lang/String;
    .locals 3
    .param p1, "simId"    # I

    .prologue
    .line 187
    iget-object v1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;->context:Landroid/content/Context;

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 188
    .local v0, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimOperatorName()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getSimSerialNumber(I)Ljava/lang/String;
    .locals 3
    .param p1, "simId"    # I

    .prologue
    .line 35
    iget-object v1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;->context:Landroid/content/Context;

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 36
    .local v0, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimSerialNumber()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getSimState(I)I
    .locals 3
    .param p1, "simId"    # I

    .prologue
    .line 29
    iget-object v1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;->context:Landroid/content/Context;

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 30
    .local v0, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v1

    return v1
.end method

.method public getSubscriberId(I)Ljava/lang/String;
    .locals 3
    .param p1, "simId"    # I

    .prologue
    .line 23
    iget-object v1, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;->context:Landroid/content/Context;

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 24
    .local v0, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public needQuerySimIdSperately()Z
    .locals 1

    .prologue
    .line 176
    const/4 v0, 0x0

    return v0
.end method

.method public prepareDualSimApis()V
    .locals 0

    .prologue
    .line 151
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
    .line 78
    const-string v8, "isms"

    .line 79
    .local v8, "service_name":Ljava/lang/String;
    const/4 v9, 0x1

    move/from16 v0, p6

    if-ne v0, v9, :cond_0

    .line 80
    const-string v8, "isms2"

    .line 83
    :cond_0
    :try_start_0
    const-string v9, "android.os.ServiceManager"

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 85
    .local v1, "ServiceManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v9, "getService"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Class;

    const/4 v11, 0x0

    const-class v12, Ljava/lang/String;

    aput-object v12, v10, v11

    invoke-virtual {v1, v9, v10}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 86
    .local v4, "method_getService":Ljava/lang/reflect/Method;
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v8, v9, v10

    invoke-virtual {v4, v1, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 88
    .local v7, "service":Ljava/lang/Object;
    iget-object v9, p0, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;->context:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    .line 89
    .local v6, "package_name":Ljava/lang/String;
    check-cast v7, Landroid/os/IBinder;

    .end local v7    # "service":Ljava/lang/Object;
    invoke-static {v7}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v3

    .line 90
    .local v3, "localObject":Lcom/android/internal/telephony/ISms;
    const-string v9, "com.android.internal.telephony.ISms"

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 91
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

    .line 92
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

    .line 96
    .end local v1    # "ServiceManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "localObject":Lcom/android/internal/telephony/ISms;
    .end local v4    # "method_getService":Ljava/lang/reflect/Method;
    .end local v5    # "method_sendText":Ljava/lang/reflect/Method;
    .end local v6    # "package_name":Ljava/lang/String;
    :goto_0
    return-void

    .line 93
    :catch_0
    move-exception v9

    goto :goto_0
.end method

.method public testDeviceId()Z
    .locals 1

    .prologue
    .line 135
    const/4 v0, 0x0

    return v0
.end method

.method public testDualSimApis()Z
    .locals 1

    .prologue
    .line 144
    invoke-virtual {p0}, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;->prepareDualSimApis()V

    .line 145
    const/4 v0, 0x1

    return v0
.end method

.method public testLine1Number()Z
    .locals 1

    .prologue
    .line 140
    const/4 v0, 0x0

    return v0
.end method

.method public testNetworkOperator()Z
    .locals 1

    .prologue
    .line 120
    const/4 v0, 0x0

    return v0
.end method

.method public testNetworkType()Z
    .locals 1

    .prologue
    .line 130
    const/4 v0, 0x0

    return v0
.end method

.method public testPrerequist()Z
    .locals 1

    .prologue
    .line 100
    const/4 v0, 0x0

    return v0
.end method

.method public testSendTextMessage()Z
    .locals 1

    .prologue
    .line 155
    const/4 v0, 0x0

    return v0
.end method

.method public testSimSerialNumber()Z
    .locals 1

    .prologue
    .line 115
    const/4 v0, 0x0

    return v0
.end method

.method public testSimState()Z
    .locals 1

    .prologue
    .line 110
    const/4 v0, 0x0

    return v0
.end method

.method public testSubscriberId()Z
    .locals 1

    .prologue
    .line 105
    const/4 v0, 0x0

    return v0
.end method

.method public tstNetworkOperatorName()Z
    .locals 1

    .prologue
    .line 125
    const/4 v0, 0x0

    return v0
.end method
