.class final Lcom/switfpass/pay/activity/d;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private synthetic g:Lcom/switfpass/pay/activity/PayPlugin;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/PayPlugin;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/d;->g:Lcom/switfpass/pay/activity/PayPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    new-instance v0, Lcom/switfpass/pay/activity/f;

    iget-object v1, p0, Lcom/switfpass/pay/activity/d;->g:Lcom/switfpass/pay/activity/PayPlugin;

    invoke-direct {v0, v1}, Lcom/switfpass/pay/activity/f;-><init>(Lcom/switfpass/pay/activity/PayPlugin;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/activity/f;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
