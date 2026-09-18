Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FB83ABD82
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693737; cv=fail; b=ubHCK5poXdZZWpb81RAD4RwNy9ulCRtu6xu4qLAC8TXtUi4IIWhbZWjO9UH85ZJnvxitJBq9CIrx3ndNmqAjf5IOOtHUxkJ0KagRyzWa6Ar2FHUqfbLCb/XLOrMTrjMu12bs/RnXNpvaP6GXpaEE+uQho6uOGwfULA0EKCxA9Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693737; c=relaxed/simple;
	bh=kuRfCFuMN2M5b8FLKFAjkA5NZroQtdJYOFqOkZxQrgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=se2493IQ2Tikc4jxld1HLG+XqNt8qkwk3RL6iyqp7Xkj+fZSWBiQ0Je3gS1Q0Sup3dy2+mLYlQMxcaTzpX9GtJEWnrco9/i0Zl9ha6HCmlOofeaGZt99FS60HHz3wZmVmcvyOtMpke4et6lCFZqlyycn0xlPa2aI0F54SrfBaoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ij/9mras; arc=fail smtp.client-ip=52.101.46.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ij/9mras"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyzuY4LmtSrGt8hxezjuanaPIZy1vYvf5pwMMWfNE7Rr1tr9/52AZW8lJI7yUyYWHD51D9GQDYi4pR6GyRhHKuxKJPb8SOhTBZtidHmxPzJUTc9YoM6+leUaFDMA9FUsGFda/SjJUIW8Dv3/mh6vOjtsyBV79/czs6V0HZFyk9YB8jhPEWcqeBl24ZqgIZfYQAaRI/VIBFN/I+Eqv0AcBHgw3yABf6wDNpiL6xaQlDsOsVRNHMpCW2AomSm3542NMOY5yWTTDMFDOfQ5FMqYaI67erK8+4BINwFYLZI9xeEi7ujslaTWywLNjoGD9e3c9E8DIhMB/MIcIPaLfZck5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlDY3D+TgmcHgmKY+RSmxlsWqWll8RlhI75v2Ak32cg=;
 b=sLQGb+F+URskJJS2XWRTo1R0sErKNYMdb46G8P0QMad9Rvz3fF3Ydh/p3EPd/aWepk3OWRuL0A8c4HKxoGsUZzz/b4ZZBGLH/Ukmrk4avJp1PT/TpwFbfVkYH4h/zP+cvOS/b2OAOq0BnXWw3m9SbCzRIY3GC94hyu2zkCWcLiDgCi+WgKyjZnPg9HQN28qddAa1G2etEvOl0ayStPaWkHEfeF49YXNGLK4N8INC3mMwV2FlLh3s5V7K6eI3tMUpgKjL9hPPuqUepqFZiihWnRHX36hFANRbju2iSKfzCAd+dNtPA3DDNe3qHwxjllvPSAIEHEFGreXUQdgPQCi9Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlDY3D+TgmcHgmKY+RSmxlsWqWll8RlhI75v2Ak32cg=;
 b=Ij/9mrasaxcU/HodLo0/V5W+vd9mqFsZRbv/W6AZUiXdadP4WfvPJMvdmaNMf9N9WjpeREhQpQ9HpinbH5cICrWfh/5OI71kvcQ4ZY2BXrFW6KX3dbc/DEkCsU7F5DoGnWrxCgHQOzSNnSk2oylE3YURmAu1YcfXEDUtJg5U8JZnDjm9wUtdF6onCVamgdrf7V32+yBgkyq5uADouUPCR2m1dpX1dLPML001Tlp/thz6yphZ+w7uM9QRKfCc3JVspa5Fq4vFyoA+3zMwIgDY7kHit5PXpDgdvULmctHZ0D6GtbKZVjlKsQzQXG1oiktz8H7haEtFMNHHAkHhtqJPZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:08:16 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:08:16 +0000
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
Subject: [PATCH v3 24/33] gpu: nova-core: add the ucodes firmware loader
Date: Thu, 17 Sep 2026 18:07:10 -0700
Message-ID: <20260918010719.1176945-25-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: afdfaa77-edea-495b-c191-08df152144dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Y3hxC2/+9YAAnwVYs9ivF29fyTsJreNQjBXu+se+x1ymgKq5d7O7yB0cc4zve7spD9+eJJKjTcIC4CouEdqJ5or8H/Vp1xRu47FXbo8BO+0P2o5ebpRRjMKfKqk+rVCO1QZLCNNfJQW6ifXCfSNdScIZJb9rutdy3L43FewvMcDE2UsLDltAYGxs25hE1RtsCIlYHFJRfD30ENSgOCESOieDc6g1kDcS+XCKCmYqQ/HT/JgGC4mZyNbCiR/7XJ31MU9k4cZpUAkoPYyEVwWU1HlGb1C/R6cUDsYrOm5Tigc1/nguNsEww+28vo5aVbvFKeCbGQCBlxQkRAUsBBdPIrWiSPOEMz5ChbN9zplwGwCkvQ5yPamml8v7AqbWs01UfS7r1oSkCB7y/nocHE5FJ8z4SlGURWm6o1fX5eNWg0DcXrG2KfSPQDtswTTvTHC/C68qTUJpLSw9ZMYVbY8s+SfkXTuKOqnHGn+is5mF5pURYcpIoGlYRHk+F3FgQqLBf1GuiyHXgsmiEnGY5XevyrvRYzjNa37+OrWM1xG6rdT81s0EBjmHWguk8AlDSiqlFSNFqviAWGc9qVdJWPV8R79WiOFmU378GD6qogU1ACXuTLsm4V61svI2NdtUPo+O1vx9sDaT7HizgbqDy6wamOYkcdru3cgokWFNBYl0KsM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ALpxJgMV4995R982hA6ltabzyIwVcRdELsbCOJzU8019ia0yd2vh5i64rjl?=
 =?us-ascii?Q?7loWnLmG0br2ngkYCZFPyAm+izpz5ABXcxDU4iy8Pzz7XS0yWpFvAaQMi1+Z?=
 =?us-ascii?Q?QXjmhRPHtyzA1ZWDVNaQj0qoRkruYtYAdaSU+Bb3LZz/cm/0UhC6C5+NRX4b?=
 =?us-ascii?Q?6V5jDL//ntG6ukjNAnh1aXBDjJlqL7lJVGqbnFOGt85fda4mg9nNB5oR2yVQ?=
 =?us-ascii?Q?+qZNQSGgBPm2QKVkh7IofMk9r/Pbe6E+ePCdzGx16kCa8+sbkY1hhX0ca+lL?=
 =?us-ascii?Q?4VBDwdAmbMv6T2oH0Tys7VplY1vxCZwIC1gN/ctXzOmi+DwuHV1QEMAFq6oS?=
 =?us-ascii?Q?bS2976XrHeX9zuBXC1iLlB1Rg5+56NHkwO6xPHlDUFrshLa/qNVcFTKxnni/?=
 =?us-ascii?Q?g5opcLSYIRJKKqV4iIo0+Lkno2vdAbR1/ERd12mABrl/u5NAc3N+uK/BT6qi?=
 =?us-ascii?Q?IuqY5u67FlrZSmj8gQQX4PSep96TKZfgD1orxrjmb3SMnGLnAovS/ZI52+Xs?=
 =?us-ascii?Q?meE8tFVND0nb64a70jtV/hTlDz64VXP4dktE9j/hTJSuzt8KQCIdB3rlaBHL?=
 =?us-ascii?Q?R+4D5vebZXEE/6IH3TUDEhOefTnQ+whqTnwzbgV8a34SosQdh+1M43SylDMG?=
 =?us-ascii?Q?eBOKOFS3/vAtdF9Yhj03mfEYDk9AbT8buwF6O7/gzwc4VF1SOQkQ22qz0F1R?=
 =?us-ascii?Q?G4jn/qomJqsMnYUIs4971bsW44u33Zr/KdsU4xYRpjNGXQZ2Hc4J8DaiOJbI?=
 =?us-ascii?Q?3Hy8tRJeZQQuCJbSVj7CGhyVC6d86p+ibUvqDerE6xgMKCWIz0S1pJvxrbVo?=
 =?us-ascii?Q?YuJgKrEXU7K94gDTh8tlF3zCtFJLhJiAfduQ2cvbpuiO1oCpdYBHHhrBBvd7?=
 =?us-ascii?Q?hHvUSvtDL14qlOXwuOY3Rk2oqS4eze4GyUqIR0jcFeOHuo/+OdZ7LuHAGan7?=
 =?us-ascii?Q?fJX9VP5tuq+BI+p5aNZEFij2/bpAh4iNNxFIGu1l+Xzik6G80C/MFFSdo2Q9?=
 =?us-ascii?Q?2UINxE0ILl0qyuqVSv1czy086zxfhMVDZ8suL5lddg3be6Cfak/glM9575y2?=
 =?us-ascii?Q?20xFm9Uj9LgBxw58ZIhCYorJ+gRZsygRkaGWaZM2Lw/0uJP2a5qPPrylGfvY?=
 =?us-ascii?Q?ST2anRHAF83v5my+mlWAh2i24kd3TWOoL03lU0+T2a0o5JkZC90etoAwZblE?=
 =?us-ascii?Q?dH+9Tx8R53Ff172N21w/7pEw5s3bRhvKT+643c4Vv6GeAD8c3Z7Y0Roslq0p?=
 =?us-ascii?Q?R1rrYV/4m92y0Dz4rBwXKb8r4HiiOcFoiNcdCR+pSQyCbVIPDSV4Zf53L1Pn?=
 =?us-ascii?Q?hcvEm0fVGF1ORLwRQTznE/Tk4+iOLfQRA5cHo4SthbjHjbAQhrzyup3fCGmd?=
 =?us-ascii?Q?tRBTOUZOPzGAk48DULz1xfyJuwtkwkR/kKn5id5RhHb1o314DyhD3RvQMa3l?=
 =?us-ascii?Q?wOE6u+IHYB0LsfeYeTl9JE7PkLgYac6ogTh07W5avvKmZJEPKpwxU7zoX78k?=
 =?us-ascii?Q?rXxEZLh3wut+oehflEVBPw9bpNM50KzpDDZqls4LM2iMciaHfBcN8ilXFWK+?=
 =?us-ascii?Q?kcXjT18EjeBkKC43wWPaJnen3jckJ3yOrdBgFdQTEz+ORzZs6gZxlz/aQ4Wd?=
 =?us-ascii?Q?cHy7JHKoZe82jc6nUwA4fhqHaS5F6Uz1+A0BLtAvdluJlM4CIiXVS8z8PLXT?=
 =?us-ascii?Q?iRHh3cq6Vic2hE+Wl+98bQ6iS4mJwSvVwrJWX8J/6E2Pd4Au2JoGTd/iK8Z3?=
 =?us-ascii?Q?+tcaUV5kbg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afdfaa77-edea-495b-c191-08df152144dc
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:54.4459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94oc8bTDc7cuyf8WCvneAQ2qlVXjtwL8VtOrMRcuOpG1AuZ1GgG/KZ3NfBMpdfMs2nDd4uP/D3R42palVAgRFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349

