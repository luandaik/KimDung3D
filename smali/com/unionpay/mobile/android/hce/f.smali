.class public Lcom/unionpay/mobile/android/hce/f;
.super Ljava/lang/Object;


# static fields
.field private static final w:Ljava/lang/Object;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Lcom/unionpay/mobile/android/fully/a;

.field private c:Landroid/os/Handler;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:I

.field private g:I

.field private h:I

.field private i:I

.field private j:Ljava/lang/String;

.field private k:Ljava/lang/String;

.field private l:Ljava/lang/String;

.field private m:Ljava/lang/String;

.field private n:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/unionpay/mobile/android/hce/k;",
            ">;"
        }
    .end annotation
.end field

.field private o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/unionpay/mobile/android/hce/k;",
            ">;"
        }
    .end annotation
.end field

.field private p:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/unionpay/mobile/android/hce/k;",
            ">;"
        }
    .end annotation
.end field

.field private q:I

.field private r:I

.field private s:I

.field private t:I

.field private u:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/unionpay/mobile/android/hce/d;",
            ">;"
        }
    .end annotation
.end field

.field private v:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/unionpay/mobile/android/hce/l;",
            ">;"
        }
    .end annotation
.end field

.field private final x:Landroid/os/Handler$Callback;

.field private y:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/unionpay/mobile/android/hce/f;->w:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v1, p0, Lcom/unionpay/mobile/android/hce/f;->f:I

    iput v1, p0, Lcom/unionpay/mobile/android/hce/f;->g:I

    const/16 v0, 0xa

    iput v0, p0, Lcom/unionpay/mobile/android/hce/f;->h:I

    const/16 v0, 0x3e8

    iput v0, p0, Lcom/unionpay/mobile/android/hce/f;->i:I

    const-string v0, "hce"

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->j:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->k:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->m:Ljava/lang/String;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->n:Ljava/util/HashMap;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->o:Ljava/util/List;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->p:Ljava/util/HashMap;

    iput v1, p0, Lcom/unionpay/mobile/android/hce/f;->q:I

    const/4 v0, 0x1

    iput v0, p0, Lcom/unionpay/mobile/android/hce/f;->r:I

    iput v1, p0, Lcom/unionpay/mobile/android/hce/f;->s:I

    const/4 v0, 0x5

    iput v0, p0, Lcom/unionpay/mobile/android/hce/f;->t:I

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->u:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->v:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v0, Lcom/unionpay/mobile/android/hce/g;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/hce/g;-><init>(Lcom/unionpay/mobile/android/hce/f;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->x:Landroid/os/Handler$Callback;

    iput-object p1, p0, Lcom/unionpay/mobile/android/hce/f;->a:Landroid/content/Context;

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/f;->x:Landroid/os/Handler$Callback;

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->y:Landroid/os/Handler;

    const-string v0, "20150801000000000000"

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->l:Ljava/lang/String;

    check-cast p1, Lcom/unionpay/mobile/android/plugin/BaseActivity;

    const-class v0, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    invoke-virtual {v0}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/unionpay/mobile/android/plugin/BaseActivity;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/fully/a;

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->b:Lcom/unionpay/mobile/android/fully/a;

    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/hce/f;Ljava/lang/String;II)Landroid/os/Bundle;
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Lcom/unionpay/mobile/android/hce/f;->a(Ljava/lang/String;II)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method private a(Ljava/lang/String;II)Landroid/os/Bundle;
    .locals 4

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "action_resp_code"

    const-string v2, "0000"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "v"

    const-string v3, "1.9"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "cmd"

    iget-object v3, p0, Lcom/unionpay/mobile/android/hce/f;->j:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "params"

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "base_version"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "page"

    invoke-virtual {v2, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v3, "size"

    invoke-virtual {v2, v3, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/f;->b:Lcom/unionpay/mobile/android/fully/a;

    invoke-interface {v2, v1}, Lcom/unionpay/mobile/android/fully/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "action_resp_message"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/unionpay/mobile/android/hce/f;->a(Landroid/os/Bundle;)Z

    iget v1, p0, Lcom/unionpay/mobile/android/hce/f;->f:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/unionpay/mobile/android/hce/f;->f:I

    iget v1, p0, Lcom/unionpay/mobile/android/hce/f;->f:I

    iget v2, p0, Lcom/unionpay/mobile/android/hce/f;->g:I

    if-gt v1, v2, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/f;->l:Ljava/lang/String;

    iget v2, p0, Lcom/unionpay/mobile/android/hce/f;->f:I

    iget v3, p0, Lcom/unionpay/mobile/android/hce/f;->h:I

    invoke-direct {p0, v1, v2, v3}, Lcom/unionpay/mobile/android/hce/f;->a(Ljava/lang/String;II)Landroid/os/Bundle;

    :cond_0
    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    const-string v1, "action_resp_code"

    const-string v2, "10019"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/hce/f;)V
    .locals 5

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->n:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/hce/k;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/k;->a()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/k;->b()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/k;->e()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/unionpay/mobile/android/hce/f;->a:Landroid/content/Context;

    invoke-static {v4, v2}, Lcom/unionpay/mobile/android/utils/c;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/unionpay/mobile/android/hce/f;->a:Landroid/content/Context;

    invoke-static {v4, v2}, Lcom/unionpay/mobile/android/utils/c;->b(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget v3, p0, Lcom/unionpay/mobile/android/hce/f;->q:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/unionpay/mobile/android/hce/f;->q:I

    iget-object v3, p0, Lcom/unionpay/mobile/android/hce/f;->p:Ljava/util/HashMap;

    iget v4, p0, Lcom/unionpay/mobile/android/hce/f;->q:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/unionpay/mobile/android/hce/l;

    invoke-direct {v0, v2}, Lcom/unionpay/mobile/android/hce/l;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/hce/f;->v:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v2, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/unionpay/mobile/android/hce/d;

    invoke-direct {v0, v2}, Lcom/unionpay/mobile/android/hce/d;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/hce/f;->u:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v2, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/hce/f;Ljava/lang/String;)V
    .locals 13

    const/4 v12, 0x1

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->u:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/hce/d;

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/f;->v:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/unionpay/mobile/android/hce/l;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/d;->a()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/hce/l;->a()Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/f;->y:Landroid/os/Handler;

    const/16 v3, 0x7d6

    invoke-virtual {v2, v3, p1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/hce/l;->c()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/hce/l;->b()Lcom/unionpay/mobile/android/hce/service/a;

    move-result-object v6

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/d;->c()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/d;->d()Landroid/content/ServiceConnection;

    move-result-object v7

    if-eqz v5, :cond_2

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    if-eqz v2, :cond_2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-static {v2, v5}, Lcom/unionpay/mobile/android/hce/a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "uppay-hce"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " card after: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v3, v8}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    new-instance v8, Lorg/json/JSONArray;

    invoke-direct {v8, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v9

    move v3, v4

    :goto_0
    if-ge v3, v9, :cond_2

    invoke-virtual {v8, v3}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    check-cast v2, Lorg/json/JSONObject;

    sget-object v10, Lcom/unionpay/mobile/android/model/b;->bb:Ljava/util/List;

    if-nez v10, :cond_0

    new-instance v10, Ljava/util/ArrayList;

    const/4 v11, 0x1

    invoke-direct {v10, v11}, Ljava/util/ArrayList;-><init>(I)V

    sput-object v10, Lcom/unionpay/mobile/android/model/b;->bb:Ljava/util/List;

    :cond_0
    sget-object v10, Lcom/unionpay/mobile/android/model/b;->bb:Ljava/util/List;

    new-instance v11, Lcom/unionpay/mobile/android/hce/c;

    invoke-direct {v11, v2, v5, v6, v7}, Lcom/unionpay/mobile/android/hce/c;-><init>(Lorg/json/JSONObject;Ljava/lang/String;Lcom/unionpay/mobile/android/hce/service/a;Landroid/content/ServiceConnection;)V

    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_0

    :catch_0
    move-exception v2

    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    :cond_2
    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/d;->f()V

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/f;->u:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/hce/l;->e()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->v:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/unionpay/mobile/android/hce/f;->w:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1
    iget v0, p0, Lcom/unionpay/mobile/android/hce/f;->s:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/unionpay/mobile/android/hce/f;->s:I

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/hce/f;->b()V

    :cond_3
    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->u:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/hce/d;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/d;->b()Z

    move-result v0

    if-nez v0, :cond_4

    :cond_5
    :goto_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_6
    sget-boolean v0, Lcom/unionpay/mobile/android/model/b;->bk:Z

    if-nez v0, :cond_5

    sput-boolean v12, Lcom/unionpay/mobile/android/model/b;->bk:Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->c:Landroid/os/Handler;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->c:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/f;->c:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_1
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/hce/f;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    new-instance v0, Lcom/unionpay/mobile/android/hce/i;

    invoke-direct {v0, p0, p1, p2}, Lcom/unionpay/mobile/android/hce/i;-><init>(Lcom/unionpay/mobile/android/hce/f;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/unionpay/mobile/android/hce/d;

    invoke-direct {v1, p1}, Lcom/unionpay/mobile/android/hce/d;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/unionpay/mobile/android/hce/d;->a(Landroid/content/ServiceConnection;)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/f;->u:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v2, "com.unionpay.uppay.action.HCE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/f;->a:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/f;->a:Landroid/content/Context;

    const/4 v3, 0x1

    invoke-virtual {v2, v1, v0, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    return-void
.end method

.method private a(Landroid/os/Bundle;)Z
    .locals 7

    const/4 v1, 0x0

    const-string v0, "action_resp_code"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "action_resp_message"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "0000"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz v2, :cond_1

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "resp"

    invoke-static {v0, v2}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "msg"

    invoke-static {v0, v3}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    const-string v3, "params"

    invoke-static {v0, v3}, Lcom/unionpay/mobile/android/utils/i;->c(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v0, "00"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "signature"

    invoke-static {v3, v0}, Lcom/unionpay/mobile/android/utils/i;->c(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->d:Ljava/lang/String;

    const-string v0, "configs"

    invoke-static {v3, v0}, Lcom/unionpay/mobile/android/utils/i;->d(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    if-eqz v2, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v0, v4, :cond_0

    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    iget-object v5, p0, Lcom/unionpay/mobile/android/hce/f;->o:Ljava/util/List;

    new-instance v6, Lcom/unionpay/mobile/android/hce/k;

    invoke-direct {v6, v4}, Lcom/unionpay/mobile/android/hce/k;-><init>(Lorg/json/JSONObject;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v4, "version"

    invoke-static {v3, v4}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/unionpay/mobile/android/hce/f;->m:Ljava/lang/String;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    const-string v0, "total_count"

    invoke-static {v3, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget v2, p0, Lcom/unionpay/mobile/android/hce/f;->h:I

    if-le v0, v2, :cond_1

    iget v2, p0, Lcom/unionpay/mobile/android/hce/f;->h:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/unionpay/mobile/android/hce/f;->g:I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_1
    return v1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method

.method static synthetic b(Lcom/unionpay/mobile/android/hce/f;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->u:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method

.method static synthetic c(Lcom/unionpay/mobile/android/hce/f;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->v:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method

.method static synthetic d(Lcom/unionpay/mobile/android/hce/f;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->y:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic e(Lcom/unionpay/mobile/android/hce/f;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/mobile/android/hce/f;->i:I

    return v0
.end method

.method static synthetic f(Lcom/unionpay/mobile/android/hce/f;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->d:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic g(Lcom/unionpay/mobile/android/hce/f;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->e:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic h(Lcom/unionpay/mobile/android/hce/f;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->l:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic i(Lcom/unionpay/mobile/android/hce/f;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/mobile/android/hce/f;->f:I

    return v0
.end method

.method static synthetic j(Lcom/unionpay/mobile/android/hce/f;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/mobile/android/hce/f;->h:I

    return v0
.end method

.method static synthetic k(Lcom/unionpay/mobile/android/hce/f;)V
    .locals 4

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->m:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->o:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/hce/k;

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/f;->n:Ljava/util/HashMap;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/k;->b()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->n:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/hce/k;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/k;->f()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->a:Landroid/content/Context;

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/f;->m:Ljava/lang/String;

    const-string v3, "hce_version"

    invoke-static {v0, v2, v3}, Lcom/unionpay/mobile/android/utils/PreferenceUtils;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->a:Landroid/content/Context;

    invoke-virtual {v1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "hce_info"

    invoke-static {v0, v1, v2}, Lcom/unionpay/mobile/android/utils/PreferenceUtils;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->k:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->n:Ljava/util/HashMap;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->n:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-lez v0, :cond_4

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->n:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/f;->k:Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/hce/k;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/k;->c()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_2

    :cond_4
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/unionpay/mobile/android/hce/f;->f:I

    return-void
.end method

.method public final a(I)V
    .locals 0

    iput p1, p0, Lcom/unionpay/mobile/android/hce/f;->h:I

    return-void
.end method

.method public final a(Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/hce/f;->c:Landroid/os/Handler;

    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/unionpay/mobile/android/hce/f;->j:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public final b()V
    .locals 5

    iget v0, p0, Lcom/unionpay/mobile/android/hce/f;->q:I

    if-nez v0, :cond_1

    const/4 v0, 0x1

    sput-boolean v0, Lcom/unionpay/mobile/android/model/b;->bk:Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->c:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->c:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/f;->c:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    :goto_0
    return-void

    :cond_1
    sget-object v2, Lcom/unionpay/mobile/android/hce/f;->w:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget v0, p0, Lcom/unionpay/mobile/android/hce/f;->r:I

    move v1, v0

    :goto_1
    iget v0, p0, Lcom/unionpay/mobile/android/hce/f;->q:I

    if-gt v1, v0, :cond_2

    iget v0, p0, Lcom/unionpay/mobile/android/hce/f;->s:I

    iget v3, p0, Lcom/unionpay/mobile/android/hce/f;->t:I

    if-ge v0, v3, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->p:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/hce/k;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/k;->b()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/k;->d()Ljava/lang/String;

    move-result-object v0

    iget v4, p0, Lcom/unionpay/mobile/android/hce/f;->s:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/unionpay/mobile/android/hce/f;->s:I

    new-instance v4, Lcom/unionpay/mobile/android/hce/h;

    invoke-direct {v4, p0, v3, v0}, Lcom/unionpay/mobile/android/hce/h;-><init>(Lcom/unionpay/mobile/android/hce/f;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4}, Lcom/unionpay/mobile/android/hce/h;->start()V

    iget v0, p0, Lcom/unionpay/mobile/android/hce/f;->r:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/unionpay/mobile/android/hce/f;->r:I

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    :cond_2
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method public final b(I)V
    .locals 0

    if-lez p1, :cond_0

    iput p1, p0, Lcom/unionpay/mobile/android/hce/f;->i:I

    :cond_0
    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/hce/f;->e:Ljava/lang/String;

    return-void
.end method

.method public final c()V
    .locals 5

    sget-object v0, Lcom/unionpay/mobile/android/model/b;->bb:Ljava/util/List;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/unionpay/mobile/android/model/b;->bb:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    sput-object v0, Lcom/unionpay/mobile/android/model/b;->bb:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->a:Landroid/content/Context;

    const-string v1, "hce_version"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/PreferenceUtils;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->l:Ljava/lang/String;

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/f;->a:Landroid/content/Context;

    const-string v1, "hce_info"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/PreferenceUtils;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v0, "[{\"package\":\"com.yitong.mbank0408\",\"issuer\":\"64083300\",\"syn_key\":\"0123456789ABCDEF1010101010101010\",\"pub_key\":\"268576AF6F50DA40196E18D6E059D2A721373638\",\"status\":\"I\",\"priority\":\"1\"}]"

    :cond_2
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_3

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    new-instance v3, Lcom/unionpay/mobile/android/hce/k;

    invoke-direct {v3, v2}, Lcom/unionpay/mobile/android/hce/k;-><init>(Lorg/json/JSONObject;)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/f;->n:Ljava/util/HashMap;

    invoke-virtual {v3}, Lcom/unionpay/mobile/android/hce/k;->b()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    :cond_3
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/unionpay/mobile/android/hce/j;

    invoke-direct {v1, p0}, Lcom/unionpay/mobile/android/hce/j;-><init>(Lcom/unionpay/mobile/android/hce/f;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public final c(I)V
    .locals 0

    if-lez p1, :cond_0

    iput p1, p0, Lcom/unionpay/mobile/android/hce/f;->t:I

    :cond_0
    return-void
.end method

.method public final c(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/hce/f;->k:Ljava/lang/String;

    return-void
.end method
