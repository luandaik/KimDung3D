.class Lcom/heitao/platform/activity/HTPUserCenterActivity$3;
.super Ljava/lang/Object;
.source "HTPUserCenterActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPUserCenterActivity;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$heitao$platform$activity$HTPUserCenterActivity$PAGE_CENTER:[I


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;


# direct methods
.method static synthetic $SWITCH_TABLE$com$heitao$platform$activity$HTPUserCenterActivity$PAGE_CENTER()[I
    .locals 3

    .prologue
    .line 250
    sget-object v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$3;->$SWITCH_TABLE$com$heitao$platform$activity$HTPUserCenterActivity$PAGE_CENTER:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->values()[Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->BASE_VIEW:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_5

    :goto_1
    :try_start_1
    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->BINDE_NEW_PHONE:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_4

    :goto_2
    :try_start_2
    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->BIND_PHONE:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_3

    :goto_3
    :try_start_3
    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->CHANGE_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_2

    :goto_4
    :try_start_4
    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->FIND_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_1

    :goto_5
    :try_start_5
    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->FORGET_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_0

    :goto_6
    sput-object v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$3;->$SWITCH_TABLE$com$heitao$platform$activity$HTPUserCenterActivity$PAGE_CENTER:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_6

    :catch_1
    move-exception v1

    goto :goto_5

    :catch_2
    move-exception v1

    goto :goto_4

    :catch_3
    move-exception v1

    goto :goto_3

    :catch_4
    move-exception v1

    goto :goto_2

    :catch_5
    move-exception v1

    goto :goto_1
.end method

.method constructor <init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$3;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    .line 250
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 254
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$3;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->size()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 255
    invoke-static {}, Lcom/heitao/platform/activity/HTPUserCenterActivity$3;->$SWITCH_TABLE$com$heitao$platform$activity$HTPUserCenterActivity$PAGE_CENTER()[I

    move-result-object v1

    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$3;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_0

    .line 279
    :cond_0
    :goto_0
    return-void

    .line 257
    :pswitch_0
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$3;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->finish()V

    goto :goto_0

    .line 260
    :pswitch_1
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$3;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$13(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 263
    :pswitch_2
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$3;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$13(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 266
    :pswitch_3
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$3;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$13(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 269
    :pswitch_4
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$3;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$13(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 272
    :pswitch_5
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$3;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$13(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 255
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method
