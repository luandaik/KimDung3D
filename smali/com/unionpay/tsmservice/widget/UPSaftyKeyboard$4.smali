.class final Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;


# direct methods
.method constructor <init>(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;->a:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;->a:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;

    invoke-static {v0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;->a:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;

    invoke-static {v0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->d(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Landroid/os/Vibrator;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [J

    fill-array-data v1, :array_0

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate([JI)V

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;->a:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;

    invoke-virtual {v0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->hide()V

    :cond_1
    :goto_0
    return-void

    :cond_2
    const/16 v1, 0x14

    if-ne v0, v1, :cond_4

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;->a:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;

    invoke-static {v0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->e(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I

    move-result v0

    if-lez v0, :cond_3

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;->a:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;

    invoke-static {}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->a()V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;->a:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;

    invoke-static {v0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->f(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I

    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;->a:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;

    invoke-static {v0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->h(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnEditorListener;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;->a:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;

    invoke-static {v0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->h(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnEditorListener;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;->a:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;

    invoke-static {v1}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->e(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I

    move-result v1

    invoke-interface {v0, v1}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnEditorListener;->onEditorChanged(I)V

    goto :goto_0

    :cond_4
    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;->a:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;

    invoke-static {v1}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->e(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I

    move-result v1

    const/4 v2, 0x6

    if-eq v1, v2, :cond_1

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;->a:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;->a:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;

    invoke-static {v0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I

    goto :goto_1

    :array_0
    .array-data 8
        0x0
        0x64
    .end array-data
.end method
