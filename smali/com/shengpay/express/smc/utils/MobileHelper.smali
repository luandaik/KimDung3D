.class public Lcom/shengpay/express/smc/utils/MobileHelper;
.super Ljava/lang/Object;
.source "MobileHelper.java"


# static fields
.field public static final CDMA:Ljava/lang/String; = "cdma"

.field public static final EDGE:Ljava/lang/String; = "edge"

.field public static final EHRPD:Ljava/lang/String; = "ehrpd"

.field public static final GPRS:Ljava/lang/String; = "gprs"

.field public static final GSM:Ljava/lang/String; = "gsm"

.field public static final HSDPA:Ljava/lang/String; = "hsdpa"

.field public static final HSPA:Ljava/lang/String; = "hspa"

.field public static final HSPA_PLUS:Ljava/lang/String; = "hspa+"

.field public static final HSUPA:Ljava/lang/String; = "hsupa"

.field public static final LTE:Ljava/lang/String; = "lte"

.field public static final MOBILE:Ljava/lang/String; = "mobile"

.field public static final ONEXRTT:Ljava/lang/String; = "1xrtt"

.field private static final TAG:Ljava/lang/String; = "MobileHelper"

.field public static final UMB:Ljava/lang/String; = "umb"

.field public static final UMTS:Ljava/lang/String; = "umts"

.field public static final WIFI:Ljava/lang/String; = "wifi"

.field public static final WIMAX:Ljava/lang/String; = "wimax"

.field private static instance:Lcom/shengpay/express/smc/utils/MobileHelper; = null

.field public static isDouble:Z = false

.field private static final kSystemRootStateDisable:I = 0x0

.field private static final kSystemRootStateEnable:I = 0x1

.field private static final kSystemRootStateUnknow:I = -0x1

.field private static systemRootState:I


# instance fields
.field private agent:Lcom/snda/youni/dualsim/DualSimAgent;

.field private cm:Landroid/net/ConnectivityManager;

.field private context:Landroid/app/Activity;

.field private openWifi:Z

.field private preferences:Landroid/content/SharedPreferences;

.field private tm:Landroid/telephony/TelephonyManager;

.field private wifiMan:Landroid/net/wifi/WifiManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const/4 v0, -0x1

    sput v0, Lcom/shengpay/express/smc/utils/MobileHelper;->systemRootState:I

    .line 60
    const/4 v0, 0x0

    sput-boolean v0, Lcom/shengpay/express/smc/utils/MobileHelper;->isDouble:Z

    return-void
.end method

.method private constructor <init>(Landroid/app/Activity;)V
    .locals 2
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    const/4 v1, 0x0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-boolean v1, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->openWifi:Z

    .line 65
    iput-object p1, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->context:Landroid/app/Activity;

    .line 66
    const-string v0, "wifi"

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    iput-object v0, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->wifiMan:Landroid/net/wifi/WifiManager;

    .line 68
    const-string v0, "phone"

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 67
    iput-object v0, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->tm:Landroid/telephony/TelephonyManager;

    .line 69
    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iput-object v0, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->cm:Landroid/net/ConnectivityManager;

    .line 70
    const-string v0, "smc_device_info"

    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->preferences:Landroid/content/SharedPreferences;

    .line 72
    new-instance v0, Lcom/snda/youni/dualsim/DualSimAgent;

    invoke-direct {v0, p1}, Lcom/snda/youni/dualsim/DualSimAgent;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->agent:Lcom/snda/youni/dualsim/DualSimAgent;

    .line 73
    iget-object v0, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->agent:Lcom/snda/youni/dualsim/DualSimAgent;

    invoke-virtual {v0}, Lcom/snda/youni/dualsim/DualSimAgent;->isSupportedDualSim()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 74
    const/4 v0, 0x1

    sput-boolean v0, Lcom/shengpay/express/smc/utils/MobileHelper;->isDouble:Z

    .line 75
    const-string v0, "MobileHelper double cards"

    invoke-static {v0}, Lcom/shengpay/express/smc/utils/Logger;->d(Ljava/lang/String;)V

    .line 77
    :cond_0
    return-void
.end method

