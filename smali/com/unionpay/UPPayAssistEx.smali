.class public Lcom/unionpay/UPPayAssistEx;
.super Ljava/lang/Object;


# static fields
.field private static A:Ljava/lang/String; = null

.field private static B:I = 0x0

.field private static C:Z = false

.field private static D:Lcom/unionpay/a/d; = null

.field private static E:Landroid/os/Handler; = null

.field private static F:Ljava/lang/String; = null

.field private static G:Ljava/lang/String; = null

.field private static H:Ljava/lang/String; = null

.field private static I:Lorg/json/JSONArray; = null

.field private static J:Landroid/content/IntentFilter; = null

.field private static K:Landroid/content/BroadcastReceiver; = null

.field private static final L:Landroid/os/Handler$Callback;

.field public static final PLUGIN_NOT_FOUND:I = -0x1

.field public static final PLUGIN_VALID:I

.field private static a:Ljava/lang/String;

.field private static b:Ljava/lang/String;

.field private static c:Ljava/lang/String;

.field private static d:Ljava/lang/String;

.field private static e:Ljava/lang/String;

.field private static f:Ljava/lang/String;

.field private static g:Ljava/lang/String;

.field private static h:Ljava/lang/String;

.field private static i:Ljava/lang/String;

.field private static j:Ljava/lang/String;

.field private static k:Ljava/lang/String;

.field private static l:Ljava/lang/String;

.field private static m:Ljava/lang/String;

.field private static n:Ljava/lang/String;

.field private static o:Ljava/lang/String;

.field private static p:Ljava/lang/String;

.field private static q:Ljava/lang/String;

.field private static r:Z

.field private static s:I

.field private static t:Landroid/content/Context;

.field private static u:Ljava/lang/String;

.field private static v:Ljava/lang/String;

.field private static w:Ljava/lang/String;

.field private static x:Ljava/lang/String;

.field private static y:Ljava/lang/String;

