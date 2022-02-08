.class final Lcom/unionpay/mobile/android/pro/views/p;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pro/views/k;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pro/views/k;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pro/views/p;->a:Lcom/unionpay/mobile/android/pro/views/k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/p;->a:Lcom/unionpay/mobile/android/pro/views/k;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/k;->t(Lcom/unionpay/mobile/android/pro/views/k;)Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/plugin/BaseActivity;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.NFC_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/mobile/android/plugin/BaseActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
