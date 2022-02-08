.class final Lcom/switfpass/pay/utils/g;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private synthetic do:Lcom/switfpass/pay/utils/DialogInfoSdk;

.field private final synthetic dp:I


# direct methods
.method constructor <init>(Lcom/switfpass/pay/utils/DialogInfoSdk;I)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/g;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    iput p2, p0, Lcom/switfpass/pay/utils/g;->dp:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/g;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->dismiss()V

    iget v0, p0, Lcom/switfpass/pay/utils/g;->dp:I

    sparse-switch v0, :sswitch_data_0

    :goto_0
    return-void

    :sswitch_0
    iget-object v0, p0, Lcom/switfpass/pay/utils/g;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-static {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->a(Lcom/switfpass/pay/utils/DialogInfoSdk;)Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    :sswitch_1
    iget-object v0, p0, Lcom/switfpass/pay/utils/g;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-static {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->b(Lcom/switfpass/pay/utils/DialogInfoSdk;)Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;

    move-result-object v0

    invoke-interface {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;->cancel()V

    goto :goto_0

    :sswitch_2
    iget-object v0, p0, Lcom/switfpass/pay/utils/g;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/g;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->cancel()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/g;->do:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-static {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->b(Lcom/switfpass/pay/utils/DialogInfoSdk;)Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;

    move-result-object v0

    invoke-interface {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;->cancel()V

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x6 -> :sswitch_0
        0xa -> :sswitch_1
        0xc -> :sswitch_2
    .end sparse-switch
.end method
