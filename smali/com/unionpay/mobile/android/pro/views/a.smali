.class public final Lcom/unionpay/mobile/android/pro/views/a;
.super Lcom/unionpay/mobile/android/nocard/views/b;

# interfaces
.implements Landroid/os/Handler$Callback;
.implements Lcom/unionpay/mobile/android/upviews/a$b;


# static fields
.field private static M:Ljava/sql/Date;

.field private static N:Ljava/lang/String;

.field private static P:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static Q:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private A:Lcom/unionpay/mobile/android/widgets/ay;

.field private B:Ljava/lang/String;

.field private C:Lcom/unionpay/mobile/android/hce/c;

.field private D:I

.field private E:Ljava/lang/String;

.field private F:Z

.field private G:Landroid/os/Handler$Callback;

.field private H:Landroid/os/Handler;

.field private I:Landroid/view/View$OnClickListener;

.field private J:Landroid/view/View$OnClickListener;

.field private K:Landroid/view/View$OnClickListener;

.field private L:Landroid/view/View$OnClickListener;

.field private O:Ljava/lang/String;

.field public r:Ljava/lang/String;

.field s:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

.field private t:I

.field private u:I

.field private v:Landroid/widget/TextView;

.field private w:Z

.field private x:Lcom/unionpay/mobile/android/upviews/a;

.field private y:Lcom/unionpay/mobile/android/upviews/a;