.method private check(Ljava/lang/String;)Z
    .locals 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 209
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 210
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v0, v2, :cond_1

    .line 217
    .end local v0    # "i":I
    :cond_0
    const/4 v2, 0x0

    :goto_1
    return v2

    .line 211
    .restart local v0    # "i":I
    :cond_1
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 212
    .local v1, "temp":C
    const/16 v2, 0x30

    if-eq v1, v2, :cond_2

    .line 213
    const/4 v2, 0x1

    goto :goto_1

    .line 210
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private getIMEI()Ljava/lang/String;
    .locals 8

    .prologue
    .line 187
    iget-object v4, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->tm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    .line 188
    .local v1, "imei":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/shengpay/express/smc/utils/MobileHelper;->check(Ljava/lang/String;)Z

    move-result v3

    .line 189
    .local v3, "isImei":Z
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 190
    invoke-direct {p0, v1}, Lcom/shengpay/express/smc/utils/MobileHelper;->check(Ljava/lang/String;)Z

    move-result v3

    .line 191
    if-eqz v3, :cond_0

    move-object v2, v1

    .line 205
    .end local v1    # "imei":Ljava/lang/String;
    .local v2, "imei":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 195
    .end local v2    # "imei":Ljava/lang/String;
    .restart local v1    # "imei":Ljava/lang/String;
    :cond_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    if-nez v3, :cond_2

    .line 196
    :cond_1
    const-string v4, ""

    iget-object v5, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->preferences:Landroid/content/SharedPreferences;

    const-string v6, "imei"

    const-string v7, ""

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 197
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "-"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 198
    iget-object v4, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 199
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v4, "imei"

    invoke-interface {v0, v4, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 200
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_2
    :goto_1
    move-object v2, v1

    .line 205
    .end local v1    # "imei":Ljava/lang/String;
    .restart local v2    # "imei":Ljava/lang/String;
    goto :goto_0

    .line 202
    .end local v2    # "imei":Ljava/lang/String;
    .restart local v1    # "imei":Ljava/lang/String;
    :cond_3
    iget-object v4, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->preferences:Landroid/content/SharedPreferences;

    const-string v5, "imei"

    const-string v6, ""

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method

.method public static getInstance(Landroid/app/Activity;)Lcom/shengpay/express/smc/utils/MobileHelper;
    .locals 1
    .param p0, "context"    # Landroid/app/Activity;

    .prologue
    .line 80
    sget-object v0, Lcom/shengpay/express/smc/utils/MobileHelper;->instance:Lcom/shengpay/express/smc/utils/MobileHelper;

    if-nez v0, :cond_0

    .line 81
    new-instance v0, Lcom/shengpay/express/smc/utils/MobileHelper;

    invoke-direct {v0, p0}, Lcom/shengpay/express/smc/utils/MobileHelper;-><init>(Landroid/app/Activity;)V

    sput-object v0, Lcom/shengpay/express/smc/utils/MobileHelper;->instance:Lcom/shengpay/express/smc/utils/MobileHelper;

    .line 83
    :cond_0
    sget-object v0, Lcom/shengpay/express/smc/utils/MobileHelper;->instance:Lcom/shengpay/express/smc/utils/MobileHelper;

    return-object v0
.end method

.method private getResolution()Ljava/lang/String;
    .locals 5

    .prologue
    .line 176
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 177
    .local v0, "displaymetrics":Landroid/util/DisplayMetrics;
    iget-object v3, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->context:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 178
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 179
    .local v1, "height":I
    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 180
    .local v2, "width":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private getWifiMac()Ljava/lang/String;
    .locals 1

    .prologue
    .line 221
    iget-object v0, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->wifiMan:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isRootSystem()Z
    .locals 8

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 244
    sget v6, Lcom/shengpay/express/smc/utils/MobileHelper;->systemRootState:I

    if-ne v6, v4, :cond_0

    .line 264
    .local v0, "f":Ljava/io/File;
    .local v2, "i":I
    .local v3, "kSuSearchPaths":[Ljava/lang/String;
    :goto_0
    return v4

    .line 246
    .end local v0    # "f":Ljava/io/File;
    .end local v2    # "i":I
    .end local v3    # "kSuSearchPaths":[Ljava/lang/String;
    :cond_0
    sget v6, Lcom/shengpay/express/smc/utils/MobileHelper;->systemRootState:I

    if-nez v6, :cond_1

    move v4, v5

    .line 248
    goto :goto_0

    .line 250
    :cond_1
    const/4 v0, 0x0

    .line 251
    .restart local v0    # "f":Ljava/io/File;
    const/4 v6, 0x5

    new-array v3, v6, [Ljava/lang/String;

    const-string v6, "/system/bin/"

    aput-object v6, v3, v5

    const-string v6, "/system/xbin/"

    aput-object v6, v3, v4

    const/4 v6, 0x2

    .line 252
    const-string v7, "/system/sbin/"

    aput-object v7, v3, v6

    const/4 v6, 0x3

    const-string v7, "/sbin/"

    aput-object v7, v3, v6

    const/4 v6, 0x4

    const-string v7, "/vendor/bin/"

    aput-object v7, v3, v6

    .line 254
    .restart local v3    # "kSuSearchPaths":[Ljava/lang/String;
    const/4 v2, 0x0

    .restart local v2    # "i":I
    move-object v1, v0

    .end local v0    # "f":Ljava/io/File;
    .local v1, "f":Ljava/io/File;
    :goto_1
    :try_start_0
    array-length v6, v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-lt v2, v6, :cond_2

    move-object v0, v1

    .line 263
    .end local v1    # "f":Ljava/io/File;
    .restart local v0    # "f":Ljava/io/File;
    :goto_2
    sput v5, Lcom/shengpay/express/smc/utils/MobileHelper;->systemRootState:I

    move v4, v5

    .line 264
    goto :goto_0

    .line 255
    .end local v0    # "f":Ljava/io/File;
    .restart local v1    # "f":Ljava/io/File;
    :cond_2
    :try_start_1
    new-instance v0, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    aget-object v7, v3, v2

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "su"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 256
    .end local v1    # "f":Ljava/io/File;
    .restart local v0    # "f":Ljava/io/File;
    if-eqz v0, :cond_3

    :try_start_2
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 257
    const/4 v6, 0x1

    sput v6, Lcom/shengpay/express/smc/utils/MobileHelper;->systemRootState:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 261
    :catch_0
    move-exception v4

    goto :goto_2

    .line 254
    :cond_3
    add-int/lit8 v2, v2, 0x1

    move-object v1, v0

    .end local v0    # "f":Ljava/io/File;
    .restart local v1    # "f":Ljava/io/File;
    goto :goto_1

    .line 261
    :catch_1
    move-exception v4

    move-object v0, v1

    .end local v1    # "f":Ljava/io/File;
    .restart local v0    # "f":Ljava/io/File;
    goto :goto_2
.end method


# virtual methods
.method public getDeviceInfo()Lcom/shengpay/express/smc/vo/MobileInfo;
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 132
    new-instance v3, Lcom/shengpay/express/smc/vo/MobileInfo;

    invoke-direct {v3}, Lcom/shengpay/express/smc/vo/MobileInfo;-><init>()V

    .line 134
    .local v3, "mobileInfo":Lcom/shengpay/express/smc/vo/MobileInfo;
    iget-object v7, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->agent:Lcom/snda/youni/dualsim/DualSimAgent;

    invoke-virtual {v7, v8}, Lcom/snda/youni/dualsim/DualSimAgent;->getDeviceId(I)Ljava/lang/String;

    move-result-object v0

    .line 135
    .local v0, "imei":Ljava/lang/String;
    invoke-static {v0}, Lcom/shengpay/express/smc/utils/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 136
    iget-object v7, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->agent:Lcom/snda/youni/dualsim/DualSimAgent;

    invoke-virtual {v7, v9}, Lcom/snda/youni/dualsim/DualSimAgent;->getDeviceId(I)Ljava/lang/String;

    move-result-object v0

    .line 137
    invoke-static {v0}, Lcom/shengpay/express/smc/utils/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 138
    invoke-direct {p0}, Lcom/shengpay/express/smc/utils/MobileHelper;->getIMEI()Ljava/lang/String;

    move-result-object v0

    .line 141
    :cond_0
    invoke-virtual {v3, v0}, Lcom/shengpay/express/smc/vo/MobileInfo;->setImei(Ljava/lang/String;)V

    .line 142
    invoke-direct {p0}, Lcom/shengpay/express/smc/utils/MobileHelper;->getWifiMac()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/shengpay/express/smc/vo/MobileInfo;->setWifiMac(Ljava/lang/String;)V

    .line 143
    iget-object v7, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->agent:Lcom/snda/youni/dualsim/DualSimAgent;

    invoke-virtual {v7, v8}, Lcom/snda/youni/dualsim/DualSimAgent;->getSubscriberId(I)Ljava/lang/String;

    move-result-object v1

    .line 144
    .local v1, "imsi1":Ljava/lang/String;
    if-nez v1, :cond_3

    const-string v7, ""

    :goto_0
    invoke-virtual {v3, v7}, Lcom/shengpay/express/smc/vo/MobileInfo;->setImsi1(Ljava/lang/String;)V

    .line 145
    iget-object v7, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->agent:Lcom/snda/youni/dualsim/DualSimAgent;

    invoke-virtual {v7, v9}, Lcom/snda/youni/dualsim/DualSimAgent;->getSubscriberId(I)Ljava/lang/String;

    move-result-object v2

    .line 146
    .local v2, "imsi2":Ljava/lang/String;
    if-nez v2, :cond_4

    const-string v7, ""

    :goto_1
    invoke-virtual {v3, v7}, Lcom/shengpay/express/smc/vo/MobileInfo;->setImsi2(Ljava/lang/String;)V

    .line 147
    invoke-static {v1}, Lcom/shengpay/express/smc/utils/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 148
    iget-object v7, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->tm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v7}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_5

    const-string v7, ""

    :goto_2
    invoke-virtual {v3, v7}, Lcom/shengpay/express/smc/vo/MobileInfo;->setImsi1(Ljava/lang/String;)V

    .line 149
    invoke-virtual {v3}, Lcom/shengpay/express/smc/vo/MobileInfo;->getImsi1()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/shengpay/express/smc/utils/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    invoke-virtual {v3}, Lcom/shengpay/express/smc/vo/MobileInfo;->getImsi2()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/shengpay/express/smc/utils/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 150
    sput-boolean v8, Lcom/shengpay/express/smc/utils/MobileHelper;->isDouble:Z

    .line 151
    const-string v7, "MobileHelper single card **********"

    invoke-static {v7}, Lcom/shengpay/express/smc/utils/Logger;->d(Ljava/lang/String;)V

    .line 158
    :cond_1
    :goto_3
    iget-object v7, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->tm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v7}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v4

    .line 159
    .local v4, "phoneNo":Ljava/lang/String;
    iget-object v7, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->agent:Lcom/snda/youni/dualsim/DualSimAgent;

    invoke-virtual {v7, v8}, Lcom/snda/youni/dualsim/DualSimAgent;->getLine1Number(I)Ljava/lang/String;

    move-result-object v5

    .line 160
    .local v5, "phoneNo1":Ljava/lang/String;
    invoke-virtual {v3, v5}, Lcom/shengpay/express/smc/vo/MobileInfo;->setPhoneNo1(Ljava/lang/String;)V

    .line 161
    iget-object v7, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->agent:Lcom/snda/youni/dualsim/DualSimAgent;

    invoke-virtual {v7, v9}, Lcom/snda/youni/dualsim/DualSimAgent;->getLine1Number(I)Ljava/lang/String;

    move-result-object v6

    .line 162
    .local v6, "phoneNo2":Ljava/lang/String;
    invoke-virtual {v3, v6}, Lcom/shengpay/express/smc/vo/MobileInfo;->setPhoneNo2(Ljava/lang/String;)V

    .line 163
    invoke-static {v5}, Lcom/shengpay/express/smc/utils/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 164
    iget-object v7, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->tm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v7}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_7

    const-string v7, ""

    :goto_4
    invoke-virtual {v3, v7}, Lcom/shengpay/express/smc/vo/MobileInfo;->setPhoneNo1(Ljava/lang/String;)V

    .line 170
    :cond_2
    :goto_5
    sget-object v7, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v3, v7}, Lcom/shengpay/express/smc/vo/MobileInfo;->setModel(Ljava/lang/String;)V

    .line 171
    sget-object v7, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v3, v7}, Lcom/shengpay/express/smc/vo/MobileInfo;->setBrand(Ljava/lang/String;)V

    .line 172
    return-object v3

    .end local v2    # "imsi2":Ljava/lang/String;
    .end local v4    # "phoneNo":Ljava/lang/String;
    .end local v5    # "phoneNo1":Ljava/lang/String;
    .end local v6    # "phoneNo2":Ljava/lang/String;
    :cond_3
    move-object v7, v1

    .line 144
    goto :goto_0

    .restart local v2    # "imsi2":Ljava/lang/String;
    :cond_4
    move-object v7, v2

    .line 146
    goto :goto_1

    .line 148
    :cond_5
    iget-object v7, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->tm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v7}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v7

    goto :goto_2

    .line 153
    :cond_6
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 154
    const-string v7, ""

    invoke-virtual {v3, v7}, Lcom/shengpay/express/smc/vo/MobileInfo;->setImsi2(Ljava/lang/String;)V

    .line 155
    sput-boolean v8, Lcom/shengpay/express/smc/utils/MobileHelper;->isDouble:Z

    .line 156
    const-string v7, "MobileHelper single card"

    invoke-static {v7}, Lcom/shengpay/express/smc/utils/Logger;->d(Ljava/lang/String;)V

    goto :goto_3

    .line 164
    .restart local v4    # "phoneNo":Ljava/lang/String;
    .restart local v5    # "phoneNo1":Ljava/lang/String;
    .restart local v6    # "phoneNo2":Ljava/lang/String;
    :cond_7
    iget-object v7, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->tm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v7}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v7

    goto :goto_4

    .line 165
    :cond_8
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 166
    const-string v7, ""

    invoke-virtual {v3, v7}, Lcom/shengpay/express/smc/vo/MobileInfo;->setPhoneNo2(Ljava/lang/String;)V

    goto :goto_5
