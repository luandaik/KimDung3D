.class public Lcom/unionpay/mobile/android/pro/pboc/engine/b;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Handler$Callback;
.implements Lcom/unionpay/mobile/android/pboctransaction/samsung/f$a;


# instance fields
.field private A:Lcom/unionpay/mobile/android/pro/pboc/engine/a;

.field private B:Z

.field private final a:I

.field private final b:I

.field private final c:I

.field private final d:I

.field private final e:I

.field private f:I

.field private g:Landroid/content/Context;

.field private h:Landroid/os/Handler;

.field private i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/unionpay/mobile/android/model/c;",
            ">;"
        }
    .end annotation
.end field

.field private j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/unionpay/mobile/android/model/c;",
            ">;"
        }
    .end annotation
.end field

.field private k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/unionpay/mobile/android/model/c;",
            ">;"
        }
    .end annotation
.end field

.field private l:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/unionpay/mobile/android/model/c;",
            ">;"
        }
    .end annotation
.end field

.field private m:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/unionpay/mobile/android/model/c;",
            ">;"
        }
    .end annotation
.end field

.field private n:Lcom/unionpay/mobile/android/pboctransaction/d;

.field private o:Lcom/unionpay/mobile/android/pboctransaction/c;

.field private final p:Lcom/unionpay/mobile/android/pboctransaction/b;

.field private q:Lcom/unionpay/mobile/android/pboctransaction/d;

.field private r:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

.field private final s:Lcom/unionpay/mobile/android/pboctransaction/b;

.field private t:Lcom/unionpay/mobile/android/pboctransaction/d;

.field private u:Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;

.field private final v:Lcom/unionpay/mobile/android/pboctransaction/b;

.field private w:Lcom/unionpay/mobile/android/pboctransaction/d;

.field private x:Lcom/unionpay/mobile/android/pboctransaction/samsung/b;

.field private y:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

