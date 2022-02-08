.class public final Lcom/unionpay/mobile/android/upviews/a;
.super Landroid/widget/LinearLayout;

# interfaces
.implements Lcom/unionpay/mobile/android/upwidget/q$a;
.implements Lcom/unionpay/mobile/android/widgets/aa$a;
.implements Lcom/unionpay/mobile/android/widgets/ah$a;
.implements Lcom/unionpay/mobile/android/widgets/aj$a;
.implements Lcom/unionpay/mobile/android/widgets/ap$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/unionpay/mobile/android/upviews/a$a;,
        Lcom/unionpay/mobile/android/upviews/a$b;
    }
.end annotation


# instance fields
.field private a:Landroid/content/Context;

.field private b:Lcom/unionpay/mobile/android/widgets/m;

.field private c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/unionpay/mobile/android/widgets/z;",
            ">;"
        }
    .end annotation
.end field

.field private d:J

.field private e:Lcom/unionpay/mobile/android/upviews/a$b;

.field private f:Z

.field private g:Z

.field private h:Lorg/json/JSONObject;

.field private i:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/json/JSONArray;JLcom/unionpay/mobile/android/upviews/a$b;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 11

    const/4 v10, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    invoke-direct/range {v1 .. v10}, Lcom/unionpay/mobile/android/upviews/a;-><init>(Landroid/content/Context;Lorg/json/JSONArray;JLcom/unionpay/mobile/android/upviews/a$b;Ljava/lang/String;ZLjava/lang/String;B)V

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lorg/json/JSONArray;JLcom/unionpay/mobile/android/upviews/a$b;Ljava/lang/String;ZLjava/lang/String;B)V
    .locals 11

    const/4 v10, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    invoke-direct/range {v1 .. v10}, Lcom/unionpay/mobile/android/upviews/a;-><init>(Landroid/content/Context;Lorg/json/JSONArray;JLcom/unionpay/mobile/android/upviews/a$b;Ljava/lang/String;ZLjava/lang/String;C)V

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lorg/json/JSONArray;JLcom/unionpay/mobile/android/upviews/a$b;Ljava/lang/String;ZLjava/lang/String;C)V
    .locals 13

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide/from16 v4, p3

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p7

    move-object/from16 v12, p8

    invoke-direct/range {v1 .. v12}, Lcom/unionpay/mobile/android/upviews/a;-><init>(Landroid/content/Context;Lorg/json/JSONArray;JLcom/unionpay/mobile/android/upviews/a$b;Ljava/lang/String;ZZLcom/unionpay/mobile/android/widgets/z;Lorg/json/JSONArray;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lorg/json/JSONArray;JLcom/unionpay/mobile/android/upviews/a$b;Ljava/lang/String;ZZLcom/unionpay/mobile/android/widgets/z;Lorg/json/JSONArray;Ljava/lang/String;)V
    .locals 7

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->a:Landroid/content/Context;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->b:Lcom/unionpay/mobile/android/widgets/m;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/unionpay/mobile/android/upviews/a;->d:J

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->e:Lcom/unionpay/mobile/android/upviews/a$b;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/upviews/a;->f:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/upviews/a;->g:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->h:Lorg/json/JSONObject;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->i:Ljava/lang/String;

    iput-object p1, p0, Lcom/unionpay/mobile/android/upviews/a;->a:Landroid/content/Context;

    iput-wide p3, p0, Lcom/unionpay/mobile/android/upviews/a;->d:J

    iput-object p5, p0, Lcom/unionpay/mobile/android/upviews/a;->e:Lcom/unionpay/mobile/android/upviews/a$b;

    iput-boolean p8, p0, Lcom/unionpay/mobile/android/upviews/a;->f:Z

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    sget v1, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/upviews/a;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/unionpay/mobile/android/upviews/a;->setPadding(IIII)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/upviews/a;->setOrientation(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/upviews/a;->setBackgroundColor(I)V

    move-object v0, p0

    move-object v1, p2

    move-object v2, p6

    move v3, p7

    move-object/from16 v4, p9

    move-object/from16 v5, p10

    move-object/from16 v6, p11

    invoke-virtual/range {v0 .. v6}, Lcom/unionpay/mobile/android/upviews/a;->a(Lorg/json/JSONArray;Ljava/lang/String;ZLcom/unionpay/mobile/android/widgets/z;Lorg/json/JSONArray;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lorg/json/JSONArray;Lcom/unionpay/mobile/android/upviews/a$b;Ljava/lang/String;)V
    .locals 10

    const-wide/16 v4, -0x1

    const/4 v7, 0x0

    const/4 v8, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v6, p3

    move-object v9, p4

    invoke-direct/range {v1 .. v9}, Lcom/unionpay/mobile/android/upviews/a;-><init>(Landroid/content/Context;Lorg/json/JSONArray;JLcom/unionpay/mobile/android/upviews/a$b;Ljava/lang/String;ZLjava/lang/String;)V

    return-void
.end method

.method private a(Z)Lcom/unionpay/mobile/android/upviews/a$a;
    .locals 8

    const/4 v7, -0x1

    const/4 v6, 0x1

    const/4 v2, 0x0

    new-instance v3, Lcom/unionpay/mobile/android/upviews/a$a;

    const-string v0, ""

    invoke-direct {v3, p0, v0}, Lcom/unionpay/mobile/android/upviews/a$a;-><init>(Lcom/unionpay/mobile/android/upviews/a;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/z;

    instance-of v4, v0, Lcom/unionpay/mobile/android/widgets/af;

    if-eqz v4, :cond_2

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/z;->c()Z

    move-result v4

    if-nez v4, :cond_1

    sget-object v0, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v0, v0, Lcom/unionpay/mobile/android/languages/c;->aC:Ljava/lang/String;

    new-array v4, v6, [Ljava/lang/Object;

    sget-object v5, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v5, v5, Lcom/unionpay/mobile/android/languages/c;->aE:Ljava/lang/String;

    aput-object v5, v4, v2

    invoke-static {v0, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v7, v0}, Lcom/unionpay/mobile/android/upviews/a$a;->a(ILjava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/z;->b()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v0, v0, Lcom/unionpay/mobile/android/languages/c;->aD:Ljava/lang/String;

    new-array v4, v6, [Ljava/lang/Object;

    sget-object v5, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v5, v5, Lcom/unionpay/mobile/android/languages/c;->aE:Ljava/lang/String;

    aput-object v5, v4, v2

    invoke-static {v0, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v7, v0}, Lcom/unionpay/mobile/android/upviews/a$a;->a(ILjava/lang/String;)V

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/z;->c()Z

    move-result v4

    if-nez v4, :cond_4

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->aC:Ljava/lang/String;

    new-array v4, v6, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/z;->u()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v2

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v7, v0}, Lcom/unionpay/mobile/android/upviews/a$a;->a(ILjava/lang/String;)V

    :cond_3
    :goto_1
    invoke-virtual {v3}, Lcom/unionpay/mobile/android/upviews/a$a;->a()Z

    move-result v0

    if-nez v0, :cond_5

    move-object v0, v3

    :goto_2
    return-object v0

    :cond_4
    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/z;->b()Z

    move-result v4

    if-nez v4, :cond_0

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->aD:Ljava/lang/String;

    new-array v4, v6, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/z;->u()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v2

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v7, v0}, Lcom/unionpay/mobile/android/upviews/a$a;->a(ILjava/lang/String;)V

    goto :goto_1

    :cond_5
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    if-eqz v0, :cond_8

    move v1, v2

    :goto_3
    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_8

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/z;

    instance-of v5, v0, Lcom/unionpay/mobile/android/widgets/ad;

    if-nez v5, :cond_7

    instance-of v0, v0, Lcom/unionpay/mobile/android/widgets/UPWidget;

    if-eqz v0, :cond_6

    if-eqz p1, :cond_7

    :cond_6
    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/z;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/z;->h()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/z;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/z;->f()Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, ","

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/z;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/z;->h()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_7
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_3

    :cond_8
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v6, :cond_9

    invoke-virtual {v0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :cond_9
    invoke-virtual {v3, v2, v0}, Lcom/unionpay/mobile/android/upviews/a$a;->a(ILjava/lang/String;)V

    move-object v0, v3

    goto/16 :goto_2
.end method

.method private static a(Ljava/util/List;Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/unionpay/mobile/android/widgets/z;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/unionpay/mobile/android/widgets/z;"
        }
    .end annotation

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/z;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/z;->q()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public final a()Lcom/unionpay/mobile/android/upviews/a$a;
    .locals 7

    const/4 v3, 0x1

    const/4 v6, 0x0

    const/4 v5, -0x1

    new-instance v0, Lcom/unionpay/mobile/android/upviews/a$a;

    const-string v1, ""

    invoke-direct {v0, p0, v1}, Lcom/unionpay/mobile/android/upviews/a$a;-><init>(Lcom/unionpay/mobile/android/upviews/a;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    const-string v2, "pin"

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/upviews/a;->a(Ljava/util/List;Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/widgets/z;->c()Z

    move-result v2

    if-nez v2, :cond_2

    sget-object v2, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v2, v2, Lcom/unionpay/mobile/android/languages/c;->aC:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/widgets/z;->u()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v5, v2}, Lcom/unionpay/mobile/android/upviews/a$a;->a(ILjava/lang/String;)V

    :cond_0
    :goto_0
    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a$a;->a()Z

    move-result v2

    if-nez v2, :cond_3

    :cond_1
    :goto_1
    return-object v0

    :cond_2
    invoke-virtual {v1}, Lcom/unionpay/mobile/android/widgets/z;->b()Z

    move-result v2

    if-nez v2, :cond_0

    sget-object v2, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v2, v2, Lcom/unionpay/mobile/android/languages/c;->aD:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/widgets/z;->u()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v5, v2}, Lcom/unionpay/mobile/android/upviews/a$a;->a(ILjava/lang/String;)V

    goto :goto_0

    :cond_3
    invoke-virtual {v1}, Lcom/unionpay/mobile/android/widgets/z;->a()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    goto :goto_1
.end method

.method public final a(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Lcom/unionpay/mobile/android/upviews/a;->a(Ljava/util/List;Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v1

    const-string v0, ""

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/widgets/z;->h()Ljava/lang/String;

    move-result-object v0

    :cond_0
    const-string v1, "uppay"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, " name:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", value:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method public final a(I)V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    const-string v1, "sms"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->a(Ljava/util/List;Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/ap;

    invoke-virtual {v0, p1}, Lcom/unionpay/mobile/android/widgets/ap;->a(I)V

    :cond_0
    return-void
.end method

.method public final a(Landroid/view/View$OnClickListener;)V
    .locals 2

    const-string v0, "promotion"

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v0

    if-eqz v0, :cond_0

    instance-of v1, v0, Lcom/unionpay/mobile/android/widgets/aj;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/aj;

    invoke-virtual {v0, p1}, Lcom/unionpay/mobile/android/widgets/aj;->b(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method

.method public final a(Lcom/unionpay/mobile/android/widgets/m;Lorg/json/JSONObject;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/upviews/a;->b:Lcom/unionpay/mobile/android/widgets/m;

    iput-object p2, p0, Lcom/unionpay/mobile/android/upviews/a;->h:Lorg/json/JSONObject;

    return-void
.end method

.method public final a(Lcom/unionpay/mobile/android/widgets/u;Ljava/lang/String;)V
    .locals 4

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->e:Lcom/unionpay/mobile/android/upviews/a$b;

    if-eqz v0, :cond_1

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_2

    :cond_0
    move v0, v2

    :goto_0
    iget-object v1, p0, Lcom/unionpay/mobile/android/upviews/a;->e:Lcom/unionpay/mobile/android/upviews/a$b;

    invoke-interface {v1, v0}, Lcom/unionpay/mobile/android/upviews/a$b;->a(Z)V

    :cond_1
    return-void

    :cond_2
    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/unionpay/mobile/android/widgets/z;

    instance-of v0, v1, Lcom/unionpay/mobile/android/widgets/aa;

    if-eqz v0, :cond_3

    move-object v0, v1

    check-cast v0, Lcom/unionpay/mobile/android/widgets/aa;

    invoke-virtual {v0, p1}, Lcom/unionpay/mobile/android/widgets/aa;->a(Lcom/unionpay/mobile/android/widgets/u;)Z

    move-result v0

    if-nez v0, :cond_3

    check-cast v1, Lcom/unionpay/mobile/android/widgets/aa;

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/widgets/aa;->c()Z

    move-result v0

    if-nez v0, :cond_3

    move v0, v2

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final a(Lcom/unionpay/mobile/android/widgets/z;)V
    .locals 11

    const/4 v10, 0x1

    const/4 v9, -0x1

    const/4 v8, 0x0

    instance-of v0, p1, Lcom/unionpay/mobile/android/widgets/ap;

    iget-object v1, p0, Lcom/unionpay/mobile/android/upviews/a;->e:Lcom/unionpay/mobile/android/upviews/a$b;

    if-eqz v1, :cond_0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/upviews/a;->d()Z

    new-instance v1, Lcom/unionpay/mobile/android/upviews/a$a;

    const-string v0, ""

    invoke-direct {v1, p0, v0}, Lcom/unionpay/mobile/android/upviews/a$a;-><init>(Lcom/unionpay/mobile/android/upviews/a;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    const-string v2, "mobile"

    invoke-static {v0, v2}, Lcom/unionpay/mobile/android/upviews/a;->a(Ljava/util/List;Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v2

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    const-string v3, "pan"

    invoke-static {v0, v3}, Lcom/unionpay/mobile/android/upviews/a;->a(Ljava/util/List;Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v3

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    const-string v4, "card"

    invoke-static {v0, v4}, Lcom/unionpay/mobile/android/upviews/a;->a(Ljava/util/List;Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v4

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    const-string v5, "area_code"

    invoke-static {v0, v5}, Lcom/unionpay/mobile/android/upviews/a;->a(Ljava/util/List;Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v5

    const-string v0, ""

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Lcom/unionpay/mobile/android/widgets/z;->c()Z

    move-result v6

    if-nez v6, :cond_3

    sget-object v3, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/languages/c;->aC:Ljava/lang/String;

    new-array v6, v10, [Ljava/lang/Object;

    sget-object v7, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v7, v7, Lcom/unionpay/mobile/android/languages/c;->aE:Ljava/lang/String;

    aput-object v7, v6, v8

    invoke-static {v3, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v9, v3}, Lcom/unionpay/mobile/android/upviews/a$a;->a(ILjava/lang/String;)V

    :cond_2
    :goto_1
    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upviews/a$a;->a()Z

    move-result v3

    if-nez v3, :cond_5

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->e:Lcom/unionpay/mobile/android/upviews/a$b;

    invoke-interface {v0, v1}, Lcom/unionpay/mobile/android/upviews/a$b;->a(Lcom/unionpay/mobile/android/upviews/a$a;)V

    goto :goto_0

    :cond_3
    invoke-virtual {v3}, Lcom/unionpay/mobile/android/widgets/z;->b()Z

    move-result v6

    if-nez v6, :cond_4

    sget-object v3, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/languages/c;->aD:Ljava/lang/String;

    new-array v6, v10, [Ljava/lang/Object;

    sget-object v7, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v7, v7, Lcom/unionpay/mobile/android/languages/c;->aE:Ljava/lang/String;

    aput-object v7, v6, v8

    invoke-static {v3, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v9, v3}, Lcom/unionpay/mobile/android/upviews/a$a;->a(ILjava/lang/String;)V

    goto :goto_1

    :cond_4
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v3}, Lcom/unionpay/mobile/android/widgets/z;->h()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_5
    if-eqz v2, :cond_6

    invoke-virtual {v2}, Lcom/unionpay/mobile/android/widgets/z;->c()Z

    move-result v3

    if-nez v3, :cond_7

    sget-object v3, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/languages/c;->aC:Ljava/lang/String;

    new-array v6, v10, [Ljava/lang/Object;

    invoke-virtual {v2}, Lcom/unionpay/mobile/android/widgets/z;->u()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v6, v8

    invoke-static {v3, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v9, v2}, Lcom/unionpay/mobile/android/upviews/a$a;->a(ILjava/lang/String;)V

    :cond_6
    :goto_2
    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upviews/a$a;->a()Z

    move-result v2

    if-nez v2, :cond_a

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->e:Lcom/unionpay/mobile/android/upviews/a$b;

    invoke-interface {v0, v1}, Lcom/unionpay/mobile/android/upviews/a$b;->a(Lcom/unionpay/mobile/android/upviews/a$a;)V

    goto/16 :goto_0

    :cond_7
    invoke-virtual {v2}, Lcom/unionpay/mobile/android/widgets/z;->b()Z

    move-result v3

    if-nez v3, :cond_8

    sget-object v3, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/languages/c;->aD:Ljava/lang/String;

    new-array v6, v10, [Ljava/lang/Object;

    invoke-virtual {v2}, Lcom/unionpay/mobile/android/widgets/z;->u()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v6, v8

    invoke-static {v3, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v9, v2}, Lcom/unionpay/mobile/android/upviews/a$a;->a(ILjava/lang/String;)V

    goto :goto_2

    :cond_8
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_9

    const-string v0, ""

    :goto_3
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v2}, Lcom/unionpay/mobile/android/widgets/z;->h()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_9
    const-string v0, ","

    goto :goto_3

    :cond_a
    if-eqz v4, :cond_b

    invoke-virtual {v4}, Lcom/unionpay/mobile/android/widgets/z;->h()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_b

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_d

    const-string v0, ""

    :goto_4
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v4}, Lcom/unionpay/mobile/android/widgets/z;->h()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_b
    if-eqz v5, :cond_c

    invoke-virtual {v5}, Lcom/unionpay/mobile/android/widgets/z;->h()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_c

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_e

    const-string v0, ""

    :goto_5
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v5}, Lcom/unionpay/mobile/android/widgets/z;->h()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_c
    invoke-virtual {v1, v8, v0}, Lcom/unionpay/mobile/android/upviews/a$a;->a(ILjava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->e:Lcom/unionpay/mobile/android/upviews/a$b;

    invoke-interface {v0, v1}, Lcom/unionpay/mobile/android/upviews/a$b;->a(Lcom/unionpay/mobile/android/upviews/a$a;)V

    goto/16 :goto_0

    :cond_d
    const-string v0, ","

    goto :goto_4

    :cond_e
    const-string v0, ","

    goto :goto_5
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->e:Lcom/unionpay/mobile/android/upviews/a$b;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/upviews/a;->d()Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->e:Lcom/unionpay/mobile/android/upviews/a$b;

    invoke-interface {v0, p1, p2}, Lcom/unionpay/mobile/android/upviews/a$b;->c(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public final a(Ljava/lang/String;Z)V
    .locals 4

    const-string v0, "promotion"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "instalment"

    move-object v1, v0

    :goto_0
    invoke-virtual {p0, p1}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v0

    invoke-virtual {p0, v1}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v1

    if-nez v0, :cond_2

    :cond_0
    :goto_1
    return-void

    :cond_1
    const-string v0, "promotion"

    move-object v1, v0

    goto :goto_0

    :cond_2
    instance-of v2, v0, Lcom/unionpay/mobile/android/widgets/aj;

    if-eqz v2, :cond_3

    check-cast v0, Lcom/unionpay/mobile/android/widgets/aj;

    invoke-virtual {v0, p2}, Lcom/unionpay/mobile/android/widgets/aj;->a(Z)V

    if-eqz v1, :cond_0

    move-object v0, v1

    check-cast v0, Lcom/unionpay/mobile/android/widgets/p;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/p;->g()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->a:Landroid/content/Context;

    iget-object v2, p0, Lcom/unionpay/mobile/android/upviews/a;->i:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-static {v0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    check-cast v1, Lcom/unionpay/mobile/android/widgets/p;

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/unionpay/mobile/android/widgets/p;->b(Z)V

    goto :goto_1

    :cond_3
    instance-of v1, v0, Lcom/unionpay/mobile/android/widgets/p;

    if-eqz v1, :cond_0

    if-eqz p2, :cond_4

    iget-object v1, p0, Lcom/unionpay/mobile/android/upviews/a;->e:Lcom/unionpay/mobile/android/upviews/a$b;

    invoke-interface {v1}, Lcom/unionpay/mobile/android/upviews/a$b;->t()V

    :cond_4
    check-cast v0, Lcom/unionpay/mobile/android/widgets/p;

    invoke-virtual {v0, p2}, Lcom/unionpay/mobile/android/widgets/p;->b(Z)V

    goto :goto_1
.end method

.method public final a(Lorg/json/JSONArray;)V
    .locals 2

    const-string v0, "promotion"

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v0

    if-eqz v0, :cond_0

    instance-of v1, v0, Lcom/unionpay/mobile/android/widgets/aj;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/aj;

    invoke-virtual {v0, p1}, Lcom/unionpay/mobile/android/widgets/aj;->a(Lorg/json/JSONArray;)V

    :cond_0
    return-void
.end method

.method public final a(Lorg/json/JSONArray;Ljava/lang/String;)V
    .locals 2

    const-string v0, "promotion"

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v0

    if-eqz v0, :cond_0

    instance-of v1, v0, Lcom/unionpay/mobile/android/widgets/aj;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/aj;

    invoke-virtual {v0, p1, p2}, Lcom/unionpay/mobile/android/widgets/aj;->a(Lorg/json/JSONArray;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public final a(Lorg/json/JSONArray;Ljava/lang/String;ZLcom/unionpay/mobile/android/widgets/z;Lorg/json/JSONArray;Ljava/lang/String;)V
    .locals 17

    if-eqz p1, :cond_0

    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-gtz v2, :cond_1

    :cond_0
    return-void

    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    if-nez v2, :cond_b

    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/unionpay/mobile/android/upviews/a;->removeAllViews()V

    const/4 v2, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/unionpay/mobile/android/upviews/a;->setBackgroundColor(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    sget v2, Lcom/unionpay/mobile/android/global/a;->f:I

    const/4 v5, 0x0

    const-string v3, ""

    sget v2, Lcom/unionpay/mobile/android/global/a;->I:I

    sget v4, Lcom/unionpay/mobile/android/global/a;->f:I

    mul-int/lit8 v4, v4, 0x4

    sub-int v4, v2, v4

    const/4 v2, 0x0

    move v13, v2

    move-object v14, v5

    move-object v2, v3

    :goto_1
    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v13, v3, :cond_0

    const/4 v15, 0x0

    :try_start_0
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v3, "type"

    invoke-static {v5, v3}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v16

    :try_start_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/unionpay/mobile/android/upviews/a;->a:Landroid/content/Context;

    const/4 v2, 0x0

    const-string v6, "type"

    invoke-static {v5, v6}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "pan"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_c

    new-instance v2, Lcom/unionpay/mobile/android/widgets/af;

    move-object/from16 v0, p6

    invoke-direct {v2, v3, v4, v5, v0}, Lcom/unionpay/mobile/android/widgets/af;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    :cond_2
    :goto_2
    :try_start_2
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v5, -0x2

    invoke-direct {v6, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    move-object v3, v2

    move-object/from16 v5, v16

    :goto_3
    if-eqz v3, :cond_a

    instance-of v2, v3, Lcom/unionpay/mobile/android/widgets/UPWidget;

    if-eqz v2, :cond_1d

    move-object v2, v3

    check-cast v2, Lcom/unionpay/mobile/android/widgets/UPWidget;

    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/unionpay/mobile/android/upviews/a;->d:J

    invoke-virtual {v2, v8, v9}, Lcom/unionpay/mobile/android/widgets/UPWidget;->a(J)V

    move-object v2, v3

    check-cast v2, Lcom/unionpay/mobile/android/widgets/UPWidget;

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->b(Ljava/lang/String;)V

    move-object v2, v3

    check-cast v2, Lcom/unionpay/mobile/android/widgets/UPWidget;

    move/from16 v0, p3

    invoke-virtual {v2, v0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->b(Z)V

    :cond_3
    :goto_4
    instance-of v2, v3, Lcom/unionpay/mobile/android/widgets/aa;

    if-eqz v2, :cond_4

    instance-of v2, v3, Lcom/unionpay/mobile/android/widgets/bd;

    if-nez v2, :cond_4

    move-object v2, v3

    check-cast v2, Lcom/unionpay/mobile/android/widgets/aa;

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Lcom/unionpay/mobile/android/widgets/aa;->a(Lcom/unionpay/mobile/android/widgets/aa$a;)V

    :cond_4
    const-string v2, "instalment"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    new-instance v2, Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/unionpay/mobile/android/upviews/a;->a:Landroid/content/Context;

    invoke-direct {v2, v7}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const v7, -0x342f27

    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x1

    const/4 v9, 0x1

    invoke-direct {v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    if-eqz v13, :cond_1f

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/unionpay/mobile/android/upviews/a;->a:Landroid/content/Context;

    const/high16 v9, 0x41200000    # 10.0f

    invoke-static {v8, v9}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v8

    iput v8, v7, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    :cond_5
    :goto_5
    move-object/from16 v0, p0

    iget-boolean v8, v0, Lcom/unionpay/mobile/android/upviews/a;->f:Z

    if-eqz v8, :cond_20

    if-nez v13, :cond_20

    if-eqz p4, :cond_20

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v1, v6}, Lcom/unionpay/mobile/android/upviews/a;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3}, Lcom/unionpay/mobile/android/widgets/z;->getVisibility()I

    move-result v8

    if-nez v8, :cond_6

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v7}, Lcom/unionpay/mobile/android/upviews/a;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_6
    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v6}, Lcom/unionpay/mobile/android/upviews/a;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_7
    :goto_6
    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-eq v13, v2, :cond_8

    instance-of v2, v3, Lcom/unionpay/mobile/android/widgets/aj;

    if-eqz v2, :cond_9

    :cond_8
    new-instance v2, Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/unionpay/mobile/android/upviews/a;->a:Landroid/content/Context;

    invoke-direct {v2, v7}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const v7, -0x342f27

    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x1

    const/4 v9, 0x1

    invoke-direct {v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v7}, Lcom/unionpay/mobile/android/upviews/a;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_9
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_a
    add-int/lit8 v2, v13, 0x1

    move v13, v2

    move-object v14, v6

    move-object v2, v5

    goto/16 :goto_1

    :cond_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    goto/16 :goto_0

    :cond_c
    :try_start_3
    const-string v7, "mobile"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_d

    new-instance v2, Lcom/unionpay/mobile/android/widgets/ah;

    move-object/from16 v0, p6

    invoke-direct {v2, v3, v4, v5, v0}, Lcom/unionpay/mobile/android/widgets/ah;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_2

    :catch_0
    move-exception v2

    move-object v2, v15

    move-object/from16 v3, v16

    :goto_7
    const-string v5, "uppay"

    const-string v6, "json parser exception!!! - UPRuleView"

    invoke-static {v5, v6}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    move-object v5, v3

    move-object v6, v14

    move-object v3, v2

    goto/16 :goto_3

    :cond_d
    :try_start_4
    const-string v7, "sms"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_e

    new-instance v2, Lcom/unionpay/mobile/android/widgets/ap;

    const/4 v7, 0x0

    move-object/from16 v6, p6

    invoke-direct/range {v2 .. v7}, Lcom/unionpay/mobile/android/widgets/ap;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;B)V

    goto/16 :goto_2

    :cond_e
    const-string v7, "cvn2"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_f

    new-instance v2, Lcom/unionpay/mobile/android/widgets/e;

    move-object/from16 v0, p6

    invoke-direct {v2, v3, v4, v5, v0}, Lcom/unionpay/mobile/android/widgets/e;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_f
    const-string v7, "expire"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_10

    new-instance v2, Lcom/unionpay/mobile/android/widgets/av;

    move-object/from16 v0, p6

    invoke-direct {v2, v3, v4, v5, v0}, Lcom/unionpay/mobile/android/widgets/av;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_10
    const-string v7, "pwd"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_11

    new-instance v6, Lcom/unionpay/mobile/android/widgets/UPWidget;

    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/unionpay/mobile/android/upviews/a;->d:J

    move-object v7, v3

    move v10, v4

    move-object v11, v5

    move-object/from16 v12, p6

    invoke-direct/range {v6 .. v12}, Lcom/unionpay/mobile/android/widgets/UPWidget;-><init>(Landroid/content/Context;JILorg/json/JSONObject;Ljava/lang/String;)V

    move-object v2, v6

    goto/16 :goto_2

    :cond_11
    const-string v7, "text"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_12

    new-instance v2, Lcom/unionpay/mobile/android/widgets/at;

    move-object/from16 v0, p6

    invoke-direct {v2, v3, v4, v5, v0}, Lcom/unionpay/mobile/android/widgets/at;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_12
    const-string v7, "string"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_13

    new-instance v2, Lcom/unionpay/mobile/android/widgets/ad;

    move-object/from16 v0, p6

    invoke-direct {v2, v3, v5, v0}, Lcom/unionpay/mobile/android/widgets/ad;-><init>(Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_13
    const-string v7, "cert_id"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_14

    new-instance v2, Lcom/unionpay/mobile/android/widgets/f;

    move-object/from16 v0, p6

    invoke-direct {v2, v3, v4, v5, v0}, Lcom/unionpay/mobile/android/widgets/f;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_14
    const-string v7, "cert_type"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_15

    new-instance v2, Lcom/unionpay/mobile/android/widgets/g;

    move-object/from16 v0, p6

    invoke-direct {v2, v3, v5, v0}, Lcom/unionpay/mobile/android/widgets/g;-><init>(Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_15
    const-string v7, "name"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_16

    new-instance v2, Lcom/unionpay/mobile/android/widgets/ae;

    move-object/from16 v0, p6

    invoke-direct {v2, v3, v4, v5, v0}, Lcom/unionpay/mobile/android/widgets/ae;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_16
    const-string v7, "hidden"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_17

    new-instance v2, Lcom/unionpay/mobile/android/widgets/y;

    move-object/from16 v0, p6

    invoke-direct {v2, v3, v5, v0}, Lcom/unionpay/mobile/android/widgets/y;-><init>(Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_17
    const-string v7, "user_name"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_18

    new-instance v2, Lcom/unionpay/mobile/android/widgets/au;

    move-object/from16 v0, p6

    invoke-direct {v2, v3, v4, v5, v0}, Lcom/unionpay/mobile/android/widgets/au;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_18
    const-string v7, "password"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_19

    new-instance v2, Lcom/unionpay/mobile/android/widgets/ao;

    move-object/from16 v0, p6

    invoke-direct {v2, v3, v4, v5, v0}, Lcom/unionpay/mobile/android/widgets/ao;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_19
    const-string v7, "point"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1a

    new-instance v2, Lcom/unionpay/mobile/android/widgets/bd;

    move-object/from16 v0, p6

    invoke-direct {v2, v3, v4, v5, v0}, Lcom/unionpay/mobile/android/widgets/bd;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_1a
    const-string v3, "instalment"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1b

    new-instance v3, Lcom/unionpay/mobile/android/widgets/p;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/unionpay/mobile/android/upviews/a;->a:Landroid/content/Context;

    move-object/from16 v0, p6

    invoke-direct {v3, v2, v5, v0}, Lcom/unionpay/mobile/android/widgets/p;-><init>(Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;)V

    move-object v0, v3

    check-cast v0, Lcom/unionpay/mobile/android/widgets/p;

    move-object v2, v0

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Lcom/unionpay/mobile/android/widgets/p;->a(Lcom/unionpay/mobile/android/upwidget/q$a;)V

    move-object v2, v3

    goto/16 :goto_2

    :cond_1b
    const-string v3, "promotion"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1c

    new-instance v3, Lcom/unionpay/mobile/android/widgets/aj;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/unionpay/mobile/android/upviews/a;->a:Landroid/content/Context;

    move-object/from16 v0, p6

    move-object/from16 v1, p0

    invoke-direct {v3, v2, v5, v0, v1}, Lcom/unionpay/mobile/android/widgets/aj;-><init>(Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;Lcom/unionpay/mobile/android/widgets/aj$a;)V

    move-object v0, v3

    check-cast v0, Lcom/unionpay/mobile/android/widgets/aj;

    move-object v2, v0

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Lcom/unionpay/mobile/android/widgets/aj;->a(Lcom/unionpay/mobile/android/upwidget/q$a;)V

    move-object v2, v3

    goto/16 :goto_2

    :cond_1c
    const-string v3, "area_code"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    new-instance v2, Lcom/unionpay/mobile/android/widgets/a;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/unionpay/mobile/android/upviews/a;->a:Landroid/content/Context;

    move-object/from16 v0, p5

    move-object/from16 v1, p6

    invoke-direct {v2, v3, v5, v0, v1}, Lcom/unionpay/mobile/android/widgets/a;-><init>(Landroid/content/Context;Lorg/json/JSONObject;Lorg/json/JSONArray;Ljava/lang/String;)V
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_2

    :cond_1d
    instance-of v2, v3, Lcom/unionpay/mobile/android/widgets/ap;

    if-eqz v2, :cond_1e

    move-object v2, v3

    check-cast v2, Lcom/unionpay/mobile/android/widgets/ap;

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Lcom/unionpay/mobile/android/widgets/ap;->a(Lcom/unionpay/mobile/android/widgets/ap$a;)V

    goto/16 :goto_4

    :cond_1e
    instance-of v2, v3, Lcom/unionpay/mobile/android/widgets/ah;

    if-eqz v2, :cond_3

    move-object v2, v3

    check-cast v2, Lcom/unionpay/mobile/android/widgets/ah;

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Lcom/unionpay/mobile/android/widgets/ah;->a(Lcom/unionpay/mobile/android/widgets/ah$a;)V

    goto/16 :goto_4

    :cond_1f
    move-object/from16 v0, p0

    iget-boolean v8, v0, Lcom/unionpay/mobile/android/upviews/a;->f:Z

    if-eqz v8, :cond_5

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/unionpay/mobile/android/upviews/a;->a:Landroid/content/Context;

    const/high16 v9, 0x41200000    # 10.0f

    invoke-static {v8, v9}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v8

    iput v8, v7, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9, v10, v11}, Lcom/unionpay/mobile/android/upviews/a;->setPadding(IIII)V

    goto/16 :goto_5

    :cond_20
    invoke-virtual {v3}, Lcom/unionpay/mobile/android/widgets/z;->getVisibility()I

    move-result v8

    if-nez v8, :cond_7

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v7}, Lcom/unionpay/mobile/android/upviews/a;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v6}, Lcom/unionpay/mobile/android/upviews/a;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    instance-of v2, v3, Lcom/unionpay/mobile/android/widgets/af;

    if-eqz v2, :cond_7

    if-eqz p4, :cond_7

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v1, v6}, Lcom/unionpay/mobile/android/upviews/a;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_6

    :catch_1
    move-exception v3

    move-object v3, v2

    move-object v2, v15

    goto/16 :goto_7

    :catch_2
    move-exception v3

    move-object/from16 v3, v16

    goto/16 :goto_7
.end method

.method public final a(Lorg/json/JSONObject;)V
    .locals 4

    const/4 v3, 0x0

    const/4 v2, 0x1

    if-nez p1, :cond_0

    :goto_0
    return-void

    :cond_0
    const-string v0, "instalment_empty_info"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "instalment"

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/p;

    invoke-virtual {v0, v3}, Lcom/unionpay/mobile/android/widgets/p;->a(Z)V

    const-string v0, "instalment"

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/p;

    invoke-virtual {v0, v3}, Lcom/unionpay/mobile/android/widgets/p;->b(Z)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->a:Landroid/content/Context;

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_1
    const-string v0, "instalment"

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/p;

    invoke-virtual {v0, v2}, Lcom/unionpay/mobile/android/widgets/p;->a(Z)V

    const-string v0, "instalment"

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/p;

    invoke-virtual {v0, v2}, Lcom/unionpay/mobile/android/widgets/p;->b(Z)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    const-string v1, "instalment_policy"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->a(Ljava/util/List;Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/p;

    const-string v1, "new_instalments"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->d(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/p;->a(Lorg/json/JSONArray;)V

    goto :goto_0
.end method

.method public final b()Lcom/unionpay/mobile/android/upviews/a$a;
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/unionpay/mobile/android/upviews/a;->a(Z)Lcom/unionpay/mobile/android/upviews/a$a;

    move-result-object v0

    return-object v0
.end method

.method public final b(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Lcom/unionpay/mobile/android/upviews/a;->a(Ljava/util/List;Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v1

    const-string v0, ""

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/widgets/z;->a()Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public final b(Landroid/view/View$OnClickListener;)V
    .locals 2

    const-string v0, "promotion"

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v0

    if-eqz v0, :cond_0

    instance-of v1, v0, Lcom/unionpay/mobile/android/widgets/aj;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/aj;

    invoke-virtual {v0, p1}, Lcom/unionpay/mobile/android/widgets/aj;->c(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method

.method public final c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;
    .locals 4

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    move-object v0, v1

    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/z;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/z;->r()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    :cond_3
    move-object v0, v1

    goto :goto_0
.end method

.method public final c()Ljava/util/HashMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/unionpay/mobile/android/upviews/a;->a(Z)Lcom/unionpay/mobile/android/upviews/a$a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upviews/a$a;->a()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    if-eqz v1, :cond_2

    move v1, v0

    :goto_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/z;

    instance-of v3, v0, Lcom/unionpay/mobile/android/widgets/ad;

    if-nez v3, :cond_1

    instance-of v3, v0, Lcom/unionpay/mobile/android/widgets/UPWidget;

    if-nez v3, :cond_1

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/z;->a()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/z;->q()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/z;->a()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    :cond_2
    move-object v0, v2

    goto :goto_0
.end method

.method public final c(Landroid/view/View$OnClickListener;)V
    .locals 2

    const-string v0, "promotion"

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v0

    if-eqz v0, :cond_0

    instance-of v1, v0, Lcom/unionpay/mobile/android/widgets/aj;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/aj;

    invoke-virtual {v0, p1}, Lcom/unionpay/mobile/android/widgets/aj;->a(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method

.method public final d(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/upviews/a;->i:Ljava/lang/String;

    return-void
.end method

.method public final d()Z
    .locals 4

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/z;

    instance-of v1, v0, Lcom/unionpay/mobile/android/widgets/UPWidget;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Lcom/unionpay/mobile/android/widgets/UPWidget;

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/widgets/UPWidget;->j()Z

    move-result v1

    if-eqz v1, :cond_0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/UPWidget;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->k()V

    const/4 v0, 0x1

    move v1, v0

    :goto_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->a:Landroid/content/Context;

    const-string v3, "input_method"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/upviews/a;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    invoke-virtual {v0, v3, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    return v1

    :cond_1
    move v1, v2

    goto :goto_0
.end method

.method public final e(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->e:Lcom/unionpay/mobile/android/upviews/a$b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->e:Lcom/unionpay/mobile/android/upviews/a$b;

    invoke-interface {v0, p1}, Lcom/unionpay/mobile/android/upviews/a$b;->c(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public final e()Z
    .locals 5

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/z;

    instance-of v4, v0, Lcom/unionpay/mobile/android/widgets/aa;

    if-eqz v4, :cond_0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/aa;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/aa;->c()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    if-nez v0, :cond_2

    move v0, v1

    :goto_1
    return v0

    :cond_1
    move v0, v2

    goto :goto_0

    :cond_2
    move v0, v2

    goto :goto_1
.end method

.method public final f()V
    .locals 3

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_1

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/z;

    instance-of v2, v0, Lcom/unionpay/mobile/android/widgets/UPWidget;

    if-nez v2, :cond_3

    instance-of v2, v0, Lcom/unionpay/mobile/android/widgets/e;

    if-nez v2, :cond_3

    instance-of v2, v0, Lcom/unionpay/mobile/android/widgets/av;

    if-eqz v2, :cond_2

    :cond_3
    check-cast v0, Lcom/unionpay/mobile/android/widgets/aa;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/aa;->g()V

    goto :goto_0
.end method

.method public final g()V
    .locals 4

    const-string v0, "instalment"

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v1

    if-eqz v1, :cond_0

    move-object v0, v1

    check-cast v0, Lcom/unionpay/mobile/android/widgets/p;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/p;->g()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/upviews/a;->a:Landroid/content/Context;

    iget-object v2, p0, Lcom/unionpay/mobile/android/upviews/a;->i:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-static {v0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    check-cast v1, Lcom/unionpay/mobile/android/widgets/p;

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/unionpay/mobile/android/widgets/p;->b(Z)V

    :cond_0
    return-void
.end method
