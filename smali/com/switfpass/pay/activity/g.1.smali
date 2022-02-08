.class final Lcom/switfpass/pay/activity/g;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private synthetic I:Lcom/switfpass/pay/activity/PayResultActivity;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/PayResultActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/g;->I:Lcom/switfpass/pay/activity/PayResultActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v1, v1, v0}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(IILjava/lang/Object;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/g;->I:Lcom/switfpass/pay/activity/PayResultActivity;

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/PayResultActivity;->finish()V

    return-void
.end method
