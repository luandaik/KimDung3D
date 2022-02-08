.class public Lcom/shengpay/express/smc/utils/Logger;
.super Ljava/lang/Object;
.source "Logger.java"


# static fields
.field private static FILE_NAME:Ljava/lang/String;

.field private static ROOT:Ljava/lang/String;

.field private static TAG:Ljava/lang/String;

.field private static instance:Lcom/shengpay/express/smc/utils/Logger;

.field private static logFile:Ljava/lang/String;

.field private static write2Sdcard:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const-string v0, "Logger"

    sput-object v0, Lcom/shengpay/express/smc/utils/Logger;->TAG:Ljava/lang/String;

    .line 21
    const-string v0, ""

    sput-object v0, Lcom/shengpay/express/smc/utils/Logger;->ROOT:Ljava/lang/String;

    .line 22
    const-string v0, "smc.log"

    sput-object v0, Lcom/shengpay/express/smc/utils/Logger;->FILE_NAME:Ljava/lang/String;

    .line 24
    const-string v0, ""

    sput-object v0, Lcom/shengpay/express/smc/utils/Logger;->logFile:Ljava/lang/String;

    .line 26
    const/4 v0, 0x0

    sput-boolean v0, Lcom/shengpay/express/smc/utils/Logger;->write2Sdcard:Z

    .line 28
    new-instance v0, Lcom/shengpay/express/smc/utils/Logger;

    invoke-direct {v0}, Lcom/shengpay/express/smc/utils/Logger;-><init>()V

    sput-object v0, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    invoke-virtual {p0}, Lcom/shengpay/express/smc/utils/Logger;->isExternalStorageWritable()Z

    move-result v0

    sput-boolean v0, Lcom/shengpay/express/smc/utils/Logger;->write2Sdcard:Z

    .line 32
    sget-boolean v0, Lcom/shengpay/express/smc/utils/Logger;->write2Sdcard:Z

    if-eqz v0, :cond_0

    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/shengpay/express/smc/utils/Logger;->ROOT:Ljava/lang/String;

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/shengpay/express/smc/utils/Logger;->ROOT:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/shengpay/express/smc/utils/Logger;->FILE_NAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/shengpay/express/smc/utils/Logger;->logFile:Ljava/lang/String;

    .line 36
    :cond_0
    return-void
.end method

