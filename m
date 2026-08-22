Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011055.outbound.protection.outlook.com [52.101.57.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E871130D41B
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363766; cv=fail; b=lCt2yMcI7BWm7EEgo7W8r+frifcUutNiB3wfFFFWSEmHQmIRj6De8DfmloMh7tveh7Xyk8IHTQ/zNYPzdhOSbWzpV77rB2c5EjquXsz7gTJSOKdXVOFi3Rd3W9W7D3QLbNlD51uTA/5coZs7y2U9aDX4vaBXTfzKXAkrc3r2W7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363766; c=relaxed/simple;
	bh=L0bEb2JWbT+rgrydYvZwYp3MIij8f21n8s5zo83V9nQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QkYohQtoriCoZnAHhLgXI9LeG8xwJl0b94rDR+Ckk4CGCe9QPV/q5FjXc33wboTw/Ayei6ycOhGpKukvcuRuD9KcQPfjlF15zclmZm1uCk29Ib4Hh9OZ84SVqCAZ3E3dvMjmto5nfWEiDf1cA9886cktdMZk5cEBQOnFuYMhFKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ORpDpLHv; arc=fail smtp.client-ip=52.101.57.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ORpDpLHv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ok5wnA8qWVzZx1xbDJ1pAjdowYx9FXaRaNXh+vn13dHe7r/DQREEITUMeghN6TCiRPP42VtuxB6/wnBVMjoz86mjp1j+/Q/Oa5TIZueo0JP0N/up+FPF9trlLQ6mg5TQGQwr0HUb+NVzmgd+MxGTYvnu0AdRUsRijYLcW/rdFGBfvJac4U72PmcaSRWWQzCANw15wXTPMIkuqhk7taYbm785OBW8i3EQMjSJUTktAScwsZNk7jBKz52s6IPTyLwgHrlJJGlHXns6vYKKjB+O1JjYNJFaInMe5MDXOBUKHOp+ptBw2LYUPQVdNbPufbWpksf6qOM1IYpex63CWJACuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trRhfNuJCcjd0p8J1yFdIaomO0VuVqho+smvqFIJvrU=;
 b=Df8NDRTBTrwQpTYYGCMjjXDbRmJYqhuES0ZShnouM0JZLCPX9iG9HYstiPciCJ1CIndEKHpO8Hk/iHiZegeKxrA+yES+WFFEHYmKGo/L+GlLapf7A9KzdFoWT4B0XhH4BtGMNty4RzSIRD4r4YzDBBzyCFFFDSDgKDNVg0iGaYa97HkZyTjjWyHycop9RsPUkZCfUAht/U6LTLypcOoL0oRxVVlXO/Mm+DK7G23RCVJ0Yp4NasEDhB7hHjc4nSTodahzHNDhdt4jMSP+oEiV76gmCwGndNhD4Ehm2uYZ5RAqCxOT52i/8dZpzlIbD+0ZaQg9cWd2MwiwmgxwrzFQqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trRhfNuJCcjd0p8J1yFdIaomO0VuVqho+smvqFIJvrU=;
 b=ORpDpLHv/K1cJHYbssXL+FpZaUD1NIp7L/iG8m9bS+fzICazGd8Db8ul9ApRZKH7eGyTo1gBkJV5pZiZTVxpow/HFpw8N+xYSlMdxogcaDtbwlw49YwXSOudF6DRmi1oBal1COMOSBCotdnmgyPBZRaJX0k4wgaSgAnsFRNbVzY+WmgF95YHnsXQVqs7zh1zfV6sX9fbu0xhNgOBQzVQAkDJYQQWbeITtt2rY+Xjh/ySjvqYuKKABq3mugV+eHl6M0L+Qsrga2qz66Oc/4VFNFIs8yXTqMLO8l8KSZKX310UxEwh1fNCwO2KrjaRQgyQxvW2wJv51ClqICcxyXN21g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sat, 22 Aug
 2026 01:55:55 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:55 +0000
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
Subject: [PATCH v2 19/31] gpu: nova-core: separate the generic falcon bootloader from FWSEC
Date: Fri, 21 Aug 2026 18:54:36 -0700
Message-ID: <20260822015448.238214-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:a03:255::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b69ef2-fbeb-4626-0d97-08defff0809a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|376014|1800799024|6133799003|10067099003|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3T/ZXoIQ8dU+JkrjPYw8DThjhXrPLntF1O7r0DdEATcRlWlpBJLra6+hhSV7uZJUPblyQBh0AwRRWD+6eAD/rmOiM2iyHbN50C+b7vZQOKjmMuMLY9pLWPVyLoDJIWcdaU+bn72d9mgs9zzyWVlQl1gJC4wHP1cnE7rpYnrHFwaP0k132OgtzaZmEmTY9+M2dPeot3sf5Pe1mS7G+s2FhUpNC7OVrYkV//qSqenD+Pzk90p1Up4q9UEVX4u81v9HJwZLLCwmvZ+t02FfLdWczOSEsGHweZNSVBKSSRJ548tyMw7NMPJy7JeQSKRQAcKUGziEJS0L8R8fzKScJWF4bB5YvbPEOENq2xDBNE0BhewexJ4oUqpLDiOdq7+Po8019/uhau7REYrQrp4ZionNPLgHUitbj25ARHPjM3NbPWYZ1ChX3Psb8pn9ldHpNxswlrbxAsCF+bDwXpgRmbzUHF9SoFhJRT9wWxXH5JJo0hsBpT3MpR6LVXRfEyfcV265U7XzWfpIkolfxNVKXcAXCLzr2+lKNWP/pG4Rf56IEQdVJ6f7EiBWZOnpGb+Gk8uc8H5hYI4EL+o7DNSeuzCYFi94cFsRKTxLGe76Dp4dl1CkCphTE4GJ5JTXN9ZlNi5aqN3/EY/xXa7r08gYIE+BmlibRYuPfnFfjRR4W0eR6M0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LLBRwgngPYG8AeU8e25AoTRegxK53bLKjrcpw3aRXGJuNmQ8rhdQikkeuRQq?=
 =?us-ascii?Q?rlYXv9XH2wtIfv2honDx5sTEHxo4hHTSGGI1+HHG9wOcL3WaGvNCKL7h7hYn?=
 =?us-ascii?Q?SK3WTBJ+g5Pxi2lF7V2dK/d5C+7xScp1Bkz1k73R4ASgUlymgnd2DbDlE0jz?=
 =?us-ascii?Q?k1pPpBYJGkEPiqHD6fqWla7jpIKCwgpzvltck99a5YyE86Cp0GmNv3jhQH32?=
 =?us-ascii?Q?3iBn8MzCzi7rfCMHvc4YKZ0/bHOfGLKY/FhzwUsDj1SLggA8ZZPixy4vy5nq?=
 =?us-ascii?Q?BqG/4zQtbERsP6OSEFbbIzn9QP3F13bVAcQTWw0D0XGbaAR1BrHhrwjHwpnc?=
 =?us-ascii?Q?AORVYZsXgKSXTuXRQpJvumRtvCqHjkKr/oeLMgMnWBTzYoCJaQZ5cqyca4xm?=
 =?us-ascii?Q?jhW7UM5ZS7UGYrc/PIhzsfkY0Y8ssxhCtmJcbiuESVqJA7PqIpx5nDxAcSG1?=
 =?us-ascii?Q?ODcxr4S4rPNyX8mGf/MGZag4DLQibAS88HAZ4nknPZTOkaW4ajrhd7RKnsGE?=
 =?us-ascii?Q?Hu8FlXo0KselF4l087xJfvTPVLNJQt624ThfwZ0S5C9cbyh058p0kusdd4GS?=
 =?us-ascii?Q?sZeHpzDcW3JeN9blTNttC5o8Lh+h7IabM9XpUNr3eMbQwH9fOdHDjmQt4e3E?=
 =?us-ascii?Q?3YwcdQyX1fYMekZ7tgsTZs0e+KJjnJKWICuyEGimTpbUrQXvTiSRSCvk5jJO?=
 =?us-ascii?Q?ReDNRxe8cuxAR8xU9moiSJcdgt53sepBCU/7kCjbO5vUoXxD6W8Ab58Y64zx?=
 =?us-ascii?Q?0/3fhB2q8tmzknBsADhNPIU04uV7dFOnAgD8deXRr2b0raRYHl28wwqpVTGv?=
 =?us-ascii?Q?5scgK/CClrDHHL1htK09Gulj3LGsFatxBa2D0GLoR287vCEs+GS0OXdFFyae?=
 =?us-ascii?Q?hQ6ra8lz6n68PLl0x8ozAYzuZKiM031gFsu0E0Q+DdJ807iPCrKdTVjxJ1YD?=
 =?us-ascii?Q?k28bPOYxB0xi317sPpxxyVK+Nh9ZkVvkTxgqTbwIQZ4htVIIImvdeQEzh8wd?=
 =?us-ascii?Q?8EH4o1kAXAQDn9/sIQaV4DeaJ9X+crspcq6bnr/51s5e+Zabz54CxDNpY20m?=
 =?us-ascii?Q?Q9SaE1Q2+LJv2vCQd8jD7s2YH2OkM+uLZunboqev0Bu3V7lteXHv161wvNP1?=
 =?us-ascii?Q?eCCNdRdKum2dujHKuULue2kwIGxbiSBDELJzodHW8PShaa3PG7XSITKpQHks?=
 =?us-ascii?Q?Ha6MlKs6HdJsiaNUIJ3U1RtxeD9FcrkuQJvzobj+uO9QMHt5KbiEtUvm64hA?=
 =?us-ascii?Q?UyKt1UM5w8ELzTObx/nPPr1+mVDqx0IAKMGTgcE4fkk/blkhl65AUne5rZdr?=
 =?us-ascii?Q?u5L4Z1L4x0vEayEP1OsjYwpkI0cbcB7YGqp6pusEEdpUz8tzd4+JnjK+iT/m?=
 =?us-ascii?Q?esmdb/Op+a7Z3nQPaUqdHXw2GaSICikSNDKyyb6EsYuvhd5L8XcF0Y1ft/Kz?=
 =?us-ascii?Q?GJ8G/Z03c5hTM4xwueWEj/IUrn/Y+FLiO0HH2MlqEXkCBdjrNbITZejKh2BK?=
 =?us-ascii?Q?Q6Meg8Zfk1nsx0NO90aey2A8bzmuqjD0efKGkB2dfLpE4EP0tY/qA5n7Kt2b?=
 =?us-ascii?Q?uFwC4cHSCUhbibSXohIx2fnD74dEC2KmSwNvcmHsGAWyUOmNR9/Vvuj6ovaY?=
 =?us-ascii?Q?zBZoW5pA+eLv8RRvg5t/J/syZ6/5Gk2FjyOCfDKw27+Msb4h8n51ZoHyo43V?=
 =?us-ascii?Q?52tq4b/L8nnXLKtNAoRMP+kDY219CjEHgf5qw4PodxDaNi5i5II8OJe6qRFl?=
 =?us-ascii?Q?ey8apxJ7Tw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b69ef2-fbeb-4626-0d97-08defff0809a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:54.9245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HVCFMTqNgBkttuNyrKyPwxYRX8oXnZGPDxCzu0RuG0nO1LOraWGFnAmNqonvTPZow8LUCPvJdAmqb6cvrih09g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603

The r000 GSP boot protocol sends a load-and-execute event for the
generic falcon bootloader.

Nova-core stored the image and its load parameters in the FWSEC firmware
wrapper, which kept the r000 boot path from loading it independently.

Separate the bootloader image and load parameters from the FWSEC
wrapper. Place the bootloader at the end of the target falcon's
HWCFG-reported IMEM rather than below a fixed 64 KiB ceiling, so its
placement remains within bounds on falcons with less IMEM.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs               |  15 +++
 drivers/gpu/nova-core/firmware.rs             |   1 +
 .../nova-core/firmware/fwsec/bootloader.rs    |  64 ++---------
 .../gpu/nova-core/firmware/gen_bootloader.rs  | 102 ++++++++++++++++++
 drivers/gpu/nova-core/gsp/hal/tu102.rs        |   6 +-
 drivers/gpu/nova-core/regs.rs                 |   5 +
 6 files changed, 135 insertions(+), 58 deletions(-)
 create mode 100644 drivers/gpu/nova-core/firmware/gen_bootloader.rs

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 249d440c14c5..644703c14924 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -387,6 +387,21 @@ pub(crate) fn new(
         })
     }
 
