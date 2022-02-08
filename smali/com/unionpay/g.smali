.class final Lcom/unionpay/g;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic a:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/g;->a:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    iget-object v0, p0, Lcom/unionpay/g;->a:Landroid/content/Context;

    invoke-static {}, Lcom/unionpay/UPPayAssistEx;->j()Lorg/json/JSONArray;

    move-result-object v1

    invoke-static {}, Lcom/unionpay/UPPayAssistEx;->o()I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/unionpay/UPPayAssistEx;->a(Landroid/content/Context;Lorg/json/JSONArray;I)V

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method
