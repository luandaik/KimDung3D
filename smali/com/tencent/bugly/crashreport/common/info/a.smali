.class public final Lcom/tencent/bugly/crashreport/common/info/a;
.super Ljava/lang/Object;
.source "BUGLY"


# static fields
.field private static aa:Lcom/tencent/bugly/crashreport/common/info/a;


# instance fields
.field public A:Ljava/util/HashMap;
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

.field public B:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public C:Lcom/tencent/bugly/crashreport/a;

.field public D:Landroid/content/SharedPreferences;

.field private final E:Landroid/content/Context;

.field private F:Ljava/lang/String;

.field private G:Ljava/lang/String;

.field private H:Ljava/lang/String;

.field private I:Ljava/lang/String;

.field private J:Ljava/lang/String;

.field private K:Ljava/lang/String;

.field private L:Ljava/lang/String;

.field private M:Ljava/lang/String;

.field private N:Ljava/lang/String;

.field private O:J

.field private P:J

.field private Q:J

.field private R:Ljava/lang/String;

.field private S:Ljava/lang/String;

.field private T:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/tencent/bugly/crashreport/common/info/PlugInBean;",
            ">;"
        }
    .end annotation
.end field

.field private U:Z

.field private V:Ljava/lang/String;

.field private W:Ljava/lang/String;

.field private X:Ljava/lang/Boolean;

.field private Y:Ljava/lang/String;

.field private Z:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/tencent/bugly/crashreport/common/info/PlugInBean;",
            ">;"
        }
    .end annotation
.end field

.field public final a:J

.field private ab:I

.field private ac:I

.field private ad:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private ae:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private af:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private ag:Z

.field private ah:Ljava/lang/String;

.field private ai:Ljava/lang/String;

.field private aj:Ljava/lang/String;

.field private ak:Ljava/lang/String;

.field private al:Ljava/lang/String;

.field private final am:Ljava/lang/Object;

.field private final an:Ljava/lang/Object;

.field private final ao:Ljava/lang/Object;

.field private final ap:Ljava/lang/Object;

.field private final aq:Ljava/lang/Object;

.field private final ar:Ljava/lang/Object;

.field private final as:Ljava/lang/Object;

.field public final b:B

.field public c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public e:Z

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public i:J

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public p:Ljava/lang/String;

.field public q:J

.field public r:J

.field public s:J

.field public t:J

.field public u:Z

.field public v:Ljava/lang/String;

.field public w:Ljava/lang/String;

.field public x:Ljava/lang/String;

.field public y:Z

