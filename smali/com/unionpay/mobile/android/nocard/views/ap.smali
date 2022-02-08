.class final Lcom/unionpay/mobile/android/nocard/views/ap;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/nocard/views/ao;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/nocard/views/ao;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/nocard/views/ap;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 9

    const/4 v5, 0x1

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ap;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget v0, v0, Lcom/unionpay/mobile/android/model/b;->aP:I

    sget-object v1, Lcom/unionpay/mobile/android/views/order/l;->e:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ap;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->r:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/ap;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v1, v1, Lcom/unionpay/mobile/android/nocard/views/ao;->r:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    sget-object v0, Lcom/unionpay/mobile/android/model/b;->bb:Ljava/util/List;

    if-eqz v0, :cond_3

    sget-object v0, Lcom/unionpay/mobile/android/model/b;->bb:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3

    sget-object v0, Lcom/unionpay/mobile/android/model/b;->bb:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    move v1, v4

    :goto_0
    if-ge v1, v2, :cond_1

    sget-object v0, Lcom/unionpay/mobile/android/model/b;->bb:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/model/d;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/ap;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/ao;->a(Lcom/unionpay/mobile/android/model/d;)Ljava/util/Map;

    move-result-object v3

    iget-object v6, p0, Lcom/unionpay/mobile/android/nocard/views/ap;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v6, v6, Lcom/unionpay/mobile/android/nocard/views/ao;->r:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-nez v1, :cond_0

    iget-object v6, p0, Lcom/unionpay/mobile/android/nocard/views/ap;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-static {v6}, Lcom/unionpay/mobile/android/nocard/views/ao;->a(Lcom/unionpay/mobile/android/nocard/views/ao;)Lcom/unionpay/mobile/android/views/order/o;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Lcom/unionpay/mobile/android/model/d;->b()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Lcom/unionpay/mobile/android/model/d;->c()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v7, " "

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v7, "text2"

    invoke-interface {v3, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Lcom/unionpay/mobile/android/views/order/o;->b(Ljava/lang/String;)V

    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ap;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/ao;->a(Lcom/unionpay/mobile/android/nocard/views/ao;)Lcom/unionpay/mobile/android/views/order/o;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/unionpay/mobile/android/views/order/o;->setVisibility(I)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ap;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/ao;->b(Lcom/unionpay/mobile/android/nocard/views/ao;)Landroid/widget/LinearLayout;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_2
    :goto_1
    return v5

    :cond_3
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ap;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/nocard/views/ao;->n()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ap;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    sget-object v1, Lcom/unionpay/mobile/android/views/order/l;->a:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, v0, Lcom/unionpay/mobile/android/model/b;->aP:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ap;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v0, v0, Lcom/unionpay/mobile/android/model/b;->aE:Z

    if-eqz v0, :cond_4

    move v4, v5

    :cond_4
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ap;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->bq:Ljava/lang/String;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/ap;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v2, v2, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->bg:Ljava/lang/String;

    sget v3, Lcom/unionpay/mobile/android/global/a;->t:I

    sget v6, Lcom/unionpay/mobile/android/global/a;->k:I

    sub-int/2addr v3, v6

    sget v6, Lcom/unionpay/mobile/android/global/a;->s:I

    mul-int/lit8 v6, v6, 0x3

    sub-int/2addr v3, v6

    invoke-virtual/range {v0 .. v5}, Lcom/unionpay/mobile/android/nocard/views/ao;->a(Ljava/lang/String;Ljava/lang/String;IZZ)V

    goto :goto_1
.end method