.field private z:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Ljava/sql/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/sql/Date;-><init>(J)V

    sput-object v0, Lcom/unionpay/mobile/android/pro/views/a;->M:Ljava/sql/Date;

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMddhhmmss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/unionpay/mobile/android/pro/views/a;->M:Ljava/sql/Date;

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/unionpay/mobile/android/pro/views/a;->N:Ljava/lang/String;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/unionpay/mobile/android/model/e;Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;)V
    .locals 3

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, p1, p2}, Lcom/unionpay/mobile/android/nocard/views/b;-><init>(Landroid/content/Context;Lcom/unionpay/mobile/android/model/e;)V

    const/16 v0, 0x14

    iput v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->t:I

    const/16 v0, 0x64

    iput v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->u:I

    const-string v0, "1.9"

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->r:Ljava/lang/String;

    iput-object v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->v:Landroid/widget/TextView;

    iput-boolean v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->w:Z

    iput-object v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->x:Lcom/unionpay/mobile/android/upviews/a;

    iput-object v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->y:Lcom/unionpay/mobile/android/upviews/a;

    iput-object v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->z:Landroid/os/Handler;

    const/4 v0, 0x5

    iput v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->D:I

    iput-boolean v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->F:Z

    new-instance v0, Lcom/unionpay/mobile/android/pro/views/b;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/pro/views/b;-><init>(Lcom/unionpay/mobile/android/pro/views/a;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->G:Landroid/os/Handler$Callback;

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->G:Landroid/os/Handler$Callback;

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->H:Landroid/os/Handler;

    new-instance v0, Lcom/unionpay/mobile/android/pro/views/c;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/pro/views/c;-><init>(Lcom/unionpay/mobile/android/pro/views/a;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->I:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/unionpay/mobile/android/pro/views/d;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/pro/views/d;-><init>(Lcom/unionpay/mobile/android/pro/views/a;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->J:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/unionpay/mobile/android/pro/views/e;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/pro/views/e;-><init>(Lcom/unionpay/mobile/android/pro/views/a;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->K:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/unionpay/mobile/android/pro/views/f;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/pro/views/f;-><init>(Lcom/unionpay/mobile/android/pro/views/a;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->L:Landroid/view/View$OnClickListener;

    iput-object v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->O:Ljava/lang/String;

    const/4 v0, 0x6

    iput v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->f:I

    const-string v0, "hcepay"

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->q:Ljava/lang/String;

    iput-object p3, p0, Lcom/unionpay/mobile/android/pro/views/a;->s:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->z:Landroid/os/Handler;

    sget-object v0, Lcom/unionpay/mobile/android/model/b;->bb:Ljava/util/List;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget v1, v1, Lcom/unionpay/mobile/android/model/b;->bc:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/hce/c;

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->C:Lcom/unionpay/mobile/android/hce/c;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v0, v0, Lcom/unionpay/mobile/android/model/b;->K:Z

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->w:Z

    const v0, -0x10100c

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/pro/views/a;->setBackgroundColor(I)V

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/pro/views/a;->e()V

    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/pro/views/a;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->H:Landroid/os/Handler;

    return-object v0
.end method

.method private a(Landroid/widget/LinearLayout;)V
    .locals 13

    const/4 v9, 0x0

    const/4 v10, 0x0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->y:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->y:Lcom/unionpay/mobile/android/upviews/a;

    const-string v1, "instalment"

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v10

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->z:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    move v1, v9

    :goto_0
    if-ge v1, v2, :cond_3

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->z:Lorg/json/JSONArray;

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/i;->b(Lorg/json/JSONArray;I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    :try_start_0
    check-cast v0, Lorg/json/JSONObject;

    const-string v4, "pan"

    const-string v5, "type"

    invoke-static {v0, v5}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string v4, "label"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/unionpay/mobile/android/pro/views/a;->C:Lcom/unionpay/mobile/android/hce/c;

    invoke-virtual {v6}, Lcom/unionpay/mobile/android/hce/c;->b()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/unionpay/mobile/android/pro/views/a;->C:Lcom/unionpay/mobile/android/hce/c;

    invoke-virtual {v6}, Lcom/unionpay/mobile/android/hce/c;->c()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    :goto_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    :cond_3
    new-instance v1, Lcom/unionpay/mobile/android/upviews/a;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->d:Landroid/content/Context;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c()J

    move-result-wide v4

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->C:Lcom/unionpay/mobile/android/hce/c;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/c;->a()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v11, v0, Lcom/unionpay/mobile/android/model/b;->ad:Lorg/json/JSONArray;

    iget-object v12, p0, Lcom/unionpay/mobile/android/pro/views/a;->q:Ljava/lang/String;

    move-object v6, p0

    invoke-direct/range {v1 .. v12}, Lcom/unionpay/mobile/android/upviews/a;-><init>(Landroid/content/Context;Lorg/json/JSONArray;JLcom/unionpay/mobile/android/upviews/a$b;Ljava/lang/String;ZZLcom/unionpay/mobile/android/widgets/z;Lorg/json/JSONArray;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->x:Lcom/unionpay/mobile/android/upviews/a;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->x:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {p1, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/pro/views/a;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/unionpay/mobile/android/pro/views/a;->a(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/pro/views/a;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const/16 v0, 0x8

    iput v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->u:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    invoke-virtual {v0, p1, p2}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/pro/views/a;Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->d:Landroid/content/Context;

    check-cast v0, Lcom/unionpay/uppay/PayActivity;

    const-class v1, Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-virtual {v1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/unionpay/uppay/PayActivity;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast v0, Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    :goto_0
    if-nez v0, :cond_1

    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/pro/views/a;->b(I)V

    :goto_1
    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/unionpay/mobile/android/pro/views/g;

    invoke-direct {v1, p0, p1, p2}, Lcom/unionpay/mobile/android/pro/views/g;-><init>(Lcom/unionpay/mobile/android/pro/views/a;Ljava/lang/String;Ljava/util/HashMap;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_1
.end method

.method private static a(Ljava/lang/StringBuffer;)V
    .locals 6

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v1, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    const/4 v3, 0x1

    new-array v3, v3, [B

    const/4 v4, 0x0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-byte v5, v5

    aput-byte v5, v3, v4

    array-length v4, v3

    invoke-static {v3, v4}, Lcom/unionpay/mobile/android/pboctransaction/e;->a([BI)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    :cond_1
    return-void
.end method

.method private declared-synchronized b(Ljava/lang/String;Ljava/util/HashMap;)Landroid/os/Bundle;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/unionpay/mobile/android/pro/views/a;->v()Landroid/os/Bundle;

    move-result-object v1

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v2, "PIN"

    invoke-virtual {v0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v2, "AN1"

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/a;->C:Lcom/unionpay/mobile/android/hce/c;

    invoke-virtual {v3}, Lcom/unionpay/mobile/android/hce/c;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/a;->a(Ljava/lang/StringBuffer;)V

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v3, "DCD"

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->be:Ljava/lang/String;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->s:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    invoke-virtual {v2}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->b()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/unionpay/mobile/android/pro/views/a;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->B:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v2, "5F34"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    new-instance v2, Ljava/lang/StringBuffer;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v3, "5F34"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x0

    const-string v3, "0"

    invoke-virtual {v2, v0, v3}, Ljava/lang/StringBuffer;->insert(ILjava/lang/String;)Ljava/lang/StringBuffer;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v3, "5F34"

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v2, "57"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_5

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v2, "57"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    move-object v2, v0

    :goto_1
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v3, "f"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v3, "F"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    move-object v2, v0

    goto :goto_1

    :cond_1
    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v2, "5F34"

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_2
    :try_start_1
    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v3, "TD2"

    invoke-virtual {v2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "D"

    invoke-virtual {v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v0, 0x0

    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v4, "F"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string v4, "f"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    :cond_3
    const/4 v4, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_4
    sget-object v4, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v5, "AN1"

    invoke-virtual {v4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v3, 0x1

    add-int/lit8 v3, v3, 0x5

    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v3, "ED"

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v2, "AMT"

    sget-object v3, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v4, "9F02"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, ""

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "pan="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v3, "AN1"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "&pin="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v3, "PIN"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "&icc_data="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v3, "DCD"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "&card_seq_id="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v3, "5F34"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "&auth_id="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->bf:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "mac"

    invoke-static {v2, v0}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/a;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "md5"

    invoke-static {v3, v2}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/a;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    invoke-virtual {v3, v2}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "sig"

    invoke-static {v3, v2}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "&"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/a;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    iget-object v4, p0, Lcom/unionpay/mobile/android/pro/views/a;->B:Ljava/lang/String;

    invoke-virtual {v3, v0, v4}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    :try_start_2
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "v"

    iget-object v5, p0, Lcom/unionpay/mobile/android/pro/views/a;->r:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "cmd"

    const-string v5, "pay"

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "params"

    invoke-virtual {v3, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v5, "encrypt_key_field"

    invoke-virtual {v4, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "pay_type"

    const-string v5, "2"

    invoke-virtual {v4, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "pay_mode"

    const-string v5, "1"

    invoke-virtual {v4, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "bind"

    const-string v5, "no"

    invoke-virtual {v4, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "carrier_tp"

    const-string v5, "9"

    invoke-virtual {v4, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "carrier_app_tp"

    const-string v5, "0"

    invoke-virtual {v4, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "sign"

    invoke-virtual {v4, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "pan"

    sget-object v2, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v5, "AN1"

    invoke-virtual {v2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v4, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v2, "ED"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_6

    const-string v0, "expire"

    sget-object v2, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v5, "ED"

    invoke-virtual {v2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v4, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_6
    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v2, "TD2"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_7

    const-string v0, "track2_data"

    sget-object v2, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v5, "TD2"

    invoke-virtual {v2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v4, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_7
    if-eqz p2, :cond_8

    invoke-virtual {p2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_8

    invoke-virtual {p2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    if-lez v0, :cond_8

    const-string v0, "pan"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "pin"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :catch_0
    move-exception v0

    :try_start_3
    const-string v0, "action_resp_code"

    const-string v2, "10019"

    invoke-virtual {v1, v0, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v0, v1

    :goto_3
    monitor-exit p0

    return-object v0

    :cond_8
    :try_start_4
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v0

    :try_start_5
    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->s:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    invoke-virtual {v2, v0}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "action_resp_message"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-object v0, v1

    goto :goto_3
.end method

.method static synthetic b(Lcom/unionpay/mobile/android/pro/views/a;)Lcom/unionpay/mobile/android/hce/c;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->C:Lcom/unionpay/mobile/android/hce/c;

    return-object v0
.end method

.method static synthetic b(Lcom/unionpay/mobile/android/pro/views/a;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/unionpay/mobile/android/pro/views/a;->a(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic b(Lcom/unionpay/mobile/android/pro/views/a;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/unionpay/mobile/android/pro/views/a;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private b(Ljava/util/HashMap;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    const/16 v7, 0x8

    const/4 v1, 0x1

    const/4 v2, 0x0

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->N:Ljava/lang/String;

    const/4 v3, 0x2

    invoke-virtual {v0, v3, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    new-instance v0, Ljava/sql/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {v0, v4, v5}, Ljava/sql/Date;-><init>(J)V

    invoke-virtual {v0}, Ljava/sql/Date;->getTime()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v6, v7, :cond_0

    const-string v0, "%08d"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v6, v2

    invoke-static {v0, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    sget-object v4, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v5, "9F26"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v4, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v5, "9F27"

    const-string v6, "80"

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v4, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v5, "9F10"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v4, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v5, "9F37"

    invoke-virtual {v4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v4, "9F36"

    const-string v5, ""

    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v4, "95"

    const-string v5, "0000000800"

    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v4, "9A"

    invoke-virtual {v0, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "9C"

    const-string v4, "45"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "9F02"

    const-string v4, "000000000000"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "5F2A"

    const-string v4, "0156"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "82"

    const-string v4, ""

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "9F1A"

    const-string v4, "0156"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "9F03"

    const-string v4, "000000000000"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "9F33"

    const-string v4, "A04000"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "9F34"

    const-string v4, "420300"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "9F35"

    const-string v4, "34"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "9F1E"

    const-string v4, "3030303030303030"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "84"

    const-string v4, ""

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "9F09"

    const-string v4, "0001"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "9F41"

    const-string v4, ""

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "91"

    const-string v4, ""

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "71"

    const-string v4, ""

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "72"

    const-string v4, ""

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "DF31"

    const-string v4, ""

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "9F74"

    const-string v4, ""

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "9F63"

    const-string v4, ""

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "8A"

    const-string v4, ""

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v3, "9F66"

    const-string v4, "26C00000"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/unionpay/mobile/android/pro/views/a;->v()Landroid/os/Bundle;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "9F02"

    const-string v4, "trans_amt"

    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "9F1A"

    const-string v4, "0156"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "5F2A"

    const-string v4, "trans currcy code"

    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v3, "9C"

    const-string v4, "trans_type"

    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v3, "CUR"

    sget-object v4, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v5, "5F2A"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v0, "9F66"

    sget-object v4, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    const-string v5, "9F66"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "9F02"

    sget-object v4, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v5, "9F02"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "9F03"

    sget-object v4, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v5, "9F03"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "9F1A"

    sget-object v4, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v5, "9F1A"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "95"

    sget-object v4, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v5, "95"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "5F2A"

    sget-object v4, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v5, "5F2A"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "9A"

    sget-object v4, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v5, "9A"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "9C"

    sget-object v4, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v5, "9C"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "9F37"

    sget-object v4, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v5, "9F37"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->C:Lcom/unionpay/mobile/android/hce/c;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/c;->f()Ljava/lang/String;

    move-result-object v0

    iget-object v4, p0, Lcom/unionpay/mobile/android/pro/views/a;->C:Lcom/unionpay/mobile/android/hce/c;

    invoke-virtual {v4}, Lcom/unionpay/mobile/android/hce/c;->g()Lcom/unionpay/mobile/android/hce/service/a;

    move-result-object v4

    iget-object v5, p0, Lcom/unionpay/mobile/android/pro/views/a;->C:Lcom/unionpay/mobile/android/hce/c;

    invoke-virtual {v5}, Lcom/unionpay/mobile/android/hce/c;->a()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v0}, Lcom/unionpay/mobile/android/hce/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/unionpay/mobile/android/hce/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :try_start_1
    const-string v3, ""

    new-instance v6, Lcom/unionpay/mobile/android/hce/b;

    const/16 v7, 0x7d4

    const-string v8, ""

    iget-object v9, p0, Lcom/unionpay/mobile/android/pro/views/a;->H:Landroid/os/Handler;

    invoke-direct {v6, v7, v8, v9}, Lcom/unionpay/mobile/android/hce/b;-><init>(ILjava/lang/String;Landroid/os/Handler;)V

    invoke-interface {v4, v5, v0, v3, v6}, Lcom/unionpay/mobile/android/hce/service/a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/unionpay/mobile/android/hce/service/b;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->H:Landroid/os/Handler;

    const/16 v3, 0x7d6

    invoke-virtual {v0, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/a;->H:Landroid/os/Handler;

    iget-object v4, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget v4, v4, Lcom/unionpay/mobile/android/model/b;->bd:I

    int-to-long v4, v4

    invoke-virtual {v3, v0, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    move v0, v1

    :goto_2
    return v0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x8

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->ap:Ljava/lang/String;

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/mobile/android/pro/views/a;->a(Ljava/lang/String;Z)V

    move v0, v2

    goto :goto_2
.end method

.method static synthetic c(Lcom/unionpay/mobile/android/pro/views/a;)Lcom/unionpay/mobile/android/model/b;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    return-object v0
.end method

.method static synthetic c(Lcom/unionpay/mobile/android/pro/views/a;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/unionpay/mobile/android/pro/views/a;->a(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic d(Lcom/unionpay/mobile/android/pro/views/a;)Lcom/unionpay/mobile/android/model/b;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    return-object v0
.end method

.method private static final d(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    const-string v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/security/MessageDigest;->update([B)V

    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/e;->a([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    invoke-static {p0}, Lcom/unionpay/mobile/android/pboctransaction/e;->a(Ljava/lang/String;)[B

    move-result-object v1

    invoke-static {p1}, Lcom/unionpay/mobile/android/pboctransaction/e;->a(Ljava/lang/String;)[B

    move-result-object v2

    const/4 v0, 0x0

    :goto_0
    array-length v3, v1

    if-ge v0, v3, :cond_0

    aget-byte v3, v1, v0

    aget-byte v4, v2, v0

    xor-int/2addr v3, v4

    int-to-byte v3, v3

    aput-byte v3, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-static {v1}, Lcom/unionpay/mobile/android/pboctransaction/e;->a([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic d(Lcom/unionpay/mobile/android/pro/views/a;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/unionpay/mobile/android/pro/views/a;->a(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic d(Lorg/json/JSONObject;)Z
    .locals 5

    const/4 v1, 0x0

    if-nez p0, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "5F34"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "57"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "9F6C"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "9F5D"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "5F20"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    :cond_2
    sget-object v4, Lcom/unionpay/mobile/android/pro/views/a;->Q:Ljava/util/HashMap;

    invoke-virtual {v4, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_3
    sget-object v4, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    invoke-virtual {v4, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_4
    sget-object v0, Lcom/unionpay/mobile/android/pro/views/a;->P:Ljava/util/HashMap;

    const-string v2, "9F10"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/e;->a(Ljava/lang/String;)[B

    move-result-object v0

    const/4 v2, 0x4

    aget-byte v0, v0, v2

    and-int/lit8 v0, v0, 0x30

    int-to-byte v0, v0

    const/16 v2, 0x20

    if-eq v0, v2, :cond_5

    move v0, v1

    goto :goto_0

    :cond_5
    const/4 v0, 0x1

    goto :goto_0
.end method

.method static synthetic e(Lcom/unionpay/mobile/android/pro/views/a;)Lcom/unionpay/mobile/android/upviews/a;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->x:Lcom/unionpay/mobile/android/upviews/a;

    return-object v0
.end method

.method static synthetic e(Lcom/unionpay/mobile/android/pro/views/a;Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/unionpay/mobile/android/pro/views/a;->a(Ljava/lang/String;)V

    return-void
.end method

.method private e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    const/16 v0, 0x9

    iput v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->u:I

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    const-string v1, ""

    invoke-virtual {v0, p1, v1}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->D:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->D:I

    return-void

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\"uuid\":\""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    const/16 v2, 0xa

    invoke-virtual {v1, p1, v0, v2}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->a(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method static synthetic f(Lcom/unionpay/mobile/android/pro/views/a;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pro/views/a;->E:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic f(Lcom/unionpay/mobile/android/pro/views/a;)Ljava/util/HashMap;
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->x:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->x:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->c()Ljava/util/HashMap;

    move-result-object v0

    :cond_0
    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->y:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->y:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upviews/a;->c()Ljava/util/HashMap;

    move-result-object v1

    if-eqz v1, :cond_2

    if-eqz v0, :cond_2

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    :cond_1
    :goto_0
    return-object v0

    :cond_2
    if-eqz v1, :cond_1

    if-nez v0, :cond_1

    move-object v0, v1

    goto :goto_0
.end method

.method static synthetic g(Lcom/unionpay/mobile/android/pro/views/a;)Lcom/unionpay/mobile/android/model/b;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    return-object v0
.end method

.method static synthetic g(Lcom/unionpay/mobile/android/pro/views/a;Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/unionpay/mobile/android/pro/views/a;->a(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic h(Lcom/unionpay/mobile/android/pro/views/a;)Lcom/unionpay/mobile/android/model/b;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    return-object v0
.end method

.method static synthetic i(Lcom/unionpay/mobile/android/pro/views/a;)I
    .locals 1

    const/4 v0, 0x5

    iput v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->D:I

    return v0
.end method

.method static synthetic j(Lcom/unionpay/mobile/android/pro/views/a;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->d:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic k(Lcom/unionpay/mobile/android/pro/views/a;)Lcom/unionpay/mobile/android/model/b;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    return-object v0
.end method

.method static synthetic l(Lcom/unionpay/mobile/android/pro/views/a;)Lcom/unionpay/mobile/android/model/b;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    return-object v0
.end method

.method static synthetic m(Lcom/unionpay/mobile/android/pro/views/a;)V
    .locals 1

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/pro/views/a;->d(I)V

    return-void
.end method

.method static synthetic n(Lcom/unionpay/mobile/android/pro/views/a;)Z
    .locals 1

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/pro/views/a;->o()Z

    move-result v0

    return v0
.end method

.method static synthetic o(Lcom/unionpay/mobile/android/pro/views/a;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->F:Z

    return v0
.end method

.method static synthetic p(Lcom/unionpay/mobile/android/pro/views/a;)V
    .locals 3

    const/16 v0, 0x68

    iput v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->u:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->j:Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    const-string v0, ""

    const-string v1, "uppay"

    invoke-static {v1, v0}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    const-string v2, "cardsecret"

    invoke-virtual {v1, v2, v0}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic q(Lcom/unionpay/mobile/android/pro/views/a;)Lcom/unionpay/mobile/android/model/b;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    return-object v0
.end method

.method static synthetic r(Lcom/unionpay/mobile/android/pro/views/a;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->d:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic s(Lcom/unionpay/mobile/android/pro/views/a;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->q:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic t(Lcom/unionpay/mobile/android/pro/views/a;)Lcom/unionpay/mobile/android/widgets/m;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->b:Lcom/unionpay/mobile/android/widgets/m;

    return-object v0
.end method

.method static synthetic u(Lcom/unionpay/mobile/android/pro/views/a;)I
    .locals 1

    const/16 v0, 0x65

    iput v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->u:I

    return v0
.end method

.method private u()V
    .locals 4

    const/16 v0, 0x67

    iput v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->u:I

    iget v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->t:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    const-string v1, "query"

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->aj:Ljava/lang/String;

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->a(Ljava/lang/String;Ljava/lang/String;I)V

    iget v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->t:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->t:I

    return-void
.end method

.method private static v()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "action_resp_code"

    const-string v2, "0000"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method static synthetic v(Lcom/unionpay/mobile/android/pro/views/a;)Lcom/unionpay/mobile/android/model/b;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    return-object v0
.end method

.method static synthetic w(Lcom/unionpay/mobile/android/pro/views/a;)Lcom/unionpay/mobile/android/model/b;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    return-object v0
.end method

.method static synthetic x(Lcom/unionpay/mobile/android/pro/views/a;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->z:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/util/HashMap;)Landroid/os/Bundle;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/unionpay/mobile/android/pro/views/a;->b(Ljava/lang/String;Ljava/util/HashMap;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public final a(Lcom/unionpay/mobile/android/upviews/a$a;)V
    .locals 0

    return-void
.end method

.method public final a(Lorg/json/JSONObject;)V
    .locals 8

    const/16 v3, 0x64

    const/4 v5, 0x2

    const/4 v7, 0x1

    iget v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->u:I

    sparse-switch v0, :sswitch_data_0

    :cond_0
    :goto_0
    return-void

    :sswitch_0
    :try_start_0
    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v0, "encrypt_key"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, v1, Lcom/unionpay/mobile/android/model/b;->be:Ljava/lang/String;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v0, "auth_id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, v1, Lcom/unionpay/mobile/android/model/b;->bf:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->p:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->x:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->a()Lcom/unionpay/mobile/android/upviews/a$a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a$a;->a()Z

    move-result v1

    if-nez v1, :cond_1

    iput-boolean v7, p0, Lcom/unionpay/mobile/android/pro/views/a;->F:Z

    iget-object v0, v0, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/pro/views/a;->a(Ljava/lang/String;)V

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    :cond_1
    const/16 v0, 0x65

    iput v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->u:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->p:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/pro/views/a;->a(Ljava/util/HashMap;)Z

    goto :goto_0

    :sswitch_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/unionpay/mobile/android/utils/h;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->aj:Ljava/lang/String;

    const-string v0, "qn"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    invoke-static {v0}, Lcom/unionpay/mobile/android/utils/c;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/unionpay/mobile/android/model/b;->n:Ljava/lang/String;

    :cond_2
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->aj:Ljava/lang/String;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->aj:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_4

    :cond_3
    invoke-virtual {p0, v5}, Lcom/unionpay/mobile/android/pro/views/a;->b(I)V

    goto :goto_0

    :cond_4
    const/16 v0, 0x14

    iput v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->t:I

    invoke-direct {p0}, Lcom/unionpay/mobile/android/pro/views/a;->u()V

    goto/16 :goto_0

    :sswitch_2
    const-string v0, "status"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "fail_msg"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->t:I

    if-lez v2, :cond_5

    const-string v2, "01"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-direct {p0}, Lcom/unionpay/mobile/android/pro/views/a;->u()V

    goto/16 :goto_0

    :cond_5
    iput v3, p0, Lcom/unionpay/mobile/android/pro/views/a;->u:I

    const-string v2, "00"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/pro/views/a;->j()V

    iput v3, p0, Lcom/unionpay/mobile/android/pro/views/a;->u:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "result"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->d(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->H:Lorg/json/JSONArray;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "openupgrade_flag"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->P:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "temporary_pay_flag"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->Q:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "temporary_pay_info"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->R:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "front_url"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->V:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "front_request"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->W:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "title"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->A:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "succ_info"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->B:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/nocard/utils/b;->b(Lorg/json/JSONObject;Lcom/unionpay/mobile/android/model/b;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/nocard/utils/b;->a(Lorg/json/JSONObject;Lcom/unionpay/mobile/android/model/b;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->x:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->x:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->f()V

    :cond_6
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->d:Landroid/content/Context;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->q:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_succeed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pro/views/a;->a(Landroid/content/Context;Ljava/lang/String;)V

    sget-object v0, Lcom/unionpay/mobile/android/model/b;->bb:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/model/d;

    check-cast v0, Lcom/unionpay/mobile/android/hce/c;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/c;->h()Landroid/content/ServiceConnection;

    move-result-object v0

    :try_start_1
    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->d:Landroid/content/Context;

    invoke-virtual {v2, v0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception v0

    goto :goto_2

    :cond_7
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v0, v0, Lcom/unionpay/mobile/android/model/b;->f:Z

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    const-string v1, "success"

    iput-object v1, v0, Lcom/unionpay/mobile/android/plugin/c;->f:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/pro/views/a;->k()V

    goto/16 :goto_0

    :cond_8
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/pro/views/a;->d(I)V

    goto/16 :goto_0

    :cond_9
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/pro/views/a;->j()V

    iput-boolean v7, p0, Lcom/unionpay/mobile/android/pro/views/a;->F:Z

    const-string v2, "03"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->d:Landroid/content/Context;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/unionpay/mobile/android/pro/views/a;->q:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_fail"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/unionpay/mobile/android/utils/o;->j:[Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    aput-object v1, v5, v7

    invoke-static {v2, v3, v4, v5}, Lcom/unionpay/mobile/android/pro/views/a;->a(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/pro/views/a;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_a
    iget v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->t:I

    if-gtz v0, :cond_0

    const/16 v0, 0x13

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/pro/views/a;->b(I)V

    goto/16 :goto_0

    :sswitch_3
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/pro/views/a;->j()V

    const-string v0, "options"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->d(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->y:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->y:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v1, v0}, Lcom/unionpay/mobile/android/upviews/a;->a(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    :sswitch_4
    const-string v0, "status"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_c

    const-string v1, "01"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    const-string v0, "uuid"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->D:I

    if-ltz v1, :cond_b

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->E:Ljava/lang/String;

    invoke-direct {p0, v1, v0}, Lcom/unionpay/mobile/android/pro/views/a;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_b
    sget-object v0, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v0, v0, Lcom/unionpay/mobile/android/languages/c;->D:Ljava/lang/String;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->y:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->y:Lcom/unionpay/mobile/android/upviews/a;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Lcom/unionpay/mobile/android/upviews/a;->a(Lorg/json/JSONArray;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_c
    const-string v0, "options"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->d(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const-string v1, "empty_info"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->y:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->y:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v2, v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->a(Lorg/json/JSONArray;Ljava/lang/String;)V

    goto/16 :goto_0

    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_3
        0x9 -> :sswitch_4
        0x65 -> :sswitch_1
        0x67 -> :sswitch_2
        0x68 -> :sswitch_0
    .end sparse-switch
.end method

.method public final a(Z)V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->v:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->v:Landroid/widget/TextView;

    if-nez p1, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    :cond_0
    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final a(Ljava/util/HashMap;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    new-instance v0, Ljava/sql/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/sql/Date;-><init>(J)V

    sput-object v0, Lcom/unionpay/mobile/android/pro/views/a;->M:Ljava/sql/Date;

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMddHHmmss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/unionpay/mobile/android/pro/views/a;->M:Ljava/sql/Date;

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/unionpay/mobile/android/pro/views/a;->N:Ljava/lang/String;

    new-instance v0, Ljava/lang/String;

    sget-object v1, Lcom/unionpay/mobile/android/pro/views/a;->N:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->O:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/unionpay/mobile/android/pro/views/a;->b(Ljava/util/HashMap;)Z

    move-result v0

    return v0
.end method

.method protected final b()V
    .locals 5

    const/4 v4, -0x1

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v4, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    new-instance v1, Lcom/unionpay/mobile/android/widgets/ay;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/pro/views/a;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/languages/c;->bq:Ljava/lang/String;

    invoke-direct {v1, v2, v3, p0}, Lcom/unionpay/mobile/android/widgets/ay;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/unionpay/mobile/android/widgets/ay$a;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->A:Lcom/unionpay/mobile/android/widgets/ay;

    const/16 v1, 0xd

    invoke-virtual {v0, v1, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->k:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/a;->A:Lcom/unionpay/mobile/android/widgets/ay;

    invoke-virtual {v1, v2, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final b(I)V
    .locals 1

    iget v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->u:I

    packed-switch v0, :pswitch_data_0

    :goto_0
    :pswitch_0
    invoke-super {p0, p1}, Lcom/unionpay/mobile/android/nocard/views/b;->b(I)V

    return-void

    :pswitch_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->F:Z

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method protected final c()V
    .locals 8

    const/4 v1, 0x1

    const/4 v7, -0x2

    const/4 v6, -0x1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->m:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->removeAllViews()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->o:Lcom/unionpay/mobile/android/upwidget/UPScrollView;

    invoke-virtual {v0, p0}, Lcom/unionpay/mobile/android/upwidget/UPScrollView;->a(Lcom/unionpay/mobile/android/upwidget/UPScrollView$a;)V

    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->d:Landroid/content/Context;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v6, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    sget v3, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v3, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    const/16 v3, 0xa

    invoke-virtual {v0, v3, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/a;->m:Landroid/widget/RelativeLayout;

    invoke-virtual {v3, v2, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->p:Lcom/unionpay/mobile/android/model/e;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->p:Lcom/unionpay/mobile/android/model/e;

    check-cast v0, Lcom/unionpay/mobile/android/model/f;

    const-string v4, "promotion"

    invoke-virtual {v0, v4}, Lcom/unionpay/mobile/android/model/f;->a(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string v4, "instalment"

    invoke-virtual {v0, v4}, Lcom/unionpay/mobile/android/model/f;->a(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    iget-object v4, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v5, "promotion_instalment_msgbox"

    invoke-virtual {v0, v5}, Lcom/unionpay/mobile/android/model/f;->a(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    iput-object v0, v4, Lcom/unionpay/mobile/android/model/b;->aU:Lorg/json/JSONObject;

    :cond_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lez v0, :cond_1

    new-instance v0, Lcom/unionpay/mobile/android/upviews/a;

    iget-object v4, p0, Lcom/unionpay/mobile/android/pro/views/a;->d:Landroid/content/Context;

    iget-object v5, p0, Lcom/unionpay/mobile/android/pro/views/a;->q:Ljava/lang/String;

    invoke-direct {v0, v4, v3, p0, v5}, Lcom/unionpay/mobile/android/upviews/a;-><init>(Landroid/content/Context;Lorg/json/JSONArray;Lcom/unionpay/mobile/android/upviews/a$b;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->y:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->y:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/a;->I:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v3}, Lcom/unionpay/mobile/android/upviews/a;->a(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->y:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/a;->J:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v3}, Lcom/unionpay/mobile/android/upviews/a;->b(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->y:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/a;->K:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v3}, Lcom/unionpay/mobile/android/upviews/a;->c(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->y:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/a;->b:Lcom/unionpay/mobile/android/widgets/m;

    iget-object v4, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v4, v4, Lcom/unionpay/mobile/android/model/b;->aU:Lorg/json/JSONObject;

    invoke-virtual {v0, v3, v4}, Lcom/unionpay/mobile/android/upviews/a;->a(Lcom/unionpay/mobile/android/widgets/m;Lorg/json/JSONObject;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    sget v3, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/a;->y:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v2, v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    invoke-direct {p0, v2}, Lcom/unionpay/mobile/android/pro/views/a;->a(Landroid/widget/LinearLayout;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    new-instance v0, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/a;->d:Landroid/content/Context;

    invoke-direct {v0, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->v:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->v:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v3, v3, Lcom/unionpay/mobile/android/model/b;->C:Lorg/json/JSONObject;

    const-string v4, "label"

    invoke-static {v3, v4}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->v:Landroid/widget/TextView;

    sget v3, Lcom/unionpay/mobile/android/global/b;->i:F

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->v:Landroid/widget/TextView;

    invoke-static {}, Lcom/unionpay/mobile/android/pro/views/a;->p()Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->v:Landroid/widget/TextView;

    const/16 v3, 0x11

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/a;->v:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->x:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->x:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->e()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    sget v0, Lcom/unionpay/mobile/android/global/a;->n:I

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->c:Lcom/unionpay/mobile/android/resource/c;

    const/16 v3, 0x7d8

    invoke-virtual {v1, v3}, Lcom/unionpay/mobile/android/resource/c;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/a;->v:Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/a;->v:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/a;->L:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v6, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    sget v0, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->d:Landroid/content/Context;

    const/high16 v3, 0x41200000    # 10.0f

    invoke-static {v0, v3}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v0

    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->v:Landroid/widget/TextView;

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final c(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public final c(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public final handleMessage(Landroid/os/Message;)Z
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/Bundle;

    const-string v1, "action_resp_code"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "action_resp_message"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "0000"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz v0, :cond_0

    invoke-virtual {p0, v3, v0}, Lcom/unionpay/mobile/android/pro/views/a;->a(ILjava/lang/String;)V

    :cond_0
    :goto_0
    const/4 v0, 0x1

    return v0

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->ap:Ljava/lang/String;

    invoke-virtual {p0, v0, v3}, Lcom/unionpay/mobile/android/pro/views/a;->a(Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method public final l()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->x:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->x:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v0, v0, Lcom/unionpay/mobile/android/model/b;->K:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->w:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iput-boolean v1, v0, Lcom/unionpay/mobile/android/model/b;->K:Z

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/pro/views/a;->n()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->a:Lcom/unionpay/mobile/android/model/b;

    iput-boolean v1, v0, Lcom/unionpay/mobile/android/model/b;->K:Z

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/pro/views/a;->a(I)V

    goto :goto_0
.end method

.method protected final onDetachedFromWindow()V
    .locals 1

    invoke-super {p0}, Lcom/unionpay/mobile/android/nocard/views/b;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->x:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->x:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->d()Z

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unionpay/mobile/android/pro/views/a;->b:Lcom/unionpay/mobile/android/widgets/m;

    return-void
.end method

.method public final t()V
    .locals 0

    return-void
.end method
