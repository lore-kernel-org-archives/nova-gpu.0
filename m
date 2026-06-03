Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011001.outbound.protection.outlook.com [52.101.57.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7231C5F27
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 23:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780530648; cv=fail; b=PV+QAULVWn45hchx5JysoLyr87oT2HYU+E2+toVi+TRgI3Uqbm2A9+F4ihcS76zzFO1mDsQ8y/zBTyL6Ij7UW1bTCyTZqZjZsjOo4XAkCyZJb6IBTFo8lNfA/CtygZH0JKo9QYRujug6UdXgJ11L+WKQRZDFkLuD+kv23w64tBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780530648; c=relaxed/simple;
	bh=a13NTq+aoYgoNLUqGV7eymTSauMjuDyc4Hyh9ausqCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f8Wk+oRTEM8NKlHrWS8LQu2cLjP2o+A6AvodfKBfdk9slRlVace2oaFhLwcpdR54G+NQRPm6Pjpc/ChSUD+6tLakp0LUHeX+CJQSPldJxhL+EYMC+p5Yc4QFTKefiQZXgfjIpt7hUYAOcZ95qUMmbU5bdDIPxpY6qUlxqTM6bIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KhcuoXCU; arc=fail smtp.client-ip=52.101.57.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KhcuoXCU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9VDLHj4+uQxsaLPrbfuzspEgfKsXY9P5+CGpgVKMAzhoJ04AvQGPh5m/qE7JoKDiJcPVNHRg49rvGUOE0+RmP1b75oz384Z/i2ogR4L01MHhELNFKNsRZd47SEq+erhs6pnRcAx3OLUvrB/KqwLJ/jUXXtvtI+6IbAh1V1a52XMorUaSUn8EsCxr8sI90efxA41wVkDYAYVQu0uXN0aePplQst9E+yDTfdlq6uvh0BPjLSJvKd09gbCN/lK3AS+tIzfQjwfgSXTuhLXAPxgI7ZdMrgew7vJWdnpgizTH2aVnpg09esLNEIQ88a5KOSL5JTLB9P/zRfuE2LSvimyVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDHbHG8FuDRLYaSP7kTgzpTfaGMz4DDeo5ui+aaszE0=;
 b=MTCLAW0AGB7HjKg9OqMljXjuz/wpKIZ9znZz7bUY+N46BISDEMezlwLObAgFnh7AKQ3of7kVZ1zVnmTyo37Wfnqd2TcTW7wRsfbNLK65eMkcBNTlCAG+syOP1wiYhI+aglxiTNaU2A3iUu9Ka9aG2hmBB/8uCpIoMuAmzVC97+3Mst4YVZBb7VhNqiFvdkXQdcdgHsAK7O/kpcWRU0SfX3mGAgMKeVSQkVil4xz++Ep+foPBW9SCBSewoYLE2vfLzm1l7T5OWrEdkRdte0H/W3Qmb0a+kuqnySKAFNg9ek9rQWhTafxAwzoIUcTP9cyLkuIP3SPTEb4H9vJ2EK4xdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDHbHG8FuDRLYaSP7kTgzpTfaGMz4DDeo5ui+aaszE0=;
 b=KhcuoXCUc1hbcuERq292gpshShfm8jfhCpWke1AQCHHdyZq2MI0bivxGGsBEJdlCMetxHxBngd7nqwpZstgkRschHsY7Pp4L99fau33lkGjRvQiUV9lCHZUxX3gP/Xk676ne2oi1CawVYWpBFEmeo+xe8v7IrygfgbWzyoEWkNLDtkkhQRjG3T++Ssm6hkmn1RowSacbjeKAdMYp+cMmRw1qrJzc16BnvzR4fqukefRqCaLdB5ZRBig36nts1zKz2mLuxjMSUsMvkHcDTfoTyqiQIIzIoX1GVNdxBnZsY95MjxnU41f6xdoVVI5/4XseI3J8vt0kMsJAhD4PyarqFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6660.namprd12.prod.outlook.com (2603:10b6:510:212::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 23:50:40 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 23:50:38 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 2/2] gpu: nova-core: clean up FSP FRTS comments
Date: Wed,  3 Jun 2026 16:50:34 -0700
Message-ID: <20260603235034.131354-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603235034.131354-1-jhubbard@nvidia.com>
References: <20260603235034.131354-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::6) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c09be2-1237-42e5-911a-08dec1cae9e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	mQ6mG7s4nvDTpf//jQ64EOelsIUnZEvspSrTZ6Scp6Lhz0TIaBiEoUwZBk0bPbxEusxpHx2CvNdjzG2FbPIruQx5lkItXm4QFhV++OCptdEppOzDtRECflhQGwOw3i9HwQduu5qWmzr7DaffxC5gtds+gqO/aTRmGAf9WhjWq+MmXxgV+SGKObmoFrTtin/EZUCiO7TPITk77PfeLcAcaZN4dFihVFITfsMYq5dUkFfc109B3fq6u7+p1F9YSMkMl41HMinF5hl0jjSHLnWOUDzcoU9HSv87PYYzAMZGhE/AE0IizfLR7SbQYU+TMu2eXc+ispKY1BGsdXmGdLYklH/zMW9XlucUh2tdgKk01h9n2UthQngzebMeaRSt3vvZ/0WcCyza06gdY/msl1uUVhtmJGjHlf3xIPYza+ne2gUbAzqH2bKhAZh6d0HZpqUpGe4Gu/UMAwudcAkzZN4ubyUId6moDsKyQ2LWEgIWSUi+ZU4pMqJBHL+EX9UzZkG3QGGUuGZdT6rBXXumeE1IPGr/45jqQuix2oP4YFcJI9kPIKvQMDRlBTPoI7A8dolx9KjoT/wqInkdeDq2FYUnZo5/AKP/jvtINufBy+XZ5IjuP5QusnyB7LOD13ZQPsxNinF3KXGkNsuQaLxR9B1NFJtAeCT6jBZY/ZHDtpqDWNRsYBUDGmNrylFFKZvWiumo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v90l2A828tG/qwbujX2pbt+q8wGuBG5zzCaxR95WSPTQxLSUA666mxWj0UKp?=
 =?us-ascii?Q?hGDoOEw1knENvhMHYmjxx6t4DrDbtEXs3whGlfsSCSWMRjwlfN8EWXlmCJ7/?=
 =?us-ascii?Q?H2QW2TBR+aXR3dKJIypl+9It+ni45xHL7FmJj3GmFTtf1DTjSznP38xiUqo5?=
 =?us-ascii?Q?9G59ruUWnrSkEPJkcr0JQwJ3el1lnV1YCZuCCoZbVWzHXpMqhzWg/rgnpPVP?=
 =?us-ascii?Q?7aoTmTzQdss3TyirOrUk4MpV9qlJZ2EslxBHZSRbk1W8nbiGG1a19CEtQ6qV?=
 =?us-ascii?Q?B/P/o2R/az0olI800KZzAVhOCE8W8JF8stpU2IHKSFmCppfCSCzcpsYJW39T?=
 =?us-ascii?Q?AoP8XTsnaXTCDqwUReJXi/bRiswPIN6YlOqGSOs0pU33/sixHxJjjfZmweKY?=
 =?us-ascii?Q?vE3RGWIfDlLBMHWM2EeeOMh4OmaoxkqE7NYhuUAcNFk8ejpFurZ8u2rOYmvh?=
 =?us-ascii?Q?S3WCmZEShB6zfQUu/jQnuUJJxi8E+mNHwwkQ9gzlwTcgEw/YFwU8DKdYrjR9?=
 =?us-ascii?Q?6i/WREfcxvoZ+Vb1Fcra0qq/JJTxxwYdwAfgbrePWXbcfHzHK34tqeYiTuBg?=
 =?us-ascii?Q?FxOFkEMACrGwW7RsX+PgKYN2C8vQF83TPaWD/OdEpjudvpW0tNnbbGlChvot?=
 =?us-ascii?Q?bFrm98cWz4toAWSMN6fQmFe1B5MxnAMJoFROtA6IOwWrYSJwHtugzBZo3oT/?=
 =?us-ascii?Q?AbDgTUcxIGmgMFoRpjpEsOiN63KPnPotCVbB3wYQ1/SOpb45WPWy+g0HovnL?=
 =?us-ascii?Q?peYq48jrd/usOV3wYzT9jtySrNqsxXy0nc9FRV3oAwPjxQ7TnD7w8Wbb0ecs?=
 =?us-ascii?Q?2iBh9UaXMM9mSUubB87hRaceOrltqCOpzRzvA/xSpXqbth/jfl05ZEDjxTB8?=
 =?us-ascii?Q?/WEkGcYWTBa7UlKlD++ND7JdAtqWhneicaFKdU7pGBsk+8ew1HFb0Qtx8Mj0?=
 =?us-ascii?Q?3ZI2Ldp0Kr00g+6v09OSm5v4arpdRfvFDDbvMZ81jAnhevemhtLk8kXNnUpY?=
 =?us-ascii?Q?dmsBx8A8/+S3EqBK6c4K2+zHVJdvnliF/LGeQM5Wre6Sse0B1l9OPcHtDGO8?=
 =?us-ascii?Q?jhdmOI1TX9teXjjGkxP0nNOYRiMn96jaiECq43gBXpCJx/WCh1l/L1mR9VAf?=
 =?us-ascii?Q?028cIpwR0Xtf3HWDBYTRaAhnXMYQNbThzXqKFg54p52xu/yJWezTbMZXMc8R?=
 =?us-ascii?Q?o9cPVHRFiloChWTqGak6EmcsDG6kwUHQk251cFKtKA74mA/wNyYmkiMTxqr0?=
 =?us-ascii?Q?x24++ydVOkbJuI14oGcGV1SVJ0pMjAJGqVHhSQs8rzlCHmsCfan828m0knlG?=
 =?us-ascii?Q?TEh5lP7nxncXrr9u9qqazLOtMi9HmRKl9Ne41EJj3d01X+OPv4P77qcdt6N3?=
 =?us-ascii?Q?a/2ee9in4Y4px4T2nat71ZF+uLxnOYtjvnRoB4EN2AZs/uRnfFbu0Fq5hH91?=
 =?us-ascii?Q?O+GdolG6PnRABT3psUyvdekDJivSseoa0RCY88iyICkhbGo5MKxTehvVSBL2?=
 =?us-ascii?Q?4c31Wehy+oXBuspRn53d0TK/HXWjzMr6WOXSG7Xt+7jixFF+hnUuJpwW00hb?=
 =?us-ascii?Q?lRht3GTvLjdwJcuTPd73BQaeFtXHrkwHCaJ//M5J9DVo1flzF6SmuXajHGkR?=
 =?us-ascii?Q?ILmOKs8QADKOoKVFQGMWGd/VWOMIxnT/Y6dpENfxR2lq/l90jWVpF4NDrqqG?=
 =?us-ascii?Q?iGGvKvbOFjRFJGZWp0p2gwAqCCQFPCHKu5oJnL1hF9lk1eLnKtzO6Vyfa3Xm?=
 =?us-ascii?Q?SO3ihJWfVQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c09be2-1237-42e5-911a-08dec1cae9e6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 23:50:38.6459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIeaFIhu5wsRSiuTsVeKrOQRVsqrzzrVtPhqfcgl5QMeGLI7B9suOllv2PSn6Mqpz+dWDM2sgr3eJkEjJvmGHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6660

