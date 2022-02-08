.class public Lcom/heitao/common/HTDevice;
.super Ljava/lang/Object;
.source "HTDevice.java"


# static fields
.field private static mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/common/HTDataCenter;->mContext:Landroid/content/Context;

    sput-object v0, Lcom/heitao/common/HTDevice;->mContext:Landroid/content/Context;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAndroidId()Ljava/lang/String;
    .locals 4

    .prologue
    .line 287
    const-string v1, ""

    .line 290
    .local v1, "ret":Ljava/lang/String;
    :try_start_0
    sget-object v2, Lcom/heitao/common/HTDevice;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "android_id"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 297
    :goto_0
    return-object v1

    .line 292
    :catch_0
    move-exception v0

    .line 295
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, ""

    goto :goto_0
.end method

.method public static getCarrierType()Ljava/lang/String;
    .locals 5

    .prologue
    .line 258
    const-string v1, "unknown"

    .line 259
    .local v1, "carrierType":Ljava/lang/String;
    sget-object v3, Lcom/heitao/common/HTDevice;->mContext:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 260
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    .line 279
    :cond_0
    :goto_0
    return-object v1

    .line 265
    :cond_1
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v0

    .line 266
    .local v0, "IMSI":Ljava/lang/String;
    const-string v3, "46000"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "46002"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "46007"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "46020"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 268
    :cond_2
    const-string v1, "\u4e2d\u56fd\u79fb\u52a8"

    goto :goto_0

    .line 270
    :cond_3
    const-string v3, "46001"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4

    const-string v3, "46006"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 272
    :cond_4
    const-string v1, "\u4e2d\u56fd\u8054\u901a"

    goto :goto_0

    .line 274
    :cond_5
    const-string v3, "46003"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    const-string v3, "46005"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    const-string v3, "46011"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 276
    :cond_6
    const-string v1, "\u4e2d\u56fd\u7535\u4fe1"

    goto :goto_0
.end method

