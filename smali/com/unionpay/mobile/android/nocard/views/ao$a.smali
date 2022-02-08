.class public final Lcom/unionpay/mobile/android/nocard/views/ao$a;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unionpay/mobile/android/views/order/o$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unionpay/mobile/android/nocard/views/ao;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/nocard/views/ao;


# direct methods
.method public constructor <init>(Lcom/unionpay/mobile/android/nocard/views/ao;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()I
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/unionpay/mobile/android/model/b;->J:Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/ao;->d(I)V

    const/4 v0, 0x0

    return v0
.end method

.method public final a(I)I
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-static {v0, p1}, Lcom/unionpay/mobile/android/nocard/views/ao;->a(Lcom/unionpay/mobile/android/nocard/views/ao;I)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    const/4 v1, 0x3

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/ao;->b(Lcom/unionpay/mobile/android/nocard/views/ao;I)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iput-boolean v2, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->j:Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v1, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->q:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/model/c;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/model/c;->a()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->m(Ljava/lang/String;)V

    return v2
.end method

.method public final a(IZILcom/unionpay/mobile/android/upviews/a$a;)V
    .locals 5

    const/4 v4, 0x2

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/ao;->a(Lcom/unionpay/mobile/android/nocard/views/ao;)Lcom/unionpay/mobile/android/views/order/o;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-static {v1}, Lcom/unionpay/mobile/android/nocard/views/ao;->a(Lcom/unionpay/mobile/android/nocard/views/ao;)Lcom/unionpay/mobile/android/views/order/o;

    move-result-object v1

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/views/order/o;->a()I

    move-result v1

    iput v1, v0, Lcom/unionpay/mobile/android/model/b;->aQ:I

    const-string v0, "functionEx"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v2, v2, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget v2, v2, Lcom/unionpay/mobile/android/model/b;->aQ:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    sget-object v0, Lcom/unionpay/mobile/android/views/order/l;->e:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne p1, v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-static {v0, p3}, Lcom/unionpay/mobile/android/nocard/views/ao;->c(Lcom/unionpay/mobile/android/nocard/views/ao;I)V

    :goto_0
    return-void

    :cond_1
    if-eqz p2, :cond_3

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->d:Landroid/content/Context;

    const-string v1, "bankpay_choose_bankcard_next"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/ao;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iput p3, v0, Lcom/unionpay/mobile/android/model/b;->N:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iput-boolean v3, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->j:Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-static {v0, v4}, Lcom/unionpay/mobile/android/nocard/views/ao;->b(Lcom/unionpay/mobile/android/nocard/views/ao;I)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->q:Ljava/util/List;

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/model/c;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/model/c;->c()I

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->q:Ljava/util/List;

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/model/c;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/model/c;->a()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v1, v1, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v2, "1"

    iput-object v2, v1, Lcom/unionpay/mobile/android/model/b;->M:Ljava/lang/String;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v1, v1, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->M:Ljava/lang/String;

    const-string v2, "1"

    const-string v3, "1"

    invoke-static {v1, v0, v2, v3}, Lcom/unionpay/mobile/android/nocard/views/bh;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v1, v1, Lcom/unionpay/mobile/android/nocard/views/ao;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v2, v2, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->j:Lorg/json/JSONObject;

    invoke-static {v2}, Lcom/unionpay/mobile/android/nocard/views/bh;->a(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "0"

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->M:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->q:Ljava/util/List;

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/model/c;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/model/c;->b()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v1, v1, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->M:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\"pan\":\""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "2"

    const-string v3, "1\",\"carrier_tp\":\"2"

    invoke-static {v1, v0, v2, v3}, Lcom/unionpay/mobile/android/nocard/views/bh;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_3
    invoke-virtual {p4}, Lcom/unionpay/mobile/android/upviews/a$a;->a()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v1, p4, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/ao;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_4
    sget-object v0, Lcom/unionpay/mobile/android/views/order/l;->c:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne p1, v0, :cond_5

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->d:Landroid/content/Context;

    const-string v1, "login"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/ao;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iput-boolean v3, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->j:Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/ao;->b(Lcom/unionpay/mobile/android/nocard/views/ao;I)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    iget-object v1, p4, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->n(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_5
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->d:Landroid/content/Context;

    const-string v1, "bankpay_input_cardNO_next"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/ao;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iput-boolean v3, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->j:Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-static {v0, v4}, Lcom/unionpay/mobile/android/nocard/views/ao;->b(Lcom/unionpay/mobile/android/nocard/views/ao;I)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    const-string v1, "0"

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->M:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->M:Ljava/lang/String;

    iget-object v1, p4, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    const-string v2, "1"

    const-string v3, "1"

    invoke-static {v0, v1, v2, v3}, Lcom/unionpay/mobile/android/nocard/views/bh;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v1, v1, Lcom/unionpay/mobile/android/nocard/views/ao;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v2, v2, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->j:Lorg/json/JSONObject;

    invoke-static {v2}, Lcom/unionpay/mobile/android/nocard/views/bh;->a(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-virtual {v0, p1, p2}, Lcom/unionpay/mobile/android/nocard/views/ao;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final b(I)I
    .locals 6

    const/4 v5, 0x0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->d:Landroid/content/Context;

    const-string v1, "bankpay_choose_bankcard"

    sget-object v2, Lcom/unionpay/mobile/android/utils/o;->f:[Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v0, v1, v2, v3}, Lcom/unionpay/mobile/android/nocard/views/ao;->a(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/Object;)V

    return v5
.end method

.method public final c(I)V
    .locals 3

    sget-object v0, Lcom/unionpay/mobile/android/views/order/l;->b:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne p1, v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->d:Landroid/content/Context;

    const-string v1, "open_bankpay"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/ao;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    sget-object v1, Lcom/unionpay/mobile/android/views/order/l;->b:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, v0, Lcom/unionpay/mobile/android/model/b;->aP:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/ao;->d(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    sget-object v0, Lcom/unionpay/mobile/android/views/order/l;->c:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne p1, v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->d:Landroid/content/Context;

    const-string v1, "open_loginpay"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/ao;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/ao;->c(Lcom/unionpay/mobile/android/nocard/views/ao;)V

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/unionpay/mobile/android/views/order/l;->d:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne p1, v0, :cond_3

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/ao;->d:Landroid/content/Context;

    const-string v1, "open_nfcpay"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/ao;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/ao;->d(Lcom/unionpay/mobile/android/nocard/views/ao;)V

    goto :goto_0

    :cond_3
    sget-object v0, Lcom/unionpay/mobile/android/views/order/l;->e:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne p1, v0, :cond_4

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/ao;->e(Lcom/unionpay/mobile/android/nocard/views/ao;)V

    goto :goto_0

    :cond_4
    sget-object v0, Lcom/unionpay/mobile/android/views/order/l;->f:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v1, v1, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->bo:Ljava/lang/String;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/ao$a;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v2, v2, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->bp:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/mobile/android/nocard/views/ao;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
