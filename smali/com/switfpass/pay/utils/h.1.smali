.class final Lcom/switfpass/pay/utils/h;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private synthetic do:Lcom/switfpass/pay/utils/DialogInfoSdk;

.field private final synthetic dp:I


# direct methods
.method constructor <init>(Lcom/switfpass/pay/utils/DialogInfoSdk;I)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    iput p2, p0, Lcom/switfpass/pay/utils/h;->dp:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    const/4 v1, 0x0

    iget v0, p0, Lcom/switfpass/pay/utils/h;->dp:I

    packed-switch v0, :pswitch_data_0

    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    iget-object v0, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-static {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->a(Lcom/switfpass/pay/utils/DialogInfoSdk;)Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "\u63d0\u4ea4\u6210\u529f!"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->cancel()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-static {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->b(Lcom/switfpass/pay/utils/DialogInfoSdk;)Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;

    move-result-object v0

    invoke-interface {v0, v1}, Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;->handleOkBtn(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_4
    iget-object v0, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->cancel()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-static {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->b(Lcom/switfpass/pay/utils/DialogInfoSdk;)Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;

    move-result-object v0

    invoke-interface {v0, v1}, Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;->handleOkBtn(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-static {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->b(Lcom/switfpass/pay/utils/DialogInfoSdk;)Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;

    move-result-object v0

    invoke-interface {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;->cancel()V

    goto :goto_0

    :pswitch_5
    iget-object v0, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->cancel()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-static {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->b(Lcom/switfpass/pay/utils/DialogInfoSdk;)Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-static {v1}, Lcom/switfpass/pay/utils/DialogInfoSdk;->c(Lcom/switfpass/pay/utils/DialogInfoSdk;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;->handleOkBtn(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_6
    iget-object v0, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-static {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->b(Lcom/switfpass/pay/utils/DialogInfoSdk;)Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;

    move-result-object v0

    invoke-interface {v0, v1}, Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;->handleOkBtn(Ljava/lang/String;)V

    :pswitch_7
    iget-object v0, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/h;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->cancel()V

    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_6
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method