.method private createMessage(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/shengpay/express/smc/utils/Logger;->getFunctionName()Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "functionName":Ljava/lang/String;
    if-nez v0, :cond_0

    move-object v1, p1

    .line 79
    .local v1, "message":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 78
    .end local v1    # "message":Ljava/lang/String;
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static d(Ljava/lang/Exception;)V
    .locals 2
    .param p0, "e"    # Ljava/lang/Exception;

    .prologue
    .line 174
    sget-object v1, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Lcom/shengpay/express/smc/utils/Logger;->debug(Ljava/lang/String;)V

    .line 175
    return-void

    .line 174
    :cond_0
    const-string v0, "null"

    goto :goto_0
.end method

.method public static d(Ljava/lang/String;)V
    .locals 1
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 170
    sget-object v0, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    invoke-virtual {v0, p0}, Lcom/shengpay/express/smc/utils/Logger;->debug(Ljava/lang/String;)V

    .line 172
    return-void
.end method

.method public static e(Ljava/lang/Exception;)V
    .locals 1
    .param p0, "e"    # Ljava/lang/Exception;

    .prologue
    .line 187
    sget-object v0, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    invoke-virtual {v0, p0}, Lcom/shengpay/express/smc/utils/Logger;->error(Ljava/lang/Exception;)V

    .line 188
    return-void
.end method

.method public static e(Ljava/lang/String;)V
    .locals 1
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 183
    sget-object v0, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    invoke-virtual {v0, p0}, Lcom/shengpay/express/smc/utils/Logger;->error(Ljava/lang/String;)V

    .line 184
    return-void
.end method

.method private getFunctionName()Ljava/lang/String;
    .locals 7

    .prologue
    const/4 v2, 0x0

    .line 50
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    .line 52
    .local v1, "sts":[Ljava/lang/StackTraceElement;
    if-nez v1, :cond_1

    .line 73
    :cond_0
    :goto_0
    return-object v2

    .line 56
    :cond_1
    array-length v4, v1

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v4, :cond_0

    aget-object v0, v1, v3

    .line 57
    .local v0, "st":Ljava/lang/StackTraceElement;
    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->isNativeMethod()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 56
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 61
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v5

    const-class v6, Ljava/lang/Thread;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 65
    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 69
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "["

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 70
    const-string v3, "): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 69
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static getLogger()Lcom/shengpay/express/smc/utils/Logger;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    return-object v0
.end method

.method public static getLogger(Landroid/content/Context;Ljava/lang/String;)Lcom/shengpay/express/smc/utils/Logger;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/shengpay/express/smc/utils/Logger;->TAG:Ljava/lang/String;

    .line 43
    sput-object p1, Lcom/shengpay/express/smc/utils/Logger;->FILE_NAME:Ljava/lang/String;

    .line 44
    sget-object v0, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    return-object v0
.end method

.method public static i(Ljava/lang/Exception;)V
    .locals 2
    .param p0, "e"    # Ljava/lang/Exception;

    .prologue
    .line 96
    sget-object v1, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Lcom/shengpay/express/smc/utils/Logger;->info(Ljava/lang/String;)V

    .line 97
    return-void

    .line 96
    :cond_0
    const-string v0, "null"

    goto :goto_0
.end method

.method public static i(Ljava/lang/String;)V
    .locals 1
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 93
    sget-object v0, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    invoke-virtual {v0, p0}, Lcom/shengpay/express/smc/utils/Logger;->info(Ljava/lang/String;)V

    .line 94
    return-void
.end method

.method public static resetLogFile()V
    .locals 3

    .prologue
    .line 199
    new-instance v1, Ljava/io/File;

    sget-object v2, Lcom/shengpay/express/smc/utils/Logger;->logFile:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 200
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 202
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    :goto_0
    return-void

    .line 203
    :catch_0
    move-exception v0

    .line 204
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public static w(Ljava/lang/Exception;)V
    .locals 2
    .param p0, "e"    # Ljava/lang/Exception;

    .prologue
    .line 196
    sget-object v1, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Lcom/shengpay/express/smc/utils/Logger;->warn(Ljava/lang/String;)V

    .line 197
    return-void

    .line 196
    :cond_0
    const-string v0, "null"

    goto :goto_0
.end method

.method public static w(Ljava/lang/String;)V
    .locals 1
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 193
    sget-object v0, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    invoke-virtual {v0, p0}, Lcom/shengpay/express/smc/utils/Logger;->warn(Ljava/lang/String;)V

    .line 194
    return-void
.end method

.method private writeLog(Ljava/lang/String;)V
    .locals 6
    .param p1, "content"    # Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SimpleDateFormat"
        }
    .end annotation

    .prologue
    .line 210
    :try_start_0
    new-instance v1, Ljava/io/File;

    sget-object v4, Lcom/shengpay/express/smc/utils/Logger;->logFile:Ljava/lang/String;

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 211
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 212
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 215
    :cond_0
    new-instance v2, Ljava/text/SimpleDateFormat;

    .line 216
    const-string v4, "yyyy-MM-dd HH:mm:ss"

    .line 215
    invoke-direct {v2, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 217
    .local v2, "formate":Ljava/text/SimpleDateFormat;
    new-instance v3, Ljava/io/FileWriter;

    const/4 v4, 0x1

    invoke-direct {v3, v1, v4}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    .line 218
    .local v3, "write":Ljava/io/FileWriter;
    new-instance v4, Ljava/lang/StringBuilder;

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 219
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 218
    invoke-virtual {v3, v4}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 220
    invoke-virtual {v3}, Ljava/io/FileWriter;->flush()V

    .line 221
    invoke-virtual {v3}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 225
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "formate":Ljava/text/SimpleDateFormat;
    .end local v3    # "write":Ljava/io/FileWriter;
    :goto_0
    return-void

    .line 222
    :catch_0
    move-exception v0

    .line 223
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public debug(Ljava/lang/String;)V
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 118
    invoke-direct {p0, p1}, Lcom/shengpay/express/smc/utils/Logger;->createMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 119
    .local v0, "message":Ljava/lang/String;
    sget-object v1, Lcom/shengpay/express/smc/utils/Logger;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    sget-boolean v1, Lcom/shengpay/express/smc/utils/Logger;->write2Sdcard:Z

    if-eqz v1, :cond_0

    .line 121
    sget-object v1, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    invoke-direct {v1, p1}, Lcom/shengpay/express/smc/utils/Logger;->writeLog(Ljava/lang/String;)V

    .line 123
    :cond_0
    return-void
.end method

.method public error(Ljava/lang/Exception;)V
    .locals 8
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 138
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 139
    .local v1, "sb":Ljava/lang/StringBuffer;
    invoke-direct {p0}, Lcom/shengpay/express/smc/utils/Logger;->getFunctionName()Ljava/lang/String;

    move-result-object v0

    .line 140
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/Exception;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    .line 142
    .local v3, "sts":[Ljava/lang/StackTraceElement;
    if-eqz v0, :cond_2

    .line 143
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " - "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\r\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 147
    :goto_0
    if-eqz v3, :cond_0

    array-length v4, v3

    if-lez v4, :cond_0

    .line 148
    array-length v5, v3

    const/4 v4, 0x0

    :goto_1
    if-lt v4, v5, :cond_3

    .line 154
    :cond_0
    sget-object v4, Lcom/shengpay/express/smc/utils/Logger;->TAG:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    sget-boolean v4, Lcom/shengpay/express/smc/utils/Logger;->write2Sdcard:Z

    if-eqz v4, :cond_1

    .line 156
    sget-object v4, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/shengpay/express/smc/utils/Logger;->writeLog(Ljava/lang/String;)V

    .line 158
    :cond_1
    return-void

    .line 145
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\r\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 148
    :cond_3
    aget-object v2, v3, v4

    .line 149
    .local v2, "st":Ljava/lang/StackTraceElement;
    if-eqz v2, :cond_4

    .line 150
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "[ "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ]\r\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 148
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_1
.end method

.method public error(Ljava/lang/String;)V
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 128
    invoke-direct {p0, p1}, Lcom/shengpay/express/smc/utils/Logger;->createMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 129
    .local v0, "message":Ljava/lang/String;
    sget-object v1, Lcom/shengpay/express/smc/utils/Logger;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    sget-boolean v1, Lcom/shengpay/express/smc/utils/Logger;->write2Sdcard:Z

    if-eqz v1, :cond_0

    .line 131
    sget-object v1, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    invoke-direct {v1, v0}, Lcom/shengpay/express/smc/utils/Logger;->writeLog(Ljava/lang/String;)V

    .line 133
    :cond_0
    return-void
.end method

.method public getLogStr()Ljava/lang/String;
    .locals 8

    .prologue
    .line 252
    new-instance v2, Ljava/io/File;

    sget-object v5, Lcom/shengpay/express/smc/utils/Logger;->logFile:Ljava/lang/String;

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 253
    .local v2, "file":Ljava/io/File;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 254
    .local v4, "text":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .line 257
    .local v0, "br":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const-string v7, "utf-8"

    invoke-direct {v5, v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v1, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 260
    .end local v0    # "br":Ljava/io/BufferedReader;
    .local v1, "br":Ljava/io/BufferedReader;
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v3

    .local v3, "line":Ljava/lang/String;
    if-nez v3, :cond_0

    .line 267
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    :goto_1
    move-object v0, v1

    .line 268
    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    invoke-static {}, Lcom/shengpay/express/smc/utils/Logger;->resetLogFile()V

    .line 270
    .end local v3    # "line":Ljava/lang/String;
    :goto_2
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 261
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v3    # "line":Ljava/lang/String;
    :cond_0
    :try_start_3
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    .line 264
    .end local v3    # "line":Ljava/lang/String;
    :catch_0
    move-exception v5

    move-object v0, v1

    .line 267
    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :goto_3
    :try_start_4
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 268
    :goto_4
    invoke-static {}, Lcom/shengpay/express/smc/utils/Logger;->resetLogFile()V

    goto :goto_2

    .line 266
    :catchall_0
    move-exception v5

    .line 267
    :goto_5
    :try_start_5
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 268
    :goto_6
    invoke-static {}, Lcom/shengpay/express/smc/utils/Logger;->resetLogFile()V

    .line 269
    throw v5

    .line 267
    :catch_1
    move-exception v5

    goto :goto_4

    :catch_2
    move-exception v6

    goto :goto_6

    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v3    # "line":Ljava/lang/String;
    :catch_3
    move-exception v5

    goto :goto_1

    .line 266
    .end local v3    # "line":Ljava/lang/String;
    :catchall_1
    move-exception v5

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_5

    .line 264
    :catch_4
    move-exception v5

    goto :goto_3
.end method

.method public info(Ljava/lang/String;)V
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/shengpay/express/smc/utils/Logger;->createMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, "message":Ljava/lang/String;
    sget-object v1, Lcom/shengpay/express/smc/utils/Logger;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/shengpay/express/smc/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    sget-boolean v1, Lcom/shengpay/express/smc/utils/Logger;->write2Sdcard:Z

    if-eqz v1, :cond_0

    .line 89
    sget-object v1, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    invoke-direct {v1, v0}, Lcom/shengpay/express/smc/utils/Logger;->writeLog(Ljava/lang/String;)V

    .line 91
    :cond_0
    return-void
.end method

.method public isExternalStorageWritable()Z
    .locals 2

    .prologue
    .line 244
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    .line 245
    .local v0, "state":Ljava/lang/String;
    const-string v1, "mounted"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 246
    const/4 v1, 0x1

    .line 248
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public v(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 112
    sget-object v1, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Lcom/shengpay/express/smc/utils/Logger;->verbose(Ljava/lang/String;)V

    .line 113
    return-void

    .line 112
    :cond_0
    const-string v0, "null"

    goto :goto_0
.end method

.method public v(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 109
    sget-object v0, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    invoke-virtual {v0, p1}, Lcom/shengpay/express/smc/utils/Logger;->verbose(Ljava/lang/String;)V

    .line 110
    return-void
.end method

.method public verbose(Ljava/lang/String;)V
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 102
    invoke-direct {p0, p1}, Lcom/shengpay/express/smc/utils/Logger;->createMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 103
    .local v0, "message":Ljava/lang/String;
    sget-object v1, Lcom/shengpay/express/smc/utils/Logger;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/shengpay/express/smc/utils/LogUtil;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    sget-boolean v1, Lcom/shengpay/express/smc/utils/Logger;->write2Sdcard:Z

    if-eqz v1, :cond_0

    .line 105
    sget-object v1, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    invoke-direct {v1, v0}, Lcom/shengpay/express/smc/utils/Logger;->writeLog(Ljava/lang/String;)V

    .line 107
    :cond_0
    return-void
.end method

.method public warn(Ljava/lang/String;)V
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 163
    invoke-direct {p0, p1}, Lcom/shengpay/express/smc/utils/Logger;->createMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 164
    .local v0, "message":Ljava/lang/String;
    sget-object v1, Lcom/shengpay/express/smc/utils/Logger;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/shengpay/express/smc/utils/LogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    sget-boolean v1, Lcom/shengpay/express/smc/utils/Logger;->write2Sdcard:Z

    if-eqz v1, :cond_0

    .line 166
    sget-object v1, Lcom/shengpay/express/smc/utils/Logger;->instance:Lcom/shengpay/express/smc/utils/Logger;

    invoke-direct {v1, v0}, Lcom/shengpay/express/smc/utils/Logger;->writeLog(Ljava/lang/String;)V

    .line 168
    :cond_0
    return-void
.end method

.method public writeWebConsoleLog(Ljava/lang/String;)V
    .locals 5
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    .line 229
    :try_start_0
    new-instance v1, Ljava/io/File;

    sget-object v3, Lcom/shengpay/express/smc/utils/Logger;->logFile:Ljava/lang/String;

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 230
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 231
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 233
    :cond_0
    new-instance v2, Ljava/io/FileWriter;

    const/4 v3, 0x1

    invoke-direct {v2, v1, v3}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    .line 234
    .local v2, "write":Ljava/io/FileWriter;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 235
    invoke-virtual {v2}, Ljava/io/FileWriter;->flush()V

    .line 236
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 240
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "write":Ljava/io/FileWriter;
    :goto_0
    return-void

    .line 237
    :catch_0
    move-exception v0

    .line 238
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
