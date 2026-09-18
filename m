Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCA638D3FE
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693704; cv=fail; b=R2cZZWAcpIxYNobtUUWLXCeZAwbSvekjFpTDIg4Hrm12GzMzNNKMndfhGnPNjafaTWDitD6gUkhq+9HDTqqeMFCMl8aF7IvmlpWnpHRik4JtFLT1sHUQvkD4dnKj3Py230L1ClptmdvumzSvc9U3vJCs3mD+R8URq8kldOUkSEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693704; c=relaxed/simple;
	bh=reKypDvBHNWTtPfxIQ4A2TvMuDWnHLkLUrJbwLQFcjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WO7BjrhGomPgo6HFtngK6O3LIVrTPgxALpiNj5rQJ8hgLJONpSeLV5cNqvLFGiApgfpKnuWweI3lMkpimqjTmInyh3SW9MsopB3FOkr6aaalypy77amdxWidwfrtMKZ2edrJTMkBR1hWyN89z9M4rCYJVSh65CvKjOumIa0TvWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PzuSNc7h; arc=fail smtp.client-ip=52.101.193.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PzuSNc7h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtpHOxvmX7H1ghARGGWk75iG4yD73GopPb4l4tsmNwE+a+acibOr5Obnh0HbwbFmjh1p6G9GZNlUE0psxc64qE1VpmIkNS0Si2rkMpdBwQG/uDazERmxAj5OZsuP93L9L9KQl5ChI5/9B3ugatI++muW5ppx61DA5CHAqntD0Il9XB96FJA0C+HeeclrWrg19Sl82JLLNRZ9GytdYx3/ZCoVP3YGHsyxbr3/6JBoboJ6oFDwN269C3WbTp5R1AqQjTcKsmq0Lq9zszjLPNkriBOeLMQJXkqtV0OrVD6W7CYnCgoKf+rEm0wn9u1qhu+5B4wu/5sf+3EPeTEI/EBCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXIHEdmFg0BtGAPz8ULt7ygDZF43nRDD4S9nQ5mNwRY=;
 b=YGNJeP1tEbR3eFuzTzYzUHCWUQSCk4alKpW4kigo1hZXAfsWOHCYgw0QTWZUz1wDS9pZqbkwQ8dIgdLjtX2Sjf9y9vienMqxyUrHtNH6GWdKTzboVhNQfP9O2qBIn0+WVisgyU3GCpsAFBYWRRuNZ2YACeD4AlNlEY/IJSu3RHNsL8Qy7WwYUMZa6ivuhgIjm/zO3c/4FAkT/8saSn/g2eHscpnt51VCerh48JiZEXh/DdU3+zQJdHCCbGOQWesXWH7obG7yRIvQF+CyBJ0xCm/c1YiIATDrhUQ9stpZ66tdbuziA5lowW9p2XMSxFri3oNrubxPkAGWmCRwgjp8OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXIHEdmFg0BtGAPz8ULt7ygDZF43nRDD4S9nQ5mNwRY=;
 b=PzuSNc7hMAapkOAOvGBeIXovUcIggXwC8voXl9C2zwDIZ1ufzgEFTxbtmO/TD3KBpE5uzn9Ans2ylPNZ72RdocjvgLcNjkQAlSU1id+Vd1ZFyyomvj0nKDdeTepKt7hRV4a/hGqbSt6wRkqf7IVp7dW3hoYq1hH2+YsVimrx3bcIchKvQm/WqxDDB/RE7o1PKjdFeFEd1ZPYpynAPVyBR+RYkxvQeWiXF9uUOgcuob2aYM+iLmLAb3xpvRpT4TNyQzc/7doNRa5bIfnLWXhR8n/iGCSvGzMboRgKLwvXo83JMDyI3yO1Jn3sqKclX9YkjCwC5/Yi4K9siUUZuUVEzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:45 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:45 +0000
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
Subject: [PATCH v3 16/33] gpu: nova-core: move the bootloader DMEM descriptor out of FWSEC
Date: Thu, 17 Sep 2026 18:07:02 -0700
Message-ID: <20260918010719.1176945-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0059.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: dad7cc7a-f9d5-4225-a4b5-08df15213f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|3023799007|5023799004|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tYrw+pqjLLlGPLTSSuQcngB8LFTvIPdIaE7PWoTGifVNjys6/XiXFkyGEyPzRt2vOsJdEvVBPjVP57+VAtdLpyRFSxXGbjE52wuDQo09f5ElyatuTw11PLLwJS2RCW1jLCAdB5hHeuGXWfINT1AGyPHP3PnuKhl+jOWzNY46H08womR2xP4OopdXE2gnOv/iTfyKUNM9sX2hHKRC4n/3nKtDCcGvy58olDVoDHkJp9lv4/Y909tIkz4ZXZ8xGJdU83K/QQMiR3va+O+GhD8L45FcMFGxBjlRxS+AFnovKUnuOm5y23hJYAZD8M29HmT6vKd1m6+q+veiYc7HJ70TZTwnW/JtgD2odOylC44hnVU30Jgptn424rHQeF+TuzIRoj84NIutA1IFWpx3TC8iJK/snYKcjbF9MGy6cGt8+0EbkgQPXU33uQ1a2y79Whr9AH8+DrCPmch2TU+8pWo4s0o2mIlxwNKxey/JdYDPSmVm5IpVtMA1nApux7m34Eho4pkkcOBQvxLEAQe4KKeexqWiMaJYrlek8diZnJNdqhF7m6Axc4Yf3VxvuYUHyT2jDqU8vCaNrIIHgPrg1nOiQgnvAQXuzAjglw1QUdl1wNdo3rgJ8am/fTYCpWM6KIb0yXQd1kzJwgQYe9L1NSrO9ZCJSNgSWuFWXlVZZuzPL10=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(3023799007)(5023799004)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?toGCrZ8qwn3nbmBQ5jhkOg0xPuDnTB6FRFj2giBdL0zkjS9h10g145qGGMS+?=
 =?us-ascii?Q?XPwtV40LcrZAfn03WuvYyMpxgq1hI8b7i9i+85Nvu46wbQ8/wJI/jIGg6OgV?=
 =?us-ascii?Q?Q2rnA7RR9YvIbHx+wr2NXxnjz8YmNM0e17SvuH1Gu94MNSG0IwyFNk1Dy9GU?=
 =?us-ascii?Q?YxDnbfEpdM9SJp7hd3Rk/U9paFdfVceo/6o0UklPwSWdITDUCWQtul5EPqug?=
 =?us-ascii?Q?6f42IKsCyEFbG3A57e+XNdLuYhio3nlEaq4Izdg0IWR9DJZZWYy4A6+Hap4O?=
 =?us-ascii?Q?mjehKiKIxQOdCV5rn0JAYsvsAzSKje3rDLiUjGxe8+MsxMoLXixeQoboDDlx?=
 =?us-ascii?Q?pfn0IX8UmxackI8dg2HPUoBrw7CGoo4HCIvG/oqiExvziPkl/bjSxOqUs0NW?=
 =?us-ascii?Q?A6rxbCJ23f+2i3GKl69T5+9I/jRwGs8wjX+coatQ/o+Cy4fYs4gUcnw+TVWf?=
 =?us-ascii?Q?jMLqSFH/vLaTBB7vyk1GRk1f6ugjF5jTGJOd+QHsMvBx8+CXYr/j3azKs4GO?=
 =?us-ascii?Q?9oUak2S0eYpwwqfh/d53ZNkQXPC/CFYA3CrIzFIfBRLYg4mYN5knGyg9mxgH?=
 =?us-ascii?Q?yFub8yxiuG98WzMbmMqmWl/3+GSBQzZ4MahbhfBORNIdF9NIlJ8yZmxGAwAF?=
 =?us-ascii?Q?dKQDlK+AxQUrKgv3gNOryZSEJKk/wNT6vSTXAK8ukdn/Y1iy1+PTEAsFRuC/?=
 =?us-ascii?Q?W4PE4Kxvg0m0YXzvIo9vVWy2Ra9zMHn7PK0SmEeYq3W0QbqdZsmno2sjC1pP?=
 =?us-ascii?Q?46suYyLlvzdN50Nkxm1LzS47D9YC09TB3xgjjl47szOCi8/02X+/VnVj4mEl?=
 =?us-ascii?Q?QtzVI5t9ZpwXLb5qRspOsTWUQ6ya/7JmmiUalUZConjCX22SBTWI+sd8Nh1N?=
 =?us-ascii?Q?vST4K41gfJHEPWhut5ErPsU6yQrE/KaNfOU8wUVcA2HGoa9vyDH0jPiVywoN?=
 =?us-ascii?Q?xEXPx4t9TjqFxU2SpyZA95WmZNDMJD/FrPO/ZvagYtZJjCuG+lGLuEbYDjxO?=
 =?us-ascii?Q?dB3NBzC2qTfQPGol2MXqNhw6VXdNuQ61qNFUNn6hRIDwoJmhWGwkSyptR3zA?=
 =?us-ascii?Q?MoYDnb34h9crlvJRlelanLyqmu62yHjhmss8+jPpftBVgszBrFtt9pKPh31r?=
 =?us-ascii?Q?NZMJyzRkjZ3OXQsmnIDcsKUTweLpE1nqADADZ3ba9f/y4KpZHVc3SiOMbzes?=
 =?us-ascii?Q?/BUE9yLVjVlwmXnUTy20wHK90PqJXo7Ypg200NrLXzR57wX+fp8hwMlPqBob?=
 =?us-ascii?Q?qp+Gc7AY4Z6lh3sncUCua1gVeMVpYV57mRZ7l/QtvZzRxpIFt0zgFMrSaEuy?=
 =?us-ascii?Q?5efg8SVKG2u5hSAG8tALTLcUf15sHZIwCCqbPDKdrjm+6jX0FPFZu3/3LR77?=
 =?us-ascii?Q?Woqn5ESRmWyig7LTxZ0yIrXNRoVUvYMqwOFcVOD1SkqPfS1AEDFnT/i2jW9p?=
 =?us-ascii?Q?Rr9X/gtYH4WYLqz8qkwiSLARHlh+QQc3k1/5ZJ3M2zIrshzQmEiSXRknT/2k?=
 =?us-ascii?Q?S3cHG/3BdwUq24RIXgmjG0E8YVu4u9iIPYnupq+R+vQxPItOzWldN39PA2gr?=
 =?us-ascii?Q?P+vvMtAJoYU3xNVFa8B7q8usdI4fW+kWILbWZtWGiktyM2vBpatPRznn4Wxg?=
 =?us-ascii?Q?nqbR7Br9du086bXKzjKOf963ZK69TjPBU8XaW8yivQLrNJ/JKJ+7+LE5WpNq?=
 =?us-ascii?Q?cOnkM+OaUNyEwlvobRdLt0CtTa9i8IOVuFPrxs6ZI8T++aCr1pSW8cY2efV+?=
 =?us-ascii?Q?2DwEBlVb4g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dad7cc7a-f9d5-4225-a4b5-08df15213f25
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:44.9152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpEsDX6BAFXpR+x+kfvGqwymLMFOWchl6W643oFk69PNMFO5X4Sjtd3NDhgalHGW+3W0S7kV9MTllBL6Exyp0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

