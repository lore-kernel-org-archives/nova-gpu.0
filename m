Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A56238C2C0
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693697; cv=fail; b=H/8QNjc6Ou/VFyMa527t9ng9cLlBi+tKhFIMPTZLWpTCq3OGm/GFZEKUkMyI/EdYsOQ0bplp1ma3U1TsjB6DXgl6q/vXgl8u3bYfYu9UGw9yGxiZclQ4G6JaYKP9cCX0VB556r0FuV5Hb9/IwmvnFtBw4OGC2qtwzfsZRB+gk3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693697; c=relaxed/simple;
	bh=e9fmFWQJf7MYx3xvEKLbGJaipo3CXrr2Wefk6q4Q78s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FhZX1zTvfb/hHB9taNUKjXGM+889AK36qU8fmUDDSZEm23bJhzeLBfg5bU8DEXGJC1xboPa5ANMS2ISw36jUR5PqRjoQhj6Yy+1JNWtXmSdlqYE95u+xIL3FDGfILopEcQPSzs5lNbJaseaBAqB9cQFNfazMiXzBOtBTF9dOGfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oNseqHVH; arc=fail smtp.client-ip=52.101.193.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oNseqHVH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkXg+QpC4PKNAa2L4A/gArHtw9NIWDJGw757BZDrauwE5irxMagtSoUAFldwofHBJ6SGUXMTP/OIJdTpZE1e6aqBa04feomDyk7kBzGCyqiccjBNZknUkglLuuwiXx1gnoAdTWx2mDnR+P6J1755R7gB+Fja5xBWNdZJ3eF8VfRmrq2Z26JuUYVrYaiwg15GdtFylL0p4O2ihWjw4KYDc/o4BpojScwoidfQrjA+keiVUA21OElYJMgDaYNCp0TMvTywi7joH4OvBPGnFxWXasLmmz+FirY3r6V1QS6dieUU3m7cEVijzlScSLyJ6EFS0lWddtfXMpCACNCw4RSo9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1+G2MwNvW9WCcgd2lwFft1DvC+3NZJeMlFneowQ9VQ=;
 b=ZpM35Eh+/sORgHDUfJe0gQBxI4ujkwBZ7p4GlBLcSkRfzdy0FUeYT5415iWTm00Ds2foKZmn6DNgUaovvMSl3LW/OZWkvP7Qfmmszj431aJarVssZ5d1zR14UQHuCQeuZiA78lDMQJ/ExWL3YM0D7AP0t1bye2x7BEPGSbmf+POD5nLR5yCrRVRjKDappnBh2w8d79xL1rmaVVnAmSaecVJPw5rcbQxyJVrqnr5SvnsKf6k8JtLjPRo+2M4lg0CTBCMkC2p0Lla5oQx2ZApKdzp94m3qZ7EbTAZTa73QmimntylHl1l6hqFa2zACYEL5MU+05N/lHSSEQ8gJr3jTvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1+G2MwNvW9WCcgd2lwFft1DvC+3NZJeMlFneowQ9VQ=;
 b=oNseqHVH7VTR0F2lmGjnzhWZVIUggfqN5cPk1MRviJO5SJYU45Z/arvTgWqyCDaKA5DFB2DKvuSfw/WohkGN4em6+uNfJRCjVigETi6VN/6nSAT0oKWUcd0ZQJmh1EMuAOKc/ayvzAWwmzQglER1EWaU/Gim+S17nLBd7gV32qi6Uz6cRoA8i5R66/BfOz22TYn4MUQ8UWe3LfAFbsU3fryn5pAF/R1u20LoqsB1kMedHoqtRoYps889tSpF4XPEY3qZfhm1jVBzBFSKLPYiL4aqWmRIHYnmzl4DR/Ea2mgHLeg+cFsbYsD0RVkIwkIMcmQzA0RWvExZQzoIhqvRUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:42 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:42 +0000
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
Subject: [PATCH v3 14/33] gpu: nova-core: add the falcon DMA and suspend helpers for r000 boot
Date: Thu, 17 Sep 2026 18:07:00 -0700
Message-ID: <20260918010719.1176945-15-jhubbard@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4447e0fe-4531-499c-76a5-08df15213db0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|3023799007|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bPVCtKu1Y5IHVO16J0wUkNj88iCJZhaqGxxvqP4rN69HqHomyCyHse8Ao7RHLTkL3vRwXmwn8Z8q6KwEQ+BxFfD19W+Yh2UEKPjmQKPC1B08Jp3lpCuzCgurkFDQ144zvKJhTIbu6DaYfNxaG4PJaUXntVbcBRM6XMig0Hb6F1LzjcIOguYLVQ01nKfXRmnvQEUL+DxVWXVObyj0RsLuZnZXY7pTlH71slzrBLC8eT55lydVbrKfClrL4pyAczPl7iKaAfm0AFA9vM7+IKd8OuhXgkdmJmK9Qrn1zVrmN1hYaouNRE8v/GaPl00hQbv5qfqI5F3asdN2ou4ULM9jOIrZC9GxZEzqywoDdM7/V0wXhj3QgXVQeOd9KAcPwewnRdQ1gCa/UW0YKle280cer2PQt9fA77IMo0gVF7jDxQLgYvRsqqXzK5z+p7a5icsah2uzV2k0Rd7EnQNvshwpRsQYE5Xth/2XwoQrZkPglMmBGP51HMtMKSEOOTgs6z4INjSjZrkDEcxyGtmJwt/fK1eKj5/u4C17V4xVrcM+SGIhxJqfRDPmfJcNktZH/tF7VK14NVYTl6iV5iSp3JLNXd3816r1v+A3DTSbuWuzHLS12KqR4TGLBN5fWyjupCEWGuX89CEMFOZCyYuNqSfvNHowDwQvcICs0PMs1RJBVdI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(3023799007)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MasbjRp3A4NSGj7TP7bO3sDdSexh+6nbQLvMgDw+8ZeNWUk0A0gAb8GkZnjE?=
 =?us-ascii?Q?MSje/Z0ULeQoreWAx4Tq/V/Y10Ck5BFSdOsSpiMn+Pha6RBxGdDmK5kaJiSd?=
 =?us-ascii?Q?+oU+39pcqXHKo5+JfdfiE6J50XstMHr50zuqtda4wKpJFkqtspqs9C/E+lre?=
 =?us-ascii?Q?5iQBPdFifLDslExw+KVU+EeIzLJCqPPyINRtReX72Rhy1FuNzb2fDxagjPFb?=
 =?us-ascii?Q?uR6IH9N67X02kc1UsgDAQqju0jY88RHehZ5DWgWH3coivG2SejZac9CSf3BJ?=
 =?us-ascii?Q?aVE1ulv2x8OVjyxd00BWWhF/n2fA4QgMFRXv9GNNyVHCsB/u3AqOAwfvJZ54?=
 =?us-ascii?Q?+zyYXyutkooImXLJYEkA/KQzcchzjDkQ4FXs3AjxqFUh3ScmadW80/o69oNH?=
 =?us-ascii?Q?E89fBgzMLsYeI5FczqoHgi9qg/HqDb28Tctvmim0ft93qX4gNw6YSnGnCffO?=
 =?us-ascii?Q?xzdfQc9/O2QzOfWU093+LzHTOOd7mAKEcTCHK2TFgzFiYj5oKvZ0gMk8c8CC?=
 =?us-ascii?Q?YpKGcw8qQI1kHQVF+l19Bc6z4fEVAkSuPV0GUhc8vyCkZeHgO6KH4Xm7M2za?=
 =?us-ascii?Q?jVtNFOoOWzGpLC0zrKqdoKk03tG6zOKwN7UbTGKPQQsf5KLlA/NmBbG1IVrK?=
 =?us-ascii?Q?QRV4VuDcclgNGCiKGA33cxP4zovoTve2F7TTDZRXuMZHpqV2UvyynYqdzUzo?=
 =?us-ascii?Q?Ap8eng1MEvlCRDE/T9AOkq8MSaiH1+gEhIDFTpHDvYPNaiDnhAJwJAiYNfLq?=
 =?us-ascii?Q?Bp+fHAJbS65as9J0+vokI3+DEq3ZKnWMkFuBMcdVf2an08q6mLVTuF03SJ+J?=
 =?us-ascii?Q?zIdTLBOhy4AqUjJHShMTW9yCe4bdfdKBtVtlADH0T9cgB1YoZH7cljzzBTTz?=
 =?us-ascii?Q?jkl/s6B+gTtpgohiakOuCwsgxts79/EA2/JHqRHByEGWNf0lWYmzgYH0RHRW?=
 =?us-ascii?Q?sT0NBE9Ex7SNiEIN7L8O62nYaqmYYKk7YdoZuWatuKt+D62TqKv5ZQGg+oOz?=
 =?us-ascii?Q?cUFz8hAKD/j7c02fbmNpQRSMDpktleLZUpiO/hT0TiMAScIwQD8NDmLMn9U0?=
 =?us-ascii?Q?JzG6zrb9V60XZGyOXJi3t1qciLsePWo/L7eV19MudRhP7wG8kZ7XUpEver1z?=
 =?us-ascii?Q?LWlDmGSJbSMWIfWwNVevuRKD/4ZrbFQkhLsA3nsMkoINr8JdSG5oOZIryzZx?=
 =?us-ascii?Q?vALLyD8SwNcrrfn51T6eCWBjw4Nx+Ku80hmquQRdqvAAfTmE8PlW7bqGzeWp?=
 =?us-ascii?Q?JW/2HxHfCGd7/9G9+0uUxE0JjnEKpUyekGBEq1cREv3O9L2PN038Nnzfa7zt?=
 =?us-ascii?Q?l3RO0FzGjLQielpOAgOt8oKzKwZHOaGLssQlHGhmWMKxm10cYDqV1/NXFRDK?=
 =?us-ascii?Q?h9HQeUw8K3TyBGgyJkwFAA+HIykejAfofSbsf16vvUyPbdSSanNZ5tqwOT9j?=
 =?us-ascii?Q?Hs37SVOtfbkQVQZ0goBFHDlWkbjLHToZWKwWspGRL9lf1e/iK37O/Rh+2zXG?=
 =?us-ascii?Q?9xS+0e8Cd+lme7mmKBsIjQD9/E0ND37SnYH3DYDNuGXUuCc874tmjg8okLtK?=
 =?us-ascii?Q?c5vcfN+SoIMAgezbtRXtd0ZYSzeQmXa8sbA7kcXiAQptVcyhTFuZgaRJbURm?=
 =?us-ascii?Q?PRZFPTz1d+bpjOKqEtKUbDb0taitJagEhpE8QZOKW1yY8ePmdI8eVplyEHe6?=
 =?us-ascii?Q?QCGjOv6+Q3eg00C1IvJgWOViZwU9zhobvxxezaEDuRHWw7dvolFJvRKcrTT5?=
 =?us-ascii?Q?bENM8l3nFg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4447e0fe-4531-499c-76a5-08df15213db0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:42.6181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9JshsNxFUpO0kTTpm7UP8ru/h/spsz11lf0utKyTWvdu++cmTj/hO5qxAIF6/18FHnO25lJ0HwhVb4fcxkZ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

