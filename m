Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011055.outbound.protection.outlook.com [52.101.57.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02B7313523
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363771; cv=fail; b=FkpwDcK7j7c4+dqf/8frlhH3W7pTIbrN2W73ZCMzAGrIAnyDhalVAhYuXVgtY+aSru3/IvUdSKdoZ1WVJo1FwVeBPDy8XLrG2PfyX4866rCJLTFJjFxsHJ+yIKyC4MV4t5ODUTol+FOy3tNJ4g/7ikDGf9yXukTqYUV6PahIT+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363771; c=relaxed/simple;
	bh=OAY4qaJFXxYCnVxgoUPWbhGVaX8I5XNS6g1TukdZxVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ojwzh0RV9SAf0bwBLBgTuzTo3nsfojAUR0qXbKYyYZNNHLGYD2C5uwM02iOq8o5lJl+Ta3THez/LAF9KGPyKAJ7pMK08Oa4o+BuL+t16m5YQs6XidquafW/yLEnN2gD/IuG+mDwiaDlQKt7KVCULpTmbZ8lQviHhu/UQtlNCPvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Bs+DHct+; arc=fail smtp.client-ip=52.101.57.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bs+DHct+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+6yK+TsfgzHAgJ1hjaQn9nQaG9dFZ1A+RwA3EPCxjWzxnjiLb5GRBw21kgzns26ouF+MXbvPAsaMMAThie94iQelszLkbIN/ifIWq2k+IEd40+hLZmbF+6c+5lonSshNd7AgVS0+0TOWAb67jV4PnmW/s2p73pm6qqe3mi8tj8cPCjz2tOhXpyQXYhdSs5YWbQhtu667C4XukP7XRm7KCMVTvscpnU/WPnmFBqnd6v3nbsvicYmSn/7BWF55/qf22tTpiMvyzcdLQplLYNY9xAQWLBr3D3CpqN/kDFHWNSXW1EFFrgyx8TcG7D1Ae7d7gtYHInwCCjta2e7Kn4MCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSPuo9VV03kt9q5ib/lxnyth8QBaWSVA7zEjupgmYRg=;
 b=qX7SsXWOATZUfcsxvLMfYeWHjn8Hua0k/LDNZQ4WIRZm1jWRuBU9ZvkholJUTrefhLJp+AWvz+l5PigjYihy2obBW5oofMSSERDdbyU28DhdiKysu0LqTfeR1gvQoIXsvDmvD0qS7yKxNAQSckKUYdcVrpYTwcyrZhmeRIaTBcZ9qE1zkfzavE4/PSAy1W1fPB5hb6xSGUK1bR2O7b1OnVamnITh/ODZou2Wa5aXCpefDhdIkFzGtZMFJVqqYBkEd/i1fr+aOBbx+zrd3JsXK2fBV8xvHIl5iCGtQ/Uj+D9+jFp+RFeBo4GYCEjKl81SaRNhd8ckWZ1OUFurphGuVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSPuo9VV03kt9q5ib/lxnyth8QBaWSVA7zEjupgmYRg=;
 b=Bs+DHct+fj3Dh0M48jaRxuyIAfxkpRkWH1ZWqFXAjmg1r+K1udJ3TFriik2VYw0+lpUikuKPqYZqTYPyiovt8inv+QTyQR9YNUtU086A1nSG3pYeZeFXWXdvbZ0TmcBurMloc4LqpDKMQN/beWkVP0JqS164CgKoxTlg3tSkN0xzupmZd8EgZGb6nxthYcgUSvDPCCyPxpRsW7rFeHtwUNVQG42Q8EjNPwbVQeqoQtai9+KW/yJK4Z9CnrLMPuK2tLCejiMD38fpVN68VzgFz40NowYIzu+hmWLtsMWiet7OK9UTCm0HvVwJTG3dAm9SatCBoY9o0uMubaZz6yulFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sat, 22 Aug
 2026 01:56:01 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:56:00 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
Subject: [PATCH v2 21/31] gpu: nova-core: handle the r000 load-and-execute bootloader event
Date: Fri, 21 Aug 2026 18:54:38 -0700
Message-ID: <20260822015448.238214-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:a03:338::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: ec305413-9bcc-49f7-9703-08defff083ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|376014|1800799024|6133799003|10067099003|56012099006|11063799006|5023799004|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2s0aIapBjMCkCWxt92zl3gH/EvioVU/alQqoS10I114CE5uDOWEpPJyZg7F4dC7nbCQVAD5s2DLPtKMG0RqKPblQmNzTT0q1xoELT3KP2e6MmMBI/XeaKifxcQyRPQ0IVLWKHqN3XO+Ltiv1o7shCG7h4kHuGj3akJ0Cw5xkVXmQZ918mwgJgPYp6wTyJnGIb+lCqO/yBaI7LuQQoXObksx+w3Ys37Vf2K/Hu9wZOO6t2QiBiCbVsVI4X3f5kIReD/QqPWH78yB1n2JltZ6b0OvJhYp7WMeA4dYwucAkuDSEO1VOojxalOc1/eDfDtyF6xl7wIS2RQuw+bLK1q0TsZ2K4WJvhPnkS83DiC+XTB2ZoVprlPpTAhBQRvtmdghcBaq33bW2PIgH1WM/4iTx33Db59uktdkOrEF/T5xQRIWsyKO1avRtICGM9LhSRb2wpLOGe1hQho5iYPfs3Cy9b4fYj39qwJ+Eihc8WmwYbA95lviIM3LA+ffXD0rZe6M+2l6l31NLIQeb4ddeETkL/3X9NYw6ZcWcBvWL2I9A58Tg6J89G6mE8NtcPoQWcG1OG14u6o3OE+Ejgk/zciJqW2kc/K5NxG1DTmCYI6WE3ReiI5pDcrYDywCmzmDY/CD1IFcsjbpr0kgAPssLlTCItnOEjf461Ck85RDV7VOCsq8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AENDuNtLsZ7DKPD7pTYBfxbEjX5TfaTS43RpZt8UCJ4VRTZ7Op2F6PR5JL3O?=
 =?us-ascii?Q?9ZgCDr6IkEqVQexvjEMA1W1AZx1q3HDKg/9mIFIZGuZvlsQR785u67iV41w1?=
 =?us-ascii?Q?f6QfMM1nK9Rt+7dVI2qZifBOe0hY8Rf2bM5lv+sMdB9IN0OkWBH+E1fvw13C?=
 =?us-ascii?Q?9kneVozTPm8hwLkQXEu2jgtb+QvwoVtFZf3mjmJ7SdPe/e190UO87U2ze/u1?=
 =?us-ascii?Q?0nChGD/hRJcwScd7ppY4PfrhaeBSa2XJGIQmL4uvMgeDiJQEIOktsUmO+Iux?=
 =?us-ascii?Q?utK55Iewr7xsEX/OFyKA4lUhNSl+DkALuwdlMpMHKTWNS5mOomoN/QzbAfiG?=
 =?us-ascii?Q?ok2TPsRpdfeszB0N2i9C2cjl3EmCYIf4e8957EKAl79r1GGE56p9V3YbcuBM?=
 =?us-ascii?Q?DrzKjz6DeiGf1/4p4iwdanvsecVcy3KgVUinlKiPSpdDHu/E0zOiWlvkWtCy?=
 =?us-ascii?Q?9npZuiyHaSVY6UAzoGWp/oNphimxOpDo0jlnLPbBCvFVUQd/SIQcW+oGAdJT?=
 =?us-ascii?Q?6pmr18nQVmbJvfEL6lDSNVf2YtXBqFMWB2QNYqbe9doBRiFZKwimlDIWtc/5?=
 =?us-ascii?Q?JrXGSYFXWKWnPeDZ7lqMNvU0+wQfTDHNpoQKlRp9+q0gbkaMHtrsvaUX3Knl?=
 =?us-ascii?Q?Oa3yKdxaXh2peW7uXF5pIeikAZ30nBjIkw/H3cWsrhIXe3ZuWLL01HNYt3KB?=
 =?us-ascii?Q?dcyGA/UIx/oZXVCKFg0C0dQrw8kie6kgODgC+UymG7um7Fn9eWN9eXclYN8H?=
 =?us-ascii?Q?eKBBNbBoo0jYrh0Bfi9iUSQWhe2wvG+pNHxAz3vQT/aTMY0q3kzforFVXf5/?=
 =?us-ascii?Q?qsV0MYEpJJkDHI81I6zhGxsrtVc6YGd4gjY7SldEP5A5QwYQYYKVK5RpuHyo?=
 =?us-ascii?Q?Ga+RxVj5p1siBPz5B00xIquVb0+KQBN5BTzHGivxMCvakr/HsNnh5JKHyXhv?=
 =?us-ascii?Q?ukMpFRt1tZYKc7eMy3w1/Lqkv8VwIdj3MXaF2EholDCwcGH/E2Xw40HYmRs6?=
 =?us-ascii?Q?olfPSbnX4y7tGgVIfBXqz1Wt8f4f5+A5GZIk5PKHzCqCc8+PauK2GH/J0J7u?=
 =?us-ascii?Q?2odA8ut80nWG5q3q4EjegZRFtc6uIUwyThJCWP41uXLmPWiAlwluMInuV6wK?=
 =?us-ascii?Q?nYYNiG6IsIvGmhQFhteXvBDsGf/RvWEn76y30PKzcpEe4CF2ebRpvV1U+vXS?=
 =?us-ascii?Q?gmVeuIQU25BFi3f2hL4IhFopi1ft8XN8JYYescouYNAAMK4k1DcWYlo0s9tu?=
 =?us-ascii?Q?NaGw4RRE3brjCfo6SxATR5Se+XTMOm7adyfvtVSnJQTAb5MN596GmZmX8FYC?=
 =?us-ascii?Q?+RkHSatBmzWRARXHm3n4xPpecMimM9vuuxBA7PGFzEgfic92MjPXEGZvani4?=
 =?us-ascii?Q?n+mfCJyGlzefgjEvSo7bxgwBjTsT3a3Uu+Nrg0pm1v2ivQ4eD8CkMCUhF+6I?=
 =?us-ascii?Q?SoJElLvEY3v1+aXYIhjetPXQzKJ/U1vw/KoDNyX/xpIa/VWXcktT3IOFoQgK?=
 =?us-ascii?Q?ET5qE8Je52Wq28RyTh6HeBTk0Exmy1+sBuOPIu4QiNjTx7bWeQ4JB7iOo9TL?=
 =?us-ascii?Q?moyxjaRk53Hpz5J2UP8Tia6fvOWxHJYUpm4pKSiGbJwA42GTdqnv3VzhEp6P?=
 =?us-ascii?Q?bz7BcFzKujNLXCCvL8DOuWK5zhI+6aPWvR+MwmaJUmJ1DPxrCVHGTCD8VPFW?=
 =?us-ascii?Q?o+5XcGxQKuZspoeAGhiHF95cA5wUzX5lzVTTsyFJ3zhjFY1V0+bPeblkib5n?=
 =?us-ascii?Q?/ILelznbgQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec305413-9bcc-49f7-9703-08defff083ce
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:56:00.6136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ew3ShWVk4n1Jpt1ugtIjvZOBjSwWx1Aoi8yyTmJvrcSY4MCrmx1gN1mdv/f6L+GbDk8Ypm9osG5GE1TJO0sb7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603

The r000 GSP boot protocol asks the driver to run an image on the GSP
falcon, and passes a bootloader descriptor naming where the image lives.
Open RM does not copy the image itself. It runs the generic falcon
bootloader, which reads that descriptor from DMEM and does the copy.

Nova-core has no handler for that event, and keeps its copy of the
descriptor in the FWSEC module that first needed one.

Move the descriptor next to the bootloader that reads it, and add the
handler. It points the requested FBIF aperture at the image, loads the
descriptor and the bootloader, runs it, and restores the aperture once
the image halts, since a falcon that has not halted may still be reading
through it.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 .../nova-core/firmware/fwsec/bootloader.rs    |  52 +-----
 .../gpu/nova-core/firmware/gen_bootloader.rs  | 115 ++++++++++++-
 drivers/gpu/nova-core/gsp/boot.rs             | 161 +++++++++++++++++-
 3 files changed, 278 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 6670d17b4eeb..43908eb11f7d 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -33,60 +33,16 @@
     },
     firmware::{
         fwsec::FwsecFirmware,
-        gen_bootloader::GenericBootloader, //
+        gen_bootloader::{
+            BootloaderDmemDescV2,
+            GenericBootloader, //
+        },
     },
     gpu::Chipset,
     num::FromSafeCast, //
     regs,
 };
 
