.class final Lcom/unionpay/mobile/android/pro/views/y;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pro/views/x;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pro/views/x;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 4

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/x;->a(Lcom/unionpay/mobile/android/pro/views/x;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/x;->b(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/upviews/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->d()Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/x;->b(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/upviews/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->a()Lcom/unionpay/mobile/android/upviews/a$a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a$a;->a()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    iget-object v0, v0, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/unionpay/mobile/android/pro/views/x;->a(Lcom/unionpay/mobile/android/pro/views/x;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/x;->c(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/x;->c(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upwidget/a;->e()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v1}, Lcom/unionpay/mobile/android/pro/views/x;->c(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upwidget/a;->b()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pro/views/x;->b(Lcom/unionpay/mobile/android/pro/views/x;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/x;->d(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/x;->d(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upwidget/a;->e()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v1}, Lcom/unionpay/mobile/android/pro/views/x;->d(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upwidget/a;->b()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pro/views/x;->c(Lcom/unionpay/mobile/android/pro/views/x;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/x;->e(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/widgets/m;

    move-result-object v0

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/x;->f(Lcom/unionpay/mobile/android/pro/views/x;)Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v2}, Lcom/unionpay/mobile/android/pro/views/x;->g(Lcom/unionpay/mobile/android/pro/views/x;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_apply"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pro/views/x;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/x;->h(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/model/b;

    move-result-object v0

    iget-boolean v0, v0, Lcom/unionpay/mobile/android/model/b;->bq:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v1}, Lcom/unionpay/mobile/android/pro/views/x;->i(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/model/b;

    move-result-object v1

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->br:Lcom/unionpay/mobile/android/model/c;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v2}, Lcom/unionpay/mobile/android/pro/views/x;->b(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/upviews/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/unionpay/mobile/android/upviews/a;->a()Lcom/unionpay/mobile/android/upviews/a$a;

    move-result-object v2

    iget-object v2, v2, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v3}, Lcom/unionpay/mobile/android/pro/views/x;->j(Lcom/unionpay/mobile/android/pro/views/x;)Ljava/util/HashMap;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/unionpay/mobile/android/pro/views/x;->a(Lcom/unionpay/mobile/android/pro/views/x;Lcom/unionpay/mobile/android/model/c;Ljava/lang/String;Ljava/util/HashMap;)V

    goto/16 :goto_0

    :cond_4
    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/x;->l(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/model/b;

    move-result-object v0

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->q:Ljava/util/List;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v2}, Lcom/unionpay/mobile/android/pro/views/x;->k(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/model/b;

    move-result-object v2

    iget v2, v2, Lcom/unionpay/mobile/android/model/b;->N:I

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/model/c;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v2}, Lcom/unionpay/mobile/android/pro/views/x;->b(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/upviews/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/unionpay/mobile/android/upviews/a;->a()Lcom/unionpay/mobile/android/upviews/a$a;

    move-result-object v2

    iget-object v2, v2, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/y;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v3}, Lcom/unionpay/mobile/android/pro/views/x;->j(Lcom/unionpay/mobile/android/pro/views/x;)Ljava/util/HashMap;

    move-result-object v3

    invoke-static {v1, v0, v2, v3}, Lcom/unionpay/mobile/android/pro/views/x;->a(Lcom/unionpay/mobile/android/pro/views/x;Lcom/unionpay/mobile/android/model/c;Ljava/lang/String;Ljava/util/HashMap;)V

    goto/16 :goto_0
.end method