.field private static z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v2, 0x0

    const/4 v1, 0x0

    const-string v0, "SpId"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->a:Ljava/lang/String;

    const-string v0, "paydata"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->b:Ljava/lang/String;

    const-string v0, "SysProvide"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->c:Ljava/lang/String;

    const-string v0, "UseTestMode"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->d:Ljava/lang/String;

    const-string v0, "SecurityChipType"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->e:Ljava/lang/String;

    const-string v0, "uppayuri"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->f:Ljava/lang/String;

    const-string v0, "resultIntentAction"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->g:Ljava/lang/String;

    const-string v0, "reqOriginalId"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->h:Ljava/lang/String;

    const-string v0, "wapurl"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->i:Ljava/lang/String;

    const-string v0, "dlgstyle"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->j:Ljava/lang/String;

    const-string v0, "com.unionpay.uppay"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->k:Ljava/lang/String;

    const-string v0, "com.unionpay.uppay.PayActivity"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->l:Ljava/lang/String;

    const-string v0, "ex_mode"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->m:Ljava/lang/String;

    const-string v0, "server"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->n:Ljava/lang/String;

    const-string v0, "source"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->o:Ljava/lang/String;

    const-string v0, "samsung_out"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->p:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->q:Ljava/lang/String;

    sput-boolean v1, Lcom/unionpay/UPPayAssistEx;->r:Z

    const/16 v0, 0xa

    sput v0, Lcom/unionpay/UPPayAssistEx;->s:I

    const-string v0, ""

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->u:Ljava/lang/String;

    sput-object v2, Lcom/unionpay/UPPayAssistEx;->v:Ljava/lang/String;

    sput-object v2, Lcom/unionpay/UPPayAssistEx;->w:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->x:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->y:Ljava/lang/String;

    sput-boolean v1, Lcom/unionpay/UPPayAssistEx;->z:Z

    const-string v0, ""

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->A:Ljava/lang/String;

    sput v1, Lcom/unionpay/UPPayAssistEx;->B:I

    sput-boolean v1, Lcom/unionpay/UPPayAssistEx;->C:Z

    sput-object v2, Lcom/unionpay/UPPayAssistEx;->D:Lcom/unionpay/a/d;

    sput-object v2, Lcom/unionpay/UPPayAssistEx;->E:Landroid/os/Handler;

    const-string v0, "application/vnd.android.package-archive"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->F:Ljava/lang/String;

    const-string v0, "http://mobile.unionpay.com/getclient?platform=android&type=securepayplugin"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->G:Ljava/lang/String;

    const-string v0, "[{\"type\":\"app\",\"sort\":100,\"package_info\":[{\"schema\":\"com.unionpay.uppay\",\"version\":\".*\",\"sign\":\"23137B5BE6AEF6682B41E6536F08367E0949A1CC\",\"sort\":101},{\"schema\":\"com.unionpay.tsmservice\",\"version\":\"^[1-9].*|^0[2-9].*|^01\\.[1-9].*|^01\\.0[1-9].*|^01\\.00\\.[1-9].*|^01\\.00\\.0[8-9].*\",\"sign\":\"536C79B93ACFBEA950AE365D8CE1AEF91FEA9535\",\"sort\":102}],\"need_install\":false,\"install_msg\":\"\u8bf7\u5148\u5b89\u88c5\u94f6\u8054\u5728\u7ebf\u652f\u4ed8\u670d\u52a1\uff0c\u5b89\u88c5\u5b8c\u6210\u540e\u91cd\u65b0\u53d1\u8d77\u4ed8\u6b3e\",\"url\":\"https://mobile.unionpay.com/getclient?platform=android&type=securepayplugin\",\"download_app\":\"UPPayPluginEx.apk\",\"download_title\":\"\u94f6\u8054\u5728\u7ebf\u652f\u4ed8\u670d\u52a1\",\"download_desp\":\"\u6b63\u5728\u4e0b\u8f7d\u94f6\u8054\u5728\u7ebf\u652f\u4ed8\u670d\u52a1\u2026\",\"md5\":\"D75BB2802E61738A9A03BF014F927D9A\"},{\"type\":\"jar\",\"sort\":200}]"

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->H:Ljava/lang/String;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.DOWNLOAD_COMPLETE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->J:Landroid/content/IntentFilter;

    new-instance v0, Lcom/unionpay/a;

    invoke-direct {v0}, Lcom/unionpay/a;-><init>()V

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->K:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/unionpay/b;

    invoke-direct {v0}, Lcom/unionpay/b;-><init>()V

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->L:Landroid/os/Handler$Callback;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static a(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)I
    .locals 11

    const/4 v1, -0x1

    const/4 v2, 0x1

    const/4 v0, 0x0

    :try_start_0
    const-string v3, "com.unionpay.uppay"

    const/16 v4, 0x1b

    new-array v5, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v6, "30820267308201d0a00302010202044"

    aput-object v6, v5, v4

    const/4 v4, 0x1

    const-string v6, "ecb7d98300d06092a8"

    aput-object v6, v5, v4

    const/4 v4, 0x2

    const-string v6, "64886f70d01010505003078310b30090603550"

    aput-object v6, v5, v4

    const/4 v4, 0x3

    const-string v6, "406130238363111300f060355040813085"

    aput-object v6, v5, v4

    const/4 v4, 0x4

    const-string v6, "368616e676"

    aput-object v6, v5, v4

    const/4 v4, 0x5

    const-string v6, "861693111300f060355040713085368616e67686169311730"

    aput-object v6, v5, v4

    const/4 v4, 0x6

    const-string v6, "15060355040a130e4368696e6120556e696f6e50617931173015060355040b130e4"

    aput-object v6, v5, v4

    const/4 v4, 0x7

    const-string v6, "368696e612055"

    aput-object v6, v5, v4

    const/16 v4, 0x8

    const-string v6, "6e696f6e5061793111300f06035504031308556e696f6e5061"

    aput-object v6, v5, v4

    const/16 v4, 0x9

    const-string v6, "79301e170d3131313132323130343634385a170d333631313135313034"

    aput-object v6, v5, v4

    const/16 v4, 0xa

    const-string v6, "3634385a3078310b300906035504061302383631"

    aput-object v6, v5, v4

    const/16 v4, 0xb

    const-string v6, "11300f060355040813085368616e67686169311130"

    aput-object v6, v5, v4

    const/16 v4, 0xc

    const-string v6, "0f060355040713085368616e676861693117"

    aput-object v6, v5, v4

    const/16 v4, 0xd

    const-string v6, "3015060355040a130e4368696e6120556e696"

    aput-object v6, v5, v4

    const/16 v4, 0xe

    const-string v6, "f6e50617931173015060355040b130e4368696e6120556e696"

    aput-object v6, v5, v4

    const/16 v4, 0xf

    const-string v6, "f6e5061793111300f06035504031308556e696f6e50617930819f300d060"

    aput-object v6, v5, v4

    const/16 v4, 0x10

    const-string v6, "92a864886f70d010101050003818d0030818902818100c42e6236d5054ffccaa"

    aput-object v6, v5, v4

    const/16 v4, 0x11

    const-string v6, "a430ecd929d562"

    aput-object v6, v5, v4

    const/16 v4, 0x12

    const-string v6, "b1ff56cef0e21c87260c63ce3ca868bf5974c14"

    aput-object v6, v5, v4

    const/16 v4, 0x13

    const-string v6, "d9255940da7b6cd07483f4b4243fd1825b2705"

    aput-object v6, v5, v4

    const/16 v4, 0x14

    const-string v6, "08eb9b5c67474d027fa03ce35109b11604083ab6bb4df2c46240f879f"

    aput-object v6, v5, v4

    const/16 v4, 0x15

    const-string v6, "8cc1d6ed5e1b2cc00489215aec3fc2eac008e767b0215981cb5e"

    aput-object v6, v5, v4

    const/16 v4, 0x16

    const-string v6, "e94ddc285669ec06b8a405dd4341eac4ea7030203010001300d06092a864886f70d010105050003818"

    aput-object v6, v5, v4

    const/16 v4, 0x17

    const-string v6, "1001a3e74c601e3beb1b7ae4f9ab2872a0aaf1dbc2cba89c7528cd"

    aput-object v6, v5, v4

    const/16 v4, 0x18

    const-string v6, "54aa526e7a37d8ba2311a1d3d2ab79b3fbeaf3ebb9e7da9e7cdd9be1ae5a53595f47"

    aput-object v6, v5, v4

    const/16 v4, 0x19

    const-string v6, "b1fdf62b0f540fca5458b063af9354925a6c3505a18ff164b6b195f6e517eaee1fb783"

    aput-object v6, v5, v4

    const/16 v4, 0x1a

    const-string v6, "64c2f89fdffa16729c9779f99562bc189d2ce4722ba0faedb11aa22d0d9db228fda"

    aput-object v6, v5, v4

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {p0}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v6

    const/16 v7, 0x80

    invoke-virtual {v4, v6, v7}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    const/16 v6, 0x2000

    invoke-virtual {v4, v3, v6}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    const/16 v6, 0x1040

    invoke-virtual {v4, v3, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v6

    iget-object v3, v6, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {v3}, Landroid/content/pm/Signature;->toCharsString()Ljava/lang/String;

    move-result-object v7

    const-string v3, ""

    array-length v8, v5

    move-object v4, v3

    move v3, v0

    :goto_0
    if-ge v3, v8, :cond_0

    aget-object v9, v5, v3

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    if-eqz v7, :cond_2

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget v3, v6, Landroid/content/pm/PackageInfo;->versionCode:I

    const/16 v4, 0x1f

    if-lt v3, v4, :cond_2

    :goto_1
    if-eqz v2, :cond_1

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    sget-object v3, Lcom/unionpay/UPPayAssistEx;->h:Ljava/lang/String;

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    sget-object v3, Lcom/unionpay/UPPayAssistEx;->f:Ljava/lang/String;

    invoke-virtual {v2, v3, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v3, Lcom/unionpay/UPPayAssistEx;->g:Ljava/lang/String;

    invoke-virtual {v2, v3, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v3, v2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    sget-object v2, Lcom/unionpay/UPPayAssistEx;->k:Ljava/lang/String;

    sget-object v4, Lcom/unionpay/UPPayAssistEx;->l:Ljava/lang/String;

    invoke-virtual {v3, v2, v4}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v3}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    return v0

    :catch_0
    move-exception v0

    move v0, v1

    goto :goto_2

    :cond_1
    move v0, v1

    goto :goto_2

    :cond_2
    move v2, v0

    goto :goto_1
.end method

.method static synthetic a()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/unionpay/UPPayAssistEx;->A:Ljava/lang/String;

    return-object v0
.end method

.method private static a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x1

    invoke-virtual {p0, p1, v2}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v2

    const/16 v3, 0x400

    new-array v3, v3, [B

    :goto_0
    invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4

    if-lez v4, :cond_2

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5, v4}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_0
    const-string v0, ""

    :cond_1
    :goto_1
    return-object v0

    :cond_2
    :try_start_1
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method static a(Landroid/content/Context;Z)Ljava/lang/String;
    .locals 8

    const/4 v7, 0x1

    const/4 v2, 0x0

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    sget-object v4, Lcom/unionpay/UPPayAssistEx;->x:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_9
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_0 .. :try_end_0} :catch_3

    move-result v2

    :goto_0
    if-nez p1, :cond_0

    :try_start_1
    const-string v4, "tn"

    sget-object v5, Lcom/unionpay/UPPayAssistEx;->u:Ljava/lang/String;

    invoke-static {v5}, Lcom/unionpay/utils/b;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/unionpay/utils/UPUtils;->forWap(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    const-string v2, "imei"

    invoke-static {p0}, Lcom/unionpay/utils/d;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "locale"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v5, "zh"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "zh_CN"

    :goto_1
    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "terminal_version"

    const-string v4, "3.3.5"

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "terminal_resolution"

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->heightPixels:I

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "*"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "os_name"

    const-string v4, "android"

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "os_version"

    sget-object v4, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "device_model"

    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    const-string v5, " "

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    :cond_1
    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "mac"

    invoke-static {p0}, Lcom/unionpay/utils/d;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_1 .. :try_end_1} :catch_3

    :try_start_2
    const-string v2, "time_zone"

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Ljava/util/TimeZone;->getDisplayName(ZI)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_2 .. :try_end_2} :catch_3

    :goto_2
    :try_start_3
    const-string v4, "network_mode"

    const-string v2, "connectivity"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    invoke-virtual {v2}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    if-eqz v2, :cond_8

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v5

    if-nez v5, :cond_6

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v5

    sget-object v6, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v5, v6, :cond_5

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "mobile:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_3
    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_3 .. :try_end_3} :catch_3

    :goto_4
    :try_start_4
    const-string v2, "imsi"

    invoke-static {p0}, Lcom/unionpay/utils/d;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_4 .. :try_end_4} :catch_3

    :goto_5
    :try_start_5
    const-string v2, "baseband_version"

    invoke-static {}, Lcom/unionpay/utils/d;->a()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/unionpay/UPPayAssistEx;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_5 .. :try_end_5} :catch_3

    :goto_6
    :try_start_6
    const-string v4, "root"

    new-instance v2, Ljava/io/File;

    const-string v5, "/system/bin/su"

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_9

    const-string v2, "1"

    :goto_7
    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_6 .. :try_end_6} :catch_3

    :goto_8
    :try_start_7
    const-string v4, "support_map"

    new-instance v5, Ljava/lang/StringBuffer;

    const-string v2, "000"

    invoke-direct {v5, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0xa

    if-lt v2, v6, :cond_2

    const-string v2, "nfc"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/nfc/NfcManager;

    invoke-virtual {v2}, Landroid/nfc/NfcManager;->getDefaultAdapter()Landroid/nfc/NfcAdapter;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Landroid/nfc/NfcAdapter;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_a

    const/4 v2, 0x0

    const/16 v6, 0x31

    invoke-virtual {v5, v2, v6}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    :goto_9
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x13

    if-lt v2, v6, :cond_2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const-string v6, "android.hardware.nfc.hce"

    invoke-virtual {v2, v6}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v2, 0x1

    const/16 v6, 0x31

    invoke-virtual {v5, v2, v6}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    :cond_2
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_7 .. :try_end_7} :catch_3

    :goto_a
    :try_start_8
    const-string v2, "country"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/unionpay/UPPayAssistEx;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "package"

    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    move-object v2, v0

    invoke-virtual {v2}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_b

    :goto_b
    invoke-static {v2}, Lcom/unionpay/UPPayAssistEx;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "latitude"

    invoke-static {p0}, Lcom/unionpay/utils/d;->d(Landroid/content/Context;)Landroid/location/Location;

    move-result-object v2

    if-eqz v2, :cond_c

    invoke-virtual {v2}, Landroid/location/Location;->getLatitude()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_c
    invoke-static {v2}, Lcom/unionpay/UPPayAssistEx;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "longitude"

    invoke-static {p0}, Lcom/unionpay/utils/d;->d(Landroid/content/Context;)Landroid/location/Location;

    move-result-object v2

    if-eqz v2, :cond_d

    invoke-virtual {v2}, Landroid/location/Location;->getLongitude()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_d
    invoke-static {v2}, Lcom/unionpay/UPPayAssistEx;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "tel"

    invoke-static {p0}, Lcom/unionpay/utils/d;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/unionpay/UPPayAssistEx;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_8 .. :try_end_8} :catch_3

    if-eqz p1, :cond_3

    :try_start_9
    const-string v2, "com.unionpay.uppay.PayActivity"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    const-string v2, "has_sdk"

    const-string v4, "1"

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_9
    .catch Ljava/lang/ClassNotFoundException; {:try_start_9 .. :try_end_9} :catch_8
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_9 .. :try_end_9} :catch_3

    :cond_3
    :goto_e
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "uppay"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "init: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/unionpay/utils/g;->b(Ljava/lang/String;Ljava/lang/String;)I

    return-object v2

    :cond_4
    :try_start_a
    const-string v2, "en_US"

    goto/16 :goto_1

    :catch_0
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_a
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_a .. :try_end_a} :catch_3

    goto/16 :goto_2

    :catch_1
    move-exception v2

    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_e

    :cond_5
    :try_start_b
    const-string v2, "mobile"

    goto/16 :goto_3

    :cond_6
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    if-ne v2, v7, :cond_7

    const-string v2, "wifi"

    goto/16 :goto_3

    :cond_7
    const-string v2, "other"

    goto/16 :goto_3

    :cond_8
    const-string v2, "disConnect"
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_b} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_b .. :try_end_b} :catch_3

    goto/16 :goto_3

    :catch_2
    move-exception v2

    :try_start_c
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_c
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_c} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_c .. :try_end_c} :catch_3

    goto/16 :goto_4

    :catch_3
    move-exception v2

    invoke-virtual {v2}, Ljava/util/regex/PatternSyntaxException;->printStackTrace()V

    goto :goto_e

    :catch_4
    move-exception v2

    :try_start_d
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_5

    :catch_5
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_d
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_d} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_d .. :try_end_d} :catch_3

    goto/16 :goto_6

    :cond_9
    :try_start_e
    const-string v2, "0"
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_6
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_e} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_e .. :try_end_e} :catch_3

    goto/16 :goto_7

    :catch_6
    move-exception v2

    :try_start_f
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_f
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_f} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_f .. :try_end_f} :catch_3

    goto/16 :goto_8

    :cond_a
    const/4 v2, 0x0

    const/16 v6, 0x32

    :try_start_10
    invoke-virtual {v5, v2, v6}, Ljava/lang/StringBuffer;->setCharAt(IC)V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_7
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_10} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_10 .. :try_end_10} :catch_3

    goto/16 :goto_9

    :catch_7
    move-exception v2

    :try_start_11
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_a

    :cond_b
    const-string v2, ""

    goto/16 :goto_b

    :cond_c
    const-string v2, ""

    goto/16 :goto_c

    :cond_d
    const-string v2, ""

    goto/16 :goto_d

    :catch_8
    move-exception v2

    const-string v2, "has_sdk"

    const-string v4, "0"

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_11
    .catch Lorg/json/JSONException; {:try_start_11 .. :try_end_11} :catch_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_11 .. :try_end_11} :catch_3

    goto/16 :goto_e

    :catch_9
    move-exception v4

    goto/16 :goto_0