.method public static getDeviceId()Ljava/lang/String;
    .locals 5

    .prologue
    .line 26
    sget-object v3, Lcom/heitao/common/HTDevice;->mContext:Landroid/content/Context;

    if-nez v3, :cond_1

    .line 28
    const-string v3, "\u83b7\u53d6\u8bbe\u5907ID Context\u4e3a\u7a7a"

    invoke-static {v3}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 29
    const/4 v0, 0x0

    .line 57
    .local v0, "deviceId":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v0

    .line 32
    .end local v0    # "deviceId":Ljava/lang/String;
    :cond_1
    const/4 v0, 0x0

    .line 35
    .restart local v0    # "deviceId":Ljava/lang/String;
    :try_start_0
    sget-object v3, Lcom/heitao/common/HTDevice;->mContext:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 36
    .local v2, "manager":Landroid/telephony/TelephonyManager;
    if-eqz v2, :cond_2

    .line 38
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    .line 41
    :cond_2
    invoke-static {v0}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 43
    invoke-static {}, Lcom/heitao/openudid/HTOpenUDID_manager;->getOpenUDID()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 52
    .end local v2    # "manager":Landroid/telephony/TelephonyManager;
    :cond_3
    :goto_1
    invoke-static {v0}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 54
    const-string v0, "default_device_id"

    goto :goto_0

    .line 46
    :catch_0
    move-exception v1

    .line 49
    .local v1, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public static getIPAddress()Ljava/lang/String;
    .locals 6

    .prologue
    .line 95
    const/4 v2, 0x0

    .line 98
    .local v2, "ipAddress":Ljava/lang/String;
    :try_start_0
    sget-object v4, Lcom/heitao/common/HTDevice;->mContext:Landroid/content/Context;

    const-string v5, "wifi"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/wifi/WifiManager;

    .line 106
    .local v3, "wifi":Landroid/net/wifi/WifiManager;
    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v1

    .line 107
    .local v1, "info":Landroid/net/wifi/WifiInfo;
    invoke-virtual {v1}, Landroid/net/wifi/WifiInfo;->getIpAddress()I

    move-result v4

    invoke-static {v4}, Lcom/heitao/common/HTDevice;->intToIp(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 115
    .end local v1    # "info":Landroid/net/wifi/WifiInfo;
    .end local v3    # "wifi":Landroid/net/wifi/WifiManager;
    :goto_0
    return-object v2

    .line 109
    :catch_0
    move-exception v0

    .line 112
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getMacAddress()Ljava/lang/String;
    .locals 6

    .prologue
    .line 66
    const/4 v2, 0x0

    .line 69
    .local v2, "macAddress":Ljava/lang/String;
    :try_start_0
    sget-object v4, Lcom/heitao/common/HTDevice;->mContext:Landroid/content/Context;

    const-string v5, "wifi"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/wifi/WifiManager;

    .line 77
    .local v3, "wifi":Landroid/net/wifi/WifiManager;
    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v1

    .line 78
    .local v1, "info":Landroid/net/wifi/WifiInfo;
    invoke-virtual {v1}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 86
    .end local v1    # "info":Landroid/net/wifi/WifiInfo;
    .end local v3    # "wifi":Landroid/net/wifi/WifiManager;
    :goto_0
    return-object v2

    .line 80
    :catch_0
    move-exception v0

    .line 83
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getNetworkType()Ljava/lang/String;
    .locals 7

    .prologue
    .line 199
    const-string v4, "unknown"

    .line 200
    .local v4, "strNetworkType":Ljava/lang/String;
    sget-object v5, Lcom/heitao/common/HTDevice;->mContext:Landroid/content/Context;

    const-string v6, "connectivity"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 201
    .local v1, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    .line 202
    .local v2, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 204
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1

    .line 206
    const-string v4, "wifi"

    .line 250
    :cond_0
    :goto_0
    return-object v4

    .line 208
    :cond_1
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v5

    if-nez v5, :cond_0

    .line 210
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getSubtypeName()Ljava/lang/String;

    move-result-object v0

    .line 211
    .local v0, "_strSubTypeName":Ljava/lang/String;
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v3

    .line 212
    .local v3, "networkType":I
    packed-switch v3, :pswitch_data_0

    .line 236
    const-string v5, "TD-SCDMA"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, "WCDMA"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, "CDMA2000"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 240
    :cond_2
    const-string v4, "3g"

    goto :goto_0

    .line 219
    :pswitch_0
    const-string v4, "2g"

    .line 220
    goto :goto_0

    .line 230
    :pswitch_1
    const-string v4, "3g"

    .line 231
    goto :goto_0

    .line 233
    :pswitch_2
    const-string v4, "4g"

    .line 234
    goto :goto_0

    .line 244
    :cond_3
    move-object v4, v0

    goto :goto_0

    .line 212
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public static getOpenUDID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 305
    invoke-static {}, Lcom/heitao/openudid/HTOpenUDID_manager;->getOpenUDID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPhoneNumber()Ljava/lang/String;
    .locals 10

    .prologue
    .line 132
    sget-object v8, Lcom/heitao/common/HTDevice;->mContext:Landroid/content/Context;

    if-nez v8, :cond_1

    .line 134
    const-string v8, "\u83b7\u53d6\u8bbe\u5907ID Context\u4e3a\u7a7a"

    invoke-static {v8}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 135
    const-string v4, ""

    .line 178
    .local v4, "phoneNumber":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v4

    .line 138
    .end local v4    # "phoneNumber":Ljava/lang/String;
    :cond_1
    const-string v4, ""

    .line 141
    .restart local v4    # "phoneNumber":Ljava/lang/String;
    :try_start_0
    sget-object v8, Lcom/heitao/common/HTDevice;->mContext:Landroid/content/Context;

    const-string v9, "phone"

    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    .line 142
    .local v3, "manager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v3}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v4

    .line 144
    invoke-static {v4}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 146
    const-string v4, ""
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    .end local v3    # "manager":Landroid/telephony/TelephonyManager;
    :cond_2
    :goto_1
    invoke-static {v4}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 157
    const-string v5, "hfvtrwjolm"

    .line 158
    .local v5, "ref":Ljava/lang/String;
    const-string v6, ""

    .line 160
    .local v6, "result":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v2, v8, :cond_3

    .line 162
    invoke-virtual {v4, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 165
    .local v0, "c":C
    :try_start_1
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .line 166
    .local v7, "value":I
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v5, v7}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v6

    .line 160
    .end local v7    # "value":I
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 149
    .end local v0    # "c":C
    .end local v2    # "i":I
    .end local v5    # "ref":Ljava/lang/String;
    .end local v6    # "result":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 152
    .local v1, "e":Ljava/lang/Exception;
    const-string v4, ""

    goto :goto_1

    .line 168
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "c":C
    .restart local v2    # "i":I
    .restart local v5    # "ref":Ljava/lang/String;
    .restart local v6    # "result":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 171
    .restart local v1    # "e":Ljava/lang/Exception;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_3

    .line 175
    .end local v0    # "c":C
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_3
    move-object v4, v6

    goto :goto_0
.end method

.method public static getResolution()Ljava/lang/String;
    .locals 6

    .prologue
    .line 184
    sget-object v4, Lcom/heitao/common/HTDevice;->mContext:Landroid/content/Context;

    if-nez v4, :cond_0

    .line 186
    const-string v4, "\u83b7\u53d6\u8bbe\u5907\u5c4f\u5e55\u5c3a\u5bf8 Context\u4e3a\u7a7a"

    invoke-static {v4}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 187
    const-string v4, ""

    .line 194
    .local v0, "display":Landroid/view/Display;
    .local v1, "screenHeight":I
    .local v2, "screenWidth":I
    .local v3, "windowManager":Landroid/view/WindowManager;
    :goto_0
    return-object v4

    .line 190
    .end local v0    # "display":Landroid/view/Display;
    .end local v1    # "screenHeight":I
    .end local v2    # "screenWidth":I
    .end local v3    # "windowManager":Landroid/view/WindowManager;
    :cond_0
    sget-object v4, Lcom/heitao/common/HTDevice;->mContext:Landroid/content/Context;

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v3

    .line 191
    .restart local v3    # "windowManager":Landroid/view/WindowManager;
    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 192
    .restart local v0    # "display":Landroid/view/Display;
    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v2

    .line 193
    .restart local v2    # "screenWidth":I
    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v1

    .line 194
    .restart local v1    # "screenHeight":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "*"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0
.end method

.method private static intToIp(I)Ljava/lang/String;
    .locals 2
    .param p0, "i"    # I

    .prologue
    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    and-int/lit16 v1, p0, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    shr-int/lit8 v1, p0, 0x10

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    shr-int/lit8 v1, p0, 0x18

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
