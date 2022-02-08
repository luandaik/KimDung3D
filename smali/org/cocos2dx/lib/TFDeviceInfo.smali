.class public Lorg/cocos2dx/lib/TFDeviceInfo;
.super Ljava/lang/Object;
.source "TFDeviceInfo.java"


# static fields
.field private static mText:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const/4 v0, 0x0

    sput-object v0, Lorg/cocos2dx/lib/TFDeviceInfo;->mText:Landroid/widget/TextView;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lorg/cocos2dx/lib/TFDeviceInfo;->mText:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$002(Landroid/widget/TextView;)Landroid/widget/TextView;
    .locals 0
    .param p0, "x0"    # Landroid/widget/TextView;

    .prologue
    .line 23
    sput-object p0, Lorg/cocos2dx/lib/TFDeviceInfo;->mText:Landroid/widget/TextView;

    return-object p0
.end method

.method public static copyToPasteBord(Ljava/lang/String;)V
    .locals 2
    .param p0, "content"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxActivity;

    .line 29
    .local v0, "pActivity":Lorg/cocos2dx/lib/Cocos2dxActivity;
    new-instance v1, Lorg/cocos2dx/lib/TFDeviceInfo$1;

    invoke-direct {v1, p0, v0}, Lorg/cocos2dx/lib/TFDeviceInfo$1;-><init>(Ljava/lang/String;Lorg/cocos2dx/lib/Cocos2dxActivity;)V

    .line 42
    .local v1, "run":Ljava/lang/Runnable;
    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 43
    return-void
.end method

.method public static getAddreddBook()Ljava/lang/String;
    .locals 12

    .prologue
    const/4 v2, 0x0

    .line 167
    const-string v11, ""

    .line 168
    .local v11, "sAddressBook":Ljava/lang/String;
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 170
    .local v0, "content":Landroid/content/ContentResolver;
    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 171
    .local v6, "cur":Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_2

    .line 173
    :cond_0
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 175
    const-string v1, "_id"

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 176
    .local v7, "id":Ljava/lang/String;
    const-string v1, "display_name"

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 177
    .local v8, "name":Ljava/lang/String;
    const-string v1, "has_phone_number"

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_0

    .line 179
    sget-object v1, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    const-string v3, "contact_id = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v7, v4, v5

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 181
    .local v9, "pCur":Landroid/database/Cursor;
    :goto_1
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 183
    const-string v1, "data1"

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 184
    .local v10, "phoneNo":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "name:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 185
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 186
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " tel:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 187
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 188
    goto :goto_1

    .line 189
    .end local v10    # "phoneNo":Ljava/lang/String;
    :cond_1
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    .line 193
    .end local v7    # "id":Ljava/lang/String;
    .end local v8    # "name":Ljava/lang/String;
    .end local v9    # "pCur":Landroid/database/Cursor;
    :cond_2
    return-object v11
.end method

.method public static getCarrierOperator()Ljava/lang/String;
    .locals 3

    .prologue
    .line 248
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 249
    .local v0, "tMgr":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getClipBoardText()Ljava/lang/String;
    .locals 2

    .prologue
    .line 47
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxActivity;

    .line 49
    .local v0, "pActivity":Lorg/cocos2dx/lib/Cocos2dxActivity;
    new-instance v1, Lorg/cocos2dx/lib/TFDeviceInfo$2;

    invoke-direct {v1, v0}, Lorg/cocos2dx/lib/TFDeviceInfo$2;-><init>(Lorg/cocos2dx/lib/Cocos2dxActivity;)V

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 71
    sget-object v1, Lorg/cocos2dx/lib/TFDeviceInfo;->mText:Landroid/widget/TextView;

    if-eqz v1, :cond_0

    .line 72
    sget-object v1, Lorg/cocos2dx/lib/TFDeviceInfo;->mText:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 74
    :goto_0
    return-object v1

    :cond_0
    const-string v1, ""

    goto :goto_0
.end method

