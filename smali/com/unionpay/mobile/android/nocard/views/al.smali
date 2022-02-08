.class final Lcom/unionpay/mobile/android/nocard/views/al;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/nocard/views/ak;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/nocard/views/ak;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/nocard/views/al;->a:Lcom/unionpay/mobile/android/nocard/views/ak;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/al;->a:Lcom/unionpay/mobile/android/nocard/views/ak;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/nocard/views/ak;->o()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/al;->a:Lcom/unionpay/mobile/android/nocard/views/ak;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/ak;->a(Lcom/unionpay/mobile/android/nocard/views/ak;)Lcom/unionpay/mobile/android/upviews/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->d()Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/al;->a:Lcom/unionpay/mobile/android/nocard/views/ak;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/ak;->a(Lcom/unionpay/mobile/android/nocard/views/ak;)Lcom/unionpay/mobile/android/upviews/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->b()Lcom/unionpay/mobile/android/upviews/a$a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a$a;->a()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/al;->a:Lcom/unionpay/mobile/android/nocard/views/ak;

    iget-object v0, v0, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/unionpay/mobile/android/nocard/views/ak;->a(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/al;->a:Lcom/unionpay/mobile/android/nocard/views/ak;

    invoke-static {v1}, Lcom/unionpay/mobile/android/nocard/views/ak;->b(Lcom/unionpay/mobile/android/nocard/views/ak;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/al;->a:Lcom/unionpay/mobile/android/nocard/views/ak;

    invoke-static {v1}, Lcom/unionpay/mobile/android/nocard/views/ak;->b(Lcom/unionpay/mobile/android/nocard/views/ak;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upwidget/a;->e()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/al;->a:Lcom/unionpay/mobile/android/nocard/views/ak;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/al;->a:Lcom/unionpay/mobile/android/nocard/views/ak;

    invoke-static {v1}, Lcom/unionpay/mobile/android/nocard/views/ak;->b(Lcom/unionpay/mobile/android/nocard/views/ak;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upwidget/a;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/ak;->a(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object v0, v0, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/al;->a:Lcom/unionpay/mobile/android/nocard/views/ak;

    iget-object v1, v1, Lcom/unionpay/mobile/android/nocard/views/ak;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v2, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v2, v2, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/al;->a:Lcom/unionpay/mobile/android/nocard/views/ak;

    iget-object v1, v1, Lcom/unionpay/mobile/android/nocard/views/ak;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    invoke-virtual {v1, v0}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->l(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/al;->a:Lcom/unionpay/mobile/android/nocard/views/ak;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/ak;->c(Lcom/unionpay/mobile/android/nocard/views/ak;)I

    goto :goto_0
.end method
