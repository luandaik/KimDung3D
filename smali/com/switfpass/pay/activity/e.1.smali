.class final Lcom/switfpass/pay/activity/e;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic d:Ljava/lang/String;

.field private synthetic g:Lcom/switfpass/pay/activity/PayPlugin;

.field private final synthetic h:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/PayPlugin;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/e;->g:Lcom/switfpass/pay/activity/PayPlugin;

    iput-object p2, p0, Lcom/switfpass/pay/activity/e;->h:Landroid/content/Context;

    iput-object p3, p0, Lcom/switfpass/pay/activity/e;->d:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/switfpass/pay/activity/e;->g:Lcom/switfpass/pay/activity/PayPlugin;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PayPlugin;->loadingDialog:Landroid/app/ProgressDialog;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/e;->g:Lcom/switfpass/pay/activity/PayPlugin;

    new-instance v1, Landroid/app/ProgressDialog;

    iget-object v2, p0, Lcom/switfpass/pay/activity/e;->h:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/switfpass/pay/activity/PayPlugin;->loadingDialog:Landroid/app/ProgressDialog;

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/activity/e;->g:Lcom/switfpass/pay/activity/PayPlugin;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PayPlugin;->loadingDialog:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/switfpass/pay/activity/e;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/e;->g:Lcom/switfpass/pay/activity/PayPlugin;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PayPlugin;->loadingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    return-void
.end method