The r000 boot protocol has two load-and-execute events. In each, GSP-RM
names an image that it has placed in the framebuffer, and the driver
copies the image into the GSP falcon's memory by DMA and runs it. The
event supplies the image's framebuffer address, and the copy goes
through a context DMA slot of the falcon's framebuffer interface. GSP-RM
also reports that the GSP's RISC-V core has suspended through a bit in
the falcon's MAILBOX0 register, rather than through the halted bit in
CPUCTL, and the driver has to wait for that bit before it resets the
falcon.

Nova-core's falcon DMA copied only from a DMA object that the driver had
allocated, so there was no way to copy an image from an address that an
event supplied. The shutdown path read the suspend bit inline, so there
was no wait for it that a boot event handler could share.

Add a DMA transfer that copies from a caller-supplied source address
through a caller-supplied context DMA slot. Add a check of the suspend
bit and a wait built on it, and make the shutdown path use the check in
place of its inline read.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs   | 150 +++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/boot.rs |   6 +-
 drivers/gpu/nova-core/regs.rs     |   2 +-
 3 files changed, 151 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 04e35cbcb6f0..2a0fe86153aa 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -5,6 +5,7 @@
 use hal::FalconHal;
 
 use kernel::{
+    bits,
     device,
     dma::{
         Coherent,
@@ -20,7 +21,7 @@
     },
     prelude::*,
     sizes::SZ_4K,
-    time::Delta,
+    time::Delta, //
 };
 
 use crate::{
@@ -43,6 +44,9 @@
 /// Alignment (in bytes) of falcon memory blocks.
 pub(crate) const MEM_BLOCK_ALIGNMENT: usize = 256;
 
+/// DMEM virtual address value that means "no virtual address assigned".
+const FLCN_DMEM_VA_INVALID: u32 = 0xffff_ffff;
+
 bounded_enum! {
     /// Revision number of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
     /// register.
@@ -132,12 +136,36 @@ pub(crate) enum FalconMem {
     /// Secure Instruction Memory.
     ImemSecure,
     /// Non-Secure Instruction Memory.
-    #[expect(unused)]
+    #[expect(dead_code)]
     ImemNonSecure,
     /// Data Memory.
     Dmem,
 }
 
+/// Where a raw falcon DMA transfer reads its image from, relative to the DMA base address.
+#[derive(Copy, Clone)]
+pub(crate) enum FalconDmaSrcOffset {
+    /// The image starts this many bytes past the DMA base address.
+    Offset(u32),
+    /// Virtual address of the image in the target memory. The DMA engine tags each loaded block
+    /// with this value and adds the tag to the base address, so the base address must be the
+    /// source address minus this value.
+    Va(u32),
+}
+
+impl FalconDmaSrcOffset {
+    /// Returns the source offset of a DMEM image at virtual address `dmem_va`, or the start of the
+    /// source when `dmem_va` is `FLCN_DMEM_VA_INVALID`.
+    #[expect(dead_code)]
+    pub(crate) fn from_dmem_va(dmem_va: u32) -> Self {
+        if dmem_va == FLCN_DMEM_VA_INVALID {
+            Self::Offset(0)
+        } else {
+            Self::Va(dmem_va)
+        }
+    }
+}
+
 bounded_enum! {
     /// Defines the Framebuffer Interface (FBIF) aperture type.
     /// This determines the memory type for external memory access during a DMA transfer, which is
@@ -600,6 +628,98 @@ fn dma_wr(
         Ok(())
     }
 
+    /// Transfers `len` bytes from `src_addr` into this falcon's `target_mem`.
+    ///
+    /// `src_addr` is a GPU physical address reached through the FBIF aperture, so the caller must
+    /// program `NV_PFALCON_FBIF_TRANSCFG` for `ctx_dma` before calling this.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if `ctx_dma` is not a context DMA slot that the falcon has, or if `src_addr` is
+    ///   not 256-byte aligned.
+    /// - `ERANGE` if `src_addr` does not fit the `DMATRFBASE` register pair.
+    /// - `EOVERFLOW` if a per-block source or destination offset exceeds `u32`.
+    #[expect(dead_code)]
+    pub(crate) fn raw_dma_transfer(
+        &self,
+        ctx_dma: u32,
+        src_addr: u64,
+        target_mem: FalconMem,
+        src: FalconDmaSrcOffset,
+        dst_offset: u32,
+        len: u32,
+    ) -> Result {
+        const DMA_LEN: u32 = num::usize_into_u32::<{ MEM_BLOCK_ALIGNMENT }>();
+
+        if src_addr % u64::from(DMA_LEN) > 0 {
+            dev_err!(
+                self.dev,
+                "raw DMA: source address {:#x} not 256B-aligned\n",
+                src_addr
+            );
+            return Err(EINVAL);
+        }
+
+        if src_addr >> 40 > u64::from(regs::NV_PFALCON_FALCON_DMATRFBASE1::BASE_MASK) {
+            dev_err!(
+                self.dev,
+                "raw DMA: source address {:#x} does not fit DMATRFBASE\n",
+                src_addr
+            );
+            return Err(ERANGE);
+        }
+
+        // An IMEM block is always tagged with its source offset. A DMEM block is tagged only when
+        // `SET_DMTAG` is set, so a DMEM virtual address sets `SET_DMTAG`.
+        let (src_offset, set_dmtag) = match src {
+            FalconDmaSrcOffset::Offset(offset) => (offset, false),
+            FalconDmaSrcOffset::Va(va) => (va, target_mem == FalconMem::Dmem),
+        };
+
+        let num_transfers = len.div_ceil(DMA_LEN);
+
+        self.pfalcon
+            .write_reg(regs::NV_PFALCON_FALCON_DMATRFBASE::zeroed().with_base(
+                // CAST: this drops the upper bits on purpose. They are written to
+                // `NV_PFALCON_FALCON_DMATRFBASE1` next.
+                (src_addr >> 8) as u32,
+            ));
+        self.pfalcon.write_reg(
+            regs::NV_PFALCON_FALCON_DMATRFBASE1::zeroed().try_with_base(src_addr >> 40)?,
+        );
+
+        // The `CTXDMA` field holds exactly the indices of the falcon's `TRANSCFG` slots, so the
+        // field's range is the bound on the slot.
+        let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::zeroed()
+            .with_size(DmaTrfCmdSize::Size256B)
+            .try_with_ctxdma(ctx_dma)
+            .map_err(|_| EINVAL)?
+            .with_falcon_mem(target_mem)
+            .with_set_dmtag(set_dmtag);
+
+        for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
+            self.pfalcon.write_reg(
+                regs::NV_PFALCON_FALCON_DMATRFMOFFS::zeroed()
+                    .try_with_offs(dst_offset.checked_add(pos).ok_or(EOVERFLOW)?)?,
+            );
+            self.pfalcon.write_reg(
+                regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed()
+                    .with_offs(src_offset.checked_add(pos).ok_or(EOVERFLOW)?),
+            );
+
+            self.pfalcon.write_reg(cmd);
+
+            read_poll_timeout(
+                || Ok(self.pfalcon.read(regs::NV_PFALCON_FALCON_DMATRFCMD)),
+                |r| r.idle(),
+                Delta::ZERO,
+                Delta::from_secs(2),
+            )?;
+        }
+
+        Ok(())
+    }
+
     /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
     fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(&self, fw: &F) -> Result {
         // DMA object with firmware content as the source of the DMA engine.
@@ -653,6 +773,32 @@ pub(crate) fn wait_till_halted(&self) -> Result<()> {
         Ok(())
     }
 
+    /// Returns `true` if the RISC-V core has suspended.
+    pub(crate) fn is_processor_suspended(&self) -> bool {
+        const INTERRUPT_PROCESSOR_SUSPENDED: u32 = bits::bit_u32(31);
+
+        self.read_mailbox0() & INTERRUPT_PROCESSOR_SUSPENDED != 0
+    }
+
+    /// Waits until the RISC-V core has suspended.
+    ///
+    /// The caller must write `MAILBOX0` before starting the core, or this returns as soon as it
+    /// reads the previous suspend.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if the core has not suspended within two seconds.
+    #[expect(dead_code)]
+    pub(crate) fn wait_for_processor_suspend(&self) -> Result {
+        read_poll_timeout(
+            || Ok(self.is_processor_suspended()),
+            |suspended| *suspended,
+            Delta::ZERO,
+            Delta::from_secs(2),
+        )
+        .map(|_| ())
+    }
+
     /// Start the falcon CPU.
     pub(crate) fn start(&self) -> Result<()> {
         match self.pfalcon.read(regs::NV_PFALCON_FALCON_CPUCTL).alias_en() {
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 4fb1b69ac9d5..8518248c9732 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -2,7 +2,6 @@
 // SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 use kernel::{
-    bits,
     io::poll::read_poll_timeout,
     prelude::*,
     time::Delta,
@@ -94,10 +93,9 @@ fn shutdown_gsp(
         cmdq.send_command(commands::UnloadingGuestDriver::new(mode))?;
 
         // Wait until GSP signals it is suspended.
-        const LIBOS_INTERRUPT_PROCESSOR_SUSPENDED: u32 = bits::bit_u32(31);
         read_poll_timeout(
-            || Ok(gsp_falcon.read_mailbox0()),
-            |&mb0| mb0 & LIBOS_INTERRUPT_PROCESSOR_SUSPENDED != 0,
+            || Ok(gsp_falcon.is_processor_suspended()),
+            |suspended| *suspended,
             Delta::from_millis(10),
             Delta::from_secs(5),
         )
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 69dd6526e469..feb37de69be5 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -203,7 +203,7 @@ pub(crate) fn usable_fb_size(self) -> u64 {
     }
 
     pub(crate) NV_PFALCON_FALCON_DMATRFCMD(u32) @ 0x00000118 {
-        16:16   set_dmtag;
+        16:16   set_dmtag => bool;
         14:12   ctxdma;
         10:8    size ?=> DmaTrfCmdSize;
         5:5     is_write => bool;
-- 
2.55.0

