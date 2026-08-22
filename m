Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F57F263F5D
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363717; cv=fail; b=k1zehjmyhlbllKG9zO7OZZBS53R+aqgR8L6pQrBl7xP50LJ4z3kptGQUGMwcQKIn0WiqnfBbvifrnU4vHyi4LNhHmJirnSzM3Qg6UlyW29zgYo6gSymQFZ8rHhGlHA40rWgCmfcgX2OsG3ShhB5YzRCrP4urCIn7//KQ7igQx2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363717; c=relaxed/simple;
	bh=cqrCfu532JmpO9GPBRQGjMfyHLu0psg4KIybFGuP6kQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J64PU5IA6KZpJavpjbtKakSR+OXvnRsu+w9ucYNUA6lYrLH8h2mDf74z6z3VHQ/iYTIVqKT23f/LlO5yRSRxwrswD0Z2/aLC9h/gGFzDefSGu/5Wn/PPFJwZvJS5bvyAyt40quVfdpT4wkV5Q8ctbim5RHC6WAa5CCiSQEAtwBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kVUHi89x; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kVUHi89x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yt8uZVTsBwbd6TMIQpH+bv1+ovUOd2HJLNCpOSWQiu3OvjovukIVPudj+gEnxjgkkMMV8StLDGXzOhwL0JqxIa5I0bAaAHl87l/nqcvOmnyb+MCyY8qEvtlvlO1CWkm99Hl8oL0w9bs42vqjs/z3G7UI9ZXlCfvEy7ViV+u5IZ6JYo9/PsYFjZxiL/Yr56jeSxJGGvc5mc5vtyQVXtoRRjCPNcDW9UEeVE/2BehM6WWuDOpBPZQVTtUSCGH6bddDD8jAWz5AgAqZpHWmymrKIq1HyqhlIhNuXB0ELBD3PtsfbzcNbc8RHjWonQZNHosso7/BS/90qpZgQPncjsVVTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vFTOd8UStk4lXAO1PurbocpzFoywile9s6Ko2JKXSs=;
 b=A1gAOcOZ1w/Wf056cQWtMq+NOsSNJ8hUVc/lQmBF3SAG0tOT6IyO6ulyAYps3o7LpL91rpSWjmFFqgcixvMEoXUQnYhfN5Y2XAUMnfT3/TSjbKgFFmQP2l6xCwykuISmsHdOaSF/LsL14prOuyxeVbl03tfqRZo/EL1oq4PHOu2wNuhLNY7WASaCttkOnHgCu4O2v5Q3i3KlWLAqvJA/eJfTB9MvPJKFolTtYPeSpNPlqKUbBsuLVz0xsegB9r5ECRhlyctpYXSFWl8xoYnd0i590TB9G0jgtI38gdQWPCUj6zCbMnqoShUqGfAr5elJQjW7Gty0wO/otX/kreG5xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vFTOd8UStk4lXAO1PurbocpzFoywile9s6Ko2JKXSs=;
 b=kVUHi89xyUbxWK5U7Y/jq0+3maO2Fc9CxUpYJnaPaW7I9CSP3Rc8Gp28k8OiSbj5oCCofjZyO/+LNytxxZhE8Fta2SmR8PcBjb9YLCXaPjH54jlXxSvnEn+nHBWbhu9uY+NS5V9RFqqQgLKWnlwAcaY3ATBA03WRv+NekbfwudEkEbAP6BaAX1Cba4czxY3ivCxB71foS2LuCkrWWaJ0kPCNJMukdSIsvYrmwUEgTsLdmUXB9Iy1Wy4SWXxq2Kf0nlgI3tue4Ox8llkX/kaB5WC2vgnvdl8ivTddiQed8DNFhr9AcJyIoRoaVdL2LO0M+XEafMn1RB+QkBRi+Ems+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 01:55:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:05 +0000
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
Subject: [PATCH v2 03/31] gpu: nova-core: extract radix3 page table into its own module
Date: Fri, 21 Aug 2026 18:54:20 -0700
Message-ID: <20260822015448.238214-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e680cf-c264-44b3-81f5-08defff06305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9fqXxfpTAwzkP/yFfE/ZEHEvXv9oqdX6+XkcTa4QydMhq9xX5wYyn7YFTLaaXK5YAZFawVz8ST6Z9GpQHP9C2bwMvLK2a43tw/OCBPtlbyHEoJ7ztZaeMxzWpKpQm9hVdnU8SfKLLDpHM2NGwzVbuZ6NMoAXxocAHOOIxOng9k8DBQv5B7cCZcWxZeEKsG8sfF/J9S00jbp4yMY5YWS8X+caiRra6ekCHUu9JBrV5aAEHQZbrRVAz3vRbuyJoNGrLYN/CkL97AFR3mcK3LiHh1vGJqQHXBF1PC7Wuwb/N57PjJiwroldUfixaxtfMfqrntMi5q+HuF3gnFQMbvrvYb3prPOtL/PqhaLzM9breC/zXd6Dcv1ictGVhqmqCkGJv9QGJ2WSgNq9QvLPNRKgF5OfqTpCIk0x9T3+UY7QVxFhhW7WzXJefWnpjfjHH4rsKm7SQUcoOutGarLjamAR0SjcJWRRpM6Tc1B+cLfjPk/JAm3623j3A4+9mFJ7uNMs0qxRnVha5hB7PtHPS0z7bvgUNGBCIZb1m0uhZOJG2aB/cEQ8U9UOwxpPyC36/yTvrwnRPyLraxhFvtbYARE71FA61f2gaiVIRai+cX1TVzdv8YvOjW68dfdjfXn7L3rYMX3TO3oxMdzvbLs4qOawbevqHAY4BnjCACHkkWzf9Yo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i2+raA2Nl/K3mhZISkVats8kw+jIwmsfr3jWzoWhbK5ax8DhpSkZ0xtjc7K8?=
 =?us-ascii?Q?kx3E2YNHolz2FwigIbe5yHw5eYv190lqSjLpyyBpGu7+jjQNpwhEH3y99UeJ?=
 =?us-ascii?Q?0cxrnLWeIMZ7XBRxMWkzsyhsS2GW9SjGzLiDppsnZUmocpBfDCbI7TjorbHY?=
 =?us-ascii?Q?KtT8B5pq4KXagWotEGub5MjTI0Utn1/DChAuIsUe+qTJkJxfrkaMQgWdkUKq?=
 =?us-ascii?Q?9qhnVB5ORk3PiLjLOnvy8mTzEtr8MUcZ0+U3WEafGyc0/rZqjbJ12iFEYfKD?=
 =?us-ascii?Q?3xTCrSYbHzXrazYDiXa8SQ13bPT5Olqn0fBNeMk78SFVVfKbomSFQL2fw0MR?=
 =?us-ascii?Q?Jb80FOPVFonhBLTTTcGl4J5X26Ei0zHt/0k478I37yt5rUN3Kel3UTu6wADO?=
 =?us-ascii?Q?QX/qd0sEX9BvREVmmKbRJw4gpeSbGGFwPBhDfmwv7zpqsf/pIhoKdQuSV6Em?=
 =?us-ascii?Q?mHTazArvStGVSiirUlJ71cOhEmQnnmduTUvhg+TBY1bjE4H3BSShEXjpBqXm?=
 =?us-ascii?Q?/+XJfRresn8VXXNYLVHC4oOslesuCimVFURwXyWcz9Jv704bm2KKYFn1if/v?=
 =?us-ascii?Q?1hxl5wW1ZMxLZhXlfu2kuEboNKAZxPqQHTtOdHp5tUpYL26wUif8MP+0Ts8Q?=
 =?us-ascii?Q?4d5I1uO6lou2W7rHYaMr5s9SXIaK1g7zrffUGxOaTrspNV9NVAmN5erNniGX?=
 =?us-ascii?Q?tZueTHRI9Ki9bKl1digpxRjUvWbWGBEP/wQQEpwhy6u1gEgqwC8AUXjMyzQo?=
 =?us-ascii?Q?tjm8xelzDJ8QKn+LInoe6YapcVRpGGkCWB/241lcOv/RuJtn/jZwMB7GxorK?=
 =?us-ascii?Q?6jUo4TrETaCZ0opSyI015qDulwJerOG6o6XxqWvpBZy7UBDMv0Zr9dReXkM4?=
 =?us-ascii?Q?WO89xyk81wiw1WdZiEvjXn5ltWTu9uW5boGADVkuWtEiWksV3N+DM2Di5YjG?=
 =?us-ascii?Q?B1+vCcz5ySC/wVgI9pcC24YSJeUBMBJeLanG5LegCYiVrsj9iXenQNhRKBYN?=
 =?us-ascii?Q?KWo/mP2WwmYLUKIorbmahUBg9QJFIRVPPRBX9alsl2jCJsoeK+rDm/i5Qdvz?=
 =?us-ascii?Q?ZLg/0sN5CVH8iXtFioZZTMojU0AVz3Mig1TiPv3NyOaWHFMOV3jbyanSSlPW?=
 =?us-ascii?Q?YMMWkdrdct0avRBXe2qO+X3ks1anfmP+IfsunVIUjdckqGXCP5wA5ldDkeAE?=
 =?us-ascii?Q?Pzq44B+d0UcfshYidQmSPBBfLtT2Y3+uEhVlv74+CU/TI9d6k+MNIi57CGnp?=
 =?us-ascii?Q?o0yTZxqEFkxifx2ydrigoDYwx3nHUVPEwqi58CKAaaZOd5pBOLpfeB2aL/nN?=
 =?us-ascii?Q?XqgAX2eOzPIjueiA7Ijgd7jLdDS3AnxWem679rV0Qjb3XZDzJW5quaAKURuU?=
 =?us-ascii?Q?r7K/9yBFfcnZB/ZsNTY0vt7uEdve81G+WAMkV3yx7Wi8juiG5Rrqac2EIHFT?=
 =?us-ascii?Q?CoVYZk1qjv6fYDKixPGPZN63Ba0cD9uhnXksyXJCdRaC4gXSEr75/AOSRt7N?=
 =?us-ascii?Q?E5nPyOYSywADU76MfTaWLpdxrH1IGHVdKF+AAe+JomtQOAKkbVfodmTNaGXL?=
 =?us-ascii?Q?KLooGMa07crSCAQmag8+sX3Yr2BNiLWZWaZ3UY5nCiiUZ0SN5jPGXMq0U/Tu?=
 =?us-ascii?Q?2XVWzLg4j+HhztPtV36biQITIm7lo/ANJlIzuZl7OAaaJVNWf/EKmwI0rYGo?=
 =?us-ascii?Q?xSfVbA1D2iihPcUflj08Rcumj42TaIgzLENDxNzM7pj7tuKQQ9hHYvIqAD0j?=
 =?us-ascii?Q?8FFhpmoKEg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e680cf-c264-44b3-81f5-08defff06305
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:05.5837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVib6S4OlNGKGLexpEp0F8dqaX2WVaDCVtSHgzaaXrPwIDW46OyNeaAF5u/CIOdamt9GgoYDWPFwrKyParvOKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

