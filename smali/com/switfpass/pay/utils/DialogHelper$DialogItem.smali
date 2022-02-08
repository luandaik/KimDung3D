.class public Lcom/switfpass/pay/utils/DialogHelper$DialogItem;
.super Ljava/lang/Object;


# instance fields
.field public activity:Landroid/app/Activity;

.field public link:Landroid/content/Intent;

.field public name:Ljava/lang/String;

.field public requestCode:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->requestCode:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/content/Intent;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->requestCode:I

    iput-object p1, p0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->name:Ljava/lang/String;

    iput-object p2, p0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->link:Landroid/content/Intent;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/content/Intent;ILandroid/app/Activity;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->requestCode:I

    iput-object p1, p0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->name:Ljava/lang/String;

    iput-object p2, p0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->link:Landroid/content/Intent;

    iput p3, p0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->requestCode:I

    iput-object p4, p0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->activity:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public getLink()Landroid/content/Intent;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->link:Landroid/content/Intent;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getRequestCode()I
    .locals 1

    iget v0, p0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->requestCode:I

    return v0
.end method

.method public setLink(Landroid/content/Intent;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->link:Landroid/content/Intent;

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->name:Ljava/lang/String;

    return-void
.end method

.method public setRequestCode(I)V
    .locals 0

    iput p1, p0, Lcom/switfpass/pay/utils/DialogHelper$DialogItem;->requestCode:I

    return-void
.end method