.field public z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 78
    const/4 v0, 0x0

    sput-object v0, Lcom/tencent/bugly/crashreport/common/info/a;->aa:Lcom/tencent/bugly/crashreport/common/info/a;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 8

    .prologue
    const-wide/16 v6, -0x1

    const-wide/16 v4, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v1, 0x0

    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-boolean v2, p0, Lcom/tencent/bugly/crashreport/common/info/a;->e:Z

    .line 39
    const-string v0, "unknown"

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->H:Ljava/lang/String;

    .line 49
    const-string v0, "unknown"

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->I:Ljava/lang/String;

    .line 50
    const-string v0, ""

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->J:Ljava/lang/String;

    .line 51
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->K:Ljava/lang/String;

    .line 54
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->L:Ljava/lang/String;

    .line 55
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->M:Ljava/lang/String;

    .line 56
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->N:Ljava/lang/String;

    .line 58
    iput-wide v6, p0, Lcom/tencent/bugly/crashreport/common/info/a;->O:J

    .line 59
    iput-wide v6, p0, Lcom/tencent/bugly/crashreport/common/info/a;->P:J

    .line 60
    iput-wide v6, p0, Lcom/tencent/bugly/crashreport/common/info/a;->Q:J

    .line 61
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->R:Ljava/lang/String;

    .line 62
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->S:Ljava/lang/String;

    .line 63
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->T:Ljava/util/Map;

    .line 64
    iput-boolean v2, p0, Lcom/tencent/bugly/crashreport/common/info/a;->U:Z

    .line 65
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->V:Ljava/lang/String;

    .line 66
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->j:Ljava/lang/String;

    .line 67
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->k:Ljava/lang/String;

    .line 68
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->W:Ljava/lang/String;

    .line 69
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->l:Ljava/lang/String;

    .line 70
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->X:Ljava/lang/Boolean;

    .line 71
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->Y:Ljava/lang/String;

    .line 72
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->m:Ljava/lang/String;

    .line 73
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->n:Ljava/lang/String;

    .line 74
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->Z:Ljava/util/Map;

    .line 76
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->o:Ljava/util/List;

    .line 79
    const/4 v0, -0x1

    iput v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ab:I

    .line 80
    const/4 v0, -0x1

    iput v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ac:I

    .line 81
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ad:Ljava/util/Map;

    .line 82
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ae:Ljava/util/Map;

    .line 83
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->af:Ljava/util/Map;

    .line 86
    const-string v0, "unknown"

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->p:Ljava/lang/String;

    .line 87
    iput-wide v4, p0, Lcom/tencent/bugly/crashreport/common/info/a;->q:J

    .line 88
    iput-wide v4, p0, Lcom/tencent/bugly/crashreport/common/info/a;->r:J

    .line 89
    iput-wide v4, p0, Lcom/tencent/bugly/crashreport/common/info/a;->s:J

    .line 90
    iput-wide v4, p0, Lcom/tencent/bugly/crashreport/common/info/a;->t:J

    .line 92
    iput-boolean v3, p0, Lcom/tencent/bugly/crashreport/common/info/a;->u:Z

    .line 93
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->v:Ljava/lang/String;

    .line 94
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->w:Ljava/lang/String;

    .line 96
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->x:Ljava/lang/String;

    .line 97
    iput-boolean v3, p0, Lcom/tencent/bugly/crashreport/common/info/a;->y:Z

    .line 98
    iput-boolean v3, p0, Lcom/tencent/bugly/crashreport/common/info/a;->z:Z

    .line 100
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->A:Ljava/util/HashMap;

    .line 102
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ah:Ljava/lang/String;

    .line 103
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ai:Ljava/lang/String;

    .line 104
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->aj:Ljava/lang/String;

    .line 105
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ak:Ljava/lang/String;

    .line 106
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->al:Ljava/lang/String;

    .line 108
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->B:Ljava/util/List;

    .line 113
    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->C:Lcom/tencent/bugly/crashreport/a;

    .line 119
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->am:Ljava/lang/Object;

    .line 120
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->an:Ljava/lang/Object;

    .line 121
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ao:Ljava/lang/Object;

    .line 122
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ap:Ljava/lang/Object;

    .line 123
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->aq:Ljava/lang/Object;

    .line 124
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ar:Ljava/lang/Object;

    .line 125
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->as:Ljava/lang/Object;

    .line 128
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->a:J

    .line 129
    invoke-static {p1}, Lcom/tencent/bugly/proguard/y;->a(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->E:Landroid/content/Context;

    .line 130
    iput-byte v2, p0, Lcom/tencent/bugly/crashreport/common/info/a;->b:B

    .line 131
    invoke-static {p1}, Lcom/tencent/bugly/crashreport/common/info/AppInfo;->b(Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->j:Ljava/lang/String;

    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->j:Ljava/lang/String;

    iput-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->v:Ljava/lang/String;

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->w:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    :cond_0
    :goto_0
    invoke-static {p1}, Lcom/tencent/bugly/crashreport/common/info/AppInfo;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->c:Ljava/lang/String;

    .line 133
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Lcom/tencent/bugly/crashreport/common/info/AppInfo;->a(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->d:Ljava/lang/String;

    .line 134
    invoke-static {}, Lcom/tencent/bugly/crashreport/common/info/b;->k()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->f:Ljava/lang/String;

    .line 135
    invoke-static {}, Lcom/tencent/bugly/crashreport/common/info/b;->a()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->g:Ljava/lang/String;

    .line 136
    invoke-static {p1}, Lcom/tencent/bugly/crashreport/common/info/AppInfo;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->k:Ljava/lang/String;

    .line 137
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Android "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/tencent/bugly/crashreport/common/info/b;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",level "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/tencent/bugly/crashreport/common/info/b;->c()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->h:Ljava/lang/String;

    .line 138
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->h:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    invoke-static {p1}, Lcom/tencent/bugly/crashreport/common/info/AppInfo;->d(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_5

    :try_start_1
    invoke-static {v1}, Lcom/tencent/bugly/crashreport/common/info/AppInfo;->a(Ljava/util/Map;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->o:Ljava/util/List;

    const-string v0, "BUGLY_APPID"

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_1

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->W:Ljava/lang/String;

    :cond_1
    const-string v0, "BUGLY_APP_VERSION"

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_2

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->j:Ljava/lang/String;

    :cond_2
    const-string v0, "BUGLY_APP_CHANNEL"

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_3

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->l:Ljava/lang/String;

    :cond_3
    const-string v0, "BUGLY_ENABLE_DEBUG"

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_4

    const-string v2, "true"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->u:Z

    :cond_4
    const-string v0, "com.tencent.rdm.uuid"

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_5

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->x:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 142
    :cond_5
    :goto_1
    :try_start_2
    const-string v0, "bugly_db_"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 143
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_6

    .line 145
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->z:Z

    .line 146
    const-string v0, "App is first time to be installed on the device."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/tencent/bugly/proguard/w;->c(Ljava/lang/String;[Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 153
    :cond_6
    :goto_2
    const-string v0, "BUGLY_COMMON_VALUES"

    invoke-static {v0, p1}, Lcom/tencent/bugly/proguard/y;->a(Ljava/lang/String;Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->D:Landroid/content/SharedPreferences;

    .line 154
    const-string v0, "com info create end"

    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/tencent/bugly/proguard/w;->c(Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 155
    return-void

    .line 131
    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/tencent/bugly/proguard/w;->a(Ljava/lang/Throwable;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto/16 :goto_0

    .line 139
    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/tencent/bugly/proguard/w;->a(Ljava/lang/Throwable;)Z

    move-result v1

    if-nez v1, :cond_5

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1

    .line 148
    :catch_2
    move-exception v0

    .line 149
    sget-boolean v1, Lcom/tencent/bugly/b;->c:Z

    if-eqz v1, :cond_6

    .line 150
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_2
.end method

.method public static J()I
    .locals 1

    .prologue
    .line 915
    invoke-static {}, Lcom/tencent/bugly/crashreport/common/info/b;->c()I

    move-result v0

    return v0
.end method

.method public static declared-synchronized a(Landroid/content/Context;)Lcom/tencent/bugly/crashreport/common/info/a;
    .locals 2

    .prologue
    .line 245
    const-class v1, Lcom/tencent/bugly/crashreport/common/info/a;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/tencent/bugly/crashreport/common/info/a;->aa:Lcom/tencent/bugly/crashreport/common/info/a;

    if-nez v0, :cond_0

    .line 246
    new-instance v0, Lcom/tencent/bugly/crashreport/common/info/a;

    invoke-direct {v0, p0}, Lcom/tencent/bugly/crashreport/common/info/a;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/tencent/bugly/crashreport/common/info/a;->aa:Lcom/tencent/bugly/crashreport/common/info/a;

    .line 248
    :cond_0
    sget-object v0, Lcom/tencent/bugly/crashreport/common/info/a;->aa:Lcom/tencent/bugly/crashreport/common/info/a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 245
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized b()Lcom/tencent/bugly/crashreport/common/info/a;
    .locals 2

    .prologue
    .line 257
    const-class v0, Lcom/tencent/bugly/crashreport/common/info/a;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/tencent/bugly/crashreport/common/info/a;->aa:Lcom/tencent/bugly/crashreport/common/info/a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static c()Ljava/lang/String;
    .locals 1

    .prologue
    .line 266
    const-string v0, "2.5.0"

    return-object v0
.end method


# virtual methods
.method public final A()V
    .locals 2

    .prologue
    .line 717
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ao:Ljava/lang/Object;

    monitor-enter v1

    .line 718
    :try_start_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ad:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 719
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final B()I
    .locals 2

    .prologue
    .line 760
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ao:Ljava/lang/Object;

    monitor-enter v1

    .line 761
    :try_start_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ad:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v0

    .line 762
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final C()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 771
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ao:Ljava/lang/Object;

    monitor-enter v1

    .line 772
    :try_start_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ad:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 773
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final D()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 798
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->as:Ljava/lang/Object;

    monitor-enter v1

    .line 799
    :try_start_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ae:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    .line 800
    const/4 v0, 0x0

    monitor-exit v1

    .line 802
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/util/HashMap;

    iget-object v2, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ae:Ljava/util/Map;

    invoke-direct {v0, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 803
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final E()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 826
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ap:Ljava/lang/Object;

    monitor-enter v1

    .line 827
    :try_start_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->af:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    .line 828
    const/4 v0, 0x0

    monitor-exit v1

    .line 830
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/util/HashMap;

    iget-object v2, p0, Lcom/tencent/bugly/crashreport/common/info/a;->af:Ljava/util/Map;

    invoke-direct {v0, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 831
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final F()I
    .locals 2

    .prologue
    .line 856
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->aq:Ljava/lang/Object;

    monitor-enter v1

    .line 857
    :try_start_0
    iget v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ab:I

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v0

    .line 858
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final G()I
    .locals 1

    .prologue
    .line 878
    iget v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ac:I

    return v0
.end method

.method public final H()Z
    .locals 1

    .prologue
    .line 887
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->E:Landroid/content/Context;

    invoke-static {v0}, Lcom/tencent/bugly/crashreport/common/info/AppInfo;->f(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public final declared-synchronized I()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/tencent/bugly/crashreport/common/info/PlugInBean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 905
    monitor-enter p0

    const/4 v0, 0x0

    monitor-exit p0

    return-object v0
.end method

.method public final K()Ljava/lang/String;
    .locals 1

    .prologue
    .line 925
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ah:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 926
    invoke-static {}, Lcom/tencent/bugly/crashreport/common/info/b;->l()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ah:Ljava/lang/String;

    .line 928
    :cond_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ah:Ljava/lang/String;

    return-object v0
.end method

.method public final L()Ljava/lang/String;
    .locals 1

    .prologue
    .line 937
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ai:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 938
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->E:Landroid/content/Context;

    invoke-static {v0}, Lcom/tencent/bugly/crashreport/common/info/b;->i(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ai:Ljava/lang/String;

    .line 940
    :cond_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ai:Ljava/lang/String;

    return-object v0
.end method

.method public final M()Ljava/lang/String;
    .locals 1

    .prologue
    .line 949
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->aj:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 950
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->E:Landroid/content/Context;

    invoke-static {v0}, Lcom/tencent/bugly/crashreport/common/info/b;->j(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->aj:Ljava/lang/String;

    .line 952
    :cond_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->aj:Ljava/lang/String;

    return-object v0
.end method

.method public final N()Ljava/lang/String;
    .locals 1

    .prologue
    .line 962
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->E:Landroid/content/Context;

    invoke-static {}, Lcom/tencent/bugly/crashreport/common/info/b;->m()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final O()Ljava/lang/String;
    .locals 1

    .prologue
    .line 971
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ak:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 972
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->E:Landroid/content/Context;

    invoke-static {v0}, Lcom/tencent/bugly/crashreport/common/info/b;->k(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ak:Ljava/lang/String;

    .line 974
    :cond_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ak:Ljava/lang/String;

    return-object v0
.end method

.method public final P()J
    .locals 2

    .prologue
    .line 984
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->E:Landroid/content/Context;

    invoke-static {}, Lcom/tencent/bugly/crashreport/common/info/b;->n()J

    move-result-wide v0

    return-wide v0
.end method

.method public final a(I)V
    .locals 5

    .prologue
    .line 841
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->aq:Ljava/lang/Object;

    monitor-enter v1

    .line 842
    :try_start_0
    iget v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ab:I

    .line 843
    if-eq v0, p1, :cond_0

    .line 844
    iput p1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ab:I

    .line 845
    const-string v2, "user scene tag %d changed to tag %d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    iget v4, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ab:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v0

    invoke-static {v2, v3}, Lcom/tencent/bugly/proguard/w;->a(Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 847
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final a(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 312
    iput-object p1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->W:Ljava/lang/String;

    .line 313
    return-void
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 526
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 531
    :cond_0
    :goto_0
    return-void

    .line 529
    :cond_1
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->an:Ljava/lang/Object;

    monitor-enter v1

    .line 530
    :try_start_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->A:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 531
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final a(Z)V
    .locals 1

    .prologue
    .line 232
    iput-boolean p1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ag:Z

    .line 233
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->C:Lcom/tencent/bugly/crashreport/a;

    if-eqz v0, :cond_0

    .line 234
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->C:Lcom/tencent/bugly/crashreport/a;

    invoke-interface {v0, p1}, Lcom/tencent/bugly/crashreport/a;->setNativeIsAppForeground(Z)Z

    .line 236
    :cond_0
    return-void
.end method

.method public final a()Z
    .locals 1

    .prologue
    .line 223
    iget-boolean v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ag:Z

    return v0
.end method

.method public final b(I)V
    .locals 4

    .prologue
    const/16 v1, 0x5e20

    .line 865
    iget v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ac:I

    .line 866
    if-eq v0, v1, :cond_0

    .line 867
    iput v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ac:I

    .line 868
    const-string v1, "server scene tag %d changed to tag %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    iget v3, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ac:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v0

    invoke-static {v1, v2}, Lcom/tencent/bugly/proguard/w;->a(Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 870
    :cond_0
    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 332
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ar:Ljava/lang/Object;

    monitor-enter v1

    .line 333
    if-nez p1, :cond_0

    .line 334
    :try_start_0
    const-string p1, "10000"

    .line 336
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->H:Ljava/lang/String;

    .line 337
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 745
    invoke-static {p1}, Lcom/tencent/bugly/proguard/y;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2}, Lcom/tencent/bugly/proguard/y;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 746
    :cond_0
    const-string v0, "key&value should not be empty %s %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/tencent/bugly/proguard/w;->d(Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 751
    :goto_0
    return-void

    .line 749
    :cond_1
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ao:Ljava/lang/Object;

    monitor-enter v1

    .line 750
    :try_start_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ad:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 751
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final c(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 360
    iput-object p1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->G:Ljava/lang/String;

    .line 361
    return-void
.end method

.method public final c(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 810
    invoke-static {p1}, Lcom/tencent/bugly/proguard/y;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2}, Lcom/tencent/bugly/proguard/y;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 811
    :cond_0
    const-string v0, "server key&value should not be empty %s %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/tencent/bugly/proguard/w;->d(Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 817
    :goto_0
    return-void

    .line 815
    :cond_1
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ap:Ljava/lang/Object;

    monitor-enter v1

    .line 816
    :try_start_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->af:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 817
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final d()V
    .locals 2

    .prologue
    .line 273
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->am:Ljava/lang/Object;

    monitor-enter v1

    .line 274
    :try_start_0
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->F:Ljava/lang/String;

    .line 275
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final declared-synchronized d(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 378
    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->I:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 379
    monitor-exit p0

    return-void

    .line 378
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final e()Ljava/lang/String;
    .locals 2

    .prologue
    .line 284
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->F:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 285
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->am:Ljava/lang/Object;

    monitor-enter v1

    .line 286
    :try_start_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->F:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 287
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->F:Ljava/lang/String;

    .line 289
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 291
    :cond_1
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->F:Ljava/lang/String;

    return-object v0

    .line 289
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final declared-synchronized e(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 396
    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->J:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 397
    monitor-exit p0

    return-void

    .line 396
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final f()Ljava/lang/String;
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 300
    invoke-static {v0}, Lcom/tencent/bugly/proguard/y;->a(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 303
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->W:Ljava/lang/String;

    goto :goto_0
.end method

.method public final f(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .prologue
    .line 704
    invoke-static {p1}, Lcom/tencent/bugly/proguard/y;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 705
    const-string v0, "key should not be empty %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/tencent/bugly/proguard/w;->d(Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 706
    const/4 v0, 0x0

    .line 709
    :goto_0
    return-object v0

    .line 708
    :cond_0
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ao:Ljava/lang/Object;

    monitor-enter v1

    .line 709
    :try_start_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ad:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 710
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final g()Ljava/lang/String;
    .locals 2

    .prologue
    .line 321
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ar:Ljava/lang/Object;

    monitor-enter v1

    .line 322
    :try_start_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->H:Ljava/lang/String;

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 323
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final g(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .prologue
    .line 729
    invoke-static {p1}, Lcom/tencent/bugly/proguard/y;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 730
    const-string v0, "key should not be empty %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/tencent/bugly/proguard/w;->d(Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 731
    const/4 v0, 0x0

    .line 734
    :goto_0
    return-object v0

    .line 733
    :cond_0
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ao:Ljava/lang/Object;

    monitor-enter v1

    .line 734
    :try_start_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ad:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 735
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final h()Ljava/lang/String;
    .locals 2

    .prologue
    .line 346
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->G:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 347
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->G:Ljava/lang/String;

    .line 350
    :goto_0
    return-object v0

    .line 349
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/tencent/bugly/crashreport/common/info/a;->k()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/tencent/bugly/crashreport/common/info/a;->m()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/tencent/bugly/crashreport/common/info/a;->n()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->G:Ljava/lang/String;

    .line 350
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->G:Ljava/lang/String;

    goto :goto_0
.end method

.method public final declared-synchronized i()Ljava/lang/String;
    .locals 1

    .prologue
    .line 369
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->I:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized j()Ljava/lang/String;
    .locals 1

    .prologue
    .line 387
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->J:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final k()Ljava/lang/String;
    .locals 1

    .prologue
    .line 405
    iget-boolean v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->U:Z

    if-nez v0, :cond_0

    .line 406
    const-string v0, ""

    .line 411
    :goto_0
    return-object v0

    .line 408
    :cond_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->K:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 409
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->E:Landroid/content/Context;

    invoke-static {v0}, Lcom/tencent/bugly/crashreport/common/info/b;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->K:Ljava/lang/String;

    .line 411
    :cond_1
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->K:Ljava/lang/String;

    goto :goto_0
.end method

.method public final l()Ljava/lang/String;
    .locals 1

    .prologue
    .line 420
    iget-boolean v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->U:Z

    if-nez v0, :cond_0

    .line 421
    const-string v0, ""

    .line 426
    :goto_0
    return-object v0

    .line 423
    :cond_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->L:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 424
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->E:Landroid/content/Context;

    invoke-static {v0}, Lcom/tencent/bugly/crashreport/common/info/b;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->L:Ljava/lang/String;

    .line 426
    :cond_1
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->L:Ljava/lang/String;

    goto :goto_0
.end method

.method public final m()Ljava/lang/String;
    .locals 1

    .prologue
    .line 435
    iget-boolean v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->U:Z

    if-nez v0, :cond_0

    .line 436
    const-string v0, ""

    .line 441
    :goto_0
    return-object v0

    .line 438
    :cond_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->M:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 439
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->E:Landroid/content/Context;

    invoke-static {v0}, Lcom/tencent/bugly/crashreport/common/info/b;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->M:Ljava/lang/String;

    .line 441
    :cond_1
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->M:Ljava/lang/String;

    goto :goto_0
.end method

.method public final n()Ljava/lang/String;
    .locals 1

    .prologue
    .line 450
    iget-boolean v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->U:Z

    if-nez v0, :cond_0

    .line 451
    const-string v0, ""

    .line 456
    :goto_0
    return-object v0

    .line 453
    :cond_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->N:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 454
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->E:Landroid/content/Context;

    invoke-static {v0}, Lcom/tencent/bugly/crashreport/common/info/b;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->N:Ljava/lang/String;

    .line 456
    :cond_1
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->N:Ljava/lang/String;

    goto :goto_0
.end method

.method public final o()J
    .locals 4

    .prologue
    .line 465
    iget-wide v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->O:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 466
    invoke-static {}, Lcom/tencent/bugly/crashreport/common/info/b;->d()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->O:J

    .line 468
    :cond_0
    iget-wide v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->O:J

    return-wide v0
.end method

.method public final p()J
    .locals 4

    .prologue
    .line 477
    iget-wide v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->P:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 478
    invoke-static {}, Lcom/tencent/bugly/crashreport/common/info/b;->f()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->P:J

    .line 480
    :cond_0
    iget-wide v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->P:J

    return-wide v0
.end method

.method public final q()J
    .locals 4

    .prologue
    .line 489
    iget-wide v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->Q:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 490
    invoke-static {}, Lcom/tencent/bugly/crashreport/common/info/b;->h()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->Q:J

    .line 492
    :cond_0
    iget-wide v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->Q:J

    return-wide v0
.end method

.method public final r()Ljava/lang/String;
    .locals 1

    .prologue
    .line 501
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->R:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 502
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/tencent/bugly/crashreport/common/info/b;->a(Z)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->R:Ljava/lang/String;

    .line 504
    :cond_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->R:Ljava/lang/String;

    return-object v0
.end method

.method public final s()Ljava/lang/String;
    .locals 1

    .prologue
    .line 513
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->S:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 514
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->E:Landroid/content/Context;

    invoke-static {v0}, Lcom/tencent/bugly/crashreport/common/info/b;->g(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->S:Ljava/lang/String;

    .line 516
    :cond_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->S:Ljava/lang/String;

    return-object v0
.end method

.method public final t()Ljava/lang/String;
    .locals 5

    .prologue
    .line 539
    :try_start_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->E:Landroid/content/Context;

    const-string v1, "BuglySdkInfos"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 540
    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    .line 541
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 542
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->an:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 543
    :try_start_1
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 545
    :try_start_2
    iget-object v3, p0, Lcom/tencent/bugly/crashreport/common/info/a;->A:Ljava/util/HashMap;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 546
    :catch_0
    move-exception v0

    .line 547
    :try_start_3
    invoke-static {v0}, Lcom/tencent/bugly/proguard/w;->a(Ljava/lang/Throwable;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 550
    :catchall_0
    move-exception v0

    :try_start_4
    monitor-exit v1

    throw v0
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1

    .line 552
    :catch_1
    move-exception v0

    .line 553
    invoke-static {v0}, Lcom/tencent/bugly/proguard/w;->a(Ljava/lang/Throwable;)Z

    .line 555
    :cond_0
    :goto_1
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->A:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 556
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 557
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->A:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 558
    const-string v1, "["

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 559
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 560
    const-string v1, ","

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 561
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 562
    const-string v0, "] "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 550
    :cond_1
    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 565
    :cond_2
    const-string v0, "SDK_INFO"

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/tencent/bugly/crashreport/common/info/a;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 566
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 568
    :goto_3
    return-object v0

    :cond_3
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public final u()Ljava/lang/String;
    .locals 1

    .prologue
    .line 577
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->al:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 578
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->E:Landroid/content/Context;

    invoke-static {v0}, Lcom/tencent/bugly/crashreport/common/info/AppInfo;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->al:Ljava/lang/String;

    .line 580
    :cond_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->al:Ljava/lang/String;

    return-object v0
.end method

.method public final declared-synchronized v()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/tencent/bugly/crashreport/common/info/PlugInBean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 589
    monitor-enter p0

    const/4 v0, 0x0

    monitor-exit p0

    return-object v0
.end method

.method public final w()Ljava/lang/String;
    .locals 1

    .prologue
    .line 634
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->V:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 635
    invoke-static {}, Lcom/tencent/bugly/crashreport/common/info/b;->j()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->V:Ljava/lang/String;

    .line 637
    :cond_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->V:Ljava/lang/String;

    return-object v0
.end method

.method public final x()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 655
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->X:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 656
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->E:Landroid/content/Context;

    invoke-static {v0}, Lcom/tencent/bugly/crashreport/common/info/b;->h(Landroid/content/Context;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->X:Ljava/lang/Boolean;

    .line 658
    :cond_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->X:Ljava/lang/Boolean;

    return-object v0
.end method

.method public final y()Ljava/lang/String;
    .locals 4

    .prologue
    .line 676
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->Y:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 677
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->E:Landroid/content/Context;

    invoke-static {v1}, Lcom/tencent/bugly/crashreport/common/info/b;->f(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->Y:Ljava/lang/String;

    .line 678
    const-string v0, "rom:%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/tencent/bugly/crashreport/common/info/a;->Y:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/tencent/bugly/proguard/w;->a(Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 680
    :cond_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->Y:Ljava/lang/String;

    return-object v0
.end method

.method public final z()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 689
    iget-object v1, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ao:Ljava/lang/Object;

    monitor-enter v1

    .line 690
    :try_start_0
    iget-object v0, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ad:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    .line 691
    const/4 v0, 0x0

    monitor-exit v1

    .line 693
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/util/HashMap;

    iget-object v2, p0, Lcom/tencent/bugly/crashreport/common/info/a;->ad:Ljava/util/Map;

    invoke-direct {v0, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 694
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
