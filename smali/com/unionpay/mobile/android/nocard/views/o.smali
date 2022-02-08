.class public final Lcom/unionpay/mobile/android/nocard/views/o;
.super Lcom/unionpay/mobile/android/nocard/views/b;

# interfaces
.implements Lcom/unionpay/mobile/android/upviews/a$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/unionpay/mobile/android/nocard/views/o$b;,
        Lcom/unionpay/mobile/android/nocard/views/o$a;
    }
.end annotation


# instance fields
.field private A:I

.field private B:I

.field private C:Lcom/unionpay/mobile/android/upwidget/a;

.field private D:Lcom/unionpay/mobile/android/upviews/a;

.field private E:Lcom/unionpay/mobile/android/nocard/views/o$b;

.field private F:Ljava/lang/String;

.field private G:Landroid/view/View$OnClickListener;

.field private H:Landroid/view/View$OnClickListener;

.field private I:Z

.field r:Landroid/widget/LinearLayout;

.field private s:I

.field private t:Lcom/unionpay/mobile/android/upviews/a;

.field private u:Landroid/view/View$OnClickListener;

.field private v:Landroid/view/View$OnClickListener;

.field private w:Landroid/view/View$OnClickListener;

.field private x:Landroid/widget/TextView;

.field private y:I

.field private z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/unionpay/mobile/android/model/e;)V
    .locals 3

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2}, Lcom/unionpay/mobile/android/nocard/views/b;-><init>(Landroid/content/Context;Lcom/unionpay/mobile/android/model/e;)V

    iput v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    iput-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    iput-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->u:Landroid/view/View$OnClickListener;

    iput-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->v:Landroid/view/View$OnClickListener;

    iput-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->w:Landroid/view/View$OnClickListener;

    iput-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    iput-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->r:Landroid/widget/LinearLayout;

    iput v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->y:I

    iput v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->z:I

    const/16 v0, 0x14

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->A:I

    const/4 v0, 0x5

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->B:I

    iput-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->C:Lcom/unionpay/mobile/android/upwidget/a;

    iput-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    new-instance v0, Lcom/unionpay/mobile/android/nocard/views/p;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/nocard/views/p;-><init>(Lcom/unionpay/mobile/android/nocard/views/o;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->G:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/unionpay/mobile/android/nocard/views/u;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/nocard/views/u;-><init>(Lcom/unionpay/mobile/android/nocard/views/o;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->H:Landroid/view/View$OnClickListener;

    iput-boolean v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->I:Z

    const/16 v0, 0xd

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->f:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v0, v0, Lcom/unionpay/mobile/android/model/b;->K:Z

    if-eqz v0, :cond_2

    const-string v0, "loginpay_phoneNO_change"

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->q:Ljava/lang/String;

    :goto_0
    new-instance v0, Lcom/unionpay/mobile/android/nocard/views/v;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/nocard/views/v;-><init>(Lcom/unionpay/mobile/android/nocard/views/o;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->u:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/unionpay/mobile/android/nocard/views/w;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/nocard/views/w;-><init>(Lcom/unionpay/mobile/android/nocard/views/o;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->v:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/unionpay/mobile/android/nocard/views/x;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/nocard/views/x;-><init>(Lcom/unionpay/mobile/android/nocard/views/o;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->w:Landroid/view/View$OnClickListener;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->q()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->v()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v0, v0, Lcom/unionpay/mobile/android/model/b;->aZ:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->I:Z

    :cond_0
    const v0, -0x10100c

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->setBackgroundColor(I)V

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->e()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->aF:Lorg/json/JSONObject;

    if-eqz v0, :cond_1

    invoke-virtual {p0, v1}, Lcom/unionpay/mobile/android/nocard/views/o;->c(Lorg/json/JSONObject;)V

    :cond_1
    return-void

    :cond_2
    const-string v0, "loginpay"

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->q:Ljava/lang/String;

    goto :goto_0
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/nocard/views/o;)I
    .locals 1

    const/4 v0, 0x5

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->B:I

    return v0
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/nocard/views/o;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->F:Ljava/lang/String;

    return-object p1
.end method

.method private a(Landroid/widget/LinearLayout;)V
    .locals 4

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v0, Lcom/unionpay/mobile/android/model/b;->ac:Lorg/json/JSONArray;

    if-nez v2, :cond_1

    :cond_0
    return-void

    :cond_1
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v1, v0, :cond_0

    invoke-static {v2, v1}, Lcom/unionpay/mobile/android/utils/i;->b(Lorg/json/JSONArray;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/o;->q:Ljava/lang/String;

    invoke-virtual {p0, v0, v3}, Lcom/unionpay/mobile/android/nocard/views/o;->a(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/nocard/views/o;I)V
    .locals 7

    const/4 v6, 0x0

    const/4 v5, 0x1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->ab:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->ab:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iput-boolean v5, v0, Lcom/unionpay/mobile/android/model/b;->aZ:Z

    iput-boolean v5, p0, Lcom/unionpay/mobile/android/nocard/views/o;->I:Z

    const/16 v0, 0xd

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->d(I)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    const-string v1, "loginpay_choose_bankcard"

    sget-object v2, Lcom/unionpay/mobile/android/utils/o;->f:[Ljava/lang/String;

    new-array v3, v5, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v0, v1, v2, v3}, Lcom/unionpay/mobile/android/nocard/views/o;->a(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/Object;)V

    iput-boolean v6, p0, Lcom/unionpay/mobile/android/nocard/views/o;->I:Z

    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->y:I

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->z:I

    iput p1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->y:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->ab:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/model/c;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/model/c;->a()Ljava/lang/String;

    move-result-object v0

    iput-boolean v6, p0, Lcom/unionpay/mobile/android/nocard/views/o;->j:Z

    iput v5, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v2, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v2, v2, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    const-string v2, "1"

    const-string v3, "1"

    const-string v4, "2"

    invoke-static {v2, v0, v3, v4}, Lcom/unionpay/mobile/android/nocard/views/bh;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->j(Ljava/lang/String;)V

    goto :goto_0
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/nocard/views/o;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const/16 v0, 0x8

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    invoke-virtual {v0, p1, p2}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic b(Lcom/unionpay/mobile/android/nocard/views/o;)Lcom/unionpay/mobile/android/upviews/a;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    return-object v0
.end method

.method static synthetic b(Lcom/unionpay/mobile/android/nocard/views/o;Ljava/lang/String;)V
    .locals 4

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->j:Z

    const/4 v0, 0x3

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    const-string v1, "1"

    const-string v2, "2"

    const-string v3, "yes"

    invoke-virtual {v0, v1, v2, v3, p1}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic b(Lcom/unionpay/mobile/android/nocard/views/o;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/unionpay/mobile/android/nocard/views/o;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic c(Lcom/unionpay/mobile/android/nocard/views/o;)Lcom/unionpay/mobile/android/upwidget/a;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->C:Lcom/unionpay/mobile/android/upwidget/a;

    return-object v0
.end method

.method static synthetic d(Lcom/unionpay/mobile/android/nocard/views/o;)Lcom/unionpay/mobile/android/upviews/a;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    return-object v0
.end method

.method private d(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    const/16 v0, 0x9

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    const-string v1, ""

    invoke-virtual {v0, p1, v1}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->B:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->B:I

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

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    const/16 v2, 0xa

    invoke-virtual {v1, p1, v0, v2}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->a(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method private d(Lorg/json/JSONObject;)V
    .locals 8

    const/4 v4, 0x0

    const/4 v2, 0x5

    const/4 v7, 0x0

    const/4 v3, 0x1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    invoke-static {v0, p1, v7}, Lcom/unionpay/mobile/android/nocard/utils/f;->a(Lcom/unionpay/mobile/android/model/b;Lorg/json/JSONObject;Z)I

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->b(I)V

    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    if-ne v3, v0, :cond_0

    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->z:I

    invoke-direct {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->f(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-static {p1}, Lcom/unionpay/mobile/android/nocard/utils/f;->a(Lorg/json/JSONObject;)Lcom/unionpay/mobile/android/model/e;

    move-result-object v0

    iget v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    if-ne v2, v1, :cond_3

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->z:Lorg/json/JSONArray;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->z:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_2

    const/4 v1, 0x6

    invoke-virtual {p0, v1, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->a(ILcom/unionpay/mobile/android/model/e;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->D:Lorg/json/JSONArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->D:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0, v2}, Lcom/unionpay/mobile/android/nocard/views/o;->d(I)V

    goto :goto_0

    :cond_3
    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->p:Lcom/unionpay/mobile/android/model/e;

    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->y:I

    invoke-direct {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->f(I)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    invoke-direct {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->u()Lorg/json/JSONArray;

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->aq:Ljava/lang/String;

    iget-object v5, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v5, v5, Lcom/unionpay/mobile/android/model/b;->ad:Lorg/json/JSONArray;

    iget-object v6, p0, Lcom/unionpay/mobile/android/nocard/views/o;->q:Ljava/lang/String;

    invoke-virtual/range {v0 .. v6}, Lcom/unionpay/mobile/android/upviews/a;->a(Lorg/json/JSONArray;Ljava/lang/String;ZLcom/unionpay/mobile/android/widgets/z;Lorg/json/JSONArray;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->G:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->a(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->H:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->b(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->b:Lcom/unionpay/mobile/android/widgets/m;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->aU:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/mobile/android/upviews/a;->a(Lcom/unionpay/mobile/android/widgets/m;Lorg/json/JSONObject;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->bs:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->d(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    const-string v1, "instalment"

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v4

    :cond_4
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->z:Lorg/json/JSONArray;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->aq:Ljava/lang/String;

    iget-object v5, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v5, v5, Lcom/unionpay/mobile/android/model/b;->ad:Lorg/json/JSONArray;

    iget-object v6, p0, Lcom/unionpay/mobile/android/nocard/views/o;->q:Ljava/lang/String;

    invoke-virtual/range {v0 .. v6}, Lcom/unionpay/mobile/android/upviews/a;->a(Lorg/json/JSONArray;Ljava/lang/String;ZLcom/unionpay/mobile/android/widgets/z;Lorg/json/JSONArray;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upviews/a;->e()Z

    move-result v1

    if-eqz v1, :cond_6

    :cond_5
    :goto_1
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    goto/16 :goto_0

    :cond_6
    move v3, v7

    goto :goto_1
.end method

.method static synthetic e(Lcom/unionpay/mobile/android/nocard/views/o;)V
    .locals 3

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->b()Lcom/unionpay/mobile/android/upviews/a$a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a$a;->a()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v0, v0, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->a(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->j:Z

    const/4 v1, 0x5

    iput v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v2, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v2, v2, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    const-string v2, "bindcardrules"

    iget-object v0, v0, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private f(I)V
    .locals 2

    iput p1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->y:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->E:Lcom/unionpay/mobile/android/nocard/views/o$b;

    iget v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->y:I

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/o$b;->a(I)V

    return-void
.end method

.method private u()Lorg/json/JSONArray;
    .locals 4

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->p:Lcom/unionpay/mobile/android/model/e;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->p:Lcom/unionpay/mobile/android/model/e;

    check-cast v0, Lcom/unionpay/mobile/android/model/f;

    const-string v2, "promotion"

    invoke-virtual {v0, v2}, Lcom/unionpay/mobile/android/model/f;->a(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string v2, "instalment"

    invoke-virtual {v0, v2}, Lcom/unionpay/mobile/android/model/f;->a(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v3, "promotion_instalment_msgbox"

    invoke-virtual {v0, v3}, Lcom/unionpay/mobile/android/model/f;->a(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    iput-object v0, v2, Lcom/unionpay/mobile/android/model/b;->aU:Lorg/json/JSONObject;

    :cond_0
    return-object v1
.end method

.method private final v()Z
    .locals 2

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v1, v1, Lcom/unionpay/mobile/android/model/b;->aZ:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->ab:Ljava/util/List;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->ab:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private w()V
    .locals 4

    const/4 v0, 0x4

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->A:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    const-string v1, "query"

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->aj:Ljava/lang/String;

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->a(Ljava/lang/String;Ljava/lang/String;I)V

    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->A:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->A:I

    return-void
.end method


# virtual methods
.method public final a(Lcom/unionpay/mobile/android/upviews/a$a;)V
    .locals 3

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->d()Z

    invoke-virtual {p1}, Lcom/unionpay/mobile/android/upviews/a$a;->a()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->a(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->j:Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    const-string v1, "sms"

    iget-object v2, p1, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x2

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    goto :goto_0
.end method

.method public final a(Lorg/json/JSONObject;)V
    .locals 8

    const/4 v3, 0x6

    const/4 v5, 0x2

    const/4 v2, 0x5

    const/4 v7, 0x1

    const/4 v6, 0x0

    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->j()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    sget v1, Lcom/unionpay/mobile/android/global/b;->p:I

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->a(I)V

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->j()V

    invoke-virtual {p0, p1}, Lcom/unionpay/mobile/android/nocard/views/o;->b(Lorg/json/JSONObject;)Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    if-ne v0, v2, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iput-boolean v7, v0, Lcom/unionpay/mobile/android/model/b;->L:Z

    :cond_1
    invoke-direct {p0, p1}, Lcom/unionpay/mobile/android/nocard/views/o;->d(Lorg/json/JSONObject;)V

    goto :goto_0

    :pswitch_3
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->j()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    invoke-static {v0, p1, v7}, Lcom/unionpay/mobile/android/nocard/utils/f;->a(Lcom/unionpay/mobile/android/model/b;Lorg/json/JSONObject;Z)I

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->b(I)V

    :cond_2
    :goto_1
    iput v6, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iput-boolean v7, v0, Lcom/unionpay/mobile/android/model/b;->K:Z

    invoke-static {p1}, Lcom/unionpay/mobile/android/nocard/utils/f;->a(Lorg/json/JSONObject;)Lcom/unionpay/mobile/android/model/e;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->z:Lorg/json/JSONArray;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->z:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_4

    invoke-virtual {p0, v3, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->a(ILcom/unionpay/mobile/android/model/e;)V

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->D:Lorg/json/JSONArray;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->D:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lez v0, :cond_2

    invoke-virtual {p0, v2}, Lcom/unionpay/mobile/android/nocard/views/o;->d(I)V

    goto :goto_1

    :pswitch_4
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

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

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    invoke-static {v0}, Lcom/unionpay/mobile/android/utils/c;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/unionpay/mobile/android/model/b;->n:Ljava/lang/String;

    :cond_5
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->aj:Ljava/lang/String;

    if-nez v0, :cond_6

    invoke-virtual {p0, v5}, Lcom/unionpay/mobile/android/nocard/views/o;->b(I)V

    goto/16 :goto_0

    :cond_6
    const/16 v0, 0x14

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->A:I

    invoke-direct {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->w()V

    goto/16 :goto_0

    :pswitch_5
    const-string v0, "status"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->A:I

    if-lez v1, :cond_7

    const-string v1, "01"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-direct {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->w()V

    goto/16 :goto_0

    :cond_7
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->j()V

    const-string v1, "00"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    iput v6, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "result"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->d(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->H:Lorg/json/JSONArray;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "openupgrade_flag"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->P:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "temporary_pay_flag"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->Q:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "temporary_pay_info"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->R:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "front_url"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->V:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "front_request"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->W:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "title"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->A:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "succ_info"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->B:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/nocard/utils/b;->a(Lorg/json/JSONObject;Lcom/unionpay/mobile/android/model/b;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/nocard/utils/b;->b(Lorg/json/JSONObject;Lcom/unionpay/mobile/android/model/b;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->q:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_succeed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/o;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v0, v0, Lcom/unionpay/mobile/android/model/b;->f:Z

    if-eqz v0, :cond_8

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget v1, v1, Lcom/unionpay/mobile/android/model/b;->aQ:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/unionpay/mobile/android/utils/PreferenceUtils;->c(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    const-string v1, "success"

    iput-object v1, v0, Lcom/unionpay/mobile/android/plugin/c;->f:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->k()V

    goto/16 :goto_0

    :cond_8
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->d(I)V

    goto/16 :goto_0

    :cond_9
    const-string v1, "03"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    const-string v1, "fail_msg"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/o;->q:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_fail"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/unionpay/mobile/android/utils/o;->j:[Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/String;

    aput-object v0, v5, v6

    aput-object v1, v5, v7

    invoke-static {v2, v3, v4, v5}, Lcom/unionpay/mobile/android/nocard/views/o;->a(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_a
    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->A:I

    if-gtz v0, :cond_0

    const/16 v0, 0x13

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->b(I)V

    goto/16 :goto_0

    :pswitch_6
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->j()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    invoke-static {v0, p1, v6}, Lcom/unionpay/mobile/android/nocard/utils/f;->a(Lcom/unionpay/mobile/android/model/b;Lorg/json/JSONObject;Z)I

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->b(I)V

    goto/16 :goto_0

    :cond_b
    invoke-static {p1}, Lcom/unionpay/mobile/android/nocard/utils/f;->a(Lorg/json/JSONObject;)Lcom/unionpay/mobile/android/model/e;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->z:Lorg/json/JSONArray;

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->z:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_c

    invoke-virtual {p0, v3, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->a(ILcom/unionpay/mobile/android/model/e;)V

    goto/16 :goto_0

    :cond_c
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->D:Lorg/json/JSONArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->D:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0, v2}, Lcom/unionpay/mobile/android/nocard/views/o;->d(I)V

    goto/16 :goto_0

    :pswitch_7
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->j()V

    const-string v0, "options"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->d(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v1, v0}, Lcom/unionpay/mobile/android/upviews/a;->a(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    :pswitch_8
    const-string v0, "status"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_e

    const-string v1, "01"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const-string v0, "uuid"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->B:I

    if-ltz v1, :cond_d

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->F:Ljava/lang/String;

    invoke-direct {p0, v1, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_d
    sget-object v0, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v0, v0, Lcom/unionpay/mobile/android/languages/c;->D:Ljava/lang/String;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Lcom/unionpay/mobile/android/upviews/a;->a(Lorg/json/JSONArray;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_e
    const-string v0, "options"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->d(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const-string v1, "empty_info"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v2, v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->a(Lorg/json/JSONArray;Ljava/lang/String;)V

    goto/16 :goto_0

    :pswitch_9
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->b:Lcom/unionpay/mobile/android/widgets/m;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/m;->a()Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->b:Lcom/unionpay/mobile/android/widgets/m;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/m;->c()V

    :cond_f
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v0, "instalment_empty_info"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_10

    :goto_2
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v0, p1}, Lcom/unionpay/mobile/android/upviews/a;->a(Lorg/json/JSONObject;)V

    iput v6, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    goto/16 :goto_0

    :cond_10
    const-string v0, "instalment"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->c(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    goto :goto_2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_5
        :pswitch_2
        :pswitch_3
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_9
    .end packed-switch
.end method

.method public final a(Z)V
    .locals 2

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected final a(Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 2

    const/4 v0, 0x1

    iget v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    if-ne v1, v0, :cond_0

    iget v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->z:I

    invoke-direct {p0, v1}, Lcom/unionpay/mobile/android/nocard/views/o;->f(I)V

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->j()V

    invoke-virtual {p0, p1}, Lcom/unionpay/mobile/android/nocard/views/o;->a(Ljava/lang/String;)V

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected final b()V
    .locals 8

    const/4 v7, -0x1

    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v0, -0x2

    invoke-direct {v6, v7, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    sget-object v0, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v2, v0, Lcom/unionpay/mobile/android/languages/c;->o:Ljava/lang/String;

    new-instance v0, Lcom/unionpay/mobile/android/widgets/ay;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    invoke-direct {v0, v1, v2, p0}, Lcom/unionpay/mobile/android/widgets/ay;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/unionpay/mobile/android/widgets/ay$a;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v1, v1, Lcom/unionpay/mobile/android/model/b;->aC:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->q:Ljava/util/List;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->q:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v1, v1, Lcom/unionpay/mobile/android/model/b;->aZ:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->u:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v0, Lcom/unionpay/mobile/android/widgets/ay;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/o;->c:Lcom/unionpay/mobile/android/resource/c;

    const/16 v4, 0x406

    invoke-virtual {v3, v4}, Lcom/unionpay/mobile/android/resource/c;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    const/high16 v5, 0x41a00000    # 20.0f

    invoke-static {v4, v5}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v4

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Lcom/unionpay/mobile/android/widgets/ay;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/drawable/Drawable;ILcom/unionpay/mobile/android/widgets/ay$a;)V

    :cond_1
    const/16 v1, 0xd

    invoke-virtual {v6, v1, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->k:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final b(I)V
    .locals 3

    const/4 v2, 0x0

    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    const/16 v1, 0x10

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->b:Lcom/unionpay/mobile/android/widgets/m;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->b:Lcom/unionpay/mobile/android/widgets/m;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/m;->c()V

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    const-string v1, "instalment"

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v1

    if-eqz v1, :cond_1

    move-object v0, v1

    check-cast v0, Lcom/unionpay/mobile/android/widgets/p;

    invoke-virtual {v0, v2}, Lcom/unionpay/mobile/android/widgets/p;->a(Z)V

    check-cast v1, Lcom/unionpay/mobile/android/widgets/p;

    invoke-virtual {v1, v2}, Lcom/unionpay/mobile/android/widgets/p;->b(Z)V

    :cond_1
    invoke-super {p0, p1}, Lcom/unionpay/mobile/android/nocard/views/b;->b(I)V

    return-void
.end method

.method protected final b(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 2

    const-string v0, "init"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->a(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/unionpay/mobile/android/model/b;->L:Z

    :cond_2
    if-eqz p2, :cond_0

    invoke-direct {p0, p2}, Lcom/unionpay/mobile/android/nocard/views/o;->d(Lorg/json/JSONObject;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->j:Z

    const/4 v0, 0x7

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    const-string v1, ""

    invoke-virtual {v0, p1, v1}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected final c()V
    .locals 15

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->m:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->removeAllViews()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->o:Lcom/unionpay/mobile/android/upwidget/UPScrollView;

    invoke-virtual {v0, p0}, Lcom/unionpay/mobile/android/upwidget/UPScrollView;->a(Lcom/unionpay/mobile/android/upwidget/UPScrollView$a;)V

    new-instance v13, Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    invoke-direct {v13, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {v13, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    sget v1, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    const/16 v1, 0xa

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->m:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v13, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-direct {p0, v13}, Lcom/unionpay/mobile/android/nocard/views/o;->a(Landroid/widget/LinearLayout;)V

    invoke-direct {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->u()Lorg/json/JSONArray;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_0

    invoke-direct {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->v()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/unionpay/mobile/android/upviews/a;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/o;->q:Ljava/lang/String;

    invoke-direct {v1, v2, v0, p0, v3}, Lcom/unionpay/mobile/android/upviews/a;-><init>(Landroid/content/Context;Lorg/json/JSONArray;Lcom/unionpay/mobile/android/upviews/a$b;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->G:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->a(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->H:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->b(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->b:Lcom/unionpay/mobile/android/widgets/m;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->aU:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/mobile/android/upviews/a;->a(Lcom/unionpay/mobile/android/widgets/m;Lorg/json/JSONObject;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->bs:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->d(Ljava/lang/String;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    sget v1, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v13, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->q()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-direct {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->v()Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->ae:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    sget v1, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/unionpay/mobile/android/global/b;->k:F

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->ae:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v13, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    :goto_0
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setId(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    sget v2, Lcom/unionpay/mobile/android/global/a;->d:I

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v13, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->Z:Lorg/json/JSONObject;

    if-eqz v1, :cond_2

    invoke-direct {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->v()Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Lcom/unionpay/mobile/android/upwidget/a;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v3, v3, Lcom/unionpay/mobile/android/model/b;->Z:Lorg/json/JSONObject;

    sget-object v4, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v4, v4, Lcom/unionpay/mobile/android/languages/c;->s:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/unionpay/mobile/android/nocard/views/xlistview/a;->a(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    new-instance v4, Lcom/unionpay/mobile/android/nocard/views/q;

    invoke-direct {v4, p0}, Lcom/unionpay/mobile/android/nocard/views/q;-><init>(Lcom/unionpay/mobile/android/nocard/views/o;)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/unionpay/mobile/android/nocard/views/o;->q:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "_agree_user_protocol"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/unionpay/mobile/android/upwidget/a;-><init>(Landroid/content/Context;Lorg/json/JSONObject;Landroid/view/View$OnClickListener;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->C:Lcom/unionpay/mobile/android/upwidget/a;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->C:Lcom/unionpay/mobile/android/upwidget/a;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_2
    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->aa:Lorg/json/JSONObject;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/o;->c:Lcom/unionpay/mobile/android/resource/c;

    const/16 v4, 0x3f9

    invoke-virtual {v3, v4}, Lcom/unionpay/mobile/android/resource/c;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/unionpay/mobile/android/upwidget/w;->a(Landroid/content/Context;Lorg/json/JSONObject;Landroid/graphics/drawable/Drawable;)Lcom/unionpay/mobile/android/upwidget/w;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upwidget/w;->a()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/unionpay/mobile/android/nocard/views/r;

    invoke-direct {v3, p0, v2}, Lcom/unionpay/mobile/android/nocard/views/r;-><init>(Lcom/unionpay/mobile/android/nocard/views/o;Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Lcom/unionpay/mobile/android/upwidget/w;->a(Landroid/view/View$OnClickListener;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    sget v3, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_3
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->v()Z

    move-result v0

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->p:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->u:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->e()Z

    move-result v0

    if-eqz v0, :cond_b

    :cond_4
    const/4 v0, 0x1

    :goto_1
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    :goto_2
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    sget v1, Lcom/unionpay/mobile/android/global/b;->i:F

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    invoke-static {}, Lcom/unionpay/mobile/android/nocard/views/o;->p()Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    sget v0, Lcom/unionpay/mobile/android/global/a;->n:I

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->c:Lcom/unionpay/mobile/android/resource/c;

    const/16 v2, 0x7d8

    invoke-virtual {v1, v2}, Lcom/unionpay/mobile/android/resource/c;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    sget v0, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v0, v2}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v0

    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    invoke-virtual {v13, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    :cond_5
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const v1, -0x342f27

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    sget v2, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v13, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {v14, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    new-instance v0, Lcom/unionpay/mobile/android/nocard/views/o$b;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    new-instance v3, Lcom/unionpay/mobile/android/nocard/views/z;

    invoke-direct {v3, p0}, Lcom/unionpay/mobile/android/nocard/views/z;-><init>(Lcom/unionpay/mobile/android/nocard/views/o;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v4, v4, Lcom/unionpay/mobile/android/model/b;->ab:Ljava/util/List;

    const/4 v5, 0x0

    invoke-static {v1, v4, v5}, Lcom/unionpay/mobile/android/nocard/views/xlistview/a;->a(Landroid/content/Context;Ljava/util/List;Z)Ljava/util/List;

    move-result-object v4

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v5, v1, Lcom/unionpay/mobile/android/languages/c;->bh:Ljava/lang/String;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v6, v1, Lcom/unionpay/mobile/android/model/b;->aY:Ljava/lang/String;

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/unionpay/mobile/android/nocard/views/o$b;-><init>(Lcom/unionpay/mobile/android/nocard/views/o;Landroid/content/Context;Lcom/unionpay/mobile/android/nocard/views/o$a;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->E:Lcom/unionpay/mobile/android/nocard/views/o$b;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->E:Lcom/unionpay/mobile/android/nocard/views/o$b;

    invoke-virtual {v13, v0, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v10, 0x0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    const-string v1, "instalment"

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v10

    :cond_6
    new-instance v1, Lcom/unionpay/mobile/android/upviews/a;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v3, v0, Lcom/unionpay/mobile/android/model/b;->z:Lorg/json/JSONArray;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c()J

    move-result-wide v4

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v7, v0, Lcom/unionpay/mobile/android/model/b;->aq:Ljava/lang/String;

    const/4 v8, 0x1

    const/4 v9, 0x1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v11, v0, Lcom/unionpay/mobile/android/model/b;->ad:Lorg/json/JSONArray;

    iget-object v12, p0, Lcom/unionpay/mobile/android/nocard/views/o;->q:Ljava/lang/String;

    move-object v6, p0

    invoke-direct/range {v1 .. v12}, Lcom/unionpay/mobile/android/upviews/a;-><init>(Landroid/content/Context;Lorg/json/JSONArray;JLcom/unionpay/mobile/android/upviews/a$b;Ljava/lang/String;ZZLcom/unionpay/mobile/android/widgets/z;Lorg/json/JSONArray;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v13, v0, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_0

    :cond_7
    invoke-direct {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->v()Z

    move-result v0

    if-nez v0, :cond_9

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->aY:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_8

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    sget v1, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/unionpay/mobile/android/global/b;->k:F

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->ae:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v13, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_0

    :cond_8
    new-instance v0, Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/unionpay/mobile/android/global/b;->k:F

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    const v2, -0xcccccd

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    sget-object v2, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v2, v2, Lcom/unionpay/mobile/android/languages/c;->bA:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x9

    const/4 v4, -0x1

    invoke-virtual {v2, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v3, 0xf

    const/4 v4, -0x1

    invoke-virtual {v2, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    const/high16 v4, 0x41200000    # 10.0f

    invoke-static {v3, v4}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v3

    iput v3, v2, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget-object v2, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v2, v2, Lcom/unionpay/mobile/android/languages/c;->j:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget v2, Lcom/unionpay/mobile/android/global/b;->k:F

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    const v2, -0xa35c26

    const v3, -0x593503

    const v4, -0x593503

    const v5, -0x666667

    invoke-static {v2, v3, v4, v5}, Lcom/unionpay/mobile/android/utils/g;->a(IIII)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    new-instance v2, Lcom/unionpay/mobile/android/nocard/views/y;

    invoke-direct {v2, p0}, Lcom/unionpay/mobile/android/nocard/views/y;-><init>(Lcom/unionpay/mobile/android/nocard/views/o;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0xb

    const/4 v4, -0x1

    invoke-virtual {v2, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    const/high16 v4, 0x41200000    # 10.0f

    invoke-static {v3, v4}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v3

    iput v3, v2, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    const/16 v3, 0xf

    const/4 v4, -0x1

    invoke-virtual {v2, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    sget v2, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v13, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Lcom/unionpay/mobile/android/upviews/a;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->t:Lorg/json/JSONArray;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/o;->q:Ljava/lang/String;

    invoke-direct {v0, v1, v2, p0, v3}, Lcom/unionpay/mobile/android/upviews/a;-><init>(Landroid/content/Context;Lorg/json/JSONArray;Lcom/unionpay/mobile/android/upviews/a$b;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    sget v1, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v13, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_0

    :cond_9
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const v1, -0x342f27

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v13, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {v7, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    new-instance v0, Lcom/unionpay/mobile/android/nocard/views/o$b;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    new-instance v3, Lcom/unionpay/mobile/android/nocard/views/aa;

    invoke-direct {v3, p0}, Lcom/unionpay/mobile/android/nocard/views/aa;-><init>(Lcom/unionpay/mobile/android/nocard/views/o;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v4, v4, Lcom/unionpay/mobile/android/model/b;->ab:Ljava/util/List;

    const/4 v5, 0x0

    invoke-static {v1, v4, v5}, Lcom/unionpay/mobile/android/nocard/views/xlistview/a;->a(Landroid/content/Context;Ljava/util/List;Z)Ljava/util/List;

    move-result-object v4

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v5, v1, Lcom/unionpay/mobile/android/languages/c;->bh:Ljava/lang/String;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v6, v1, Lcom/unionpay/mobile/android/model/b;->aY:Ljava/lang/String;

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/unionpay/mobile/android/nocard/views/o$b;-><init>(Lcom/unionpay/mobile/android/nocard/views/o;Landroid/content/Context;Lcom/unionpay/mobile/android/nocard/views/o$a;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->E:Lcom/unionpay/mobile/android/nocard/views/o$b;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->E:Lcom/unionpay/mobile/android/nocard/views/o$b;

    invoke-virtual {v13, v0, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v10, 0x0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    const-string v1, "instalment"

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v10

    :cond_a
    new-instance v1, Lcom/unionpay/mobile/android/upviews/a;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v3, v0, Lcom/unionpay/mobile/android/model/b;->z:Lorg/json/JSONArray;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c()J

    move-result-wide v4

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v7, v0, Lcom/unionpay/mobile/android/model/b;->aq:Ljava/lang/String;

    const/4 v8, 0x1

    const/4 v9, 0x1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v11, v0, Lcom/unionpay/mobile/android/model/b;->ad:Lorg/json/JSONArray;

    iget-object v12, p0, Lcom/unionpay/mobile/android/nocard/views/o;->q:Ljava/lang/String;

    move-object v6, p0

    invoke-direct/range {v1 .. v12}, Lcom/unionpay/mobile/android/upviews/a;-><init>(Landroid/content/Context;Lorg/json/JSONArray;JLcom/unionpay/mobile/android/upviews/a$b;Ljava/lang/String;ZZLcom/unionpay/mobile/android/widgets/z;Lorg/json/JSONArray;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v13, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_0

    :cond_b
    const/4 v0, 0x0

    goto/16 :goto_1

    :cond_c
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->q()Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->q:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    new-instance v1, Lcom/unionpay/mobile/android/nocard/views/ab;

    invoke-direct {v1, p0}, Lcom/unionpay/mobile/android/nocard/views/ab;-><init>(Lcom/unionpay/mobile/android/nocard/views/o;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    goto/16 :goto_2

    :cond_d
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->aY:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v0, v0, Lcom/unionpay/mobile/android/model/b;->aZ:Z

    if-nez v0, :cond_10

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->q:Ljava/util/List;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->q:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_f

    :cond_e
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->bu:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_3
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->w:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    goto/16 :goto_2

    :cond_f
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->bv:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3

    :cond_10
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->r:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->v:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->x:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    goto/16 :goto_2
.end method

.method public final c(Ljava/lang/String;)V
    .locals 4

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->j:Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v0, v0, Lcom/unionpay/mobile/android/model/b;->aZ:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\"card\":\""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->aq:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    const-string v1, "uppay"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "cmd:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", ele:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    invoke-virtual {v1, p1, v0}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x6

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    return-void

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v0, "\"card\":\""

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->ab:Ljava/util/List;

    iget v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->y:I

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/model/c;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/model/c;->a()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public final c(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/unionpay/mobile/android/nocard/views/o;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final l()V
    .locals 5

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->u:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v0, v0, Lcom/unionpay/mobile/android/model/b;->aC:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->q:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->q:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_2

    :cond_0
    new-instance v0, Lcom/unionpay/mobile/android/nocard/views/s;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/nocard/views/s;-><init>(Lcom/unionpay/mobile/android/nocard/views/o;)V

    new-instance v1, Lcom/unionpay/mobile/android/nocard/views/t;

    invoke-direct {v1, p0}, Lcom/unionpay/mobile/android/nocard/views/t;-><init>(Lcom/unionpay/mobile/android/nocard/views/o;)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/o;->b:Lcom/unionpay/mobile/android/widgets/m;

    invoke-virtual {v2, v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->Y:Ljava/lang/String;

    sget-object v2, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v2, v2, Lcom/unionpay/mobile/android/languages/c;->av:Ljava/lang/String;

    sget-object v3, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/languages/c;->W:Ljava/lang/String;

    sget-object v4, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v4, v4, Lcom/unionpay/mobile/android/languages/c;->X:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v0, v0, Lcom/unionpay/mobile/android/model/b;->aZ:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/unionpay/mobile/android/model/b;->aZ:Z

    :cond_3
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->t:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->d()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_4
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->u:Ljava/lang/String;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->u:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_5

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/o;->a(I)V

    goto :goto_0

    :cond_5
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/o;->n()V

    goto :goto_0
.end method

.method protected final onAttachedToWindow()V
    .locals 1

    invoke-super {p0}, Lcom/unionpay/mobile/android/nocard/views/b;->onAttachedToWindow()V

    iget-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->I:Z

    return-void
.end method

.method public final t()V
    .locals 5

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->D:Lcom/unionpay/mobile/android/upviews/a;

    const-string v1, "promotion"

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->c(Ljava/lang/String;)Lcom/unionpay/mobile/android/widgets/z;

    move-result-object v0

    const-string v1, "\"\""

    if-eqz v0, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    check-cast v0, Lcom/unionpay/mobile/android/widgets/aj;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/aj;->g()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/o;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    const-string v2, "instalment"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\"promotion\":"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0x10

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/o;->s:I

    return-void

    :cond_0
    move-object v0, v1

    goto :goto_0
.end method
