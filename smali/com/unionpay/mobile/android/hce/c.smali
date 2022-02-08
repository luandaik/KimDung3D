.class public final Lcom/unionpay/mobile/android/hce/c;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unionpay/mobile/android/model/d;


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;

.field private g:Lcom/unionpay/mobile/android/hce/service/a;

.field private h:Landroid/content/ServiceConnection;


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;Ljava/lang/String;Lcom/unionpay/mobile/android/hce/service/a;Landroid/content/ServiceConnection;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "num"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/c;->a:Ljava/lang/String;

    const-string v0, "name"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/c;->b:Ljava/lang/String;

    const-string v0, "type"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/c;->d:Ljava/lang/String;

    const-string v0, "type"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/unionpay/mobile/android/hce/e;->a:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v0, Lcom/unionpay/mobile/android/hce/e;->e:Ljava/lang/String;

    :goto_0
    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/c;->c:Ljava/lang/String;

    const-string v0, "instNum"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/c;->e:Ljava/lang/String;

    iput-object p2, p0, Lcom/unionpay/mobile/android/hce/c;->f:Ljava/lang/String;

    iput-object p3, p0, Lcom/unionpay/mobile/android/hce/c;->g:Lcom/unionpay/mobile/android/hce/service/a;

    iput-object p4, p0, Lcom/unionpay/mobile/android/hce/c;->h:Landroid/content/ServiceConnection;

    return-void

    :cond_0
    sget-object v1, Lcom/unionpay/mobile/android/hce/e;->b:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v0, Lcom/unionpay/mobile/android/hce/e;->f:Ljava/lang/String;

    goto :goto_0

    :cond_1
    sget-object v1, Lcom/unionpay/mobile/android/hce/e;->c:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    sget-object v0, Lcom/unionpay/mobile/android/hce/e;->g:Ljava/lang/String;

    goto :goto_0

    :cond_2
    sget-object v1, Lcom/unionpay/mobile/android/hce/e;->d:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lcom/unionpay/mobile/android/hce/e;->h:Ljava/lang/String;

    goto :goto_0

    :cond_3
    const-string v0, ""

    goto :goto_0
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/c;->a:Ljava/lang/String;

    return-object v0
.end method

.method public final b()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/c;->b:Ljava/lang/String;

    return-object v0
.end method

.method public final c()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/c;->c:Ljava/lang/String;

    return-object v0
.end method

.method public final d()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/c;->d:Ljava/lang/String;

    return-object v0
.end method

.method public final e()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/c;->e:Ljava/lang/String;

    return-object v0
.end method

.method public final f()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/c;->f:Ljava/lang/String;

    return-object v0
.end method

.method public final g()Lcom/unionpay/mobile/android/hce/service/a;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/c;->g:Lcom/unionpay/mobile/android/hce/service/a;

    return-object v0
.end method

.method public final h()Landroid/content/ServiceConnection;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/c;->h:Landroid/content/ServiceConnection;

    return-object v0
.end method
