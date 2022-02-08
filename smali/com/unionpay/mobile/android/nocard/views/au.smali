.class final Lcom/unionpay/mobile/android/nocard/views/au;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/nocard/views/at;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/nocard/views/at;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 4

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/nocard/views/at;->o()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    const-string v0, ""

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-static {v1}, Lcom/unionpay/mobile/android/nocard/views/at;->a(Lcom/unionpay/mobile/android/nocard/views/at;)Lcom/unionpay/mobile/android/upviews/a;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/at;->a(Lcom/unionpay/mobile/android/nocard/views/at;)Lcom/unionpay/mobile/android/upviews/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->d()Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/at;->a(Lcom/unionpay/mobile/android/nocard/views/at;)Lcom/unionpay/mobile/android/upviews/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->b()Lcom/unionpay/mobile/android/upviews/a$a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a$a;->a()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    iget-object v0, v0, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/unionpay/mobile/android/nocard/views/at;->a(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, v0, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    :cond_2
    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-static {v1}, Lcom/unionpay/mobile/android/nocard/views/at;->b(Lcom/unionpay/mobile/android/nocard/views/at;)Lcom/unionpay/mobile/android/upviews/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upviews/a;->d()Z

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-static {v1}, Lcom/unionpay/mobile/android/nocard/views/at;->b(Lcom/unionpay/mobile/android/nocard/views/at;)Lcom/unionpay/mobile/android/upviews/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upviews/a;->b()Lcom/unionpay/mobile/android/upviews/a$a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upviews/a$a;->a()Z

    move-result v2

    if-nez v2, :cond_3

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    iget-object v1, v1, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/at;->a(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-static {v2}, Lcom/unionpay/mobile/android/nocard/views/at;->c(Lcom/unionpay/mobile/android/nocard/views/at;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-static {v2}, Lcom/unionpay/mobile/android/nocard/views/at;->c(Lcom/unionpay/mobile/android/nocard/views/at;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/unionpay/mobile/android/upwidget/a;->e()Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-static {v1}, Lcom/unionpay/mobile/android/nocard/views/at;->c(Lcom/unionpay/mobile/android/nocard/views/at;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upwidget/a;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/at;->a(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-static {v2}, Lcom/unionpay/mobile/android/nocard/views/at;->d(Lcom/unionpay/mobile/android/nocard/views/at;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-static {v2}, Lcom/unionpay/mobile/android/nocard/views/at;->d(Lcom/unionpay/mobile/android/nocard/views/at;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/unionpay/mobile/android/upwidget/a;->e()Z

    move-result v2

    if-nez v2, :cond_5

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-static {v1}, Lcom/unionpay/mobile/android/nocard/views/at;->d(Lcom/unionpay/mobile/android/nocard/views/at;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upwidget/a;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/at;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_5
    iget-object v1, v1, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/at;->b(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_1
    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    iget-object v1, v1, Lcom/unionpay/mobile/android/nocard/views/at;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v2, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v2, v2, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    iget-object v1, v1, Lcom/unionpay/mobile/android/nocard/views/at;->d:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    iget-object v3, v3, Lcom/unionpay/mobile/android/nocard/views/at;->q:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_apply"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/nocard/views/at;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    iget-object v1, v1, Lcom/unionpay/mobile/android/nocard/views/at;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->E:Ljava/lang/String;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    iget-object v1, v1, Lcom/unionpay/mobile/android/nocard/views/at;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->E:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-static {v2}, Lcom/unionpay/mobile/android/nocard/views/at;->e(Lcom/unionpay/mobile/android/nocard/views/at;)Z

    move-result v2

    invoke-static {v1, v2, v0}, Lcom/unionpay/mobile/android/nocard/views/at;->a(Lcom/unionpay/mobile/android/nocard/views/at;ZLjava/lang/String;)V

    goto/16 :goto_0

    :cond_6
    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/au;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-static {v1, v0}, Lcom/unionpay/mobile/android/nocard/views/at;->a(Lcom/unionpay/mobile/android/nocard/views/at;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_7
    move-object v0, v1

    goto :goto_1
.end method
