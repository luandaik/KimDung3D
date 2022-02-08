.class final Lcom/switfpass/pay/utils/a;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic cZ:Ljava/util/List;

.field private final synthetic da:Landroid/content/Context;


# direct methods
.method constructor <init>(Ljava/util/List;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/a;->cZ:Ljava/util/List;

    iput-object p2, p0, Lcom/switfpass/pay/utils/a;->da:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    iget-object v0, p0, Lcom/switfpass/pay/utils/a;->cZ:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->getRequestCode()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/utils/a;->cZ:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;

    iget-object v1, v0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->activity:Landroid/app/Activity;

    iget-object v0, p0, Lcom/switfpass/pay/utils/a;->cZ:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;

    iget-object v2, v0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->link:Landroid/content/Intent;

    iget-object v0, p0, Lcom/switfpass/pay/utils/a;->cZ:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->getRequestCode()I

    move-result v0

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lcom/switfpass/pay/utils/a;->da:Landroid/content/Context;

    iget-object v0, p0, Lcom/switfpass/pay/utils/a;->cZ:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;

    iget-object v0, v0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->link:Landroid/content/Intent;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
