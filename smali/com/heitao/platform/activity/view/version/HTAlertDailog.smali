.class public Lcom/heitao/platform/activity/view/version/HTAlertDailog;
.super Ljava/lang/Object;
.source "HTAlertDailog.java"


# instance fields
.field private ad:Landroid/app/AlertDialog;

.field baseView:Landroid/widget/RelativeLayout;

.field buttonLayout:Landroid/widget/LinearLayout;

.field private context:Landroid/content/Context;

.field private isLandScape:Z

.field messageView:Landroid/widget/TextView;

.field private scale_h:F

.field private scale_w:F

.field private screenHeight:I

.field private screenWidth:I

.field titleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "msg"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->context:Landroid/content/Context;

    .line 35
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->ad:Landroid/app/AlertDialog;

    .line 36
    iget-object v1, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->ad:Landroid/app/AlertDialog;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog;->setCancelable(Z)V

    .line 37
    iget-object v1, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->ad:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 39
    invoke-direct {p0, p2, p3}, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->initView(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    iget-object v1, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->ad:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 41
    .local v0, "window":Landroid/view/Window;
    iget-object v1, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->baseView:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/view/Window;->setContentView(Landroid/view/View;)V

    .line 43
    return-void
.end method

.method private initView(Ljava/lang/String;Ljava/lang/String;)V
    .locals 20
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 62
    invoke-direct/range {p0 .. p0}, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale()V

    .line 63
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    move/from16 v17, v0

    if-eqz v17, :cond_0

    const/high16 v17, 0x44250000    # 660.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v4, v0

    .line 64
    .local v4, "bg_with":I
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    move/from16 v17, v0

    if-eqz v17, :cond_1

    const v17, 0x43e58000    # 459.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v2, v0

    .line 65
    .local v2, "bg_hight":I
    :goto_1
    new-instance v17, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->context:Landroid/content/Context;

    move-object/from16 v18, v0

    invoke-direct/range {v17 .. v18}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->baseView:Landroid/widget/RelativeLayout;

    .line 66
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->baseView:Landroid/widget/RelativeLayout;

    move-object/from16 v17, v0

    new-instance v18, Landroid/widget/RelativeLayout$LayoutParams;

    move-object/from16 v0, v18

    invoke-direct {v0, v4, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual/range {v17 .. v18}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->context:Landroid/content/Context;

    move-object/from16 v17, v0

    const-string v18, "ht_version_bg"

    invoke-static/range {v17 .. v18}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    .line 68
    .local v3, "bg_id":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->baseView:Landroid/widget/RelativeLayout;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 70
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    move/from16 v17, v0

    if-eqz v17, :cond_2

    const/high16 v17, 0x429a0000    # 77.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v16, v0

    .line 71
    .local v16, "title_hight":I
    :goto_2
    new-instance v15, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->context:Landroid/content/Context;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-direct {v15, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 73
    .local v15, "titleTV":Landroid/widget/TextView;
    const/16 v17, 0x11

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 74
    const-string v17, "#888888"

    invoke-static/range {v17 .. v17}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 75
    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    move/from16 v17, v0

    if-eqz v17, :cond_3

    const/high16 v17, 0x42000000    # 32.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    move/from16 v19, v0

    mul-float v17, v17, v19

    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v17, v0

    :goto_3
    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    move/from16 v0, v18

    move/from16 v1, v17

    invoke-virtual {v15, v0, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 76
    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    new-instance v14, Landroid/widget/RelativeLayout$LayoutParams;

    .line 78
    const/16 v17, -0x2

    .line 77
    move/from16 v0, v17

    move/from16 v1, v16

    invoke-direct {v14, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 79
    .local v14, "titleParam":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v17, 0xe

    move/from16 v0, v17

    invoke-virtual {v14, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 80
    const/16 v17, 0xa

    move/from16 v0, v17

    invoke-virtual {v14, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 81
    invoke-virtual {v15, v14}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 82
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->baseView:Landroid/widget/RelativeLayout;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 84
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    move/from16 v17, v0

    if-eqz v17, :cond_4

    const v17, 0x44034000    # 525.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v11, v0

    .line 85
    .local v11, "msg_with":I
    :goto_4
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    move/from16 v17, v0

    if-eqz v17, :cond_5

    const/high16 v17, 0x43750000    # 245.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v10, v0

    .line 86
    .local v10, "msg_hight":I
    :goto_5
    new-instance v12, Landroid/widget/ScrollView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->context:Landroid/content/Context;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-direct {v12, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 87
    .local v12, "scroll":Landroid/widget/ScrollView;
    const/16 v17, 0x7530

    move/from16 v0, v17

    invoke-virtual {v12, v0}, Landroid/widget/ScrollView;->setId(I)V

    .line 88
    const/16 v17, 0x1

    move/from16 v0, v17

    invoke-virtual {v12, v0}, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V

    .line 89
    const/16 v17, 0x1

    move/from16 v0, v17

    invoke-virtual {v12, v0}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 90
    new-instance v13, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v13, v11, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 91
    .local v13, "scrollParam":Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    move/from16 v17, v0

    if-eqz v17, :cond_6

    const/high16 v17, 0x42d20000    # 105.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v17, v0

    :goto_6
    move/from16 v0, v17

    iput v0, v13, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 92
    const/16 v17, 0xe

    move/from16 v0, v17

    invoke-virtual {v13, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 93
    invoke-virtual {v12, v13}, Landroid/widget/ScrollView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    new-instance v9, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->context:Landroid/content/Context;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-direct {v9, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 96
    .local v9, "msgTV":Landroid/widget/TextView;
    const/16 v17, 0x13

    move/from16 v0, v17

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 97
    const-string v17, "#888888"

    invoke-static/range {v17 .. v17}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 98
    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    move/from16 v17, v0

    if-eqz v17, :cond_7

    const/high16 v17, 0x41f80000    # 31.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    move/from16 v19, v0

    mul-float v17, v17, v19

    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v17, v0

    :goto_7
    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    move/from16 v0, v18

    move/from16 v1, v17

    invoke-virtual {v9, v0, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 99
    move-object/from16 v0, p2

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    const/high16 v17, 0x40a00000    # 5.0f

    const v18, 0x3f99999a    # 1.2f

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v9, v0, v1}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 101
    new-instance v8, Landroid/widget/RelativeLayout$LayoutParams;

    .line 102
    const/16 v17, -0x2

    .line 101
    move/from16 v0, v17

    invoke-direct {v8, v11, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 103
    .local v8, "msgParam":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v17, 0xd

    move/from16 v0, v17

    invoke-virtual {v8, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 107
    invoke-virtual {v9, v8}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 108
    invoke-virtual {v12, v9}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 109
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->baseView:Landroid/widget/RelativeLayout;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 111
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    move/from16 v17, v0

    if-eqz v17, :cond_8

    const v17, 0x44048000    # 530.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v7, v0

    .line 112
    .local v7, "buttonLayout_with":I
    :goto_8
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    move/from16 v17, v0

    if-eqz v17, :cond_9

    const/high16 v17, 0x42960000    # 75.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v6, v0

    .line 113
    .local v6, "buttonLayout_hight":I
    :goto_9
    new-instance v17, Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->context:Landroid/content/Context;

    move-object/from16 v18, v0

    invoke-direct/range {v17 .. v18}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->buttonLayout:Landroid/widget/LinearLayout;

    .line 114
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->buttonLayout:Landroid/widget/LinearLayout;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-virtual/range {v17 .. v18}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 115
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->buttonLayout:Landroid/widget/LinearLayout;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-virtual/range {v17 .. v18}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 116
    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v5, v7, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 118
    .local v5, "buttonLayoutParam":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v17, 0xe

    move/from16 v0, v17

    invoke-virtual {v5, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 119
    const/16 v17, 0x3

    invoke-virtual {v12}, Landroid/widget/ScrollView;->getId()I

    move-result v18

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 120
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    move/from16 v17, v0

    if-eqz v17, :cond_a

    const/high16 v17, 0x40a00000    # 5.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v17, v0

    :goto_a
    move/from16 v0, v17

    iput v0, v5, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 121
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->buttonLayout:Landroid/widget/LinearLayout;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 123
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->baseView:Landroid/widget/RelativeLayout;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->buttonLayout:Landroid/widget/LinearLayout;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 124
    return-void

    .line 63
    .end local v2    # "bg_hight":I
    .end local v3    # "bg_id":I
    .end local v4    # "bg_with":I
    .end local v5    # "buttonLayoutParam":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v6    # "buttonLayout_hight":I
    .end local v7    # "buttonLayout_with":I
    .end local v8    # "msgParam":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v9    # "msgTV":Landroid/widget/TextView;
    .end local v10    # "msg_hight":I
    .end local v11    # "msg_with":I
    .end local v12    # "scroll":Landroid/widget/ScrollView;
    .end local v13    # "scrollParam":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v14    # "titleParam":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v15    # "titleTV":Landroid/widget/TextView;
    .end local v16    # "title_hight":I
    :cond_0
    const/high16 v17, 0x44250000    # 660.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v4, v0

    goto/16 :goto_0

    .line 64
    .restart local v4    # "bg_with":I
    :cond_1
    const v17, 0x43e58000    # 459.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v2, v0

    goto/16 :goto_1

    .line 70
    .restart local v2    # "bg_hight":I
    .restart local v3    # "bg_id":I
    :cond_2
    const/high16 v17, 0x429a0000    # 77.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v16, v0

    goto/16 :goto_2

    .line 75
    .restart local v15    # "titleTV":Landroid/widget/TextView;
    .restart local v16    # "title_hight":I
    :cond_3
    const/high16 v17, 0x42000000    # 32.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    move/from16 v19, v0

    mul-float v17, v17, v19

    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v17, v0

    goto/16 :goto_3

    .line 84
    .restart local v14    # "titleParam":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_4
    const v17, 0x44034000    # 525.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v11, v0

    goto/16 :goto_4

    .line 85
    .restart local v11    # "msg_with":I
    :cond_5
    const/high16 v17, 0x43750000    # 245.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v10, v0

    goto/16 :goto_5

    .line 91
    .restart local v10    # "msg_hight":I
    .restart local v12    # "scroll":Landroid/widget/ScrollView;
    .restart local v13    # "scrollParam":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_6
    const/high16 v17, 0x42d20000    # 105.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v17, v0

    goto/16 :goto_6

    .line 98
    .restart local v9    # "msgTV":Landroid/widget/TextView;
    :cond_7
    const/high16 v17, 0x41f80000    # 31.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    move/from16 v19, v0

    mul-float v17, v17, v19

    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v17, v0

    goto/16 :goto_7

    .line 111
    .restart local v8    # "msgParam":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_8
    const v17, 0x44048000    # 530.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v7, v0

    goto/16 :goto_8

    .line 112
    .restart local v7    # "buttonLayout_with":I
    :cond_9
    const/high16 v17, 0x42960000    # 75.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v6, v0

    goto/16 :goto_9

    .line 120
    .restart local v5    # "buttonLayoutParam":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v6    # "buttonLayout_hight":I
    :cond_a
    const/high16 v17, 0x40a00000    # 5.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    move/from16 v18, v0

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v17, v0

    goto/16 :goto_a
.end method

.method private scale()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const v4, 0x44aa8000    # 1364.0f

    const/high16 v3, 0x44400000    # 768.0f

    .line 205
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 206
    .local v0, "dm":Landroid/util/DisplayMetrics;
    iget-object v1, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->context:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 208
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v1, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->screenWidth:I

    .line 209
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v1, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->screenHeight:I

    .line 211
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    if-ge v1, v2, :cond_0

    .line 213
    iget v1, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->screenWidth:I

    int-to-float v1, v1

    div-float/2addr v1, v4

    iput v1, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    .line 214
    iget v1, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->screenHeight:I

    int-to-float v1, v1

    div-float/2addr v1, v3

    iput v1, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    .line 215
    iput-boolean v5, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    .line 222
    :goto_0
    return-void

    .line 218
    :cond_0
    iget v1, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->screenHeight:I

    int-to-float v1, v1

    div-float/2addr v1, v4

    iput v1, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    .line 219
    iget v1, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->screenWidth:I

    int-to-float v1, v1

    div-float/2addr v1, v3

    iput v1, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    .line 220
    iput-boolean v5, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    goto :goto_0
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->ad:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 202
    return-void
.end method

.method public setMessage(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 54
    iget-object v0, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->messageView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 55
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->messageView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    return-void
.end method

.method public setNegativeButton(Ljava/lang/String;Landroid/view/View$OnClickListener;)V
    .locals 12
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    const/high16 v11, 0x437a0000    # 250.0f

    const/high16 v10, 0x42960000    # 75.0f

    const/high16 v9, 0x42080000    # 34.0f

    const/high16 v8, 0x41f00000    # 30.0f

    .line 168
    iget-boolean v7, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    if-eqz v7, :cond_0

    iget v7, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    mul-float/2addr v7, v11

    float-to-int v2, v7

    .line 169
    .local v2, "bt_with":I
    :goto_0
    iget-boolean v7, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    if-eqz v7, :cond_1

    iget v7, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    mul-float/2addr v7, v10

    float-to-int v0, v7

    .line 170
    .local v0, "bt_hight":I
    :goto_1
    new-instance v3, Landroid/widget/RelativeLayout;

    iget-object v7, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->context:Landroid/content/Context;

    invoke-direct {v3, v7}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 171
    .local v3, "button":Landroid/widget/RelativeLayout;
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v2, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 172
    .local v4, "buttonParams":Landroid/widget/LinearLayout$LayoutParams;
    iget-boolean v7, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    if-eqz v7, :cond_2

    iget v7, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    mul-float/2addr v7, v8

    float-to-int v7, v7

    :goto_2
    iput v7, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 173
    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 174
    iget-object v7, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->context:Landroid/content/Context;

    const-string v8, "ht_alert_bt_bg"

    invoke-static {v7, v8}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    .line 175
    .local v1, "bt_id":I
    invoke-virtual {v3, v1}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 177
    new-instance v6, Landroid/widget/TextView;

    iget-object v7, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->context:Landroid/content/Context;

    invoke-direct {v6, v7}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 178
    .local v6, "txt":Landroid/widget/TextView;
    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v5, v2, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 179
    .local v5, "params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v7, 0xd

    invoke-virtual {v5, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 180
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 181
    invoke-virtual {v6, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 182
    const/16 v7, 0x11

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 183
    const/4 v7, -0x1

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 184
    const/4 v8, 0x0

    iget-boolean v7, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    if-eqz v7, :cond_3

    iget v7, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    mul-float/2addr v7, v9

    float-to-int v7, v7

    :goto_3
    int-to-float v7, v7

    invoke-virtual {v6, v8, v7}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 185
    invoke-virtual {v3, p2}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    invoke-virtual {v3, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 187
    iget-object v7, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->buttonLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 188
    return-void

    .line 168
    .end local v0    # "bt_hight":I
    .end local v1    # "bt_id":I
    .end local v2    # "bt_with":I
    .end local v3    # "button":Landroid/widget/RelativeLayout;
    .end local v4    # "buttonParams":Landroid/widget/LinearLayout$LayoutParams;
    .end local v5    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v6    # "txt":Landroid/widget/TextView;
    :cond_0
    iget v7, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    mul-float/2addr v7, v11

    float-to-int v2, v7

    goto :goto_0

    .line 169
    .restart local v2    # "bt_with":I
    :cond_1
    iget v7, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    mul-float/2addr v7, v10

    float-to-int v0, v7

    goto :goto_1

    .line 172
    .restart local v0    # "bt_hight":I
    .restart local v3    # "button":Landroid/widget/RelativeLayout;
    .restart local v4    # "buttonParams":Landroid/widget/LinearLayout$LayoutParams;
    :cond_2
    iget v7, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    mul-float/2addr v7, v8

    float-to-int v7, v7

    goto :goto_2

    .line 184
    .restart local v1    # "bt_id":I
    .restart local v5    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v6    # "txt":Landroid/widget/TextView;
    :cond_3
    iget v7, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    mul-float/2addr v7, v9

    float-to-int v7, v7

    goto :goto_3
.end method

.method public setPositiveButton(Ljava/lang/String;Landroid/view/View$OnClickListener;Ljava/lang/String;)V
    .locals 11
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "listener"    # Landroid/view/View$OnClickListener;
    .param p3, "isForce"    # Ljava/lang/String;

    .prologue
    const v10, 0x44048000    # 530.0f

    const/high16 v9, 0x437a0000    # 250.0f

    const/high16 v8, 0x42080000    # 34.0f

    const/high16 v7, 0x42960000    # 75.0f

    .line 133
    const/4 v2, 0x0

    .line 134
    .local v2, "bt_with":I
    const/4 v0, 0x0

    .line 135
    .local v0, "bt_hight":I
    const-string v6, "1"

    invoke-virtual {p3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 136
    iget-boolean v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    if-eqz v6, :cond_1

    iget v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    mul-float/2addr v6, v10

    float-to-int v2, v6

    .line 137
    :goto_0
    iget-boolean v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    if-eqz v6, :cond_2

    iget v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    mul-float/2addr v6, v7

    float-to-int v0, v6

    .line 143
    :cond_0
    :goto_1
    new-instance v3, Landroid/widget/RelativeLayout;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->context:Landroid/content/Context;

    invoke-direct {v3, v6}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 144
    .local v3, "button":Landroid/widget/RelativeLayout;
    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v6, v2, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v6}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 145
    iget-object v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->context:Landroid/content/Context;

    const-string v7, "ht_alert_bt_bg"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    .line 146
    .local v1, "bt_id":I
    invoke-virtual {v3, v1}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 148
    new-instance v5, Landroid/widget/TextView;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->context:Landroid/content/Context;

    invoke-direct {v5, v6}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 149
    .local v5, "txt":Landroid/widget/TextView;
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v4, v2, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 150
    .local v4, "params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v6, 0xd

    invoke-virtual {v4, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 151
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 152
    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 153
    const/16 v6, 0x11

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 154
    const/4 v6, -0x1

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 155
    const/4 v7, 0x0

    iget-boolean v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    if-eqz v6, :cond_6

    iget v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    mul-float/2addr v6, v8

    float-to-int v6, v6

    :goto_2
    int-to-float v6, v6

    invoke-virtual {v5, v7, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 156
    invoke-virtual {v3, p2}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 157
    invoke-virtual {v3, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 158
    iget-object v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->buttonLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 159
    return-void

    .line 136
    .end local v1    # "bt_id":I
    .end local v3    # "button":Landroid/widget/RelativeLayout;
    .end local v4    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v5    # "txt":Landroid/widget/TextView;
    :cond_1
    iget v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    mul-float/2addr v6, v10

    float-to-int v2, v6

    goto :goto_0

    .line 137
    :cond_2
    iget v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    mul-float/2addr v6, v7

    float-to-int v0, v6

    goto :goto_1

    .line 138
    :cond_3
    const-string v6, "2"

    invoke-virtual {p3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 139
    iget-boolean v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    if-eqz v6, :cond_4

    iget v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    mul-float/2addr v6, v9

    float-to-int v2, v6

    .line 140
    :goto_3
    iget-boolean v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->isLandScape:Z

    if-eqz v6, :cond_5

    iget v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_h:F

    mul-float/2addr v6, v7

    float-to-int v0, v6

    :goto_4
    goto :goto_1

    .line 139
    :cond_4
    iget v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    mul-float/2addr v6, v9

    float-to-int v2, v6

    goto :goto_3

    .line 140
    :cond_5
    iget v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    mul-float/2addr v6, v7

    float-to-int v0, v6

    goto :goto_4

    .line 155
    .restart local v1    # "bt_id":I
    .restart local v3    # "button":Landroid/widget/RelativeLayout;
    .restart local v4    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v5    # "txt":Landroid/widget/TextView;
    :cond_6
    iget v6, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->scale_w:F

    mul-float/2addr v6, v8

    float-to-int v6, v6

    goto :goto_2
.end method

.method public setTitle(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 46
    iget-object v0, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->titleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 47
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->titleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    return-void
.end method

.method public show()V
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->ad:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 195
    return-void
.end method