The r000 GSP firmware includes a ucodes image, microcode that GSP-RM
loads at run time from a buffer that the driver maps for it. The image
is described by a TLV whose FILE tag names a separate file and whose
SIZE tag gives that file's length, which is the convention that the GSP
firmware image already uses.

The GSP firmware wrapper open-coded the reading of the FILE and SIZE
tags, so the ucodes loader could not share it.

Move the reading of the two tags into the TLV parser, and add the ucodes
loader on top of the parser. The loader maps the image through a radix3
page table, as the GSP firmware image is mapped, and the image is
required on every chipset that nova-core supports. The loader has no
caller until the switch to r000.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs         |  7 ++-
 drivers/gpu/nova-core/firmware/bindata.rs | 59 +++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/gsp.rs     | 15 ++----
 drivers/gpu/nova-core/firmware/tlv.rs     | 40 +++++++++++++--
 4 files changed, 105 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/nova-core/firmware/bindata.rs

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 358c9b8db0b8..d7ba03184ad5 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -22,6 +22,7 @@
     num::IntoSafeCast, //
 };
 
+pub(crate) mod bindata;
 pub(crate) mod booter;
 pub(crate) mod fwsec;
 pub(crate) mod gen_bootloader;
@@ -349,7 +350,11 @@ const fn make_entry_chipset(self, chipset: gpu::Chipset) -> Self {
         let mut this = self
             .make_entry_file(name, "gsp_bootloader.tlv")
             .make_entry_file(name, "gsp.tlv")
-            .make_entry_file(name, "gsp.bin");
+            .make_entry_file(name, "gsp.bin")
+            .make_entry_file(name, "ucodes.tlv")
+            // The metadata's FILE tag gives the image's real file name at run time. This static
+            // entry names the usual one.
+            .make_entry_file(name, "ucodes.bin");
 
         // Add the firmware files specific to the GSP boot method of `chipset`.
         let boot_files = boot_firmware_files(chipset);
diff --git a/drivers/gpu/nova-core/firmware/bindata.rs b/drivers/gpu/nova-core/firmware/bindata.rs
new file mode 100644
index 000000000000..410cb741273c
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/bindata.rs
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Loading of the ucodes image, the bindata blob of microcode that GSP-RM loads at run time.
+
+use kernel::{
+    device,
+    dma::DmaAddress,
+    prelude::*, //
+};
+
+use crate::{
+    firmware::{
+        radix3::Radix3,
+        tlv::{
+            request_tlv,
+            Tlv, //
+        },
+    },
+    gpu::Chipset,
+};
+
+/// The ucodes image, mapped for GSP-RM through a radix3 page table.
+pub(crate) struct UcodesImage<'a> {
+    /// The image and the page table that maps it.
+    radix3: Pin<KBox<Radix3<'a>>>,
+}
+
+#[expect(dead_code)]
+impl<'a> UcodesImage<'a> {
+    /// Loads the ucodes image that the `ucodes` metadata file names, and maps it for `dev`.
+    ///
+    /// # Errors
+    ///
+    /// - `ENOENT` if the metadata file is not installed.
+    /// - `EINVAL` if the metadata is malformed.
+    /// - `ENOMEM` if the page table cannot be allocated.
+    ///
+    /// Errors from [`Tlv::load_file`] are propagated as-is.
+    pub(crate) fn new(dev: &'a device::Device<device::Bound>, chipset: Chipset) -> Result<Self> {
+        let firmware = request_tlv(dev, chipset, "ucodes")?;
+        let tlv = Tlv::new(firmware.data())?;
+        let image = tlv.load_file(dev, chipset)?;
+
+        Ok(Self {
+            radix3: KBox::pin_init(Radix3::new(dev, image), GFP_KERNEL)?,
+        })
+    }
+
+    /// Returns the DMA address of the level 0 page of the page table that maps the image.
+    pub(crate) fn radix3_dma_address(&self) -> DmaAddress {
+        self.radix3.dma_address()
+    }
+
+    /// Returns the size of the image in bytes.
+    pub(crate) fn size(&self) -> usize {
+        self.radix3.size()
+    }
+}
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 341a8b19aa38..a2db7b6ba131 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -6,9 +6,7 @@
         Coherent,
         DmaAddress, //
     },
