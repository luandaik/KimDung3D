.class public Lcom/shengpay/express/smc/utils/StringUtils;
.super Ljava/lang/Object;
.source "StringUtils.java"


# static fields
.field static pDecimal:Ljava/util/regex/Pattern;

.field static pMobile:Ljava/util/regex/Pattern;

.field static pMobileCM:Ljava/util/regex/Pattern;

.field static pMobileCT:Ljava/util/regex/Pattern;

.field static pMobileUC:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 8
    const-string v0, "^((13[0-9])|(14[5,7])|(15[0-9])|(18[0-9]))\\d{8}$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/shengpay/express/smc/utils/StringUtils;->pMobile:Ljava/util/regex/Pattern;

    .line 9
    const-string v0, "^((13[4-9])|(147)|(15[0-2,7-9])|(18[2,3,4,7,8]))\\d{8}$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/shengpay/express/smc/utils/StringUtils;->pMobileCM:Ljava/util/regex/Pattern;

    .line 10
    const-string v0, "^((13[0-2])|145|(15[2,5-6])|(18[5-6]))\\d{8}$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/shengpay/express/smc/utils/StringUtils;->pMobileUC:Ljava/util/regex/Pattern;

    .line 11
    const-string v0, "^((133)|(153)|(18[0-1,9]))\\d{8}$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/shengpay/express/smc/utils/StringUtils;->pMobileCT:Ljava/util/regex/Pattern;

    .line 12
    const-string v0, "^[0-9]*(\\.?)[0-9]*$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/shengpay/express/smc/utils/StringUtils;->pDecimal:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getContentBytes(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 4
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 88
    if-eqz p1, :cond_0

    const-string v1, ""

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 89
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    .line 92
    :goto_0
    return-object v1

    :cond_1
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 93
    :catch_0
    move-exception v0

    .line 94
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Not support:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static getMobileInstCode(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "mobileNo"    # Ljava/lang/String;

    .prologue
    .line 52
    sget-object v0, Lcom/shengpay/express/smc/utils/StringUtils;->pMobileCM:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "CM"

    .line 55
    :goto_0
    return-object v0

    .line 53
    :cond_0
    sget-object v0, Lcom/shengpay/express/smc/utils/StringUtils;->pMobileUC:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "UC"

    goto :goto_0

    .line 54
    :cond_1
    sget-object v0, Lcom/shengpay/express/smc/utils/StringUtils;->pMobileCT:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "CT"

    goto :goto_0

    .line 55
    :cond_2
    const-string v0, ""

    goto :goto_0
.end method

.method public static hasText(Ljava/lang/String;)Z
    .locals 1
    .param p0, "obj"    # Ljava/lang/String;

    .prologue
    .line 20
    invoke-static {p0}, Lcom/shengpay/express/smc/utils/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static is10086No(Ljava/lang/String;)Z
    .locals 2
    .param p0, "mobileNo"    # Ljava/lang/String;

    .prologue
    .line 65
    sget-object v1, Lcom/shengpay/express/smc/utils/StringUtils;->pMobileCM:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 66
    .local v0, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    return v1
.end method

.method public static isDecimal(Ljava/lang/String;)Z
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 75
    sget-object v0, Lcom/shengpay/express/smc/utils/StringUtils;->pDecimal:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    return v0
.end method

.method public static isEmpty(Ljava/lang/String;)Z
    .locals 2
    .param p0, "obj"    # Ljava/lang/String;

    .prologue
    .line 28
    if-eqz p0, :cond_0

    const-string v0, ""

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 29
    :cond_0
    const/4 v0, 0x1

    .line 31
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isMobileNO(Ljava/lang/String;)Z
    .locals 2
    .param p0, "mobileNo"    # Ljava/lang/String;

    .prologue
    .line 40
    if-nez p0, :cond_0

    const/4 v1, 0x0

    .line 43
    :goto_0
    return v1

    .line 42
    :cond_0
    sget-object v1, Lcom/shengpay/express/smc/utils/StringUtils;->pMobile:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 43
    .local v0, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    goto :goto_0
.end method
