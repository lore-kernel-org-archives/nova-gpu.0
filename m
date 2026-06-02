Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830F83546E9
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370495; cv=fail; b=qYB5jvvAYC/423DRKIhytWauq+OVujql6Xmj+WKXgEX3ax+wne5VQYKnVhiOoX7V+9vKuNxA4i3z0NWPSqGRcxgjl8D5mOMZmuBVO+/YAui7S/61qWTxJ7g0qJJC77KoEf2QFTIIJd3IxD3e/Lixc9MbH9qF3yi/fGQngs9nSsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370495; c=relaxed/simple;
	bh=6rU1IzzsO4HkJGj+2GXv9hi+w0KXVzzzkOKOBgl247w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H5pU78A8Tze7PPewVlDk9TbH63sEh5mnbVKLtkNiwb1oMuna2CwgyTGbgcRVE9itVRQVHcN+aue8lnZo0byvlLxMjrd6IcPMHlOxYBh1o6H4dyIvBakETs3NpvwC5ZCT630WyOq7w31a5zWTUTejW2DG7oDISTLMidVrpRowueM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oD0kpcJY; arc=fail smtp.client-ip=52.101.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oD0kpcJY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLDwkB+jq6X5VNoC8jEkMi/sbiSwyi6zaff2TCC40hKA1oWzC8X8RPSlvy5lJJ4yC3ZBz5+NCjzDIQ5hWhH/2Oq+0/pEQFpgzudUcoV+YTwXQf9TaVgTjXqwVObWRdIkCuoHdAmmhCFego/QdQuLftJTmQu86TX1ArZWB4+tnZN5q2dv36SyUSvg7RthstK1IfUbxL7hy59G+OJNcjydR2wMsskz1H2wyvj+nMO+w7mk7Gl6GaM/wyoRkijupTCn5IkLek7uBlhLnte/w7R4zoj25d27KUQTnQTcXLHocnM1wIFpwxlv4tanKYJYBuoEfKb02hXs63GDvsBIiAhpVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxYmnJ3w3dazDeMaM5XxMVtYMTwnzmzF5zR1QemVAes=;
 b=SFmC+b/ucR/pkwzHjU0YiVA8jXODm9gEo0iWTdSjb9jj73/VUEVTcmp84j7xn/6zWuyHMaqHle5nUW1BQ8KiFCOjkrGNKKSYoyXfpI4+A7Q9JkKrftIpPAvf3ZwnJD1oysNxdlMBCOrsUfq0LLh1VTwdjHVe0S7VIAkA8lIOmgCF4AkxbL6QJzP3/J8YUcq0OxwN29z8S/zonPd33cxMjVKdgsrjcslmMQjxFVqMGEq2X3jw7FnHnBzGf1Sn95cvdIaq6DHB0ZG2+2fUoc9byJkSx7Fexan7Y8SZBE8MKXq1ZX/6lrN7jNrPzt+phr774xHk1q4MN3yxxTsXeaKADg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxYmnJ3w3dazDeMaM5XxMVtYMTwnzmzF5zR1QemVAes=;
 b=oD0kpcJYijNdFtUYRYMmWbXp6k1vvGqzOIIsGy5UtkU9V9XEBHADXW4s9mmVZ5YSkq9chExKucNjuZV0rHowMwQ791cSMSmJARHGIZEY1n+mHnpVS2M8EgvNvdNPCRbDpekny9FrtYHHc1Z/KVq+0FdyXzWw+T1SaRl4As34G0rANJj8WojgeX7eCT53R/8WwKtVEY4g2JdQ35/CQJpOHz0BRUmb2+jN9qFlR0XpdATi/9TC8vVk/brynBFmTVhywY34iKPRBLMxWeNJrSRMctCtNu8fUM3tUgFDFGD6CdpKctCbOTMxBWX0dRfgOxCtE60pW6EfJyaXoouZtpN0Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:21 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:21 +0000
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
Subject: [PATCH v12 06/22] gpu: nova-core: Blackwell: use correct sysmem flush registers
Date: Mon,  1 Jun 2026 20:20:54 -0700
Message-ID: <20260602032111.224790-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e318622-f780-4e34-b713-08dec05604c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	DYisu5DYywU3AlK7a25EGIDENXZ9U2DhzO6qDeNJrelUaHUKK62Ll4C+jekabkSiV/hvsIMWxsb+ceDO3aiSOy/76ePmErqrS+RcegaqOfpUfHFRofn42tNwk8wgDteY/N+XryCOVDNHlFMHtNfzP2v45F7rWoCxazYoj+87jrf3j93OtwVXRiiMjcS4ReY1dVielXA1W/YDPwKuIUk+bg7wrw5c8S1YRkQFC4uyswLVYgOriPCMvF2bCSxFjATF2wT/rTYYCcH+hqUG6y99T4IkcrYrITXQnR9TkGm/O2vhoHbTGuTsBfhGMgeV75+SQOVyYQP+ezZCVLaNeG5JqJOS+txWzDUyrNVgFrr+MrL1kcd+kIf3D3mHW3Og/mIyZImANcUoqEtJWhxGt4jkb/6EbHDBjU8I+RxG3VJzeUwqOnpAbxZnIPjrB9MnE1ssqopf4/Ku2KQGFPHlZ/J4uWO/MtDUYis8XjbodFtyHRHgmh90NcFTtfHxDYA7ISkiwD1qDU5faJTL5h9qCTakyK0/+DCaI9ZIB+tgn6Su+D5BHO+kkrLIwkIc9o6hsxz2UmNtvMndKrl7TP91D0RL49tJc5pJWi3spxQ940lN9dt8frW7GVkgAINskFxfKls9sQ9rAhwLnkNBIcpuoJEcmFVYKaRDbhnX9H4WydZXdZtXAfZvvQUu6Gw8lG9DXcYH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/wmasXDSNRj1vid4qwcZYNZgd0XJQkv+bOZyKyeIwnXg3Bgno0Tj4v85QQO5?=
 =?us-ascii?Q?cn8jLIiucf+RoU07n0b0QfH/S2xXwQWcFoA794weGd/a5RAaS8ZqCsB89Sjq?=
 =?us-ascii?Q?XoaUZo6AgO+N9GpK2Cktyp8tfD2bmcOY17Eh7G5J/nAnS9jMi890BMT8agx+?=
 =?us-ascii?Q?+DPrtBOCiXlrrgpveHvuEZ4h5m8HqYGf163eD/CVt3RTXm7iDNLzF0fyodgr?=
 =?us-ascii?Q?taikNRiZh3G3PnkkbThLLJnpqtJ3VvDXxk3BQU5As1gdtUBbV6tAelozsfEP?=
 =?us-ascii?Q?3N6ozMULBw1u7Q359GiJwoi+REXokAShsoLYeoR6xZHOX0Hv3xIO/EDvLXsX?=
 =?us-ascii?Q?hUKtmx1KFXmGdz0dZ/Tu+NVTshg8j1Frud/0Aeg3yqtKt3gYoUBv7ff1jEof?=
 =?us-ascii?Q?49WsAQxpeoUtaA0QGJudTh642K1J2kHCI/7l3SWJRElIXNTO41mRkYS8falV?=
 =?us-ascii?Q?z6kuIrO8bYez60ES0RFAPunyu3aguefLXNNG0+DFlV5zZ53z9lSE7jo7iti0?=
 =?us-ascii?Q?30SageWRU9nG1vsqfwaGXW3/FSQEzS+eLPpqfoYSzu1n5IQqxOVTEhS4mPhP?=
 =?us-ascii?Q?YGrZIKFviL0tXtyUJ5K6pPvaMUDdBpzeQUtI1HcSHU31erSSQQgAuxfn6DOo?=
 =?us-ascii?Q?c44Vsbzijiv3CUYImthmApnV4m71DMts7inOCvNYHEnb6llKHmxygcQ8ucZs?=
 =?us-ascii?Q?36jgeMqpqkYLLMNpNLkVuyOGF2pKz89i4Fa7OfpZzW0TE8M48q6fiOv8K1do?=
 =?us-ascii?Q?1nOIKjx6B8ey/NnKd2k/XrWmJDujKQzN/MgyLWZbENVDm7ZdygGqrEGa5m7K?=
 =?us-ascii?Q?JP4H8KZbm+3EPRRhhEcjGSkavWWdCKgbMsYd71i8c6lCV2ZSU46KG1vQEQ4r?=
 =?us-ascii?Q?kFR0g7x1v6/XZ+rwwTLul8PdZsq4Zcf4A1MCjU3DC5iv1FdEdS4v+XKbE491?=
 =?us-ascii?Q?0lqPcWiwvLc5VY3D5+N0m6a5RON5sf3OjRWeqtopidBGi5RDa9XzPf1qKLAj?=
 =?us-ascii?Q?aqP+g08KYHy5C0lCYhv/FP1oV9fTpPI1p0/SPz54JfIg/8YI7C5r83HF/ldx?=
 =?us-ascii?Q?bW3UuXWFSBczoW28qrHJj9FI8/BVDXI3DpBgp9jzVQ65dAlNruCQmu558LMO?=
 =?us-ascii?Q?QPdQvgBjZxylNum80cANiFzNPi1YtOQ4Kx/sFFI/EceMONs8asolWGlrpZm7?=
 =?us-ascii?Q?uZ9NDbR9StmhA4KrYjAd4Uq5u7zqVQkMMopWaDkHVkcEzYRvH7HjGFEC64oE?=
 =?us-ascii?Q?cXxN9vJ6RsInXWA5dYQpGQbCAjo0Axy2Pmglw+VXLdd1K2q//QSxH1vW75Ep?=
 =?us-ascii?Q?/Afm5LVX1q2dOaLJvkf+3rwrJstAqrm2hwhe5/zKO+9w96dhGuD7pKhzi1qx?=
 =?us-ascii?Q?7OE4WRph7hPgbIL71wBn40mgBZsC4tR5coWUK8VVubdSdaWIGFU6uFCDCbAy?=
 =?us-ascii?Q?7Y7XGG6tmG17MpSLInLprXDaCXTZ0OUavmG6nUufQwyGwpOxxWJ39uvDlo8k?=
 =?us-ascii?Q?SNTFknxOKlHlsS5J3P+N4kXBcErbGkFnd80Z3G9tLrQ/YH3WJhUFeA90+iyA?=
 =?us-ascii?Q?F524cgKmA3qBkmtYNzWkqLDAa1lc76xtfruDH2/Yk8mjLM6+FJ8as3nZEi57?=
 =?us-ascii?Q?hdg1JJxcitYCXWWfr7VBtm2snKIeju2+tWMsOIC5DfSX1BaDxFSKQk0bMWpT?=
 =?us-ascii?Q?nXnmCDUbOPEA7O7p2CgSPmhkAhKThcKcfXXswt64DxP9yOc6UwaYPnMj7aaK?=
 =?us-ascii?Q?PD9b3JlNlA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e318622-f780-4e34-b713-08dec05604c3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:21.4024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RlxEXzeyKvJGMH2dcpoarNaxr6j6sjW1Ott7H99RLLV2GovIYuzrNddRa8EEBoE/5OOCyjLzEcN0mtz6iuZr9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