.field private final z:Lcom/unionpay/mobile/android/pboctransaction/b;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a:I

    iput v3, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->b:I

    const/4 v0, 0x2

    iput v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->c:I

    const/4 v0, 0x4

    iput v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->d:I

    const/16 v0, 0x8

    iput v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->e:I

    iput v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->f:I

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->g:Landroid/content/Context;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->h:Landroid/os/Handler;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->i:Ljava/util/ArrayList;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->j:Ljava/util/ArrayList;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->k:Ljava/util/ArrayList;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->l:Ljava/util/ArrayList;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->m:Ljava/util/ArrayList;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->n:Lcom/unionpay/mobile/android/pboctransaction/d;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->o:Lcom/unionpay/mobile/android/pboctransaction/c;

    new-instance v0, Lcom/unionpay/mobile/android/pro/pboc/engine/c;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/pro/pboc/engine/c;-><init>(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->p:Lcom/unionpay/mobile/android/pboctransaction/b;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->q:Lcom/unionpay/mobile/android/pboctransaction/d;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->r:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    new-instance v0, Lcom/unionpay/mobile/android/pro/pboc/engine/d;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/pro/pboc/engine/d;-><init>(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->s:Lcom/unionpay/mobile/android/pboctransaction/b;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->t:Lcom/unionpay/mobile/android/pboctransaction/d;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->u:Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;

    new-instance v0, Lcom/unionpay/mobile/android/pro/pboc/engine/e;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/pro/pboc/engine/e;-><init>(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->v:Lcom/unionpay/mobile/android/pboctransaction/b;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->w:Lcom/unionpay/mobile/android/pboctransaction/d;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->x:Lcom/unionpay/mobile/android/pboctransaction/samsung/b;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->y:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    new-instance v0, Lcom/unionpay/mobile/android/pro/pboc/engine/f;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/pro/pboc/engine/f;-><init>(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->z:Lcom/unionpay/mobile/android/pboctransaction/b;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->A:Lcom/unionpay/mobile/android/pro/pboc/engine/a;

    iput-boolean v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->B:Z

    iput-object p1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->g:Landroid/content/Context;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->h:Landroid/os/Handler;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->i:Ljava/util/ArrayList;

    check-cast p1, Lcom/unionpay/mobile/android/plugin/BaseActivity;

    const-class v0, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    invoke-virtual {v0}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/unionpay/mobile/android/plugin/BaseActivity;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/fully/a;

    const-string v1, "cn.gov.pbc.tsm.client.mobile.andorid"

    invoke-direct {p0, v1, v3}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;

    invoke-direct {v1}, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;-><init>()V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->o:Lcom/unionpay/mobile/android/pboctransaction/c;

    :goto_0
    new-instance v1, Lcom/unionpay/mobile/android/pboctransaction/d;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->o:Lcom/unionpay/mobile/android/pboctransaction/c;

    invoke-direct {v1, v2, v0, p2}, Lcom/unionpay/mobile/android/pboctransaction/d;-><init>(Lcom/unionpay/mobile/android/pboctransaction/c;Lcom/unionpay/mobile/android/fully/a;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->n:Lcom/unionpay/mobile/android/pboctransaction/d;

    :try_start_0
    const-string v1, "org.simalliance.openmobileapi.SEService"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    new-instance v1, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    invoke-direct {v1}, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;-><init>()V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->r:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    new-instance v1, Lcom/unionpay/mobile/android/pboctransaction/d;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->r:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    invoke-direct {v1, v2, v0, p2}, Lcom/unionpay/mobile/android/pboctransaction/d;-><init>(Lcom/unionpay/mobile/android/pboctransaction/c;Lcom/unionpay/mobile/android/fully/a;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->q:Lcom/unionpay/mobile/android/pboctransaction/d;

    invoke-static {}, Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;->e()Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;

    move-result-object v1

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->u:Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;

    new-instance v1, Lcom/unionpay/mobile/android/pboctransaction/d;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->u:Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;

    invoke-direct {v1, v2, v0, p2}, Lcom/unionpay/mobile/android/pboctransaction/d;-><init>(Lcom/unionpay/mobile/android/pboctransaction/c;Lcom/unionpay/mobile/android/fully/a;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->t:Lcom/unionpay/mobile/android/pboctransaction/d;

    const-string v1, "com.unionpay.tsmservice"

    const/4 v2, 0x5

    invoke-direct {p0, v1, v2}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-direct {v1, p0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;-><init>(Lcom/unionpay/mobile/android/pboctransaction/samsung/f$a;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->y:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->y:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->h:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->a(Landroid/os/Handler;)V

    new-instance v1, Lcom/unionpay/mobile/android/pboctransaction/d;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->y:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-direct {v1, v2, v0, p2}, Lcom/unionpay/mobile/android/pboctransaction/d;-><init>(Lcom/unionpay/mobile/android/pboctransaction/c;Lcom/unionpay/mobile/android/fully/a;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->w:Lcom/unionpay/mobile/android/pboctransaction/d;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :goto_1
    return-void

    :cond_0
    new-instance v1, Lcom/unionpay/mobile/android/pboctransaction/sdapdu/a;

    invoke-direct {v1}, Lcom/unionpay/mobile/android/pboctransaction/sdapdu/a;-><init>()V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->o:Lcom/unionpay/mobile/android/pboctransaction/c;

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :try_start_1
    sput-boolean v1, Lcom/unionpay/mobile/android/model/b;->aB:Z

    new-instance v1, Lcom/unionpay/mobile/android/pboctransaction/samsung/b;

    invoke-direct {v1}, Lcom/unionpay/mobile/android/pboctransaction/samsung/b;-><init>()V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->x:Lcom/unionpay/mobile/android/pboctransaction/samsung/b;

    new-instance v1, Lcom/unionpay/mobile/android/pboctransaction/d;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->x:Lcom/unionpay/mobile/android/pboctransaction/samsung/b;

    invoke-direct {v1, v2, v0, p2}, Lcom/unionpay/mobile/android/pboctransaction/d;-><init>(Lcom/unionpay/mobile/android/pboctransaction/c;Lcom/unionpay/mobile/android/fully/a;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->w:Lcom/unionpay/mobile/android/pboctransaction/d;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->s:Lcom/unionpay/mobile/android/pboctransaction/b;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/b;->b()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->v:Lcom/unionpay/mobile/android/pboctransaction/b;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/b;->b()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->z:Lcom/unionpay/mobile/android/pboctransaction/b;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/b;->b()V

    goto :goto_1

    :catch_1
    move-exception v0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->s:Lcom/unionpay/mobile/android/pboctransaction/b;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/b;->b()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->v:Lcom/unionpay/mobile/android/pboctransaction/b;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/b;->b()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->z:Lcom/unionpay/mobile/android/pboctransaction/b;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/b;->b()V

    goto :goto_1
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->h:Landroid/os/Handler;

    return-object v0
.end method

.method private final a(I)V
    .locals 3

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    const-string v0, "UPCardEngine"

    const-string v1, "sd"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->o:Lcom/unionpay/mobile/android/pboctransaction/c;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->o:Lcom/unionpay/mobile/android/pboctransaction/c;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->p:Lcom/unionpay/mobile/android/pboctransaction/b;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->g:Landroid/content/Context;

    invoke-interface {v0, v1, v2}, Lcom/unionpay/mobile/android/pboctransaction/c;->a(Lcom/unionpay/mobile/android/pboctransaction/b;Landroid/content/Context;)V

    :cond_0
    :goto_0
    :pswitch_1
    return-void

    :pswitch_2
    const-string v0, "UPCardEngine"

    const-string v1, "cmcc"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "com.unionpay.mobile.tsm"

    const/16 v1, 0xc

    invoke-direct {p0, v0, v1}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->r:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->r:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    iget-boolean v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->B:Z

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->a(Z)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->r:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->s:Lcom/unionpay/mobile/android/pboctransaction/b;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->g:Landroid/content/Context;

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->a(Lcom/unionpay/mobile/android/pboctransaction/b;Landroid/content/Context;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->s:Lcom/unionpay/mobile/android/pboctransaction/b;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/b;->b()V

    goto :goto_0

    :pswitch_3
    const-string v0, "UPCardEngine"

    const-string v1, "ic"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->u:Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->b()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ZTE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->u:Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->v:Lcom/unionpay/mobile/android/pboctransaction/b;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->g:Landroid/content/Context;

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;->a(Lcom/unionpay/mobile/android/pboctransaction/b;Landroid/content/Context;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->v:Lcom/unionpay/mobile/android/pboctransaction/b;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/b;->b()V

    goto :goto_0

    :pswitch_4
    const-string v0, "UPCardEngine"

    const-string v1, "se"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "com.unionpay.tsmservice"

    const/4 v1, 0x5

    invoke-direct {p0, v0, v1}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->y:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    if-eqz v0, :cond_3

    const-string v0, "uppay-spay"

    const-string v1, "type se  start init"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->y:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->z:Lcom/unionpay/mobile/android/pboctransaction/b;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->g:Landroid/content/Context;

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->a(Lcom/unionpay/mobile/android/pboctransaction/b;Landroid/content/Context;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->x:Lcom/unionpay/mobile/android/pboctransaction/samsung/b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->x:Lcom/unionpay/mobile/android/pboctransaction/samsung/b;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->z:Lcom/unionpay/mobile/android/pboctransaction/b;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->g:Landroid/content/Context;

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/mobile/android/pboctransaction/samsung/b;->a(Lcom/unionpay/mobile/android/pboctransaction/b;Landroid/content/Context;)V

    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->b(I)V

    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x5

    invoke-direct {p0, p1, v0}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method private a(Ljava/lang/String;I)Z
    .locals 5

    const/4 v1, 0x0

    const/4 v0, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->g:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    :goto_0
    if-eqz v1, :cond_0

    const-string v2, "tsm-client"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "tsm version code="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    iget v1, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    if-lt v1, p2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    :catch_0
    move-exception v2

    goto :goto_0

    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method static synthetic b(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Lcom/unionpay/mobile/android/pboctransaction/samsung/f;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->y:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    return-object v0
.end method

.method private static b()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private b(I)V
    .locals 2

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/unionpay/mobile/android/pro/pboc/engine/g;

    invoke-direct {v1, p0}, Lcom/unionpay/mobile/android/pro/pboc/engine/g;-><init>(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/unionpay/mobile/android/pro/pboc/engine/h;

    invoke-direct {v1, p0}, Lcom/unionpay/mobile/android/pro/pboc/engine/h;-><init>(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0

    :cond_2
    const/4 v0, 0x4

    if-ne p1, v0, :cond_3

    invoke-static {}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->b()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ZTE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/unionpay/mobile/android/pro/pboc/engine/i;

    invoke-direct {v1, p0}, Lcom/unionpay/mobile/android/pro/pboc/engine/i;-><init>(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0

    :cond_3
    const/16 v0, 0x8

    if-ne p1, v0, :cond_0

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/unionpay/mobile/android/pro/pboc/engine/j;

    invoke-direct {v1, p0}, Lcom/unionpay/mobile/android/pro/pboc/engine/j;-><init>(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method static synthetic c(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Lcom/unionpay/mobile/android/pboctransaction/d;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->n:Lcom/unionpay/mobile/android/pboctransaction/d;

    return-object v0
.end method

.method static synthetic d(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Lcom/unionpay/mobile/android/pboctransaction/d;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->q:Lcom/unionpay/mobile/android/pboctransaction/d;

    return-object v0
.end method

.method static synthetic e(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Lcom/unionpay/mobile/android/pboctransaction/d;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->t:Lcom/unionpay/mobile/android/pboctransaction/d;

    return-object v0
.end method

.method static synthetic f(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Lcom/unionpay/mobile/android/pboctransaction/d;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->w:Lcom/unionpay/mobile/android/pboctransaction/d;

    return-object v0
.end method


# virtual methods
.method public final a(Lcom/unionpay/mobile/android/model/c;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/unionpay/mobile/android/model/c;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Landroid/os/Bundle;"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v5, 0x1

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    invoke-interface {p1}, Lcom/unionpay/mobile/android/model/c;->c()I

    move-result v2

    invoke-interface {p1}, Lcom/unionpay/mobile/android/model/c;->d()I

    move-result v1

    if-ne v1, v5, :cond_7

    new-instance v1, Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;

    invoke-interface {p1}, Lcom/unionpay/mobile/android/model/c;->a()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v0}, Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1}, Lcom/unionpay/mobile/android/model/c;->d()I

    move-result v3

    if-ne v3, v5, :cond_2

    const-string v3, "2"

    :goto_1
    const/16 v4, 0x8

    if-ne v2, v4, :cond_3

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->n:Lcom/unionpay/mobile/android/pboctransaction/d;

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/unionpay/mobile/android/pboctransaction/d;->a(Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    goto :goto_0

    :cond_2
    const-string v3, "1"

    goto :goto_1

    :cond_3
    const/4 v4, 0x4

    if-ne v2, v4, :cond_4

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->q:Lcom/unionpay/mobile/android/pboctransaction/d;

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/unionpay/mobile/android/pboctransaction/d;->a(Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    goto :goto_0

    :cond_4
    const/16 v4, 0x10

    if-ne v2, v4, :cond_5

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->t:Lcom/unionpay/mobile/android/pboctransaction/d;

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/unionpay/mobile/android/pboctransaction/d;->a(Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    goto :goto_0

    :cond_5
    if-ne v2, v5, :cond_6

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->w:Lcom/unionpay/mobile/android/pboctransaction/d;

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/unionpay/mobile/android/pboctransaction/d;->a(Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    goto :goto_0

    :cond_6
    const/16 v3, 0x20

    if-ne v2, v3, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->w:Lcom/unionpay/mobile/android/pboctransaction/d;

    const-string v3, "10"

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/unionpay/mobile/android/pboctransaction/d;->a(Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    goto :goto_0

    :cond_7
    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    invoke-interface {p1}, Lcom/unionpay/mobile/android/model/c;->a()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->n:Lcom/unionpay/mobile/android/pboctransaction/d;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v1, v0, p2, p4, p5}, Lcom/unionpay/mobile/android/pboctransaction/d;->a(ILjava/lang/String;Ljava/util/HashMap;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    goto :goto_0
.end method

.method public final a()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->r:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->r:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->a()V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->r:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->o:Lcom/unionpay/mobile/android/pboctransaction/c;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->o:Lcom/unionpay/mobile/android/pboctransaction/c;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/c;->a()V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->o:Lcom/unionpay/mobile/android/pboctransaction/c;

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->u:Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->u:Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;->a()V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->u:Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;

    :cond_2
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->x:Lcom/unionpay/mobile/android/pboctransaction/samsung/b;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->x:Lcom/unionpay/mobile/android/pboctransaction/samsung/b;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/b;->a()V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->x:Lcom/unionpay/mobile/android/pboctransaction/samsung/b;

    :cond_3
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->y:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->y:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->a()V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->y:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    :cond_4
    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->g:Landroid/content/Context;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->A:Lcom/unionpay/mobile/android/pro/pboc/engine/a;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->h:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->h:Landroid/os/Handler;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->w:Lcom/unionpay/mobile/android/pboctransaction/d;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->n:Lcom/unionpay/mobile/android/pboctransaction/d;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->q:Lcom/unionpay/mobile/android/pboctransaction/d;

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->t:Lcom/unionpay/mobile/android/pboctransaction/d;

    const/4 v0, 0x0

    iput v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->f:I

    return-void
.end method

.method public final a(Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    sget-boolean v0, Lcom/unionpay/mobile/android/model/b;->aA:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/unionpay/mobile/android/model/b;->aB:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    sput-boolean v0, Lcom/unionpay/mobile/android/model/b;->bn:Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->y:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->w:Lcom/unionpay/mobile/android/pboctransaction/d;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->y:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-virtual {v0, p1}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->a(Landroid/os/Handler;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->y:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-virtual {v0, p2}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->b(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->y:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-virtual {v0, p3}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->c(Ljava/lang/String;)V

    const-string v0, "uppay-spay"

    const-string v1, "tsmservice  get spay card list"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->w:Lcom/unionpay/mobile/android/pboctransaction/d;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/pboctransaction/d;->b()Ljava/util/ArrayList;

    :cond_0
    return-void
.end method

.method public final a(Lcom/unionpay/mobile/android/pro/pboc/engine/a;Z)V
    .locals 1

    const/4 v0, 0x0

    iput-boolean p2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->B:Z

    iput-object p1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->A:Lcom/unionpay/mobile/android/pro/pboc/engine/a;

    iput v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->f:I

    invoke-direct {p0, v0}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(I)V

    return-void
.end method

.method public final a(Z)V
    .locals 2

    const-string v0, "uppay"

    const-string v1, "startReadList  spay"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    sput-boolean p1, Lcom/unionpay/mobile/android/model/b;->aB:Z

    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->b(I)V

    return-void
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 7

    const/16 v6, 0x8

    const/4 v5, 0x4

    const/4 v4, 0x2

    const/4 v3, 0x1

    const-string v0, "UPCardEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, " msg.what = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p1, Landroid/os/Message;->what:I

    if-eq v0, v3, :cond_0

    iget v0, p1, Landroid/os/Message;->what:I

    if-eq v0, v4, :cond_0

    iget v0, p1, Landroid/os/Message;->what:I

    if-eq v0, v5, :cond_0

    iget v0, p1, Landroid/os/Message;->what:I

    if-ne v0, v6, :cond_2

    :cond_0
    iget v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->f:I

    iget v1, p1, Landroid/os/Message;->what:I

    xor-int/2addr v0, v1

    iput v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->f:I

    const-string v0, "UPCardEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, " mTag = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->f:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_1

    iget v0, p1, Landroid/os/Message;->what:I

    if-ne v0, v3, :cond_8

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->j:Ljava/util/ArrayList;

    :cond_1
    :goto_0
    iget v0, p1, Landroid/os/Message;->what:I

    invoke-direct {p0, v0}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(I)V

    :cond_2
    iget v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->f:I

    const/16 v1, 0xf

    if-ne v0, v1, :cond_7

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->A:Lcom/unionpay/mobile/android/pro/pboc/engine/a;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->j:Ljava/util/ArrayList;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->j:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_3

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->i:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->j:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_3
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->k:Ljava/util/ArrayList;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_4

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->i:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->k:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_4
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->l:Ljava/util/ArrayList;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->l:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_5

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->i:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->l:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_5
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->m:Ljava/util/ArrayList;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->m:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_6

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->i:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->m:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_6
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->A:Lcom/unionpay/mobile/android/pro/pboc/engine/a;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->i:Ljava/util/ArrayList;

    invoke-interface {v0, v1}, Lcom/unionpay/mobile/android/pro/pboc/engine/a;->a(Ljava/util/ArrayList;)V

    :cond_7
    return v3

    :cond_8
    iget v0, p1, Landroid/os/Message;->what:I

    if-ne v0, v4, :cond_9

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->k:Ljava/util/ArrayList;

    goto :goto_0

    :cond_9
    iget v0, p1, Landroid/os/Message;->what:I

    if-ne v0, v5, :cond_a

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->l:Ljava/util/ArrayList;

    goto :goto_0

    :cond_a
    iget v0, p1, Landroid/os/Message;->what:I

    if-ne v0, v6, :cond_1

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->m:Ljava/util/ArrayList;

    goto/16 :goto_0
.end method