The generic falcon bootloader reads its load parameters from a
descriptor that the driver places in DMEM. The r000 load-and-execute
bootloader event carries such a descriptor, so its handler in the
following patch needs the descriptor type.

The descriptor was defined in the FWSEC code, which was its only user.

Move the definition, unchanged, into the generic bootloader module. Its
fields become pub(crate) so that the FWSEC code can still fill them in.

No functional changes.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 .../nova-core/firmware/fwsec/bootloader.rs    | 52 ++-----------------
 .../gpu/nova-core/firmware/gen_bootloader.rs  | 48 +++++++++++++++++
 2 files changed, 52 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 1584a4b814d2..96ad223df16f 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -35,60 +35,16 @@
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
 pub(crate) struct FwsecFirmwareWithBl<'a> {
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
index 65af57a34940..943a5bc16e93 100644
--- a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -12,6 +12,7 @@
         Alignable,
         Alignment, //
     },
+    transmute::AsBytes, //
 };
 
 use crate::{
@@ -27,6 +28,53 @@
     num::FromSafeCast, //
 };
 
+/// Structure used by the boot-loader to load the rest of the code.
+///
+/// This has to be filled by the GPU driver and copied into DMEM at offset
+/// [`BootloaderDesc.dmem_load_off`].
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
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for BootloaderDmemDescV2 {}
+
 /// The generic falcon bootloader image and its IMEM load parameters.
 pub(crate) struct GenericBootloader {
     /// Bootloader code, zero-padded to a whole number of falcon memory blocks.
-- 
2.55.0