Blackwell GPUs moved the sysmem flush page registers away from the
Ampere/Ada location. GB10x routes the flush through a pair of HSHUB0
register sets (primary and egress) that must both be programmed to
the same address. GB20x routes it through FBHUB0.

Define these registers relative to their HSHUB0 and FBHUB0 bases, as
Open RM does, and implement the flush paths in the GB10x and GB20x
framebuffer HALs.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal/gb100.rs | 66 +++++++++++++++++++++++++--
 drivers/gpu/nova-core/fb/hal/gb202.rs | 49 ++++++++++++++++++--
 drivers/gpu/nova-core/regs.rs         | 45 ++++++++++++++++++
 3 files changed, 154 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
index 8d63350abf8a..ecea4ff446ff 100644
--- a/drivers/gpu/nova-core/fb/hal/gb100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -4,6 +4,14 @@
 //! Blackwell GB10x framebuffer HAL.
 
 use kernel::{
+    io::{
+        register::{
+            RegisterBase,
+            WithBase, //
+        },
+        Io, //
+    },
+    num::Bounded,
     prelude::*,
     ptr::{
         const_align_up,
@@ -15,11 +23,61 @@
 use crate::{
     driver::Bar0,
     fb::hal::FbHal,
-    num::usize_into_u32, //
+    num::usize_into_u32,
+    regs, //
 };
 
 struct Gb100;
 
+impl RegisterBase<regs::Hshub0Base> for Gb100 {
+    const BASE: usize = 0x0087_0000;
+}
+
+fn read_sysmem_flush_page_gb100(bar: &Bar0) -> u64 {
+    let lo = u64::from(
+        bar.read(regs::NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::of::<Gb100>())
+            .adr(),
+    );
+    let hi = u64::from(
+        bar.read(regs::NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::of::<Gb100>())
+            .adr(),
+    );
+
+    lo | (hi << 32)
+}
+
+/// Write the sysmem flush page address through the GB10x HSHUB0 registers.
+///
+/// Both the primary and EG (egress) register pairs must be programmed to the same address,
+/// as required by hardware.
+fn write_sysmem_flush_page_gb100(bar: &Bar0, addr: Bounded<u64, 52>) {
+    // CAST: lower 32 bits. Hardware ignores bits 7:0.
+    let addr_lo = *addr as u32;
+    let addr_hi = addr.shr::<32, 20>().cast::<u32>();
+
+    // Write HI first. The hardware will trigger the flush on the LO write.
+
+    // Primary HSHUB pair.
+    bar.write(
+        regs::NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::of::<Gb100>(),
+        regs::NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed().with_adr(addr_hi),
+    );
+    bar.write(
+        regs::NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::of::<Gb100>(),
+        regs::NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr(addr_lo),
+    );
+
+    // EG (egress) pair -- must match the primary pair.
+    bar.write(
+        regs::NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_HI::of::<Gb100>(),
+        regs::NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed().with_adr(addr_hi),
+    );
+    bar.write(
+        regs::NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_LO::of::<Gb100>(),
+        regs::NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr(addr_lo),
+    );
+}
+
 pub(super) const fn pmu_reserved_size_gb100() -> u32 {
     usize_into_u32::<{ const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ_128K>()).unwrap() }>(
     )
@@ -27,11 +85,13 @@ pub(super) const fn pmu_reserved_size_gb100() -> u32 {
 
 impl FbHal for Gb100 {
     fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
-        super::ga100::read_sysmem_flush_page_ga100(bar)
+        read_sysmem_flush_page_gb100(bar)
     }
 
     fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
-        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+        let addr = Bounded::<u64, 52>::try_new(addr).ok_or(EINVAL)?;
+
+        write_sysmem_flush_page_gb100(bar, addr);
 
         Ok(())
     }
diff --git a/drivers/gpu/nova-core/fb/hal/gb202.rs b/drivers/gpu/nova-core/fb/hal/gb202.rs
index 542c1d7429e9..fa5c3f7f2b2e 100644
--- a/drivers/gpu/nova-core/fb/hal/gb202.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb202.rs
@@ -4,24 +4,67 @@
 //! Blackwell GB20x framebuffer HAL.
 
 use kernel::{
+    io::{
+        register::{
+            RegisterBase,
+            WithBase, //
+        },
+        Io, //
+    },
+    num::Bounded,
     prelude::*,
     sizes::SizeConstants, //
 };
 
 use crate::{
     driver::Bar0,
-    fb::hal::FbHal, //
+    fb::hal::FbHal,
+    regs, //
 };
 
 struct Gb202;
 
+impl RegisterBase<regs::Fbhub0Base> for Gb202 {
+    const BASE: usize = 0x008a_0000;
+}
+
+fn read_sysmem_flush_page_gb202(bar: &Bar0) -> u64 {
+    let lo = u64::from(
+        bar.read(regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::of::<Gb202>())
+            .adr(),
+    );
+    let hi = u64::from(
+        bar.read(regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::of::<Gb202>())
+            .adr(),
+    );
+
+    lo | (hi << 32)
+}
+
+/// Write the sysmem flush page address through the GB20x FBHUB0 registers.
+fn write_sysmem_flush_page_gb202(bar: &Bar0, addr: Bounded<u64, 52>) {
+    // Write HI first. The hardware will trigger the flush on the LO write.
+    bar.write(
+        regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::of::<Gb202>(),
+        regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed()
+            .with_adr(addr.shr::<32, 20>().cast::<u32>()),
+    );
+    bar.write(
+        regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::of::<Gb202>(),
+        // CAST: lower 32 bits. Hardware ignores bits 7:0.
+        regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr(*addr as u32),
+    );
+}
+
 impl FbHal for Gb202 {
     fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
-        super::ga100::read_sysmem_flush_page_ga100(bar)
+        read_sysmem_flush_page_gb202(bar)
     }
 
     fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
-        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+        let addr = Bounded::<u64, 52>::try_new(addr).ok_or(EINVAL)?;
+
+        write_sysmem_flush_page_gb202(bar, addr);
 
         Ok(())
     }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 356fbf364ea5..b39647684dd1 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 use kernel::{
     io::{
@@ -147,6 +148,50 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
     }
 }
 
+/// Base of the GB10x HSHUB0 register window (`NV_HSHUB0_PRIV_BASE` in Open RM).
+///
+/// The base is provided by the GB10x framebuffer HAL.
+pub(crate) struct Hshub0Base(());
+
+/// Base of the GB20x FBHUB0 register window (`NV_FBHUB0_PRI_BASE` in Open RM).
+///
+/// The base is provided by the GB20x framebuffer HAL.
+pub(crate) struct Fbhub0Base(());
+
+register! {
+    // GB10x sysmem flush registers, relative to the HSHUB0 base. GB10x routes sysmembar
+    // through a primary and an EG (egress) pair that must both be programmed to the same
+    // address. Hardware ignores bits 7:0 of each LO register. The boot path uses a fixed
+    // HSHUB0 base, so the multiple runtime-discovered HSHUB bases are not needed here.
+    pub(crate) NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ Hshub0Base + 0x00000e50 {
+        31:0    adr => u32;
+    }
+
+    pub(crate) NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ Hshub0Base + 0x00000e54 {
+        19:0    adr;
+    }
+
+    pub(crate) NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ Hshub0Base + 0x000006c0 {
+        31:0    adr => u32;
+    }
+
+    pub(crate) NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ Hshub0Base + 0x000006c4 {
+        19:0    adr;
+    }
+
+    // GB20x sysmem flush registers, relative to the FBHUB0 base. Unlike the older
+    // NV_PFB_NISO_FLUSH_SYSMEM_ADDR registers which encode the address with an 8-bit
+    // right-shift, these take the raw address split into lower and upper halves. Hardware
+    // ignores bits 7:0 of the LO register.
+    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ Fbhub0Base + 0x00001d58 {
+        31:0    adr => u32;
+    }
+
+    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ Fbhub0Base + 0x00001d5c {
+        19:0    adr;
+    }
+}
+
 impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
-- 
2.54.0