+    /// Returns the size of this falcon's IMEM, in bytes.
+    ///
+    /// `NV_PFALCON_FALCON_IMEMC` addresses IMEM with a 16-bit byte offset, so the result never
+    /// exceeds 64KiB.
+    pub(crate) fn imem_size(&self) -> usize {
+        let blocks = usize::from_safe_cast(
+            *self
+                .bar
+                .read(regs::NV_PFALCON_FALCON_HWCFG::of::<E>())
+                .imem_size(),
+        );
+
+        blocks * MEM_BLOCK_ALIGNMENT
+    }
+
     /// Resets DMA-related registers.
     pub(crate) fn dma_reset(&self) {
         self.bar.update(regs::NV_PFALCON_FBIF_CTL::of::<E>(), |v| {
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index e0befe84aa3e..9ff764930bcd 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -26,6 +26,7 @@
 pub(crate) mod booter;
 pub(crate) mod fsp;
 pub(crate) mod fwsec;
+pub(crate) mod gen_bootloader;
 pub(crate) mod gsp;
 pub(crate) mod radix3;
 pub(crate) mod riscv;
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index ec4d92317a93..6670d17b4eeb 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -14,18 +14,12 @@
     dma::Coherent,
     io::{register::WithBase, Io},
     prelude::*,
-    ptr::{
-        Alignable,
-        Alignment, //
-    },
-    sizes,
     transmute::AsBytes,
 };
 
 use crate::{
     driver::Bar0,
     falcon::{
-        self,
         gsp::Gsp,
         Falcon,
         FalconBromParams,
@@ -39,10 +33,7 @@
     },
     firmware::{
         fwsec::FwsecFirmware,
-        tlv::{
-            request_tlv, //
-            Tlv,
-        },
+        gen_bootloader::GenericBootloader, //
     },
     gpu::Chipset,
     num::FromSafeCast, //
@@ -101,16 +92,12 @@ unsafe impl AsBytes for BootloaderDmemDescV2 {}
 pub(crate) struct FwsecFirmwareWithBl {
     /// DMA object the bootloader will copy the firmware from.
     _firmware_dma: Coherent<[u8]>,
-    /// Code of the bootloader to be loaded into non-secure IMEM.
-    ucode: KVec<u8>,
+    /// Bootloader that performs the load.
+    bootloader: GenericBootloader,
     /// Descriptor to be loaded into DMEM for the bootloader to read.
     dmem_desc: BootloaderDmemDescV2,
-    /// Range-validated start offset of the firmware code in IMEM.
-    imem_dst_start: u16,
     /// BROM parameters of the loaded firmware.
     brom_params: FalconBromParams,
-    /// Range-validated `desc.start_tag`.
-    start_tag: u16,
 }
 
 impl FwsecFirmwareWithBl {
@@ -120,29 +107,9 @@ pub(crate) fn new(
         firmware: FwsecFirmware,
         dev: &Device<device::Bound>,
         chipset: Chipset,
+        falcon: &Falcon<'_, Gsp>,
     ) -> Result<Self> {
-        let fw = request_tlv(dev, chipset, "gen_bootloader")?;
-        let tlv = Tlv::new(fw.data())?;
-        dev_dbg!(
-            dev,
-            "loaded generic bootloader firmware v{}\n",
-            tlv.get_string(b"VERS")?
-        );
-
-        let ucode = {
-            let blob = tlv.get_bytes(b"BLOB")?;
-            let code_size = usize::from_safe_cast(tlv.get_u32(b"CDSZ")?);
-            let code = blob.get(..code_size).ok_or(EINVAL)?;
-            let aligned_code_size = code_size
-                .align_up(Alignment::new::<{ falcon::MEM_BLOCK_ALIGNMENT }>())
-                .ok_or(EINVAL)?;
-
-            let mut ucode = KVec::with_capacity(aligned_code_size, GFP_KERNEL)?;
-            ucode.extend_from_slice(code, GFP_KERNEL)?;
-            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
-
-            ucode
-        };
+        let bootloader = GenericBootloader::new(dev, chipset, falcon)?;
 
         // `BootloaderDmemDescV2` expects the source to be a mirror image of the destination and
         // uses the same offset parameter for both.
@@ -213,21 +180,11 @@ pub(crate) fn new(
             }
         };
 
-        // The bootloader's code must be loaded in the area right below the first 64K of IMEM.
-        const BOOTLOADER_LOAD_CEILING: usize = sizes::SZ_64K;
-        let imem_dst_start = BOOTLOADER_LOAD_CEILING
-            .checked_sub(ucode.len())
-            .ok_or(EOVERFLOW)?;
-
-        let start_tag = u16::try_from(tlv.get_u32(b"STRT")?)?;
-
         Ok(Self {
             _firmware_dma: firmware_dma,
-            ucode,
+            bootloader,
             dmem_desc,
             brom_params: firmware.brom_params(),
-            imem_dst_start: u16::try_from(imem_dst_start)?,
-            start_tag,
         })
     }
 
@@ -282,7 +239,7 @@ fn brom_params(&self) -> FalconBromParams {
     fn boot_addr(&self) -> u32 {
         // On V2 platforms, the boot address is extracted from the generic bootloader, because the
         // gbl is what actually copies FWSEC into memory, so that is what needs to be booted.
-        u32::from(self.start_tag) << 8
+        self.bootloader.boot_addr()
     }
 }
 
@@ -292,12 +249,7 @@ fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
     }
 
     fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
-        Some(FalconPioImemLoadTarget {
-            data: self.ucode.as_ref(),
-            dst_start: self.imem_dst_start,
-            secure: false,
-            start_tag: self.start_tag,
-        })
+        Some(self.bootloader.imem_load_params())
     }
 
     fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
new file mode 100644
index 000000000000..f949223af2d0
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! The generic falcon bootloader.
+//!
+//! A small program loaded into falcon IMEM using PIO, which then DMAs a larger image into IMEM and
+//! DMEM from a descriptor the driver leaves in DMEM at offset 0. Open RM's
+//! `ksec2GetGenericBlUcode` supplies the same image for both SEC2 and GSP.
+
+use kernel::{
+    device,
+    prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+};
+
+use crate::{
+    falcon::{
+        self,
+        Falcon,
+        FalconEngine,
+        FalconPioImemLoadTarget, //
+    },
+    firmware::tlv::{
+        request_tlv, //
+        Tlv,
+    },
+    gpu::Chipset,
+    num::FromSafeCast, //
+};
+
+/// The generic falcon bootloader image and the IMEM placement it was loaded for.
+pub(crate) struct GenericBootloader {
+    /// Bootloader code, zero-padded to a whole number of falcon memory blocks.
+    ucode: KVec<u8>,
+    /// Byte offset in IMEM the code is loaded at.
+    imem_dst_start: u16,
+    /// Tag the first code block is loaded under.
+    start_tag: u16,
+}
+
+impl GenericBootloader {
+    /// Loads the generic bootloader image for `chipset`, placed in the last blocks of `falcon`'s
+    /// IMEM so the image it goes on to load has the rest to itself.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if a required TLV field is absent or the image does not fit in IMEM.
+    /// - `ENOMEM` if the padded copy of the code cannot be allocated.
+    pub(crate) fn new<E: FalconEngine + 'static>(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        falcon: &Falcon<'_, E>,
+    ) -> Result<Self> {
+        let fw = request_tlv(dev, chipset, "gen_bootloader")?;
+        let tlv = Tlv::new(fw.data())?;
+        dev_dbg!(
+            dev,
+            "loaded generic bootloader firmware v{}\n",
+            tlv.get_string(b"VERS")?
+        );
+
+        let ucode = {
+            let blob = tlv.get_bytes(b"BLOB")?;
+            let code_size = usize::from_safe_cast(tlv.get_u32(b"CDSZ")?);
+            let code = blob.get(..code_size).ok_or(EINVAL)?;
+            let aligned_code_size = code_size
+                .align_up(Alignment::new::<{ falcon::MEM_BLOCK_ALIGNMENT }>())
+                .ok_or(EINVAL)?;
+
+            let mut ucode = KVec::with_capacity(aligned_code_size, GFP_KERNEL)?;
+            ucode.extend_from_slice(code, GFP_KERNEL)?;
+            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
+
+            ucode
+        };
+
+        let imem_dst_start = falcon.imem_size().checked_sub(ucode.len()).ok_or(EINVAL)?;
+
+        Ok(Self {
+            ucode,
+            imem_dst_start: u16::try_from(imem_dst_start)?,
+            start_tag: u16::try_from(tlv.get_u32(b"STRT")?)?,
+        })
+    }
+
+    /// Returns the address the falcon must boot from to run this bootloader.
+    pub(crate) fn boot_addr(&self) -> u32 {
+        u32::from(self.start_tag) << 8
+    }
+
+    /// Returns the PIO parameters that place this bootloader in non-secure IMEM.
+    pub(crate) fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
+        FalconPioImemLoadTarget {
+            data: self.ucode.as_ref(),
+            dst_start: self.imem_dst_start,
+            secure: false,
+            start_tag: self.start_tag,
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/hal/tu102.rs b/drivers/gpu/nova-core/gsp/hal/tu102.rs
index a5c0ca355493..68a48c882c0f 100644
--- a/drivers/gpu/nova-core/gsp/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gsp/hal/tu102.rs
@@ -166,7 +166,7 @@ fn run_fwsec_frts(
         )?;
 
         if self.needs_fwsec_bootloader {
-            let fwsec_frts_bl = FwsecFirmwareWithBl::new(fwsec_frts, dev, chipset)?;
+            let fwsec_frts_bl = FwsecFirmwareWithBl::new(fwsec_frts, dev, chipset, falcon)?;
             // Load and run the bootloader, which will load FWSEC-FRTS and run it.
             fwsec_frts_bl.run(dev, falcon, bar)?;
         } else {
@@ -224,7 +224,9 @@ fn build_unload_bundle(
         // Load the FWSEC SB firmware, as well as its bootloader if required.
         let fwsec_sb = FwsecFirmware::new(dev, gsp_falcon, bios, FwsecCommand::Sb)?;
         let fwsec_sb = if self.needs_fwsec_bootloader {
-            FwsecUnloadFirmware::WithBl(FwsecFirmwareWithBl::new(fwsec_sb, dev, chipset)?)
+            FwsecUnloadFirmware::WithBl(FwsecFirmwareWithBl::new(
+                fwsec_sb, dev, chipset, gsp_falcon,
+            )?)
         } else {
             FwsecUnloadFirmware::WithoutBl(fwsec_sb)
         };
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 5d265b5788e3..5501c36a56af 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -247,6 +247,11 @@ pub(crate) fn usable_fb_size(self) -> u64 {
         31:0    value => u32;
     }
 
+    pub(crate) NV_PFALCON_FALCON_HWCFG(u32) @ PFalconBase + 0x00000108 {
+        /// Size of this falcon's IMEM, in blocks of [`crate::falcon::MEM_BLOCK_ALIGNMENT`] bytes.
+        8:0     imem_size;
+    }
+
     pub(crate) NV_PFALCON_FALCON_DMACTL(u32) @ PFalconBase + 0x0000010c {
         7:7     secure_stat => bool;
         6:3     dmaq_num;
-- 
2.55.0

