.class final Lcom/unionpay/mobile/android/upwidget/n;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/upwidget/j;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/upwidget/j;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/upwidget/n;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/n;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v0}, Lcom/unionpay/mobile/android/upwidget/j;->h(Lcom/unionpay/mobile/android/upwidget/j;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/n;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v0}, Lcom/unionpay/mobile/android/upwidget/j;->i(Lcom/unionpay/mobile/android/upwidget/j;)Landroid/widget/TextView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/n;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v0}, Lcom/unionpay/mobile/android/upwidget/j;->j(Lcom/unionpay/mobile/android/upwidget/j;)Lcom/unionpay/mobile/android/widgets/ad;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/unionpay/mobile/android/widgets/ad;->setVisibility(I)V

    return-void
.end method