-    firmware,
-    prelude::*,
-    str::CString,
+    prelude::*, //
 };
 
 use crate::{
@@ -20,8 +18,7 @@
             Tlv,
         },
     },
-    gpu::Chipset,
-    num::FromSafeCast,
+    gpu::Chipset, //
 };
 
 /// The GSP firmware image, its signatures, and the GSP bootloader.
@@ -48,13 +45,7 @@ pub(crate) fn new(
             let tlv = Tlv::new(firmware.data())?;
             dev_dbg!(dev, "loaded gsp firmware v{}\n", tlv.get_string(b"VERS")?);
 
-            let size = usize::from_safe_cast(tlv.get_u32(b"SIZE")?);
-            let mut fw_vvec = VVec::zeroed(size, GFP_KERNEL).map_err(|_| ENOMEM)?;
-
-            let chip_name = chipset.name();
-            let file = tlv.get_string(b"FILE")?;
-            let filename = CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{file}"))?;
-            firmware::request_into_buf(&filename, dev, fw_vvec.as_mut_slice())?;
+            let fw_vvec = tlv.load_file(dev, chipset)?;
 
             let signatures = Coherent::from_slice(dev, tlv.get_bytes(b"SIGN")?, GFP_KERNEL)?;
 
diff --git a/drivers/gpu/nova-core/firmware/tlv.rs b/drivers/gpu/nova-core/firmware/tlv.rs
index 7b879f13a61e..7f278903dc8b 100644
--- a/drivers/gpu/nova-core/firmware/tlv.rs
+++ b/drivers/gpu/nova-core/firmware/tlv.rs
@@ -4,6 +4,7 @@
 use kernel::{
     device,
     firmware,
+    fmt,
     prelude::*,
     str::CString, //
 };
@@ -13,15 +14,18 @@
     num::*, //
 };
 