-/// Structure used by the boot-loader to load the rest of the code.
-///
-/// This has to be filled by the GPU driver and copied into DMEM at offset
-/// [`BootloaderDesc.dmem_load_off`].
-#[repr(C, packed)]
-#[derive(Debug, Clone)]
-struct BootloaderDmemDescV2 {
-    /// Reserved, should always be first element.
-    reserved: [u32; 4],
-    /// 16B signature for secure code, 0s if no secure code.
-    signature: [u32; 4],
-    /// DMA context used by the bootloader while loading code/data.
-    ctx_dma: u32,
-    /// 256B-aligned physical FB address where code is located.
-    code_dma_base: u64,
-    /// Offset from `code_dma_base` where the non-secure code is located.
-    ///
-    /// Also used as destination IMEM offset of non-secure code as the DMA firmware object is
-    /// expected to be a mirror image of its loaded state.
-    ///
-    /// Must be multiple of 256.
-    non_sec_code_off: u32,
-    /// Size of the non-secure code part.
-    non_sec_code_size: u32,
-    /// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
-    ///
-    /// Also used as destination IMEM offset of secure code as the DMA firmware object is expected
-    /// to be a mirror image of its loaded state.
-    ///
-    /// Must be multiple of 256.
-    sec_code_off: u32,
-    /// Size of the secure code part.
-    sec_code_size: u32,
-    /// Code entry point invoked by the bootloader after code is loaded.
-    code_entry_point: u32,
-    /// 256B-aligned physical FB address where data is located.
-    data_dma_base: u64,
-    /// Size of data block (should be multiple of 256B).
-    data_size: u32,
-    /// Number of arguments to be passed to the target firmware being loaded.
-    argc: u32,
-    /// Arguments to be passed to the target firmware being loaded.
-    argv: u32,
-}
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for BootloaderDmemDescV2 {}
-
 /// Wrapper for [`FwsecFirmware`] that includes the bootloader performing the actual load
 /// operation.
 pub(crate) struct FwsecFirmwareWithBl {
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
index f949223af2d0..f0a6c841d2aa 100644
--- a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -13,14 +13,23 @@
         Alignable,
         Alignment, //
     },
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
 };
 
 use crate::{
     falcon::{
         self,
+        gsp::Gsp,
         Falcon,
+        FalconBromParams,
         FalconEngine,
-        FalconPioImemLoadTarget, //
+        FalconFirmware,
+        FalconPioDmemLoadTarget,
+        FalconPioImemLoadTarget,
+        FalconPioLoadable, //
     },
     firmware::tlv::{
         request_tlv, //
@@ -30,6 +39,57 @@
     num::FromSafeCast, //
 };
 
+/// Structure the generic bootloader reads from DMEM offset 0 to find the image it must load.
+///
+/// Mirrors Open RM's `RM_FLCN_BL_DMEM_DESC`. The driver fills one in when it loads a firmware
+/// through the bootloader, and GSP-RM sends one in a load-and-execute event.
+#[repr(C, packed)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDmemDescV2 {
+    /// Reserved, should always be first element.
+    pub(crate) reserved: [u32; 4],
+    /// 16B signature for secure code, 0s if no secure code.
+    pub(crate) signature: [u32; 4],
+    /// DMA context used by the bootloader while loading code/data.
+    pub(crate) ctx_dma: u32,
+    /// 256B-aligned physical FB address where code is located.
+    pub(crate) code_dma_base: u64,
+    /// Offset from `code_dma_base` where the non-secure code is located.
+    ///
+    /// Also used as destination IMEM offset of non-secure code as the DMA firmware object is
+    /// expected to be a mirror image of its loaded state.
+    ///
+    /// Must be multiple of 256.
+    pub(crate) non_sec_code_off: u32,
+    /// Size of the non-secure code part.
+    pub(crate) non_sec_code_size: u32,
+    /// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
+    ///
+    /// Also used as destination IMEM offset of secure code as the DMA firmware object is expected
+    /// to be a mirror image of its loaded state.
+    ///
+    /// Must be multiple of 256.
+    pub(crate) sec_code_off: u32,
+    /// Size of the secure code part.
+    pub(crate) sec_code_size: u32,
+    /// Code entry point invoked by the bootloader after code is loaded.
+    pub(crate) code_entry_point: u32,
+    /// 256B-aligned physical FB address where data is located.
+    pub(crate) data_dma_base: u64,
+    /// Size of data block (should be multiple of 256B).
+    pub(crate) data_size: u32,
+    /// Number of arguments to be passed to the target firmware being loaded.
+    pub(crate) argc: u32,
+    /// Arguments to be passed to the target firmware being loaded.
+    pub(crate) argv: u32,
+}
+
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for BootloaderDmemDescV2 {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for BootloaderDmemDescV2 {}
+
 /// The generic falcon bootloader image and the IMEM placement it was loaded for.
 pub(crate) struct GenericBootloader {
     /// Bootloader code, zero-padded to a whole number of falcon memory blocks.
@@ -99,4 +159,57 @@ pub(crate) fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
             start_tag: self.start_tag,
         }
     }
