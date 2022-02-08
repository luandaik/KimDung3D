.class final Lcom/unionpay/d;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Ljava/lang/String;

.field final synthetic e:Ljava/lang/String;

.field final synthetic f:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/d;->a:Landroid/content/Context;

    iput-object p2, p0, Lcom/unionpay/d;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/unionpay/d;->c:Ljava/lang/String;

    iput-object p4, p0, Lcom/unionpay/d;->d:Ljava/lang/String;

    iput-object p5, p0, Lcom/unionpay/d;->e:Ljava/lang/String;

    iput-object p6, p0, Lcom/unionpay/d;->f:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 6

    iget-object v0, p0, Lcom/unionpay/d;->a:Landroid/content/Context;

    iget-object v1, p0, Lcom/unionpay/d;->b:Ljava/lang/String;

    iget-object v2, p0, Lcom/unionpay/d;->c:Ljava/lang/String;

    iget-object v3, p0, Lcom/unionpay/d;->d:Ljava/lang/String;

    iget-object v4, p0, Lcom/unionpay/d;->e:Ljava/lang/String;

    iget-object v5, p0, Lcom/unionpay/d;->f:Ljava/lang/String;

    invoke-static/range {v0 .. v5}, Lcom/unionpay/UPPayAssistEx;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
