.class public Lcom/snda/woa/bn;
.super Landroid/os/AsyncTask;


# instance fields
.field private a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p1, p0, Lcom/snda/woa/bn;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method protected varargs a([Ljava/lang/String;)Ljava/lang/String;
    .locals 11

    const-wide/16 v4, 0x0

    const/16 v2, 0xa

    invoke-static {v2}, Lcom/snda/woa/cm;->b(I)V

    iget-object v10, p0, Lcom/snda/woa/bn;->a:Landroid/content/Context;

    new-instance v0, Lcom/snda/woa/bw;

    iget-object v1, p0, Lcom/snda/woa/bn;->a:Landroid/content/Context;

    const-string v3, "0"

    const/4 v6, 0x0

    const/4 v9, 0x1

    move-wide v7, v4

    invoke-direct/range {v0 .. v9}, Lcom/snda/woa/bw;-><init>(Landroid/content/Context;ILjava/lang/String;JIJI)V

    invoke-static {v10, v0}, Lcom/snda/woa/bc;->b(Landroid/content/Context;Lcom/snda/woa/bw;)V

    const-string v0, "InitTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "versioncode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/snda/woa/bn;->a:Landroid/content/Context;

    invoke-static {v2}, Lcom/snda/woa/ax;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/snda/woa/au;->c(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "InitTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "versionname: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/snda/woa/bn;->a:Landroid/content/Context;

    invoke-static {v2}, Lcom/snda/woa/ax;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/snda/woa/au;->c(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "InitTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "appid: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/snda/woa/bn;->a:Landroid/content/Context;

    invoke-static {v2}, Lcom/snda/woa/ax;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/snda/woa/au;->c(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "InitTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "productid: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/snda/woa/bn;->a:Landroid/content/Context;

    invoke-static {v2}, Lcom/snda/woa/ax;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/snda/woa/au;->c(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "InitTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "channelid: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/snda/woa/bn;->a:Landroid/content/Context;

    invoke-static {v2}, Lcom/snda/woa/ax;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/snda/woa/au;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/snda/woa/bn;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/snda/woa/l;->a(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/snda/woa/bn;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/snda/woa/ah;->a(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "0"

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected a(Ljava/lang/String;)V
    .locals 1

    invoke-static {}, Lcom/snda/woa/cm;->e()V

    if-eqz p1, :cond_0

    const/16 v0, 0x64

    invoke-static {v0}, Lcom/snda/woa/cm;->b(I)V

    :goto_0
    return-void

    :cond_0
    const/4 v0, -0x1

    invoke-static {v0}, Lcom/snda/woa/cm;->b(I)V

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/snda/woa/bn;->a([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/snda/woa/bn;->a(Ljava/lang/String;)V

    return-void
.end method