+
+    /// Pairs this bootloader with the descriptor of the image it is to load, giving something
+    /// [`Falcon::pio_load`] accepts.
+    pub(crate) fn with_descriptor<'a>(
+        &'a self,
+        dmem_desc: &'a BootloaderDmemDescV2,
+    ) -> GenericBootloaderLoad<'a> {
+        GenericBootloaderLoad {
+            bootloader: self,
+            dmem_desc,
+        }
+    }
+}
+
+/// The generic bootloader together with the descriptor it reads from DMEM offset 0.
+pub(crate) struct GenericBootloaderLoad<'a> {
+    bootloader: &'a GenericBootloader,
+    dmem_desc: &'a BootloaderDmemDescV2,
+}
+
+impl FalconFirmware for GenericBootloaderLoad<'_> {
+    type Target = Gsp;
+
+    fn brom_params(&self) -> FalconBromParams {
+        // The bootloader is not signed. Every chipset that loads it this way uses a falcon HAL
+        // whose BROM programming is a no-op, so these values are never written to hardware.
+        FalconBromParams {
+            pkc_data_offset: 0,
+            engine_id_mask: 0,
+            ucode_id: 0,
+        }
+    }
+
+    fn boot_addr(&self) -> u32 {
+        self.bootloader.boot_addr()
+    }
+}
+
+impl FalconPioLoadable for GenericBootloaderLoad<'_> {
+    fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        None
+    }
+
+    fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        Some(self.bootloader.imem_load_params())
+    }
+
+    fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
+        FalconPioDmemLoadTarget {
+            data: self.dmem_desc.as_bytes(),
+            dst_start: 0,
+        }
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index c8cb7597e532..b7079970e049 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -28,7 +28,13 @@
         FalconMem,
         FalconModSelAlgo, //
     },
