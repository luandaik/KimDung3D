.class public Lcom/snda/woa/ac;
.super Lcom/snda/woa/as;


# instance fields
.field private a:Lcom/snda/woa/android/callback/CallBack;

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Landroid/content/Context;

.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;

.field private final g:Ljava/lang/String;

.field private h:J

.field private i:Lcom/snda/woa/bw;

.field private j:Lcom/snda/woa/bw;


# direct methods
.method public constructor <init>(Lcom/snda/woa/android/callback/CallBack;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    const/4 v2, 0x0

    invoke-direct {p0}, Lcom/snda/woa/as;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/snda/woa/ac;->e:Ljava/lang/String;

    iput-object v2, p0, Lcom/snda/woa/ac;->f:Ljava/lang/String;

    const-string v0, "\u606d\u559c\u60a8\uff0c\u5bc6\u7801\u4fee\u6539\u6210\u529f\uff0c\u8bf7\u7262\u8bb0\uff01"

    iput-object v0, p0, Lcom/snda/woa/ac;->g:Ljava/lang/String;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/snda/woa/ac;->h:J

    iput-object v2, p0, Lcom/snda/woa/ac;->i:Lcom/snda/woa/bw;

    iput-object v2, p0, Lcom/snda/woa/ac;->j:Lcom/snda/woa/bw;

    iput-object p1, p0, Lcom/snda/woa/ac;->a:Lcom/snda/woa/android/callback/CallBack;

    iput-object p2, p0, Lcom/snda/woa/ac;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/snda/woa/ac;->c:Ljava/lang/String;

    iput-object p4, p0, Lcom/snda/woa/ac;->d:Landroid/content/Context;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/snda/woa/ac;->h:J

    return-void
.end method

.method private b()I
    .locals 6

    const/4 v1, 0x0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/snda/woa/ce;->e:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/password/changePassword.shtm"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v0, ""

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pubKeyVersion="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/snda/woa/a;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "&password="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p0, Lcom/snda/woa/ac;->c:Ljava/lang/String;

    invoke-static {v3}, Lcom/snda/woa/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v3, p0, Lcom/snda/woa/ac;->d:Landroid/content/Context;

    invoke-static {v3}, Lcom/snda/woa/android/OpenAPI;->getUserId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "&sndaId="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "&sessionId="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p0, Lcom/snda/woa/ac;->b:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "&extParamIn="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v3, p0, Lcom/snda/woa/ac;->d:Landroid/content/Context;

    sget-object v4, Lcom/snda/woa/ce;->o:[Ljava/lang/String;

    sget v5, Lcom/snda/woa/ce;->b:I

    aget-object v4, v4, v5

    sget-object v5, Lcom/snda/woa/bj;->a:Ljava/lang/String;

    invoke-static {v3, v4, v2, v0, v5}, Lcom/snda/woa/av;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/snda/woa/bz;

    move-result-object v0

    invoke-virtual {v0}, Lcom/snda/woa/bz;->c()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v0}, Lcom/snda/woa/bz;->b()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/snda/woa/ac;->a(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/snda/woa/bz;->a()I

    move-result v2

    invoke-static {v2}, Lcom/snda/woa/android/OpenAPI;->getStatusText(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/snda/woa/ac;->e:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/snda/woa/bz;->a()I

    move-result v0

    :goto_0
    return v0

    :cond_1
    invoke-virtual {v0}, Lcom/snda/woa/bz;->b()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "resultCode"

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    const-string v3, "resultMsg"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/snda/woa/ac;->e:Ljava/lang/String;

    const-string v3, "token"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/snda/woa/ac;->f:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v2, "ChangePwdTask"

    const-string v3, "\u8c03\u7528\u63a5\u53e3\u8fdb\u884c\u4fee\u6539\u5bc6\u7801\u51fa\u9519: "

    invoke-static {v2, v3, v0}, Lcom/snda/woa/au;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {p0, v1}, Lcom/snda/woa/ac;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/snda/woa/ac;->d:Landroid/content/Context;

    invoke-static {v0}, Lcom/snda/woa/av;->a(Landroid/content/Context;)I

    move-result v0

    goto :goto_0
.end method


# virtual methods
.method protected varargs a([Ljava/lang/String;)Ljava/lang/Integer;
    .locals 10

    invoke-static {}, Lcom/snda/woa/bl;->a()Z

    move-result v0

    if-nez v0, :cond_0

    const v0, -0xa4cf7b

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/snda/woa/ac;->d:Landroid/content/Context;

    invoke-static {v0}, Lcom/snda/woa/at;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/snda/woa/cn;->c(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/snda/woa/ac;->d:Landroid/content/Context;

    invoke-static {v0}, Lcom/snda/woa/at;->b(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, -0xa4d09d

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    :cond_1
    const v0, -0xa4d097

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/snda/woa/ac;->c:Ljava/lang/String;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/snda/woa/ac;->c:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x6

    if-ge v0, v1, :cond_4

    :cond_3
    const v0, -0xa4d031

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/snda/woa/ac;->c:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1e

    if-le v0, v1, :cond_5

    const v0, -0xa4d032

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/snda/woa/ac;->c:Ljava/lang/String;

    const-string v1, "[A-Za-z0-9]*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_6

    const v0, -0xa4d033

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    :cond_6
    invoke-static {}, Lcom/snda/woa/k;->a()Lcom/snda/woa/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/snda/woa/k;->b()Lcom/snda/woa/k;

    move-result-object v7

    invoke-direct {p0}, Lcom/snda/woa/ac;->b()I

    move-result v6

    invoke-virtual {v7}, Lcom/snda/woa/k;->c()Lcom/snda/woa/k;

    new-instance v0, Lcom/snda/woa/bw;

    iget-object v1, p0, Lcom/snda/woa/ac;->d:Landroid/content/Context;

    const/16 v2, 0x49

    const-string v3, "120"

    invoke-virtual {v7}, Lcom/snda/woa/k;->d()J

    move-result-wide v4

    invoke-virtual {v7}, Lcom/snda/woa/k;->f()J

    move-result-wide v7

    invoke-virtual {p0}, Lcom/snda/woa/ac;->a()Ljava/lang/String;

    move-result-object v9

    invoke-direct/range {v0 .. v9}, Lcom/snda/woa/bw;-><init>(Landroid/content/Context;ILjava/lang/String;JIJLjava/lang/String;)V

    iput-object v0, p0, Lcom/snda/woa/ac;->j:Lcom/snda/woa/bw;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto/16 :goto_0
.end method

.method protected a(Ljava/lang/Integer;)V
    .locals 9

    invoke-super {p0, p1}, Lcom/snda/woa/as;->onPostExecute(Ljava/lang/Object;)V

    invoke-static {}, Lcom/snda/woa/bl;->b()V

    const-string v0, "ChangePwdTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "errCode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/snda/woa/au;->c(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/snda/woa/ac;->h:J

    sub-long v7, v0, v2

    new-instance v0, Lcom/snda/woa/bw;

    iget-object v1, p0, Lcom/snda/woa/ac;->d:Landroid/content/Context;

    const/16 v2, 0x49

    const-string v3, "0"

    iget-wide v4, p0, Lcom/snda/woa/ac;->h:J

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-direct/range {v0 .. v8}, Lcom/snda/woa/bw;-><init>(Landroid/content/Context;ILjava/lang/String;JIJ)V

    iput-object v0, p0, Lcom/snda/woa/ac;->i:Lcom/snda/woa/bw;

    iget-object v0, p0, Lcom/snda/woa/ac;->i:Lcom/snda/woa/bw;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/snda/woa/ac;->d:Landroid/content/Context;

    iget-object v1, p0, Lcom/snda/woa/ac;->i:Lcom/snda/woa/bw;

    invoke-static {v0, v1}, Lcom/snda/woa/bc;->a(Landroid/content/Context;Lcom/snda/woa/bw;)V

    :cond_0
    iget-object v0, p0, Lcom/snda/woa/ac;->j:Lcom/snda/woa/bw;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/snda/woa/ac;->d:Landroid/content/Context;

    iget-object v1, p0, Lcom/snda/woa/ac;->j:Lcom/snda/woa/bw;

    invoke-static {v0, v1}, Lcom/snda/woa/bc;->a(Landroid/content/Context;Lcom/snda/woa/bw;)V

    :cond_1
    iget-object v0, p0, Lcom/snda/woa/ac;->d:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/snda/woa/bc;->b(Landroid/content/Context;Lcom/snda/woa/bw;)V

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "\u606d\u559c\u60a8\uff0c\u5bc6\u7801\u4fee\u6539\u6210\u529f\uff0c\u8bf7\u7262\u8bb0\uff01"

    iput-object v0, p0, Lcom/snda/woa/ac;->e:Ljava/lang/String;

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/snda/woa/ac;->a:Lcom/snda/woa/android/callback/CallBack;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Lcom/snda/woa/ac;->e:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/snda/woa/android/callback/CallBack;->callBack(ILjava/lang/String;)V

    iget-object v1, p0, Lcom/snda/woa/ac;->d:Landroid/content/Context;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_4

    const/4 v0, 0x1

    :goto_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget-object v3, p0, Lcom/snda/woa/ac;->f:Ljava/lang/String;

    invoke-static {v1, v0, v2, v3}, Lcom/snda/woa/android/OpenAPI;->loginFeedBack(Landroid/content/Context;ZILjava/lang/String;)V

    return-void

    :cond_3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Lcom/snda/woa/android/OpenAPI;->getStatusText(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/snda/woa/cn;->d(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    iput-object v0, p0, Lcom/snda/woa/ac;->e:Ljava/lang/String;

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    goto :goto_1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/snda/woa/ac;->a([Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/snda/woa/ac;->a(Ljava/lang/Integer;)V

    return-void
.end method
