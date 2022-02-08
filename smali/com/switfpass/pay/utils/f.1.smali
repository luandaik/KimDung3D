.class final Lcom/switfpass/pay/utils/f;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    invoke-static {p1}, Lcom/switfpass/pay/utils/DialogHelper;->distoryDialog(Landroid/content/DialogInterface;)V

    return-void
.end method
