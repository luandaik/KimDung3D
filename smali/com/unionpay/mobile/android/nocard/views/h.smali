.class final Lcom/unionpay/mobile/android/nocard/views/h;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/nocard/views/g;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/nocard/views/g;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 4

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/nocard/views/g;->o()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/g;->a(Lcom/unionpay/mobile/android/nocard/views/g;)Lcom/unionpay/mobile/android/upviews/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->d()Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/g;->a(Lcom/unionpay/mobile/android/nocard/views/g;)Lcom/unionpay/mobile/android/upviews/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->b()Lcom/unionpay/mobile/android/upviews/a$a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a$a;->a()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    iget-object v0, v0, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/unionpay/mobile/android/nocard/views/g;->a(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    invoke-static {v1}, Lcom/unionpay/mobile/android/nocard/views/g;->b(Lcom/unionpay/mobile/android/nocard/views/g;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    invoke-static {v1}, Lcom/unionpay/mobile/android/nocard/views/g;->b(Lcom/unionpay/mobile/android/nocard/views/g;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upwidget/a;->e()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    invoke-static {v1}, Lcom/unionpay/mobile/android/nocard/views/g;->b(Lcom/unionpay/mobile/android/nocard/views/g;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upwidget/a;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/g;->a(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    iget-object v1, v1, Lcom/unionpay/mobile/android/nocard/views/g;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v2, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v2, v2, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    iget-object v1, v1, Lcom/unionpay/mobile/android/nocard/views/g;->d:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    iget-object v3, v3, Lcom/unionpay/mobile/android/nocard/views/g;->q:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_open_apply"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/nocard/views/g;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    invoke-static {v1}, Lcom/unionpay/mobile/android/nocard/views/g;->c(Lcom/unionpay/mobile/android/nocard/views/g;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    iget-object v1, v1, Lcom/unionpay/mobile/android/nocard/views/g;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->C:Lorg/json/JSONObject;

    const-string v2, "action"

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    iget-object v2, v2, Lcom/unionpay/mobile/android/nocard/views/g;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    iget-object v0, v0, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-virtual {v2, v1, v0}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    const/16 v1, 0x66

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/g;->a(Lcom/unionpay/mobile/android/nocard/views/g;I)I

    goto/16 :goto_0

    :cond_3
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/g;->d(Lcom/unionpay/mobile/android/nocard/views/g;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/h;->a:Lcom/unionpay/mobile/android/nocard/views/g;

    const/16 v1, 0x68

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/g;->a(Lcom/unionpay/mobile/android/nocard/views/g;I)I

    goto/16 :goto_0
.end method