Move the 3-level radix page table construction out of GspFirmware
into a standalone Radix3 type in firmware/radix3.rs. The ucodes
(bindata) firmware that GSP-RM loads at runtime also needs a radix3
page table, so the logic needs to be reusable.

Refactor GspFirmware to use the new Radix3 type and expose firmware
size through a size() method instead of a public field.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs              |   2 +-
 drivers/gpu/nova-core/firmware.rs        |   1 +
 drivers/gpu/nova-core/firmware/gsp.rs    | 116 ++++----------------
 drivers/gpu/nova-core/firmware/radix3.rs | 133 +++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs          |   4 +-
 5 files changed, 159 insertions(+), 97 deletions(-)
 create mode 100644 drivers/gpu/nova-core/firmware/radix3.rs

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 1576399389b1..f208d6deb5e3 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -236,7 +236,7 @@ pub(crate) fn new(
 
         let elf = {
             const ELF_DOWN_ALIGN: Alignment = Alignment::new::<SZ_64K>();
-            let elf_size = u64::from_safe_cast(gsp_fw.size);
+            let elf_size = u64::from_safe_cast(gsp_fw.size());
             let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
 
             FbRange(elf_addr..elf_addr + elf_size)
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index b49613a90bf0..34657004568c 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -26,6 +26,7 @@
 pub(crate) mod fsp;
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
+pub(crate) mod radix3;
 pub(crate) mod riscv;
 pub(crate) mod tlv;
 
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index e8f9491e84cc..48c73a676ecb 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -4,21 +4,16 @@
     device,
     dma::{
         Coherent,
-        CoherentBox,
-        DataDirection,
         DmaAddress, //
     },
     firmware,
     prelude::*,
-    scatterlist::{
-        Owned,
-        SGTable, //
-    },
     str::CString,
 };
 
 use crate::{
     firmware::{
+        radix3::Radix3,
         riscv::RiscvFirmware, //
         tlv::{
             request_tlv, //
@@ -26,38 +21,21 @@
         },
     },
     gpu::Chipset,
-    gsp::GSP_PAGE_SIZE,
     num::FromSafeCast,
 };
 
 /// GSP firmware with 3-level radix page tables for the GSP bootloader.
 ///
-/// The bootloader expects firmware to be mapped starting at address 0 in GSP's virtual address
-/// space:
-///
-/// ```text
-/// Level 0:  1 page, 1 entry         -> points to first level 1 page
-/// Level 1:  Multiple pages/entries  -> each entry points to a level 2 page
-/// Level 2:  Multiple pages/entries  -> each entry points to a firmware page
-/// ```
-///
-/// Each page is 4KB, each entry is 8 bytes (64-bit DMA address).
 /// Also known as "Radix3" firmware.
 #[pin_data]
 pub(crate) struct GspFirmware {
-    /// The GSP firmware inside a [`VVec`], device-mapped via a SG table.
-    #[pin]
-    fw: SGTable<Owned<VVec<u8>>>,
-    /// Level 2 page table whose entries contain DMA addresses of firmware pages.
-    #[pin]
-    level2: SGTable<Owned<VVec<u8>>>,
-    /// Level 1 page table whose entries contain DMA addresses of level 2 pages.
+    /// The GSP firmware image mapped via a 3-level radix page table.
     #[pin]
-    level1: SGTable<Owned<VVec<u8>>>,
-    /// Level 0 page table (single 4KB page) with one entry: DMA address of first level 1 page.
-    level0: Coherent<[u64]>,
-    /// Size in bytes of the firmware contained in [`Self::fw`].
-    pub(crate) size: usize,
+    radix3: Radix3,
+    /// Firmware file path requested from userspace.
+    pub(crate) fw_path: CString,
+    /// Firmware version from the TLV metadata.
+    pub(crate) fw_version: CString,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
     pub(crate) signatures: Coherent<[u8]>,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
@@ -74,7 +52,12 @@ pub(crate) fn new<'a>(
         pin_init::pin_init_scope(move || {
             let firmware = request_tlv(dev, chipset, "gsp")?;
             let tlv = Tlv::new(firmware.data())?;
-            dev_dbg!(dev, "loaded gsp firmware v{}\n", tlv.get_string(b"VERS")?);
+            let fw_version = CString::try_from_fmt(fmt!("{}", tlv.get_string(b"VERS")?))?;
+            dev_dbg!(
+                dev,
+                "loaded gsp firmware v{}\n",
+                fw_version.to_str().unwrap_or("unknown")
+            );
 
             let size = usize::from_safe_cast(tlv.get_u32(b"SIZE")?);
             let mut fw_vvec = VVec::zeroed(size, GFP_KERNEL).map_err(|_| ENOMEM)?;
@@ -87,49 +70,9 @@ pub(crate) fn new<'a>(
             let signatures = Coherent::from_slice(dev, tlv.get_bytes(b"SIGN")?, GFP_KERNEL)?;
 
             Ok(try_pin_init!(Self {
-                fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
-                level2 <- {
-                    // Allocate the level 2 page table, map the firmware onto it, and map it into
-                    // the device address space.
-                    VVec::<u8>::with_capacity(
-                        fw.iter().count() * core::mem::size_of::<u64>(),
-                        GFP_KERNEL,
-                    )
-                    .map_err(|_| ENOMEM)
-                    .and_then(|level2| map_into_lvl(&fw, level2))
-                    .map(|level2| SGTable::new(dev, level2, DataDirection::ToDevice, GFP_KERNEL))?
-                },
-                level1 <- {
-                    // Allocate the level 1 page table, map the level 2 page table onto it, and map
-                    // it into the device address space.
-                    VVec::<u8>::with_capacity(
-                        level2.iter().count() * core::mem::size_of::<u64>(),
-                        GFP_KERNEL,
-                    )
-                    .map_err(|_| ENOMEM)
-                    .and_then(|level1| map_into_lvl(&level2, level1))
-                    .map(|level1| SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KERNEL))?
-                },
-                level0: {
-                    // Allocate the level 0 page table as a device-visible DMA object, and map the
-                    // level 1 page table onto it.
-
-                    // Fill level 1 page entry.
-                    let level1_entry = level1.iter().next().ok_or(EINVAL)?;
-                    let level1_entry_addr = level1_entry.dma_address();
-
-                    // Create level 0 page table data and fill its first entry with the level 1
-                    // table.
-                    let mut level0 = CoherentBox::<[u64]>::zeroed_slice(
-                        dev,
-                        GSP_PAGE_SIZE / size_of::<u64>(),
-                        GFP_KERNEL
-                    )?;
-                    level0[0] = level1_entry_addr.to_le();
-
-                    level0.into()
-                },
-                size,
+                radix3 <- Radix3::new(dev, fw_vvec),
+                fw_path: filename,
+                fw_version,
                 signatures,
                 bootloader: {
                     let bl = request_tlv(dev, chipset, "gsp_bootloader")?;
@@ -140,28 +83,13 @@ pub(crate) fn new<'a>(
         })
     }
 
-    /// Returns the DMA address of the radix3 level 0 page table.
-    pub(crate) fn radix3_dma_address(&self) -> DmaAddress {
-        self.level0.dma_address()
+    /// Returns the size of the GSP firmware image, in bytes.
+    pub(crate) fn size(&self) -> usize {
+        self.radix3.size()
     }
-}
 
-/// Build a page table from a scatter-gather list.
-///
-/// Takes each DMA-mapped region from `sg_table` and writes page table entries
-/// for all 4KB pages within that region. For example, a 16KB SG entry becomes
-/// 4 consecutive page table entries.
-fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Result<VVec<u8>> {
-    for sg_entry in sg_table.iter() {
-        // Number of pages we need to map.
-        let num_pages = usize::from_safe_cast(sg_entry.dma_len()).div_ceil(GSP_PAGE_SIZE);
-
-        for i in 0..num_pages {
-            let entry = sg_entry.dma_address()
-                + (u64::from_safe_cast(i) * u64::from_safe_cast(GSP_PAGE_SIZE));
-            dst.extend_from_slice(&entry.to_le_bytes(), GFP_KERNEL)?;
-        }
+    /// Returns the DMA address of the radix3 level 0 page table.
+    pub(crate) fn radix3_dma_address(&self) -> DmaAddress {
+        self.radix3.dma_address()
     }
-
-    Ok(dst)
 }
diff --git a/drivers/gpu/nova-core/firmware/radix3.rs b/drivers/gpu/nova-core/firmware/radix3.rs
new file mode 100644
index 000000000000..b60611c7bea0
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/radix3.rs
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! 3-level radix page table for GSP firmware data.
+//!
+//! The GSP bootloader expects data to be mapped via a 3-level page table:
+//!
+//! ```text
+//! Level 0:  1 page, 1 entry         -> points to first level 1 page
+//! Level 1:  Multiple pages/entries  -> each entry points to a level 2 page
+//! Level 2:  Multiple pages/entries  -> each entry points to a data page
+//! ```
+//!
+//! Each page is 4KB, each entry is 8 bytes (64-bit DMA address).
+
+use core::mem::size_of;
+
+use kernel::{
+    device,
+    dma::{
+        Coherent,
+        CoherentBox,
+        DataDirection,
+        DmaAddress, //
+    },
+    prelude::*,
+    scatterlist::{
+        Owned,
+        SGTable, //
+    },
+};
+
+use crate::{
+    gsp::GSP_PAGE_SIZE,
+    num::FromSafeCast, //
+};
+
+/// 3-level radix page table mapping arbitrary data for the GSP.
+#[pin_data]
+pub(crate) struct Radix3 {
+    /// The data mapped via a SG table.
+    #[pin]
+    data: SGTable<Owned<VVec<u8>>>,
+    /// Level 2 page table whose entries contain DMA addresses of data pages.
+    #[pin]
+    level2: SGTable<Owned<VVec<u8>>>,
+    /// Level 1 page table whose entries contain DMA addresses of level 2 pages.
+    #[pin]
+    level1: SGTable<Owned<VVec<u8>>>,
+    /// Level 0 page table (single 4KB page) with one entry: DMA address of first level 1 page.
+    level0: Coherent<[u64]>,
+    /// Size in bytes of the data contained in [`Self::data`].
+    size: usize,
+}
+
+impl Radix3 {
+    /// Builds a 3-level radix page table that maps `data` into `dev`'s DMA address space.
+    ///
+    /// Takes ownership of `data`. May sleep.
+    pub(crate) fn new<'a>(
+        dev: &'a device::Device<device::Bound>,
+        data: VVec<u8>,
+    ) -> impl PinInit<Self, Error> + 'a {
+        let size = data.len();
+
+        pin_init::pin_init_scope(move || {
+            Ok(try_pin_init!(Self {
+                data <- SGTable::new(dev, data, DataDirection::ToDevice, GFP_KERNEL),
+                level2 <- {
+                    VVec::<u8>::with_capacity(
+                        data.iter().count() * core::mem::size_of::<u64>(),
+                        GFP_KERNEL,
+                    )
+                    .map_err(|_| ENOMEM)
+                    .and_then(|level2| map_into_lvl(&data, level2))
+                    .map(|level2| SGTable::new(dev, level2, DataDirection::ToDevice, GFP_KERNEL))?
+                },
+                level1 <- {
+                    VVec::<u8>::with_capacity(
+                        level2.iter().count() * core::mem::size_of::<u64>(),
+                        GFP_KERNEL,
+                    )
+                    .map_err(|_| ENOMEM)
+                    .and_then(|level1| map_into_lvl(&level2, level1))
+                    .map(|level1| SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KERNEL))?
+                },
+                level0: {
+                    let level1_entry = level1.iter().next().ok_or(EINVAL)?;
+                    let level1_entry_addr = level1_entry.dma_address();
+
+                    let mut level0 = CoherentBox::<[u64]>::zeroed_slice(
+                        dev,
+                        GSP_PAGE_SIZE / size_of::<u64>(),
+                        GFP_KERNEL,
+                    )?;
+                    level0[0] = level1_entry_addr.to_le();
+
+                    level0.into()
+                },
+                size,
+            }))
+        })
+    }
+
+    /// Returns the DMA address of the radix3 level 0 page table.
+    pub(crate) fn dma_address(&self) -> DmaAddress {
+        self.level0.dma_address()
+    }
+
+    /// Returns the size of the mapped data, in bytes.
+    pub(crate) fn size(&self) -> usize {
+        self.size
+    }
+}
+
+/// Build a page table from a scatter-gather list.
+///
+/// Takes each DMA-mapped region from `sg_table` and writes page table entries
+/// for all 4KB pages within that region. For example, a 16KB SG entry becomes
+/// 4 consecutive page table entries.
+fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Result<VVec<u8>> {
+    for sg_entry in sg_table.iter() {
+        let num_pages = usize::from_safe_cast(sg_entry.dma_len()).div_ceil(GSP_PAGE_SIZE);
+
+        for i in 0..num_pages {
+            let entry = sg_entry.dma_address()
+                + (u64::from_safe_cast(i) * u64::from_safe_cast(GSP_PAGE_SIZE));
+            dst.extend_from_slice(&entry.to_le_bytes(), GFP_KERNEL)?;
+        }
+    }
+
+    Ok(dst)
+}
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 9b29308678a7..d3678f16750a 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -188,7 +188,7 @@ pub(crate) fn from_ranges<'a>(
             magic: bindings::GSP_FW_WPR_META_MAGIC as u64,
             revision: u64::from(bindings::GSP_FW_WPR_META_REVISION),
             sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_address(),
-            sizeOfRadix3Elf: u64::from_safe_cast(gsp_firmware.size),
+            sizeOfRadix3Elf: u64::from_safe_cast(gsp_firmware.size()),
             sysmemAddrOfBootloader: gsp_firmware.bootloader.ucode.dma_address(),
             sizeOfBootloader: u64::from_safe_cast(gsp_firmware.bootloader.ucode.size()),
             bootloaderCodeOffset: u64::from(gsp_firmware.bootloader.code_offset),
@@ -243,7 +243,7 @@ pub(crate) fn from_sizes<'a>(
             magic: bindings::GSP_FW_WPR_META_MAGIC as u64,
             revision: u64::from(bindings::GSP_FW_WPR_META_REVISION),
             sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_address(),
-            sizeOfRadix3Elf: u64::from_safe_cast(gsp_firmware.size),
+            sizeOfRadix3Elf: u64::from_safe_cast(gsp_firmware.size()),
             sysmemAddrOfBootloader: gsp_firmware.bootloader.ucode.dma_address(),
             sizeOfBootloader: u64::from_safe_cast(gsp_firmware.bootloader.ucode.size()),
             bootloaderCodeOffset: u64::from(gsp_firmware.bootloader.code_offset),
-- 
2.55.0