Two comments in the FSP Chain of Trust message setup had drifted from
the code. One referred to a variable name that no longer exists, and
another described the unused sysmem FRTS fields as future work rather
than explaining why they are zero. Update both to describe the code as
it stands.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 8fc243c66e35..0e2c596f695a 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -110,7 +110,8 @@ fn new<'a>(
         fsp_fw: &'a FspFirmware,
         args: &'a FmcBootArgs,
     ) -> Result<impl Init<Self> + 'a> {
-        // frts_offset is relative to FB end: FRTS_location = FB_END - frts_offset
+        // frts_vidmem_offset is measured from the end of FB, so FRTS sits at
+        // (end of FB) - frts_vidmem_offset.
         let frts_vidmem_offset = if !args.resume {
             let frts_reserved_size = fb_layout.heap.len() + u64::from(fb_layout.pmu_reserved_size);
 
@@ -143,8 +144,8 @@ fn new<'a>(
             msg.cot.gsp_fmc_sysmem_offset = fsp_fw.fmc_image.dma_handle();
             msg.cot.frts_vidmem_offset = frts_vidmem_offset;
             msg.cot.frts_vidmem_size = frts_size;
-            // frts_sysmem_* intentionally left at zero for now, but will be needed for e.g.
-            // systems without VRAM.
+            // frts_sysmem_* are left at zero because this path places FRTS in vidmem. The sysmem
+            // fields point to an FRTS buffer in sysmem instead, for systems without VRAM.
             msg.cot.gsp_boot_args_sysmem_offset = args.fmc_boot_params.dma_handle();
             msg.cot.sigs = *fsp_fw.fmc_sigs;
 
-- 
2.54.0

