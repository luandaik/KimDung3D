.class public final Lcom/unionpay/mobile/android/nocard/views/g;
.super Lcom/unionpay/mobile/android/nocard/views/b;

# interfaces
.implements Lcom/unionpay/mobile/android/upviews/a$b;


# instance fields
.field private r:I

.field private s:I

.field private t:Lcom/unionpay/mobile/android/upwidget/a;

.field private u:Landroid/widget/TextView;

.field private v:Lcom/unionpay/mobile/android/upviews/a;

.field private w:Z

.field private x:Z

.field private y:Landroid/view/View$OnClickListener;

.field private z:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v3, 0x0

    invoke-direct {p0, p1}, Lcom/unionpay/mobile/android/nocard/views/b;-><init>(Landroid/content/Context;)V

    const/16 v2, 0x14

    iput v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->r:I

    const/16 v2, 0x64

    iput v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->s:I

    iput-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/g;->t:Lcom/unionpay/mobile/android/upwidget/a;

    iput-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/g;->u:Landroid/widget/TextView;

    iput-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/g;->v:Lcom/unionpay/mobile/android/upviews/a;

    iput-boolean v1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->w:Z

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->x:Z

    new-instance v2, Lcom/unionpay/mobile/android/nocard/views/h;

    invoke-direct {v2, p0}, Lcom/unionpay/mobile/android/nocard/views/h;-><init>(Lcom/unionpay/mobile/android/nocard/views/g;)V

    iput-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->y:Landroid/view/View$OnClickListener;

    new-instance v2, Lcom/unionpay/mobile/android/nocard/views/i;

    invoke-direct {v2, p0}, Lcom/unionpay/mobile/android/nocard/views/i;-><init>(Lcom/unionpay/mobile/android/nocard/views/g;)V

    iput-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->z:Landroid/view/View$OnClickListener;

    const/4 v2, 0x5

    iput v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->f:I

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v2, v2, Lcom/unionpay/mobile/android/model/b;->K:Z

    if-eqz v2, :cond_0

    const-string v2, "entrust_phoneNO_change"

    iput-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->q:Ljava/lang/String;

    :goto_0
    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v2, v2, Lcom/unionpay/mobile/android/model/b;->K:Z

    if-nez v2, :cond_1

    :goto_1
    iput-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->x:Z

    const v0, -0x10100c

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/g;->setBackgroundColor(I)V

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/g;->e()V

    return-void

    :cond_0
    const-string v2, "entrust"

    iput-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->q:Ljava/lang/String;

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_1
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/nocard/views/g;I)I
    .locals 0

    iput p1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->s:I

    return p1
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/nocard/views/g;)Lcom/unionpay/mobile/android/upviews/a;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->v:Lcom/unionpay/mobile/android/upviews/a;

    return-object v0
.end method

.method static synthetic b(Lcom/unionpay/mobile/android/nocard/views/g;)Lcom/unionpay/mobile/android/upwidget/a;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->t:Lcom/unionpay/mobile/android/upwidget/a;

    return-object v0
.end method