.end method

.method static synthetic a(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 0

    sput-object p0, Lcom/unionpay/UPPayAssistEx;->I:Lorg/json/JSONArray;

    return-object p0
.end method

.method static synthetic a(Lorg/json/JSONArray;Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 1

    invoke-static {p0, p1}, Lcom/unionpay/UPPayAssistEx;->b(Lorg/json/JSONArray;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    return-object v0
.end method

.method static synthetic a(Landroid/content/Context;)V
    .locals 2

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "package:com.android.providers.downloads"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Landroid/content/ActivityNotFoundException;->printStackTrace()V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.MANAGE_APPLICATIONS_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method static a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p0, p2}, Lcom/unionpay/UPPayAssistEx;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "file:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const-string v3, "application/vnd.android.package-archive"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :goto_0
    if-eqz v0, :cond_1

    :cond_0
    :goto_1
    return-void

    :cond_1
    sput-object p5, Lcom/unionpay/UPPayAssistEx;->y:Ljava/lang/String;

    sput-object p2, Lcom/unionpay/UPPayAssistEx;->A:Ljava/lang/String;

    sget-boolean v0, Lcom/unionpay/UPPayAssistEx;->z:Z

    if-nez v0, :cond_0

    :try_start_0
    sget-object v0, Lcom/unionpay/UPPayAssistEx;->K:Landroid/content/BroadcastReceiver;

    sget-object v1, Lcom/unionpay/UPPayAssistEx;->J:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const-string v0, "download"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/DownloadManager;

    new-instance v1, Landroid/app/DownloadManager$Request;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    sget-object v2, Lcom/unionpay/UPPayAssistEx;->F:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/DownloadManager$Request;->setMimeType(Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    sget-object v2, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-virtual {v1, v2, p2}, Landroid/app/DownloadManager$Request;->setDestinationInExternalPublicDir(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    invoke-virtual {v1, p3}, Landroid/app/DownloadManager$Request;->setTitle(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    invoke-virtual {v1, p4}, Landroid/app/DownloadManager$Request;->setDescription(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    invoke-virtual {v0, v1}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    move-result-wide v0

    const-string v2, "id"

    invoke-static {p0, v0, v1, v2}, Lcom/unionpay/utils/UPUtils;->a(Landroid/content/Context;JLjava/lang/String;)V

    const/4 v0, 0x1

    sput-boolean v0, Lcom/unionpay/UPPayAssistEx;->z:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    instance-of v0, v0, Ljava/lang/IllegalArgumentException;

    if-eqz v0, :cond_2

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-static {}, Lcom/unionpay/utils/h;->a()Lcom/unionpay/utils/h;

    move-result-object v1

    iget-object v1, v1, Lcom/unionpay/utils/h;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    invoke-static {}, Lcom/unionpay/utils/h;->a()Lcom/unionpay/utils/h;

    move-result-object v1

    iget-object v1, v1, Lcom/unionpay/utils/h;->f:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    invoke-static {}, Lcom/unionpay/utils/h;->a()Lcom/unionpay/utils/h;

    move-result-object v1

    iget-object v1, v1, Lcom/unionpay/utils/h;->b:Ljava/lang/String;

    new-instance v2, Lcom/unionpay/f;

    invoke-direct {v2, p0}, Lcom/unionpay/f;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-static {}, Lcom/unionpay/utils/h;->a()Lcom/unionpay/utils/h;

    move-result-object v1

    iget-object v1, v1, Lcom/unionpay/utils/h;->c:Ljava/lang/String;

    new-instance v2, Lcom/unionpay/g;

    invoke-direct {v2, p0}, Lcom/unionpay/g;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_1

    :cond_2
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_1

    :cond_3
    move v0, v1

    goto/16 :goto_0
.end method

.method static synthetic a(Landroid/content/Context;Lorg/json/JSONArray;I)V
    .locals 18

    move-object/from16 v2, p0

    :goto_0
    if-eqz p1, :cond_0

    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    move/from16 v0, p2

    if-ge v0, v1, :cond_0

    invoke-static/range {p1 .. p2}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONArray;I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    check-cast v1, Lorg/json/JSONObject;

    const-string v3, "type"

    invoke-static {v1, v3}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "app"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string v3, "package_info"

    invoke-static {v1, v3}, Lcom/unionpay/utils/f;->c(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    const-string v3, "install_msg"

    invoke-static {v1, v3}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v3, "url"

    invoke-static {v1, v3}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "need_install"

    invoke-static {v1, v4}, Lcom/unionpay/utils/f;->b(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v11

    const-string v4, "download_app"

    invoke-static {v1, v4}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "download_title"

    invoke-static {v1, v5}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "download_desp"

    invoke-static {v1, v6}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "md5"

    invoke-static {v1, v7}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "app_server"

    invoke-static {v1, v8}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const/4 v8, 0x0

    const-string v1, "sort"

    invoke-static {v9, v1}, Lcom/unionpay/UPPayAssistEx;->b(Lorg/json/JSONArray;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v13

    if-eqz v13, :cond_7

    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_7

    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v14

    const/4 v1, 0x0

    move v9, v1

    :goto_1
    if-ge v9, v14, :cond_7

    invoke-static {v13, v9}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONArray;I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    check-cast v1, Lorg/json/JSONObject;

    const-string v15, "schema"

    invoke-static {v1, v15}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    const-string v16, "sign"

    move-object/from16 v0, v16

    invoke-static {v1, v0}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const-string v17, "version"

    move-object/from16 v0, v17

    invoke-static {v1, v0}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v15}, Lcom/unionpay/utils/b;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_2

    invoke-static {v2, v15}, Lcom/unionpay/utils/b;->b(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_2

    invoke-static {v2, v15}, Lcom/unionpay/utils/b;->c(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v8, 0x1

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    sget-object v9, Lcom/unionpay/UPPayAssistEx;->u:Ljava/lang/String;

    sget-object v13, Lcom/unionpay/UPPayAssistEx;->x:Ljava/lang/String;

    invoke-static {v9, v1, v13}, Lcom/unionpay/UPPayAssistEx;->a(Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;)V

    sget-object v9, Lcom/unionpay/UPPayAssistEx;->a:Ljava/lang/String;

    sget-object v13, Lcom/unionpay/UPPayAssistEx;->v:Ljava/lang/String;

    invoke-virtual {v1, v9, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v9, Lcom/unionpay/UPPayAssistEx;->c:Ljava/lang/String;

    sget-object v13, Lcom/unionpay/UPPayAssistEx;->w:Ljava/lang/String;

    invoke-virtual {v1, v9, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v9, Lcom/unionpay/UPPayAssistEx;->b:Ljava/lang/String;

    sget-object v13, Lcom/unionpay/UPPayAssistEx;->u:Ljava/lang/String;

    invoke-virtual {v1, v9, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v9, Lcom/unionpay/UPPayAssistEx;->o:Ljava/lang/String;

    sget-object v13, Lcom/unionpay/UPPayAssistEx;->q:Ljava/lang/String;

    invoke-virtual {v1, v9, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v9, Lcom/unionpay/UPPayAssistEx;->j:Ljava/lang/String;

    sget-boolean v13, Lcom/unionpay/UPPayAssistEx;->r:Z

    invoke-virtual {v1, v9, v13}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    sget-object v9, Lcom/unionpay/UPPayAssistEx;->n:Ljava/lang/String;

    invoke-virtual {v1, v9, v12}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v9, Lcom/unionpay/UPPayAssistEx;->e:Ljava/lang/String;

    const/4 v12, 0x0

    invoke-virtual {v1, v9, v12}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v9, Lcom/unionpay/UPPayAssistEx;->h:Ljava/lang/String;

    const/4 v12, 0x0

    invoke-virtual {v1, v9, v12}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    new-instance v9, Landroid/content/Intent;

    invoke-direct {v9}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v9, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    sget-object v1, Lcom/unionpay/UPPayAssistEx;->l:Ljava/lang/String;

    invoke-virtual {v9, v15, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object v1, Lcom/unionpay/UPPayAssistEx;->t:Landroid/content/Context;

    instance-of v1, v1, Landroid/app/Activity;

    if-eqz v1, :cond_1

    sget-object v1, Lcom/unionpay/UPPayAssistEx;->t:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    sget v12, Lcom/unionpay/UPPayAssistEx;->s:I

    invoke-virtual {v1, v9, v12}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    move v1, v8

    :goto_2
    if-nez v1, :cond_0

    if-eqz v11, :cond_3

    new-instance v8, Landroid/app/AlertDialog$Builder;

    invoke-direct {v8, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-static {}, Lcom/unionpay/utils/h;->a()Lcom/unionpay/utils/h;

    move-result-object v1

    iget-object v1, v1, Lcom/unionpay/utils/h;->d:Ljava/lang/String;

    invoke-virtual {v8, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v8, v10}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    invoke-static {}, Lcom/unionpay/utils/h;->a()Lcom/unionpay/utils/h;

    move-result-object v1

    iget-object v9, v1, Lcom/unionpay/utils/h;->b:Ljava/lang/String;

    new-instance v1, Lcom/unionpay/d;

    invoke-direct/range {v1 .. v7}, Lcom/unionpay/d;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v8, v9, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-static {}, Lcom/unionpay/utils/h;->a()Lcom/unionpay/utils/h;

    move-result-object v1

    iget-object v1, v1, Lcom/unionpay/utils/h;->c:Ljava/lang/String;

    new-instance v3, Lcom/unionpay/e;

    invoke-direct {v3, v2}, Lcom/unionpay/e;-><init>(Landroid/content/Context;)V

    invoke-virtual {v8, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v8}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    :cond_0
    :goto_3
    return-void

    :cond_1
    const/high16 v1, 0x10000000

    invoke-virtual {v9, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    sget-object v1, Lcom/unionpay/UPPayAssistEx;->t:Landroid/content/Context;

    invoke-virtual {v1, v9}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    move v1, v8

    goto :goto_2

    :cond_2
    add-int/lit8 v1, v9, 0x1

    move v9, v1

    goto/16 :goto_1

    :cond_3
    sget-object p1, Lcom/unionpay/UPPayAssistEx;->I:Lorg/json/JSONArray;

    sget v1, Lcom/unionpay/UPPayAssistEx;->B:I

    add-int/lit8 p2, v1, 0x1

    sput p2, Lcom/unionpay/UPPayAssistEx;->B:I

    goto/16 :goto_0

    :cond_4
    const-string v4, "wap"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    sget-object v3, Lcom/unionpay/UPPayAssistEx;->p:Ljava/lang/String;

    sget-object v4, Lcom/unionpay/UPPayAssistEx;->q:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    sget-object p1, Lcom/unionpay/UPPayAssistEx;->I:Lorg/json/JSONArray;

    sget v1, Lcom/unionpay/UPPayAssistEx;->B:I

    add-int/lit8 p2, v1, 0x1

    sput p2, Lcom/unionpay/UPPayAssistEx;->B:I

    goto/16 :goto_0

    :cond_5
    const-string v2, ""

    :try_start_0
    const-string v3, "url"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_4
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    sget-object v2, Lcom/unionpay/UPPayAssistEx;->u:Ljava/lang/String;

    sget-object v4, Lcom/unionpay/UPPayAssistEx;->x:Ljava/lang/String;

    invoke-static {v2, v3, v4}, Lcom/unionpay/UPPayAssistEx;->a(Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;)V

    sget-object v2, Lcom/unionpay/UPPayAssistEx;->a:Ljava/lang/String;

    sget-object v4, Lcom/unionpay/UPPayAssistEx;->v:Ljava/lang/String;

    invoke-virtual {v3, v2, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/unionpay/UPPayAssistEx;->c:Ljava/lang/String;

    sget-object v4, Lcom/unionpay/UPPayAssistEx;->w:Ljava/lang/String;

    invoke-virtual {v3, v2, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x0

    :try_start_1
    sget-object v4, Lcom/unionpay/UPPayAssistEx;->x:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v2

    :goto_5
    sget-object v4, Lcom/unionpay/UPPayAssistEx;->b:Ljava/lang/String;

    sget-object v5, Lcom/unionpay/UPPayAssistEx;->u:Ljava/lang/String;

    invoke-static {v5}, Lcom/unionpay/utils/b;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/unionpay/utils/UPUtils;->forWap(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/unionpay/UPPayAssistEx;->i:Ljava/lang/String;

    invoke-virtual {v3, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v2, v3}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    sget-object v1, Lcom/unionpay/UPPayAssistEx;->t:Landroid/content/Context;

    const-class v3, Lcom/unionpay/UPPayWapActivity;

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    sget-object v1, Lcom/unionpay/UPPayAssistEx;->t:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    const/16 v3, 0x64

    invoke-virtual {v1, v2, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_3

    :catch_0
    move-exception v1

    move-object v1, v2

    goto :goto_4

    :cond_6
    const-string v2, "jar"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "app_server"

    invoke-static {v1, v2}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/unionpay/UPPayAssistEx;->a(Ljava/lang/String;)V

    goto/16 :goto_3

    :catch_1
    move-exception v4

    goto :goto_5

    :cond_7
    move v1, v8

    goto/16 :goto_2
.end method

.method static a(Ljava/lang/String;)V
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    sget-object v1, Lcom/unionpay/UPPayAssistEx;->u:Ljava/lang/String;

    sget-object v2, Lcom/unionpay/UPPayAssistEx;->x:Ljava/lang/String;

    invoke-static {v1, v0, v2}, Lcom/unionpay/UPPayAssistEx;->a(Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;)V

    sget-object v1, Lcom/unionpay/UPPayAssistEx;->a:Ljava/lang/String;

    sget-object v2, Lcom/unionpay/UPPayAssistEx;->v:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/unionpay/UPPayAssistEx;->c:Ljava/lang/String;

    sget-object v2, Lcom/unionpay/UPPayAssistEx;->w:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/unionpay/UPPayAssistEx;->b:Ljava/lang/String;

    sget-object v2, Lcom/unionpay/UPPayAssistEx;->u:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/unionpay/UPPayAssistEx;->o:Ljava/lang/String;

    sget-object v2, Lcom/unionpay/UPPayAssistEx;->q:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/unionpay/UPPayAssistEx;->n:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/unionpay/UPPayAssistEx;->j:Ljava/lang/String;

    sget-boolean v2, Lcom/unionpay/UPPayAssistEx;->r:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    sget-object v1, Lcom/unionpay/UPPayAssistEx;->h:Ljava/lang/String;

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    :try_start_0
    const-string v1, "com.unionpay.uppay.PayActivity"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v2, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    sget-object v0, Lcom/unionpay/UPPayAssistEx;->t:Landroid/content/Context;

    invoke-virtual {v2, v0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    sget-object v0, Lcom/unionpay/UPPayAssistEx;->t:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/unionpay/UPPayAssistEx;->t:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    sget v1, Lcom/unionpay/UPPayAssistEx;->s:I

    invoke-virtual {v0, v2, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    :goto_0
    return-void

    :cond_0
    const/high16 v0, 0x10000000

    invoke-virtual {v2, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    sget-object v0, Lcom/unionpay/UPPayAssistEx;->t:Landroid/content/Context;

    invoke-virtual {v0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private static a(Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 3

    const/4 v2, 0x0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x3c

    if-ne v0, v1, :cond_3

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "00"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/unionpay/UPPayAssistEx;->d:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/unionpay/UPPayAssistEx;->d:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    :cond_3
    sget-object v0, Lcom/unionpay/UPPayAssistEx;->m:Ljava/lang/String;

    invoke-virtual {p1, v0, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 7

    const/4 v1, 0x0

    sput-object p0, Lcom/unionpay/UPPayAssistEx;->t:Landroid/content/Context;

    sput-object p3, Lcom/unionpay/UPPayAssistEx;->u:Ljava/lang/String;

    sput-object p1, Lcom/unionpay/UPPayAssistEx;->v:Ljava/lang/String;

    sput-object p2, Lcom/unionpay/UPPayAssistEx;->w:Ljava/lang/String;

    sput-object p4, Lcom/unionpay/UPPayAssistEx;->x:Ljava/lang/String;

    sput-object p5, Lcom/unionpay/UPPayAssistEx;->q:Ljava/lang/String;

    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    sput-boolean v0, Lcom/unionpay/UPPayAssistEx;->r:Z

    :goto_0
    sput v1, Lcom/unionpay/UPPayAssistEx;->B:I

    sput-boolean v1, Lcom/unionpay/UPPayAssistEx;->C:Z

    const-string v0, "entryexpro"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    sget-object v0, Lcom/unionpay/UPPayAssistEx;->t:Landroid/content/Context;

    const-string v2, "configs"

    invoke-static {v0, v2}, Lcom/unionpay/utils/UPUtils;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "mode"

    invoke-static {p0, v2}, Lcom/unionpay/utils/UPUtils;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "or"

    invoke-static {p0, v3}, Lcom/unionpay/utils/UPUtils;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "sign"

    invoke-static {v4, v0}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v5

    :try_start_1
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_3

    move-result v0

    :goto_1
    :try_start_2
    new-instance v2, Ljava/lang/String;

    const-string v6, "configs"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x2

    invoke-static {v4, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/lang/String;-><init>([B)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/unionpay/utils/UPUtils;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/unionpay/utils/b;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v5}, Lcom/unionpay/utils/UPUtils;->forConfig(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sput-object v2, Lcom/unionpay/UPPayAssistEx;->H:Ljava/lang/String;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_3

    :cond_0
    :goto_2
    :try_start_3
    new-instance v0, Lorg/json/JSONArray;

    sget-object v2, Lcom/unionpay/UPPayAssistEx;->H:Ljava/lang/String;

    invoke-direct {v0, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const-string v2, "sort"

    invoke-static {v0, v2}, Lcom/unionpay/UPPayAssistEx;->b(Lorg/json/JSONArray;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->I:Lorg/json/JSONArray;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    :goto_3
    :try_start_4
    sget-object v0, Lcom/unionpay/UPPayAssistEx;->x:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_1

    move-result v0

    :goto_4
    invoke-static {v0}, Lcom/unionpay/utils/UPUtils;->forUrl(I)Ljava/lang/String;

    move-result-object v0

    const-string v2, "uppay"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "url: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/unionpay/utils/g;->b(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Lcom/unionpay/a/d;

    invoke-direct {v2, v0}, Lcom/unionpay/a/d;-><init>(Ljava/lang/String;)V

    sput-object v2, Lcom/unionpay/UPPayAssistEx;->D:Lcom/unionpay/a/d;

    invoke-static {p0, v1}, Lcom/unionpay/UPPayAssistEx;->a(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v0

    const-string v2, "uppay"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "postdata: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/unionpay/utils/g;->b(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v2, Lcom/unionpay/UPPayAssistEx;->D:Lcom/unionpay/a/d;

    invoke-virtual {v2, v0}, Lcom/unionpay/a/d;->a(Ljava/lang/String;)V

    new-instance v0, Landroid/os/Handler;

    sget-object v2, Lcom/unionpay/UPPayAssistEx;->L:Landroid/os/Handler$Callback;

    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    sput-object v0, Lcom/unionpay/UPPayAssistEx;->E:Landroid/os/Handler;

    new-instance v0, Lcom/unionpay/c;

    invoke-direct {v0}, Lcom/unionpay/c;-><init>()V

    invoke-virtual {v0}, Lcom/unionpay/c;->start()V

    return v1

    :cond_1
    sput-boolean v1, Lcom/unionpay/UPPayAssistEx;->r:Z

    goto/16 :goto_0

    :catch_0
    move-exception v0

    move v0, v1

    goto/16 :goto_1

    :catch_1
    move-exception v0

    move v0, v1

    goto :goto_4

    :catch_2
    move-exception v0

    goto :goto_3

    :catch_3
    move-exception v0

    goto :goto_2
.end method

.method static synthetic b()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/unionpay/UPPayAssistEx;->y:Ljava/lang/String;

    return-object v0
.end method

.method private static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string v0, "[\":,\\[\\]{}]"

    if-eqz p0, :cond_0

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method private static b(Lorg/json/JSONArray;Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 4

    const/4 v1, 0x0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move v0, v1

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v0, v3, :cond_0

    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/unionpay/h;

    invoke-direct {v0, p1}, Lcom/unionpay/h;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    :goto_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_1

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    return-object v3
.end method

.method static synthetic c()Landroid/content/Context;
    .locals 1

    sget-object v0, Lcom/unionpay/UPPayAssistEx;->t:Landroid/content/Context;

    return-object v0
.end method

.method public static checkInstalled(Landroid/content/Context;)Z
    .locals 11

    const/4 v2, 0x0

    sget-object v1, Lcom/unionpay/UPPayAssistEx;->H:Ljava/lang/String;

    const-string v0, "configs"

    invoke-static {p0, v0}, Lcom/unionpay/utils/UPUtils;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "mode"

    invoke-static {p0, v3}, Lcom/unionpay/utils/UPUtils;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "or"

    invoke-static {p0, v4}, Lcom/unionpay/utils/UPUtils;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    :try_start_0
    const-string v5, "entryexpro"

    invoke-static {v5}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "sign"

    invoke-static {v5, v0}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v6

    :try_start_1
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2

    move-result v0

    move v3, v0

    :goto_0
    :try_start_2
    new-instance v0, Ljava/lang/String;

    const-string v7, "configs"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x2

    invoke-static {v5, v7}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/lang/String;-><init>([B)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/unionpay/utils/UPUtils;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/unionpay/utils/b;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v6}, Lcom/unionpay/utils/UPUtils;->forConfig(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    move-result v3

    if-eqz v3, :cond_4

    :goto_1
    move-object v1, v0

    :cond_0
    :goto_2
    :try_start_3
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    move v1, v2

    :goto_3
    if-ge v1, v5, :cond_3

    invoke-static {v4, v1}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONArray;I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    check-cast v0, Lorg/json/JSONObject;

    const-string v3, "type"

    invoke-static {v0, v3}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v6, "app"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "package_info"

    invoke-static {v0, v3}, Lcom/unionpay/utils/f;->c(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const-string v3, "sort"

    invoke-static {v0, v3}, Lcom/unionpay/UPPayAssistEx;->b(Lorg/json/JSONArray;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    if-eqz v6, :cond_2

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lez v0, :cond_2

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v7

    move v3, v2

    :goto_4
    if-ge v3, v7, :cond_2

    invoke-static {v6, v3}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONArray;I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    check-cast v0, Lorg/json/JSONObject;

    const-string v8, "schema"

    invoke-static {v0, v8}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "sign"

    invoke-static {v0, v9}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "version"

    invoke-static {v0, v10}, Lcom/unionpay/utils/f;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v8}, Lcom/unionpay/utils/b;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1

    invoke-static {p0, v8}, Lcom/unionpay/utils/b;->b(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-static {p0, v8}, Lcom/unionpay/utils/b;->c(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_5
    return v0

    :catch_0
    move-exception v0

    move v3, v2

    goto/16 :goto_0

    :catch_1
    move-exception v0

    move v0, v2

    goto :goto_5

    :cond_1
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_4

    :cond_2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_3

    :cond_3
    move v0, v2

    goto :goto_5

    :catch_2
    move-exception v0

    goto/16 :goto_2

    :cond_4
    move-object v0, v1

    goto/16 :goto_1
.end method

.method static synthetic d()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/unionpay/UPPayAssistEx;->F:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic e()Landroid/content/BroadcastReceiver;
    .locals 1

    sget-object v0, Lcom/unionpay/UPPayAssistEx;->K:Landroid/content/BroadcastReceiver;

    return-object v0
.end method

.method static synthetic f()Z
    .locals 1

    const/4 v0, 0x0

    sput-boolean v0, Lcom/unionpay/UPPayAssistEx;->z:Z

    return v0
.end method

.method static synthetic g()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/unionpay/UPPayAssistEx;->x:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic h()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/unionpay/UPPayAssistEx;->u:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic i()Z
    .locals 1

    sget-boolean v0, Lcom/unionpay/UPPayAssistEx;->C:Z

    return v0
.end method

.method public static installUPPayPlugin(Landroid/content/Context;)Z
    .locals 8

    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    const-string v3, "UPPayPluginEx.apk"

    invoke-virtual {v2, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "UPPayPluginEx.apk"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "UPPayPluginEx.apk"

    const/4 v5, 0x1

    invoke-virtual {p0, v4, v5}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v4

    const/16 v5, 0x400

    new-array v5, v5, [B

    :goto_0
    invoke-virtual {v2, v5}, Ljava/io/InputStream;->read([B)I

    move-result v6

    if-lez v6, :cond_1

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v7, v6}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    move v0, v1

    :goto_1
    return v0

    :cond_1
    :try_start_1
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    :cond_2
    new-instance v2, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "file:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const-string v4, "application/vnd.android.package-archive"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method static synthetic j()Lorg/json/JSONArray;
    .locals 1

    sget-object v0, Lcom/unionpay/UPPayAssistEx;->I:Lorg/json/JSONArray;

    return-object v0
.end method

.method static synthetic k()I
    .locals 1

    sget v0, Lcom/unionpay/UPPayAssistEx;->B:I

    return v0
.end method

.method static synthetic l()Z
    .locals 1

    const/4 v0, 0x1

    sput-boolean v0, Lcom/unionpay/UPPayAssistEx;->C:Z

    return v0
.end method

.method static synthetic m()Landroid/os/Handler;
    .locals 1

    sget-object v0, Lcom/unionpay/UPPayAssistEx;->E:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic n()Lcom/unionpay/a/d;
    .locals 1

    sget-object v0, Lcom/unionpay/UPPayAssistEx;->D:Lcom/unionpay/a/d;

    return-object v0
.end method

.method static synthetic o()I
    .locals 1

    sget v0, Lcom/unionpay/UPPayAssistEx;->B:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/unionpay/UPPayAssistEx;->B:I

    return v0
.end method

.method public static startPay(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 6

    const-string v5, ""

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lcom/unionpay/UPPayAssistEx;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static startPayByJAR(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p2, p3, p4, p5}, Lcom/unionpay/UPPayAssistEx;->startPay(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static startPayFromBrowser(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    invoke-static {p0, p1, p2}, Lcom/unionpay/UPPayAssistEx;->a(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static startSamsungPay(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    sget-object v5, Lcom/unionpay/UPPayAssistEx;->p:Ljava/lang/String;

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    invoke-static/range {v0 .. v5}, Lcom/unionpay/UPPayAssistEx;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
