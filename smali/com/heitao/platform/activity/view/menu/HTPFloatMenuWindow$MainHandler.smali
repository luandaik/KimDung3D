.class Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;
.super Landroid/os/Handler;
.source "HTPFloatMenuWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MainHandler"
.end annotation


# instance fields
.field private final MSG_HIDE:I

.field final synthetic this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;


# direct methods
.method private constructor <init>(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V
    .locals 1

    .prologue
    .line 551
    iput-object p1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 552
    const/4 v0, 0x1

    iput v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->MSG_HIDE:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;)V
    .locals 0

    .prologue
    .line 551
    invoke-direct {p0, p1}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;-><init>(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 18
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 556
    move-object/from16 v0, p1

    iget v12, v0, Landroid/os/Message;->what:I

    packed-switch v12, :pswitch_data_0

    .line 672
    :cond_0
    :goto_0
    :pswitch_0
    invoke-super/range {p0 .. p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 673
    return-void

    .line 559
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$0(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V

    .line 560
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$1(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V

    .line 563
    new-instance v11, Landroid/os/Message;

    invoke-direct {v11}, Landroid/os/Message;-><init>()V

    .line 564
    .local v11, "sss":Landroid/os/Message;
    const/4 v12, 0x2

    iput v12, v11, Landroid/os/Message;->what:I

    .line 565
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$2(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;

    move-result-object v12

    iget v13, v11, Landroid/os/Message;->what:I

    const-wide/16 v14, 0x64

    invoke-virtual {v12, v13, v14, v15}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 569
    .end local v11    # "sss":Landroid/os/Message;
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$3(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 570
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$4(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;

    move-result-object v12

    const-string v13, "x"

    const/4 v14, 0x2

    new-array v14, v14, [F

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$5(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v16

    move/from16 v0, v16

    neg-int v0, v0

    move/from16 v16, v0

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    aput v16, v14, v15

    const/4 v15, 0x1

    const/16 v16, 0x0

    aput v16, v14, v15

    invoke-static {v12, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 571
    .local v2, "anim3":Landroid/animation/ObjectAnimator;
    const-wide/16 v12, 0x1

    invoke-virtual {v2, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 572
    new-instance v5, Landroid/animation/AnimatorSet;

    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    .line 573
    .local v5, "animSet":Landroid/animation/AnimatorSet;
    invoke-virtual {v5, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 574
    invoke-virtual {v5}, Landroid/animation/AnimatorSet;->start()V

    goto :goto_0

    .line 577
    .end local v2    # "anim3":Landroid/animation/ObjectAnimator;
    .end local v5    # "animSet":Landroid/animation/AnimatorSet;
    :cond_1
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$4(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;

    move-result-object v12

    const-string v13, "x"

    const/4 v14, 0x2

    new-array v14, v14, [F

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$5(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v16

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    aput v16, v14, v15

    const/4 v15, 0x1

    const/16 v16, 0x0

    aput v16, v14, v15

    invoke-static {v12, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 578
    .restart local v2    # "anim3":Landroid/animation/ObjectAnimator;
    const-wide/16 v12, 0x1

    invoke-virtual {v2, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 579
    new-instance v5, Landroid/animation/AnimatorSet;

    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    .line 580
    .restart local v5    # "animSet":Landroid/animation/AnimatorSet;
    invoke-virtual {v5, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 581
    invoke-virtual {v5}, Landroid/animation/AnimatorSet;->start()V

    goto/16 :goto_0

    .line 585
    .end local v2    # "anim3":Landroid/animation/ObjectAnimator;
    .end local v5    # "animSet":Landroid/animation/AnimatorSet;
    :pswitch_3
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$6(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Ljava/util/Timer;

    move-result-object v12

    if-eqz v12, :cond_2

    .line 586
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$6(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Ljava/util/Timer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/Timer;->cancel()V

    .line 588
    :cond_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    const/4 v13, 0x1

    invoke-static {v12, v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$7(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Z)V

    .line 589
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$8(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/app/Activity;

    move-result-object v12

    const-string v13, "htp_float_icon_transparent"

    invoke-static {v12, v13}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    .line 590
    .local v8, "id":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$9(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;

    move-result-object v12

    invoke-virtual {v12, v8}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 591
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$3(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 593
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$9(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;

    move-result-object v12

    const-string v13, "x"

    const/4 v14, 0x2

    new-array v14, v14, [F

    const/4 v15, 0x0

    const/16 v16, 0x0

    aput v16, v14, v15

    const/4 v15, 0x1

    const/high16 v16, 0x42dc0000    # 110.0f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$10(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)F

    move-result v17

    mul-float v16, v16, v17

    move/from16 v0, v16

    neg-float v0, v0

    move/from16 v16, v0

    aput v16, v14, v15

    invoke-static {v12, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 594
    .restart local v2    # "anim3":Landroid/animation/ObjectAnimator;
    const-wide/16 v12, 0xdc

    invoke-virtual {v2, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 595
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$9(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;

    move-result-object v12

    const-string v13, "x"

    const/4 v14, 0x1

    new-array v14, v14, [F

    const/4 v15, 0x0

    const/high16 v16, 0x41a00000    # 20.0f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$10(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)F

    move-result v17

    mul-float v16, v16, v17

    move/from16 v0, v16

    neg-float v0, v0

    move/from16 v16, v0

    aput v16, v14, v15

    invoke-static {v12, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    .line 596
    .local v3, "anim4":Landroid/animation/ObjectAnimator;
    const-wide/16 v12, 0xc8

    invoke-virtual {v3, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 597
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$9(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;

    move-result-object v12

    const-string v13, "x"

    const/4 v14, 0x1

    new-array v14, v14, [F

    const/4 v15, 0x0

    const/high16 v16, 0x42200000    # 40.0f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$11(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)F

    move-result v17

    mul-float v16, v16, v17

    move/from16 v0, v16

    neg-float v0, v0

    move/from16 v16, v0

    aput v16, v14, v15

    invoke-static {v12, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 598
    .local v4, "anim5":Landroid/animation/ObjectAnimator;
    const-wide/16 v12, 0x64

    invoke-virtual {v4, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 600
    new-instance v5, Landroid/animation/AnimatorSet;

    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    .line 601
    .restart local v5    # "animSet":Landroid/animation/AnimatorSet;
    invoke-virtual {v5, v3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v12

    invoke-virtual {v12, v2}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 602
    invoke-virtual {v5, v4}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v12

    invoke-virtual {v12, v3}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 603
    invoke-virtual {v5}, Landroid/animation/AnimatorSet;->start()V

    .line 604
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    const/4 v13, 0x0

    invoke-static {v12, v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$12(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    .line 605
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    const/4 v13, 0x1

    invoke-static {v12, v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$13(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Z)V

    .line 621
    :goto_1
    new-instance v9, Landroid/os/Message;

    invoke-direct {v9}, Landroid/os/Message;-><init>()V

    .line 622
    .local v9, "mm":Landroid/os/Message;
    const/16 v12, 0x8

    iput v12, v9, Landroid/os/Message;->what:I

    .line 623
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$2(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;

    move-result-object v12

    iget v13, v9, Landroid/os/Message;->what:I

    const-wide/16 v14, 0x258

    invoke-virtual {v12, v13, v14, v15}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_0

    .line 608
    .end local v2    # "anim3":Landroid/animation/ObjectAnimator;
    .end local v3    # "anim4":Landroid/animation/ObjectAnimator;
    .end local v4    # "anim5":Landroid/animation/ObjectAnimator;
    .end local v5    # "animSet":Landroid/animation/AnimatorSet;
    .end local v9    # "mm":Landroid/os/Message;
    :cond_3
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$9(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;

    move-result-object v12

    const-string v13, "x"

    const/4 v14, 0x2

    new-array v14, v14, [F

    const/4 v15, 0x0

    const/16 v16, 0x0

    aput v16, v14, v15

    const/4 v15, 0x1

    const/high16 v16, 0x42dc0000    # 110.0f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$10(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)F

    move-result v17

    mul-float v16, v16, v17

    aput v16, v14, v15

    invoke-static {v12, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 609
    .restart local v2    # "anim3":Landroid/animation/ObjectAnimator;
    const-wide/16 v12, 0xdc

    invoke-virtual {v2, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 610
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$9(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;

    move-result-object v12

    const-string v13, "x"

    const/4 v14, 0x1

    new-array v14, v14, [F

    const/4 v15, 0x0

    const/high16 v16, 0x41a00000    # 20.0f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$10(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)F

    move-result v17

    mul-float v16, v16, v17

    aput v16, v14, v15

    invoke-static {v12, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    .line 611
    .restart local v3    # "anim4":Landroid/animation/ObjectAnimator;
    const-wide/16 v12, 0xc8

    invoke-virtual {v3, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 612
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$9(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;

    move-result-object v12

    const-string v13, "x"

    const/4 v14, 0x1

    new-array v14, v14, [F

    const/4 v15, 0x0

    const/high16 v16, 0x42200000    # 40.0f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$10(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)F

    move-result v17

    mul-float v16, v16, v17

    aput v16, v14, v15

    invoke-static {v12, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 613
    .restart local v4    # "anim5":Landroid/animation/ObjectAnimator;
    const-wide/16 v12, 0x64

    invoke-virtual {v4, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 614
    new-instance v5, Landroid/animation/AnimatorSet;

    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    .line 615
    .restart local v5    # "animSet":Landroid/animation/AnimatorSet;
    invoke-virtual {v5, v3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v12

    invoke-virtual {v12, v2}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 616
    invoke-virtual {v5, v4}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v12

    invoke-virtual {v12, v3}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 617
    invoke-virtual {v5}, Landroid/animation/AnimatorSet;->start()V

    .line 618
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$14(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v14}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$15(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v14

    sub-int/2addr v13, v14

    invoke-static {v12, v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$12(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    .line 619
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    const/4 v13, 0x1

    invoke-static {v12, v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$13(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Z)V

    goto/16 :goto_1

    .line 626
    .end local v2    # "anim3":Landroid/animation/ObjectAnimator;
    .end local v3    # "anim4":Landroid/animation/ObjectAnimator;
    .end local v4    # "anim5":Landroid/animation/ObjectAnimator;
    .end local v5    # "animSet":Landroid/animation/AnimatorSet;
    .end local v8    # "id":I
    :pswitch_4
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    const/4 v13, 0x0

    invoke-static {v12, v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$13(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Z)V

    .line 627
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    const/4 v13, 0x0

    invoke-static {v12, v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$7(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Z)V

    .line 628
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$1(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V

    goto/16 :goto_0

    .line 631
    :pswitch_5
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$1(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V

    goto/16 :goto_0

    .line 634
    :pswitch_6
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    const/4 v13, 0x1

    invoke-static {v12, v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$13(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Z)V

    .line 635
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    const/4 v13, 0x0

    invoke-static {v12, v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$7(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Z)V

    .line 636
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$8(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/app/Activity;

    move-result-object v12

    const-string v13, "htp_float_icon_transparent"

    invoke-static {v12, v13}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    .line 637
    .local v7, "hide":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$9(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;

    move-result-object v12

    invoke-virtual {v12, v7}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 640
    .end local v7    # "hide":I
    :pswitch_7
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$3(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Z

    move-result v12

    if-eqz v12, :cond_6

    .line 641
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$17(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v13

    if-le v12, v13, :cond_5

    .line 642
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v14}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$17(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v14

    sub-int/2addr v13, v14

    invoke-static {v12, v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$12(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    .line 663
    :goto_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v12, v12, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v14}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$18(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v14

    const/4 v15, -0x1

    const/16 v16, -0x1

    invoke-virtual/range {v12 .. v16}, Landroid/widget/PopupWindow;->update(IIII)V

    .line 664
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v12

    if-nez v12, :cond_4

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$14(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v13

    if-eq v12, v13, :cond_0

    .line 665
    :cond_4
    new-instance v10, Landroid/os/Message;

    invoke-direct {v10}, Landroid/os/Message;-><init>()V

    .line 666
    .local v10, "ss":Landroid/os/Message;
    const/16 v12, 0x9

    iput v12, v10, Landroid/os/Message;->what:I

    .line 667
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$2(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;

    move-result-object v12

    iget v13, v10, Landroid/os/Message;->what:I

    const-wide/16 v14, 0x3

    invoke-virtual {v12, v13, v14, v15}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_0

    .line 644
    .end local v10    # "ss":Landroid/os/Message;
    :cond_5
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    const/4 v13, 0x0

    invoke-static {v12, v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$12(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    .line 645
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v12, v12, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v14}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$18(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v14

    const/4 v15, -0x1

    const/16 v16, -0x1

    invoke-virtual/range {v12 .. v16}, Landroid/widget/PopupWindow;->update(IIII)V

    .line 646
    new-instance v6, Landroid/os/Message;

    invoke-direct {v6}, Landroid/os/Message;-><init>()V

    .line 647
    .local v6, "hh":Landroid/os/Message;
    const/4 v12, 0x6

    iput v12, v6, Landroid/os/Message;->what:I

    .line 648
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$2(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;

    move-result-object v12

    iget v13, v6, Landroid/os/Message;->what:I

    const-wide/16 v14, 0x1f4

    invoke-virtual {v12, v13, v14, v15}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_0

    .line 652
    .end local v6    # "hh":Landroid/os/Message;
    :cond_6
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$17(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v13

    add-int/2addr v12, v13

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$14(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v14}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$15(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v14

    sub-int/2addr v13, v14

    if-ge v12, v13, :cond_7

    .line 653
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v14}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$17(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v14

    add-int/2addr v13, v14

    invoke-static {v12, v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$12(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    goto/16 :goto_2

    .line 655
    :cond_7
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$14(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v14}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$15(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v14

    sub-int/2addr v13, v14

    invoke-static {v12, v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$12(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    .line 656
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v12, v12, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v13}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v14}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$18(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v14

    const/4 v15, -0x1

    const/16 v16, -0x1

    invoke-virtual/range {v12 .. v16}, Landroid/widget/PopupWindow;->update(IIII)V

    .line 657
    new-instance v6, Landroid/os/Message;

    invoke-direct {v6}, Landroid/os/Message;-><init>()V

    .line 658
    .restart local v6    # "hh":Landroid/os/Message;
    const/4 v12, 0x6

    iput v12, v6, Landroid/os/Message;->what:I

    .line 659
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v12}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$2(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;

    move-result-object v12

    iget v13, v6, Landroid/os/Message;->what:I

    const-wide/16 v14, 0x1f4

    invoke-virtual {v12, v13, v14, v15}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_0

    .line 556
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method