+/// Returns the path of `file` in `chipset`'s GSP firmware directory.
+fn gsp_firmware_path(chipset: gpu::Chipset, file: fmt::Arguments<'_>) -> Result<CString> {
+    CString::try_from_fmt(fmt!("nvidia/{}/gsp/{}", chipset.name(), file))
+}
+
 /// Requests the GPU firmware TLV `name` suitable for `chipset`.
 pub(crate) fn request_tlv(
     dev: &device::Device,
     chipset: gpu::Chipset,
     name: &str,
 ) -> Result<firmware::Firmware> {
-    let chip_name = chipset.name();
-
-    let filename = CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name}.tlv"))?;
+    let filename = gsp_firmware_path(chipset, fmt!("{name}.tlv"))?;
 
     dev_dbg!(dev, "loading firmware image {:?}\n", &filename);
 
@@ -198,6 +202,36 @@ fn iter(&self) -> TlvIter<'_, 'a> {
         self.iter().find(|b| b.tag == *tag).ok_or(EINVAL)
     }
 
+    /// Loads the file that the `FILE` tag names from `chipset`'s GSP firmware directory.
+    ///
+    /// The `SIZE` tag gives the file's length, and the returned buffer is that long.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if `FILE` or `SIZE` is absent, or `FILE` does not hold a valid string.
+    /// - `ENODATA` if `SIZE` is zero.
+    /// - `ENOMEM` if the buffer cannot be allocated.
+    ///
+    /// Errors from the firmware request, `ENOENT` in particular, are propagated as-is.
+    pub(crate) fn load_file(
+        &self,
+        dev: &device::Device,
+        chipset: gpu::Chipset,
+    ) -> Result<VVec<u8>> {
+        let file = self.get_string(b"FILE")?;
+        let path = gsp_firmware_path(chipset, fmt!("{file}"))?;
+
+        let size = usize::from_safe_cast(self.get_u32(b"SIZE")?);
+        if size == 0 {
+            return Err(ENODATA);
+        }
+
+        let mut data = VVec::zeroed(size, GFP_KERNEL).map_err(|_| ENOMEM)?;
+        firmware::request_into_buf(&path, dev, data.as_mut_slice())?;
+
+        Ok(data)
+    }
+
     /// Return a slice of bytes.
     ///
     /// Returns `EINVAL` if the value is empty.
-- 
2.55.0

