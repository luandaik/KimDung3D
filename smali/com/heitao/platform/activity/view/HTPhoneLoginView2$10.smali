.class Lcom/heitao/platform/activity/view/HTPhoneLoginView2$10;
.super Ljava/lang/Object;
.source "HTPhoneLoginView2.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->buildPhoneRegisterView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$10;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    .line 272
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .param p1, "arg0"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 276
    if-eqz p2, :cond_0

    .line 277
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$10;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$10(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Z)V

    .line 281
    :goto_0
    return-void

    .line 279
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$10;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$10(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Z)V

    goto :goto_0
.end method