.end method

.method public getDeviceInfoJSON()Lorg/json/JSONObject;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 95
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 96
    .local v3, "jo":Lorg/json/JSONObject;
    iget-object v6, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->agent:Lcom/snda/youni/dualsim/DualSimAgent;

    invoke-virtual {v6, v8}, Lcom/snda/youni/dualsim/DualSimAgent;->getDeviceId(I)Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, "imei":Ljava/lang/String;
    invoke-static {v0}, Lcom/shengpay/express/smc/utils/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 98
    iget-object v6, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->agent:Lcom/snda/youni/dualsim/DualSimAgent;

    invoke-virtual {v6, v9}, Lcom/snda/youni/dualsim/DualSimAgent;->getDeviceId(I)Ljava/lang/String;

    move-result-object v0

    .line 99
    invoke-static {v0}, Lcom/shengpay/express/smc/utils/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 100
    invoke-direct {p0}, Lcom/shengpay/express/smc/utils/MobileHelper;->getIMEI()Ljava/lang/String;

    move-result-object v0

    .line 103
    :cond_0
    const-string v6, "imei"

    invoke-virtual {v3, v6, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 104
    const-string v6, "wifiMac"

    invoke-direct {p0}, Lcom/shengpay/express/smc/utils/MobileHelper;->getWifiMac()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 105
    iget-object v6, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->agent:Lcom/snda/youni/dualsim/DualSimAgent;

    invoke-virtual {v6, v8}, Lcom/snda/youni/dualsim/DualSimAgent;->getSubscriberId(I)Ljava/lang/String;

    move-result-object v1

    .line 106
    .local v1, "imsi1":Ljava/lang/String;
    const-string v7, "imsi1"

    if-nez v1, :cond_3

    const-string v6, ""

    :goto_0
    invoke-virtual {v3, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 107
    iget-object v6, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->agent:Lcom/snda/youni/dualsim/DualSimAgent;

    invoke-virtual {v6, v9}, Lcom/snda/youni/dualsim/DualSimAgent;->getSubscriberId(I)Ljava/lang/String;

    move-result-object v2

    .line 108
    .local v2, "imsi2":Ljava/lang/String;
    const-string v7, "imsi2"

    if-nez v2, :cond_4

    const-string v6, ""

    :goto_1
    invoke-virtual {v3, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 109
    invoke-static {v1}, Lcom/shengpay/express/smc/utils/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 110
    const-string v7, "imsi1"

    iget-object v6, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->tm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v6}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_5

    const-string v6, ""

    :goto_2
    invoke-virtual {v3, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 114
    :cond_1
    :goto_3
    iget-object v6, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->agent:Lcom/snda/youni/dualsim/DualSimAgent;

    invoke-virtual {v6, v8}, Lcom/snda/youni/dualsim/DualSimAgent;->getLine1Number(I)Ljava/lang/String;

    move-result-object v4

    .line 115
    .local v4, "phoneNo1":Ljava/lang/String;
    const-string v6, "phoneNo1"

    invoke-virtual {v3, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 116
    iget-object v6, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->agent:Lcom/snda/youni/dualsim/DualSimAgent;

    invoke-virtual {v6, v9}, Lcom/snda/youni/dualsim/DualSimAgent;->getLine1Number(I)Ljava/lang/String;

    move-result-object v5

    .line 117
    .local v5, "phoneNo2":Ljava/lang/String;
    const-string v6, "phoneNo2"

    invoke-virtual {v3, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 118
    invoke-static {v4}, Lcom/shengpay/express/smc/utils/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 119
    const-string v7, "phoneNo1"

    iget-object v6, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->tm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v6}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_7

    const-string v6, ""

    :goto_4
    invoke-virtual {v3, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 123
    :cond_2
    :goto_5
    const-string v6, "model"

    sget-object v7, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 124
    const-string v6, "brand"

    sget-object v7, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 125
    const-string v6, "TerminalType"

    const-string v7, "ExpressSMC_Android"

    invoke-virtual {v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 126
    const-string v6, "AcquireFrom"

    const-string v7, "Android_SDK_V1.0.4"

    invoke-virtual {v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 128
    return-object v3

    .end local v2    # "imsi2":Ljava/lang/String;
    .end local v4    # "phoneNo1":Ljava/lang/String;
    .end local v5    # "phoneNo2":Ljava/lang/String;
    :cond_3
    move-object v6, v1

    .line 106
    goto :goto_0

    .restart local v2    # "imsi2":Ljava/lang/String;
    :cond_4
    move-object v6, v2

    .line 108
    goto :goto_1

    .line 110
    :cond_5
    iget-object v6, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->tm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v6}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v6

    goto :goto_2

    .line 111
    :cond_6
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 112
    const-string v6, "imsi2"

    const-string v7, ""

    invoke-virtual {v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3

    .line 119
    .restart local v4    # "phoneNo1":Ljava/lang/String;
    .restart local v5    # "phoneNo2":Ljava/lang/String;
    :cond_7
    iget-object v6, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->tm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v6}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v6

    goto :goto_4

    .line 120
    :cond_8
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 121
    const-string v6, "phoneNo2"

    const-string v7, ""

    invoke-virtual {v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_5
.end method

.method public getImsi(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 14
    .param p1, "resourcesId"    # Ljava/lang/Integer;

    .prologue
    .line 268
    const-string v4, ""

    .line 270
    .local v4, "imsi":Ljava/lang/String;
    :try_start_0
    iget-object v10, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->context:Landroid/app/Activity;

    .line 271
    const-string v11, "phone"

    invoke-virtual {v10, v11}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    .line 270
    check-cast v8, Landroid/telephony/TelephonyManager;

    .line 272
    .local v8, "tm":Landroid/telephony/TelephonyManager;
    const/4 v10, 0x1

    new-array v6, v10, [Ljava/lang/Class;

    const/4 v10, 0x0

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v6, v10

    .line 274
    .local v6, "resources":[Ljava/lang/Class;
    if-eqz v4, :cond_0

    const-string v10, ""

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    move-result v10

    if-eqz v10, :cond_1

    .line 276
    :cond_0
    :try_start_1
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    const-string v11, "getSubscriberIdGemini"

    invoke-virtual {v10, v11, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 277
    .local v0, "addMethod":Ljava/lang/reflect/Method;
    const/4 v10, 0x1

    invoke-virtual {v0, v10}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 278
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p1, v10, v11

    invoke-virtual {v0, v8, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "imsi":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 283
    .end local v0    # "addMethod":Ljava/lang/reflect/Method;
    .restart local v4    # "imsi":Ljava/lang/String;
    :cond_1
    :goto_0
    if-eqz v4, :cond_2

    :try_start_2
    const-string v10, ""

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    move-result v10

    if-eqz v10, :cond_3

    .line 286
    :cond_2
    :try_start_3
    const-string v10, "com.android.internal.telephony.PhoneFactory"

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 287
    .local v2, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v10, "getServiceName"

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Class;

    const/4 v12, 0x0

    const-class v13, Ljava/lang/String;

    aput-object v13, v11, v12

    const/4 v12, 0x1

    sget-object v13, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v13, v11, v12

    invoke-virtual {v2, v10, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 288
    .local v5, "m":Ljava/lang/reflect/Method;
    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string v12, "phone"

    aput-object v12, v10, v11

    const/4 v11, 0x1

    aput-object p1, v10, v11

    invoke-virtual {v5, v2, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 289
    .local v7, "spreadTmService":Ljava/lang/String;
    iget-object v10, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->context:Landroid/app/Activity;

    invoke-virtual {v10, v7}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/telephony/TelephonyManager;

    .line 290
    .local v9, "tm1":Landroid/telephony/TelephonyManager;
    invoke-virtual {v9}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v4

    .line 295
    .end local v2    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "m":Ljava/lang/reflect/Method;
    .end local v7    # "spreadTmService":Ljava/lang/String;
    .end local v9    # "tm1":Landroid/telephony/TelephonyManager;
    :cond_3
    :goto_1
    if-eqz v4, :cond_4

    :try_start_4
    const-string v10, ""

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    move-result v10

    if-eqz v10, :cond_5

    .line 297
    :cond_4
    :try_start_5
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    const-string v11, "getSubscriberId"

    invoke-virtual {v10, v11, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 298
    .local v1, "addMethod2":Ljava/lang/reflect/Method;
    const/4 v10, 0x1

    invoke-virtual {v1, v10}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 299
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p1, v10, v11

    invoke-virtual {v1, v8, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "imsi":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .end local v1    # "addMethod2":Ljava/lang/reflect/Method;
    .restart local v4    # "imsi":Ljava/lang/String;
    :cond_5
    :goto_2
    move-object v10, v4

    .line 306
    .end local v6    # "resources":[Ljava/lang/Class;
    .end local v8    # "tm":Landroid/telephony/TelephonyManager;
    :goto_3
    return-object v10

    .line 279
    .end local v4    # "imsi":Ljava/lang/String;
    .restart local v6    # "resources":[Ljava/lang/Class;
    .restart local v8    # "tm":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    .line 280
    .local v3, "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    .restart local v4    # "imsi":Ljava/lang/String;
    goto :goto_0

    .line 291
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v3

    .line 292
    .restart local v3    # "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    goto :goto_1

    .line 300
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v4    # "imsi":Ljava/lang/String;
    :catch_2
    move-exception v3

    .line 301
    .restart local v3    # "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    .restart local v4    # "imsi":Ljava/lang/String;
    goto :goto_2

    .line 305
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v6    # "resources":[Ljava/lang/Class;
    .end local v8    # "tm":Landroid/telephony/TelephonyManager;
    :catch_3
    move-exception v3

    .line 306
    .restart local v3    # "e":Ljava/lang/Exception;
    const/4 v10, 0x0

    goto :goto_3
.end method

.method public initMobileInfo(Z)V
    .locals 0
    .param p1, "openWifi"    # Z

    .prologue
    .line 91
    iput-boolean p1, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->openWifi:Z

    .line 92
    return-void
.end method

.method public isSimReady()Z
    .locals 2

    .prologue
    .line 87
    iget-object v0, p0, Lcom/shengpay/express/smc/utils/MobileHelper;->tm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