.method static synthetic c(Lcom/unionpay/mobile/android/nocard/views/g;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->w:Z

    return v0
.end method

.method static synthetic d(Lcom/unionpay/mobile/android/nocard/views/g;)V
    .locals 0

    invoke-direct {p0}, Lcom/unionpay/mobile/android/nocard/views/g;->u()V

    return-void
.end method

.method private d(Lorg/json/JSONObject;)V
    .locals 3

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/g;->j()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "rules"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->d(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->z:Lorg/json/JSONArray;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "title"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->A:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "followrules_button"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->c(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->C:Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "service_checkbox"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->c(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->al:Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "bind_card_checkbox"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->c(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->am:Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "pan"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->aq:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->z:Lorg/json/JSONArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->z:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-gtz v0, :cond_1

    :cond_0
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/g;->b(I)V

    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->v:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->v:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->f()V

    :cond_2
    invoke-static {p1}, Lcom/unionpay/mobile/android/nocard/utils/f;->a(Lorg/json/JSONObject;)Lcom/unionpay/mobile/android/model/e;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/unionpay/mobile/android/model/b;->K:Z

    const/4 v1, 0x6

    invoke-virtual {p0, v1, v0}, Lcom/unionpay/mobile/android/nocard/views/g;->a(ILcom/unionpay/mobile/android/model/e;)V

    goto :goto_0
.end method

.method private u()V
    .locals 3

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->v:Lcom/unionpay/mobile/android/upviews/a;

    const-string v2, "pan"

    invoke-virtual {v1, v2}, Lcom/unionpay/mobile/android/upviews/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->k(Ljava/lang/String;)V

    const/16 v0, 0x68

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->s:I

    return-void
.end method

.method private v()V
    .locals 4

    const/16 v0, 0x67

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->s:I

    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->r:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    const-string v1, "query"

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->aj:Ljava/lang/String;

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->a(Ljava/lang/String;Ljava/lang/String;I)V

    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->r:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->r:I

    return-void
.end method


# virtual methods
.method public final a(Lcom/unionpay/mobile/android/upviews/a$a;)V
    .locals 3

    invoke-virtual {p1}, Lcom/unionpay/mobile/android/upviews/a$a;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->j:Z

    const/16 v0, 0x65

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->s:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    const-string v0, "uppay"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "sms elements:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p1, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    const-string v1, "sms"

    iget-object v2, p1, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p1, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/g;->a(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final a(Lorg/json/JSONObject;)V
    .locals 8

    const/16 v3, 0x64

    const/4 v5, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/unionpay/mobile/android/nocard/views/g;->x:Z

    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->s:I

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->v:Lcom/unionpay/mobile/android/upviews/a;

    sget v1, Lcom/unionpay/mobile/android/global/b;->p:I

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/a;->a(I)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->b:Lcom/unionpay/mobile/android/widgets/m;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/m;->c()V

    iput v3, p0, Lcom/unionpay/mobile/android/nocard/views/g;->s:I

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/unionpay/mobile/android/utils/h;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->aj:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->aj:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->aj:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_2

    :cond_1
    invoke-virtual {p0, v5}, Lcom/unionpay/mobile/android/nocard/views/g;->b(I)V

    goto :goto_0

    :cond_2
    const/16 v0, 0x14

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->r:I

    invoke-direct {p0}, Lcom/unionpay/mobile/android/nocard/views/g;->v()V

    goto :goto_0

    :pswitch_2
    const-string v0, "status"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "fail_msg"

    invoke-static {p1, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->r:I

    if-lez v2, :cond_3

    const-string v2, "01"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-direct {p0}, Lcom/unionpay/mobile/android/nocard/views/g;->v()V

    goto :goto_0

    :cond_3
    iput v3, p0, Lcom/unionpay/mobile/android/nocard/views/g;->s:I

    const-string v2, "00"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    iput-boolean v7, p0, Lcom/unionpay/mobile/android/nocard/views/g;->w:Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->d:Landroid/content/Context;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->q:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_open_succeed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/g;->a(Landroid/content/Context;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/unionpay/mobile/android/nocard/views/g;->u()V

    goto :goto_0

    :cond_4
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/g;->j()V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->d:Landroid/content/Context;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/g;->q:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_open_fail"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/unionpay/mobile/android/utils/o;->j:[Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/String;

    aput-object v0, v5, v6

    aput-object v1, v5, v7

    invoke-static {v2, v3, v4, v5}, Lcom/unionpay/mobile/android/nocard/views/g;->a(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/Object;)V

    const-string v2, "03"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    new-instance v0, Lcom/unionpay/mobile/android/nocard/views/j;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/nocard/views/j;-><init>(Lcom/unionpay/mobile/android/nocard/views/g;)V

    new-instance v2, Lcom/unionpay/mobile/android/nocard/views/k;

    invoke-direct {v2, p0}, Lcom/unionpay/mobile/android/nocard/views/k;-><init>(Lcom/unionpay/mobile/android/nocard/views/g;)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v3, v3, Lcom/unionpay/mobile/android/model/b;->F:Z

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/g;->b:Lcom/unionpay/mobile/android/widgets/m;

    invoke-virtual {v3, v0, v2}, Lcom/unionpay/mobile/android/widgets/m;->a(Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v2, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v2, v2, Lcom/unionpay/mobile/android/languages/c;->ab:Ljava/lang/String;

    sget-object v3, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/languages/c;->ac:Ljava/lang/String;

    sget-object v4, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v4, v4, Lcom/unionpay/mobile/android/languages/c;->ad:Ljava/lang/String;

    invoke-virtual {v0, v2, v1, v3, v4}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_5
    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->b:Lcom/unionpay/mobile/android/widgets/m;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Lcom/unionpay/mobile/android/widgets/m;->a(Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v2, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v2, v2, Lcom/unionpay/mobile/android/languages/c;->ab:Ljava/lang/String;

    sget-object v3, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/languages/c;->ac:Ljava/lang/String;

    invoke-virtual {v0, v2, v1, v3}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_6
    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->r:I

    if-gtz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->ak:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/g;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    :pswitch_3
    invoke-virtual {p0, p1}, Lcom/unionpay/mobile/android/nocard/views/g;->b(Lorg/json/JSONObject;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/unionpay/mobile/android/nocard/views/g;->d(Lorg/json/JSONObject;)V

    goto/16 :goto_0

    :pswitch_4
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/g;->j()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    invoke-static {v0, p1, v6}, Lcom/unionpay/mobile/android/nocard/utils/f;->a(Lcom/unionpay/mobile/android/model/b;Lorg/json/JSONObject;Z)I

    move-result v0

    if-eqz v0, :cond_7

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/g;->b(I)V

    goto/16 :goto_0

    :cond_7
    invoke-static {p1}, Lcom/unionpay/mobile/android/nocard/utils/f;->a(Lorg/json/JSONObject;)Lcom/unionpay/mobile/android/model/e;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->z:Lorg/json/JSONArray;

    if-eqz v1, :cond_8

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->z:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_8

    const/4 v1, 0x6

    invoke-virtual {p0, v1, v0}, Lcom/unionpay/mobile/android/nocard/views/g;->a(ILcom/unionpay/mobile/android/model/e;)V

    goto/16 :goto_0

    :cond_8
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->D:Lorg/json/JSONArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->D:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/g;->d(I)V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public final a(Z)V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->u:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->u:Landroid/widget/TextView;

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

.method protected final a(Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->x:Z

    return v0
.end method

.method protected final b()V
    .locals 5

    const/4 v4, -0x1

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v4, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    new-instance v1, Lcom/unionpay/mobile/android/widgets/ay;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/g;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v3, v3, Lcom/unionpay/mobile/android/model/b;->A:Ljava/lang/String;

    invoke-direct {v1, v2, v3, p0}, Lcom/unionpay/mobile/android/widgets/ay;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/unionpay/mobile/android/widgets/ay$a;)V

    const/16 v2, 0xd

    invoke-virtual {v0, v2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->k:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v1, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method protected final b(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 2

    const-string v0, "init"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/g;->a(I)V

    :goto_0
    return-void

    :cond_0
    const-string v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0, p2}, Lcom/unionpay/mobile/android/nocard/views/g;->d(Lorg/json/JSONObject;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->j:Z

    const/16 v0, 0x69

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->s:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    const-string v1, ""

    invoke-virtual {v0, p1, v1}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected final c()V
    .locals 15

    const/4 v14, 0x3

    const/4 v0, 0x0

    const/4 v8, 0x1

    const/4 v13, -0x2

    const/4 v12, -0x1

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->o:Lcom/unionpay/mobile/android/upwidget/UPScrollView;

    invoke-virtual {v1, p0}, Lcom/unionpay/mobile/android/upwidget/UPScrollView;->a(Lcom/unionpay/mobile/android/upwidget/UPScrollView$a;)V

    new-instance v10, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->d:Landroid/content/Context;

    invoke-direct {v10, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v10, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v10}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v10, v1}, Landroid/widget/LinearLayout;->setId(I)V

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v12, v13}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    sget v11, Lcom/unionpay/mobile/android/global/a;->d:I

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->m:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v10, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Lcom/unionpay/mobile/android/upviews/a;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->d:Landroid/content/Context;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v3, v3, Lcom/unionpay/mobile/android/model/b;->D:Lorg/json/JSONArray;

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/g;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    invoke-virtual {v4}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c()J

    move-result-wide v4

    iget-object v6, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v7, v6, Lcom/unionpay/mobile/android/model/b;->aq:Ljava/lang/String;

    iget-object v9, p0, Lcom/unionpay/mobile/android/nocard/views/g;->q:Ljava/lang/String;

    move-object v6, p0

    invoke-direct/range {v1 .. v9}, Lcom/unionpay/mobile/android/upviews/a;-><init>(Landroid/content/Context;Lorg/json/JSONArray;JLcom/unionpay/mobile/android/upviews/a$b;Ljava/lang/String;ZLjava/lang/String;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->v:Lcom/unionpay/mobile/android/upviews/a;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v12, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    sget v2, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->v:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v10, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v12, v13}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput v11, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    sget v2, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v10}, Landroid/widget/LinearLayout;->getId()I

    move-result v2

    invoke-virtual {v1, v14, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/g;->d:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setId(I)V

    new-instance v3, Lcom/unionpay/mobile/android/upwidget/a;

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/g;->d:Landroid/content/Context;

    iget-object v5, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v5, v5, Lcom/unionpay/mobile/android/model/b;->al:Lorg/json/JSONObject;

    iget-object v6, p0, Lcom/unionpay/mobile/android/nocard/views/g;->z:Landroid/view/View$OnClickListener;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/unionpay/mobile/android/nocard/views/g;->q:Ljava/lang/String;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, "_agree_user_protocol"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/unionpay/mobile/android/upwidget/a;-><init>(Landroid/content/Context;Lorg/json/JSONObject;Landroid/view/View$OnClickListener;Ljava/lang/String;)V

    iput-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/g;->t:Lcom/unionpay/mobile/android/upwidget/a;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v13, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/g;->t:Lcom/unionpay/mobile/android/upwidget/a;

    invoke-virtual {v2, v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/g;->m:Landroid/widget/RelativeLayout;

    invoke-virtual {v3, v2, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/g;->d:Landroid/content/Context;

    invoke-direct {v1, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->u:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->u:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v3, v3, Lcom/unionpay/mobile/android/model/b;->C:Lorg/json/JSONObject;

    const-string v4, "label"

    invoke-static {v3, v4}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->u:Landroid/widget/TextView;

    sget v3, Lcom/unionpay/mobile/android/global/b;->i:F

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->u:Landroid/widget/TextView;

    invoke-static {}, Lcom/unionpay/mobile/android/nocard/views/g;->p()Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->u:Landroid/widget/TextView;

    const/16 v3, 0x11

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setGravity(I)V

    sget v1, Lcom/unionpay/mobile/android/global/a;->n:I

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/g;->c:Lcom/unionpay/mobile/android/resource/c;

    const/16 v4, 0x7d8

    invoke-virtual {v3, v4}, Lcom/unionpay/mobile/android/resource/c;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/g;->u:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/g;->u:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/g;->y:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/g;->u:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/g;->v:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/g;->v:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v4}, Lcom/unionpay/mobile/android/upviews/a;->e()Z

    move-result v4

    if-eqz v4, :cond_1

    :cond_0
    :goto_0
    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setEnabled(Z)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v12, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    sget v1, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->d:Landroid/content/Context;

    const/high16 v3, 0x41200000    # 10.0f

    invoke-static {v1, v3}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v14, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->m:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/g;->u:Landroid/widget/TextView;

    invoke-virtual {v1, v2, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    :cond_1
    move v8, v0

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

.method public final l()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->v:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v0, v0, Lcom/unionpay/mobile/android/model/b;->L:Z

    if-eqz v0, :cond_1

    const/16 v0, 0xd

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/g;->a(I)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iput-boolean v1, v0, Lcom/unionpay/mobile/android/model/b;->L:Z

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v0, v0, Lcom/unionpay/mobile/android/model/b;->K:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->x:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iput-boolean v1, v0, Lcom/unionpay/mobile/android/model/b;->K:Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->G:Lorg/json/JSONObject;

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/utils/f;->a(Lcom/unionpay/mobile/android/model/b;Lorg/json/JSONObject;)I

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/g;->n()V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iput-boolean v1, v0, Lcom/unionpay/mobile/android/model/b;->K:Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->G:Lorg/json/JSONObject;

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/g;->a(I)V

    goto :goto_0
.end method

.method public final t()V
    .locals 0

    return-void
.end method