-    firmware::gsp::GspFirmware,
+    firmware::{
+        gen_bootloader::{
+            BootloaderDmemDescV2,
+            GenericBootloader, //
+        },
+        gsp::GspFirmware,
+    },
     gsp::{
         cmdq::Cmdq,
         commands, //
@@ -157,6 +163,101 @@ fn core_resume(
         Ok(())
     }
 
+    /// Handle a `GSP_LOAD_EXEC_GENERIC_BOOTLOADER` event.
+    ///
+    /// The driver does not copy the image the GSP asks for. It writes the descriptor the event
+    /// carries to DMEM offset 0, places the generic bootloader in IMEM, points the requested FBIF
+    /// aperture at wherever the image lives, and runs the bootloader, which does the copy from
+    /// the descriptor and jumps to the image. The aperture is restored once the image halts, and
+    /// left pointing at the image otherwise.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if the payload is shorter than the parameter block, the descriptor is not the
+    ///   size this driver mirrors, or the event names a context DMA slot or an aperture that does
+    ///   not exist.
+    /// - `ETIMEDOUT` if the GSP does not suspend, or the image does not halt, in time.
+    #[expect(dead_code)]
+    #[expect(clippy::too_many_arguments)]
+    fn handle_load_exec_bootloader(
+        payload: &[u8],
+        bootloader: &GenericBootloader,
+        gsp_falcon: &Falcon<'_, Gsp>,
+        sec2_falcon: &Falcon<'_, Sec2>,
+        bar: Bar0<'_>,
+        dev: &device::Device,
+        bootloader_app_version: u32,
+        libos_dma_handle: u64,
+    ) -> Result {
+        let params = LoadExecGenericBootloaderParams::from_bytes_prefix(payload)
+            .ok_or(EINVAL)?
+            .0;
+
+        let desc_size =
+            u32::try_from(core::mem::size_of::<BootloaderDmemDescV2>()).map_err(|_| EOVERFLOW)?;
+        if params.dmem_desc_size != desc_size {
+            dev_err!(
+                dev,
+                "Load-exec descriptor is {} bytes, expected {}\n",
+                params.dmem_desc_size,
+                desc_size
+            );
+            return Err(EINVAL);
+        }
+
+        let ctx_dma = params.ctx_dma()?;
+        let fbif_target = params.fbif_target()?;
+        let transcfg = || {
+            regs::NV_PFALCON_FBIF_TRANSCFG::of::<Gsp>()
+                .try_at(usize::from(ctx_dma))
+                .ok_or(EINVAL)
+        };
+
+        gsp_falcon.wait_for_processor_suspend().inspect_err(|_| {
+            dev_err!(
+                dev,
+                "Timeout waiting for GSP suspend (mbox0={:#x})\n",
+                gsp_falcon.read_mailbox0()
+            );
+        })?;
+
+        gsp_falcon.reset()?;
+        gsp_falcon.dma_reset();
+
+        let saved_transcfg = bar.read(transcfg()?);
+        bar.update(transcfg()?, |v| {
+            v.with_target(fbif_target)
+                .with_mem_type(FalconFbifMemType::Physical)
+        });
+
+        gsp_falcon.pio_load(&bootloader.with_descriptor(&params.dmem_desc))?;
+
+        // Also clears the suspend bit that `wait_for_processor_suspend` polls, so the next
+        // load-and-execute event does not read this one's suspension.
+        gsp_falcon.write_mailboxes(Some(FLCN_ERR_BINARY_NOT_STARTED), None);
+
+        gsp_falcon.start()?;
+        gsp_falcon.wait_till_halted().inspect_err(|_| {
+            dev_err!(
+                dev,
+                "Timeout waiting for the loaded image to halt (mbox0={:#x})\n",
+                gsp_falcon.read_mailbox0()
+            );
+        })?;
+
+        // Only once the image has halted. A falcon that never halted may still be reading
+        // through this aperture.
+        bar.update(transcfg()?, |_| saved_transcfg);
+
+        Self::core_resume(
+            gsp_falcon,
+            sec2_falcon,
+            dev,
+            bootloader_app_version,
+            libos_dma_handle,
+        )
+    }
+
     /// Handle a `GSP_LOAD_EXEC_HS_BINARY` event.
     ///
     /// The GSP asks the driver to run a high-security binary that it has already placed in the
@@ -347,6 +448,64 @@ pub(crate) fn unload(
 /// points it at local framebuffer.
 const HS_BINARY_CTX_DMA: u8 = 0;
 
+/// Number of FBIF context DMA slots a falcon has.
+const NUM_CTX_DMA: usize = 8;
+
+/// Parameters for loading and executing the generic bootloader.
+///
+/// Sent by GSP-RM as the payload of `GSP_LOAD_EXEC_GENERIC_BOOTLOADER`. The descriptor carries
+/// the code and data addresses, while `addr_space` and `cpu_cache_attrib` say which FBIF aperture
+/// reaches them.
+#[repr(C)]
+struct LoadExecGenericBootloaderParams {
+    dmem_desc: BootloaderDmemDescV2,
+    dmem_desc_size: u32,
+    addr_space: u32,
+    cpu_cache_attrib: u32,
+    _reserved: [u32; 4],
+}
+
+impl LoadExecGenericBootloaderParams {
+    const ADDR_SYSMEM: u32 = 1;
+    const ADDR_FBMEM: u32 = 2;
+    const NV_MEMORY_CACHED: u32 = 0;
+    const NV_MEMORY_UNCACHED: u32 = 1;
+
+    /// Returns the context DMA slot the bootloader is to fetch the image through.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if the slot is outside the FBIF `TRANSCFG` array.
+    fn ctx_dma(&self) -> Result<u8> {
+        let ctx_dma = self.dmem_desc.ctx_dma;
+
+        u8::try_from(ctx_dma)
+            .ok()
+            .filter(|slot| usize::from(*slot) < NUM_CTX_DMA)
+            .ok_or(EINVAL)
+    }
+
+    /// Returns the FBIF aperture that reaches the image.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if the address space and cache attribute pair is not one this driver maps.
+    fn fbif_target(&self) -> Result<FalconFbifTarget> {
+        match (self.addr_space, self.cpu_cache_attrib) {
+            (Self::ADDR_FBMEM, _) => Ok(FalconFbifTarget::LocalFb),
+            (Self::ADDR_SYSMEM, Self::NV_MEMORY_CACHED) => Ok(FalconFbifTarget::CoherentSysmem),
+            (Self::ADDR_SYSMEM, Self::NV_MEMORY_UNCACHED) => {
+                Ok(FalconFbifTarget::NoncoherentSysmem)
+            }
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+// SAFETY: The nested descriptor is `FromBytes`, and every other field is an integer type for
+// which all bit patterns are valid.
+unsafe impl FromBytes for LoadExecGenericBootloaderParams {}
+
 /// Parameters for loading and executing an HS (High-Security) binary.
 ///
 /// Sent by GSP-RM as the payload of `GSP_LOAD_EXEC_HS_BINARY`. The firmware
-- 
2.55.0

