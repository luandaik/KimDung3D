.class Lcom/snda/woa/cc;
.super Ljava/util/TimerTask;


# instance fields
.field final synthetic a:Lcom/snda/woa/by;


# direct methods
.method constructor <init>(Lcom/snda/woa/by;)V
    .locals 0

    iput-object p1, p0, Lcom/snda/woa/cc;->a:Lcom/snda/woa/by;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 20

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/snda/woa/cc;->a:Lcom/snda/woa/by;

    invoke-static {v2}, Lcom/snda/woa/by;->a(Lcom/snda/woa/by;)Landroid/content/Context;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/snda/woa/cc;->a:Lcom/snda/woa/by;

    invoke-static {v3}, Lcom/snda/woa/by;->b(Lcom/snda/woa/by;)J

    move-result-wide v4

    invoke-static {v2, v4, v5}, Lcom/snda/woa/cp;->a(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/snda/woa/cn;->d(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "CustomMobileLoginTask"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "smsCode "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/snda/woa/au;->c(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/snda/woa/cc;->a:Lcom/snda/woa/by;

    invoke-static {v4}, Lcom/snda/woa/by;->b(Lcom/snda/woa/by;)J

    move-result-wide v4

    sub-long v9, v2, v4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/snda/woa/cc;->a:Lcom/snda/woa/by;

    invoke-static {v2}, Lcom/snda/woa/by;->a(Lcom/snda/woa/by;)Landroid/content/Context;

    move-result-object v19

    new-instance v2, Lcom/snda/woa/bw;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/snda/woa/cc;->a:Lcom/snda/woa/by;

    invoke-static {v3}, Lcom/snda/woa/by;->a(Lcom/snda/woa/by;)Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/snda/woa/cm;->a:I

    const-string v5, "130"

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/snda/woa/cc;->a:Lcom/snda/woa/by;

    invoke-static {v6}, Lcom/snda/woa/by;->b(Lcom/snda/woa/by;)J

    move-result-wide v6

    const/4 v8, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const-string v13, ""

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/woa/cc;->a:Lcom/snda/woa/by;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/snda/woa/by;->c(Lcom/snda/woa/by;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    const-string v15, ""

    const-string v16, ""

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/woa/cc;->a:Lcom/snda/woa/by;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/snda/woa/by;->d(Lcom/snda/woa/by;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/woa/cc;->a:Lcom/snda/woa/by;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/snda/woa/by;->e(Lcom/snda/woa/by;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v2 .. v18}, Lcom/snda/woa/bw;-><init>(Landroid/content/Context;ILjava/lang/String;JIJILjava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-static {v0, v2}, Lcom/snda/woa/bc;->b(Landroid/content/Context;Lcom/snda/woa/bw;)V

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/snda/woa/cc;->a:Lcom/snda/woa/by;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/snda/woa/by;->a(Lcom/snda/woa/by;Z)Z

    invoke-virtual/range {p0 .. p0}, Lcom/snda/woa/cc;->cancel()Z

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/snda/woa/cc;->a:Lcom/snda/woa/by;

    invoke-static {v4}, Lcom/snda/woa/by;->b(Lcom/snda/woa/by;)J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/32 v4, 0x1b7740

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/snda/woa/cc;->a:Lcom/snda/woa/by;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/snda/woa/by;->a(Lcom/snda/woa/by;Z)Z

    invoke-virtual/range {p0 .. p0}, Lcom/snda/woa/cc;->cancel()Z

    :cond_1
    return-void
.end method
