.class final Lcom/switfpass/pay/utils/ab;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final synthetic dW:Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/ab;->dW:Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/ab;->dW:Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;

    invoke-interface {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;->handleOkBtn()V

    return-void
.end method
