.class final Lcom/switfpass/pay/activity/a;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic b:Lcom/switfpass/pay/activity/BasePayActivity;

.field private final synthetic c:I


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/BasePayActivity;I)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/a;->b:Lcom/switfpass/pay/activity/BasePayActivity;

    iput p2, p0, Lcom/switfpass/pay/activity/a;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    new-instance v0, Lcom/switfpass/pay/utils/PayToast;

    invoke-direct {v0}, Lcom/switfpass/pay/utils/PayToast;-><init>()V

    iget-object v1, p0, Lcom/switfpass/pay/activity/a;->b:Lcom/switfpass/pay/activity/BasePayActivity;

    iget-object v2, p0, Lcom/switfpass/pay/activity/a;->b:Lcom/switfpass/pay/activity/BasePayActivity;

    iget v3, p0, Lcom/switfpass/pay/activity/a;->c:I

    invoke-virtual {v2, v3}, Lcom/switfpass/pay/activity/BasePayActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/switfpass/pay/utils/PayToast;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method