.method public static getCurAppName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 232
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCurAppVersion()Ljava/lang/String;
    .locals 5

    .prologue
    .line 221
    :try_start_0
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 222
    .local v1, "pInfo":Landroid/content/pm/PackageInfo;
    iget-object v2, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    :goto_0
    return-object v2

    .line 223
    :catch_0
    move-exception v0

    .line 225
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 227
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getDeviceId()Ljava/lang/String;
    .locals 3

    .prologue
    .line 237
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 238
    .local v0, "tMgr":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getFreeMem()Ljava/lang/String;
    .locals 8

    .prologue
    .line 159
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "activity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 160
    .local v0, "activityManager":Landroid/app/ActivityManager;
    new-instance v1, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v1}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 161
    .local v1, "memoryInfo":Landroid/app/ActivityManager$MemoryInfo;
    invoke-virtual {v0, v1}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 162
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v4, v1, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    const-wide/16 v6, 0x400

    div-long/2addr v4, v6

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getIsJailBreak()Ljava/lang/String;
    .locals 7

    .prologue
    .line 121
    const-string v4, "false"

    .line 122
    .local v4, "root":Ljava/lang/String;
    const/4 v0, 0x0

    .line 123
    .local v0, "f":Ljava/io/File;
    const/4 v5, 0x5

    new-array v3, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "/system/bin/"

    aput-object v6, v3, v5

    const/4 v5, 0x1

    const-string v6, "/system/xbin/"

    aput-object v6, v3, v5

    const/4 v5, 0x2

    const-string v6, "/system/sbin/"

    aput-object v6, v3, v5

    const/4 v5, 0x3

    const-string v6, "/sbin/"

    aput-object v6, v3, v5

    const/4 v5, 0x4

    const-string v6, "/vendor/bin/"

    aput-object v6, v3, v5

    .line 126
    .local v3, "kSuSearchPaths":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    move-object v1, v0

    .end local v0    # "f":Ljava/io/File;
    .local v1, "f":Ljava/io/File;
    :goto_0
    :try_start_0
    array-length v5, v3

    if-ge v2, v5, :cond_1

    .line 127
    new-instance v0, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v6, v3, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "su"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    .end local v1    # "f":Ljava/io/File;
    .restart local v0    # "f":Ljava/io/File;
    if-eqz v0, :cond_0

    :try_start_1
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 129
    const-string v4, "true"
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 126
    :cond_0
    add-int/lit8 v2, v2, 0x1

    move-object v1, v0

    .end local v0    # "f":Ljava/io/File;
    .restart local v1    # "f":Ljava/io/File;
    goto :goto_0

    :cond_1
    move-object v0, v1

    .line 135
    .end local v1    # "f":Ljava/io/File;
    .restart local v0    # "f":Ljava/io/File;
    :goto_1
    return-object v4

    .line 132
    .end local v0    # "f":Ljava/io/File;
    .restart local v1    # "f":Ljava/io/File;
    :catch_0
    move-exception v5

    move-object v0, v1

    .end local v1    # "f":Ljava/io/File;
    .restart local v0    # "f":Ljava/io/File;
    goto :goto_1

    :catch_1
    move-exception v5

    goto :goto_1
.end method

.method public static getMachineName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 209
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    return-object v0
.end method

.method public static getNetWorkType()Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v7, 0x1

    .line 79
    const-string v2, "NO"

    .line 80
    .local v2, "netType":Ljava/lang/String;
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "phone"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    .line 81
    .local v3, "tMgr":Landroid/telephony/TelephonyManager;
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "connectivity"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 82
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 83
    .local v1, "info":Landroid/net/NetworkInfo;
    if-nez v1, :cond_1

    .line 116
    :cond_0
    :goto_0
    return-object v2

    .line 85
    :cond_1
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    move-result v4

    .line 86
    .local v4, "type":I
    if-ne v4, v7, :cond_2

    .line 88
    const-string v2, "WIFI"

    goto :goto_0

    .line 90
    :cond_2
    if-eq v4, v7, :cond_3

    const/4 v5, 0x2

    if-eq v4, v5, :cond_3

    const/4 v5, 0x4

    if-eq v4, v5, :cond_3

    const/4 v5, 0x7

    if-eq v4, v5, :cond_3

    const/16 v5, 0xb

    if-ne v4, v5, :cond_4

    .line 97
    :cond_3
    const-string v2, "2G"

    goto :goto_0

    .line 99
    :cond_4
    const/4 v5, 0x3

    if-eq v4, v5, :cond_5

    const/4 v5, 0x5

    if-eq v4, v5, :cond_5

    const/4 v5, 0x6

    if-eq v4, v5, :cond_5

    const/16 v5, 0x8

    if-eq v4, v5, :cond_5

    const/16 v5, 0x9

    if-eq v4, v5, :cond_5

    const/16 v5, 0xa

    if-eq v4, v5, :cond_5

    const/16 v5, 0xc

    if-eq v4, v5, :cond_5

    const/16 v5, 0xe

    if-eq v4, v5, :cond_5

    const/16 v5, 0xf

    if-ne v4, v5, :cond_6

    .line 110
    :cond_5
    const-string v2, "3G"

    goto :goto_0

    .line 112
    :cond_6
    const/16 v5, 0xd

    if-ne v4, v5, :cond_0

    .line 114
    const-string v2, "4G"

    goto :goto_0
.end method

.method public static getPhoneNumber()Ljava/lang/String;
    .locals 3

    .prologue
    .line 198
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 199
    .local v0, "tMgr":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getSDPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 243
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxHelper;->getSDPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSystemName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 204
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    return-object v0
.end method

.method public static getSystemVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 214
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    return-object v0
.end method

.method public static getTotalMem()Ljava/lang/String;
    .locals 9

    .prologue
    .line 140
    const-string v5, "/proc/meminfo"

    .line 143
    .local v5, "str1":Ljava/lang/String;
    const-wide/16 v2, 0x0

    .line 146
    .local v2, "initial_memory":J
    :try_start_0
    new-instance v4, Ljava/io/FileReader;

    invoke-direct {v4, v5}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 147
    .local v4, "localFileReader":Ljava/io/FileReader;
    new-instance v1, Ljava/io/BufferedReader;

    const/16 v7, 0x2000

    invoke-direct {v1, v4, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 148
    .local v1, "localBufferedReader":Ljava/io/BufferedReader;
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .line 149
    .local v6, "str2":Ljava/lang/String;
    const-string v7, "\\s+"

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 150
    .local v0, "arrayOfString":[Ljava/lang/String;
    const/4 v7, 0x1

    aget-object v7, v0, v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    int-to-long v2, v7

    .line 151
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 154
    .end local v0    # "arrayOfString":[Ljava/lang/String;
    .end local v1    # "localBufferedReader":Ljava/io/BufferedReader;
    .end local v4    # "localFileReader":Ljava/io/FileReader;
    .end local v6    # "str2":Ljava/lang/String;
    :goto_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 152
    :catch_0
    move-exception v7

    goto :goto_0
.end method
