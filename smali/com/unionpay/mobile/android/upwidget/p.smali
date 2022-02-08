.class final Lcom/unionpay/mobile/android/upwidget/p;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/upwidget/j;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/upwidget/j;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/upwidget/p;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 4

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/p;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v0}, Lcom/unionpay/mobile/android/upwidget/j;->a(Lcom/unionpay/mobile/android/upwidget/j;)I

    move-result v0

    if-ne v1, v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/p;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/upwidget/j;->c(Lcom/unionpay/mobile/android/upwidget/j;I)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/p;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v0}, Lcom/unionpay/mobile/android/upwidget/j;->l(Lcom/unionpay/mobile/android/upwidget/j;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/p;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v0}, Lcom/unionpay/mobile/android/upwidget/j;->m(Lcom/unionpay/mobile/android/upwidget/j;)[Lcom/unionpay/mobile/android/upwidget/j$a;

    move-result-object v0

    aget-object v0, v0, v1

    iget-object v0, v0, Lcom/unionpay/mobile/android/upwidget/j$a;->d:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/p;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v0}, Lcom/unionpay/mobile/android/upwidget/j;->m(Lcom/unionpay/mobile/android/upwidget/j;)[Lcom/unionpay/mobile/android/upwidget/j$a;

    move-result-object v0

    aget-object v0, v0, v1

    iget-object v0, v0, Lcom/unionpay/mobile/android/upwidget/j$a;->d:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/p;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v0}, Lcom/unionpay/mobile/android/upwidget/j;->n(Lcom/unionpay/mobile/android/upwidget/j;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/unionpay/mobile/android/upwidget/p;->a:Lcom/unionpay/mobile/android/upwidget/j;

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/p;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v0}, Lcom/unionpay/mobile/android/upwidget/j;->m(Lcom/unionpay/mobile/android/upwidget/j;)[Lcom/unionpay/mobile/android/upwidget/j$a;

    move-result-object v0

    aget-object v0, v0, v1

    iget-object v0, v0, Lcom/unionpay/mobile/android/upwidget/j$a;->c:Landroid/view/View;

    check-cast v0, Landroid/widget/LinearLayout;

    const-string v3, "\u6b63\u5728\u67e5\u8be2\u3002\u3002\u3002"

    invoke-static {v2, v0, v3}, Lcom/unionpay/mobile/android/upwidget/j;->a(Lcom/unionpay/mobile/android/upwidget/j;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/p;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v0}, Lcom/unionpay/mobile/android/upwidget/j;->o(Lcom/unionpay/mobile/android/upwidget/j;)Z

    :cond_2
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0
.end method
