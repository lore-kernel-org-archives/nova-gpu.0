Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010025.outbound.protection.outlook.com [52.101.201.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1061F2380
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 01:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781140752; cv=fail; b=g4frYFN2eERWC6H683guWjKfhj9Cry2cMOIgBHAMGWjDHjCXjrIN22PD4iQYPwPtuDVMxn0M1vtfuJ5mXxrQLY6IDhbPIB6u4FhEiT/MEQPzWmb14/C+cOgC0CCusjVpiNP8hO+UdpxoZ1fSn/02K9RRqxX3piQ+eYnAShkLAw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781140752; c=relaxed/simple;
	bh=R78yCJ3Z3SvNE0knNH8wUkYpx9FYdjFNcU2GBH04loE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sEehmFmsIw6msc9PbZbHEMNJxGoJu3iO8TaSOh2LHqoLw+42ayncqZk9wNs7z8iBf9vF8SDJpr6xCpLZuEi1lfBHfYYZzvCs+IkYSdViPT6gmNdW0NV11AkAn8YMTo1ys6QUSvX3LJESMtuFbO0rbC17NZ/Iguok3w8p47zOdWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SzE2C8RW; arc=fail smtp.client-ip=52.101.201.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SzE2C8RW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHgb07w5MAWdiIycfUrjOAVbfl0HPhLd1VAyPpTmHQCpdYw20beSxuUEzYM+/l3enuoGErAjofXIfNKNoxuBcuqiqdCKvb6wKUopBvW0CFtW21vdcIOnTw6Gfmty2ueKdtgA4awH1Pfj9wpw10f8YeL4UbIrYmyRhqzbbI9qPwGuh3H6rBsh4mIDlK5ZP7rGOQqHg+Hp9pls4unmCMQFaq/b/hH4WKrf+qqiEyJbkmCErV1+9xseOchIeUy2+nkj0HhTmN64qxTxx6pUEz6TzxbtjRnMkQwiJBJ9b1s46HhLGrvVy64pkUYZxVoa0wKPRlxNe8fXPYhqoc9+pejetg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRA+u508Agiiu8Ct2mdCWqV5jtRzOzkLCtMEPBvZy0s=;
 b=s+UL7N5NYOX6ZRS7V/ReAsqz/fD9CAqgPx7DIyyAVDANxmej/3MBv1yYQTLKhUJT8G+gW0zCcPzcmhUJr2+i8CKvdKen9JpjpgsC0CpP2LMHAc+TJsz394EQuLmMRj0I06sKjZyqt+xlVIO21NLbCdLxK5EqTbwMA03yeC+/DUK44G4wkf6MKFF5wQnfj53B5WOakqOBqffw1haOZFD2bzxh5kQ604qmkMpIWDgHPWOhzMv42WfeC3DKxYVbLQXduh4P8meSKFL8yX919mNZPcNY1Ne8swJZsD3JCgIIYYAGnhZ4VqGUQ7G41iMKDp/OdOqM0pOcK+UhQnjpKKK20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRA+u508Agiiu8Ct2mdCWqV5jtRzOzkLCtMEPBvZy0s=;
 b=SzE2C8RW5Cw0oa6hSkZ3SZ0GIp9ynsPw1cZsccBJDFp134hCBlAeOFwUT/fNSLPzUvWIxjXskXHi6ezVyubI0ILOKTBr0n0ayUouL8WdiTcuJedcs0inErO6kA9Ml0oMC2y2vU0/ygBBQcuelW1mkXeG047VdeD7ctTPo7uqFBmNPF8FfoXgF8BPURVzjUvnHOxW2QW7QkTq52h9LPDM2IM+zXww3rCndsfu4OtVKMdq8kXE4j9aX4eaqGiNZgwGjEzWcQWnbzhFdSCkX9KcRXCGdpbpGqTgQBFKcD5L+wIP1vSzs7sBhD6N/UAqo0ByKA+X2PYOZwvF8brV5udDkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY5PR12MB6060.namprd12.prod.outlook.com (2603:10b6:930:2f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.11; Thu, 11 Jun 2026 01:19:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 01:19:06 +0000
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
Subject: [PATCH v2 2/3] gpu: nova-core: Hopper: use correct sysmem flush registers
Date: Wed, 10 Jun 2026 18:19:00 -0700
Message-ID: <20260611011901.84517-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611011901.84517-1-jhubbard@nvidia.com>
References: <20260611011901.84517-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY5PR12MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f5a100-b121-442f-2eb2-08dec7576e4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	68utGegnUKbgKV2dy2R7OyFagL1eEulB706Gpvzch1u4Sm7UexC00oryUS+4vDeNScT1pXIpt1CNGtBnBQKnf5TYKF99DhzN4214ROPKQ69/asZ7wcj5M4j49OHPeDujDiiYRdrZF4KyWLOT0zi7cJsClz4HkNJJWFToV+IehgEmiA73MMWVcv8U3rVap4UM4/khcTQkvLwvwfGJQGno47BS06h+IBAhNdCigy/k4vezlpCVvn4yJ0uE7N+jpDhVpdQFE1yfuwCsPeI0QVVBsxN1omSBO2eF1E59CsjPfMpMwuQwrQT6SJswJW6GAqjr0RsSF730XfE58jOBclsOFoD+e83nNcm2CWa2zak3aEoqsUgMTK1qzj1AJaBlZMQswUZMf057vFEzVPx6ahOuzET/QEOA7Qy7NdCbsG7uJhVvIMWMTgAvu7CA9JlZKZNqeP3ZogYObkf6C4powDPaZuknRT3nkFeUStrGHWFZApp47ri0s6ddAcePUudAgao++ZDvTksKOpJ3+bLjR8NxKZ96B9/RjzmA9H6TaL6u47RV5E7uSlhhYdztHwl0ejjVlXwNIJZyfakCOxiHJcAMVSr4IHj1urn0ZeNOa+s7jlI3TCpTW9vxr+WskDVVX2qZCRrKbnCiGjwHQ9wjhGxhQfBYowUnu+xdcfD1jDpyuKOK4OGrJ8ono0y0hnl0QC/M
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WeZ049xzmGp3pfOX7fHqXsZJdMUvqbcjFbF26KyqK4FmTSg4HZW+pJ/4xanf?=
 =?us-ascii?Q?Lbe8pB/jO+5Ep3LSFg3slEQGmixsZvA4ymMesoBPCTYAm7WsqWUOWI1H34+F?=
 =?us-ascii?Q?RwR7/mNcA5ze1JHL6lbsixPWHnynjvllamxzuy7BKr0u9jsxk94H+v45SIqk?=
 =?us-ascii?Q?l4eD5trRPz5RSFJonjrtxrRvdP+VYP2h++2n5jpWy/8RXLoanQEgBO395oWI?=
 =?us-ascii?Q?7WOkn8ot7n5l5YcUgjcyMzMe9X51skkukxc7WyZtP+gRO9EGaPJA4on0IoYs?=
 =?us-ascii?Q?6UHXuRfqVe2Iwkusmlv7qOpOHq4J/3sxqd5VEaxNEh9iX9VeLMg3rpl3PXJ8?=
 =?us-ascii?Q?CBuSUTWAYZhgHBKZY+jzhwX8p+X9tcJ79Q95c2Glf7Q6YwQImiAAvnCU9gvo?=
 =?us-ascii?Q?V18ptFmqR8sVTG5bJeo0fecMitgkjd9f/EUEzeXcwDK2Fsbi/F8YRPvpsKcN?=
 =?us-ascii?Q?0WdoWGDE2e5Lwg2vTwEcDDszwdoZPetWRKyk1TdMaxcrjfnvLJ/XP7avXKvC?=
 =?us-ascii?Q?mRyr2ZULDyW7QaGdyHbvs76EE8b9/Lx+A5f2geQyGDTksbk965R7D+3qT3oM?=
 =?us-ascii?Q?N7r/8842HlUeYDCDU9rJXIUzS5VywQkc3XOAdVyRRUnyfZ75V70JRGpPC/GX?=
 =?us-ascii?Q?BcSYxJ+X8z9B3yvrtiyZVhTaqliZye0ioVZdKNkyki0GI0CqWqf4SsE1qJZL?=
 =?us-ascii?Q?byyKDQr1swj0FfuqWNlwn98km+cyw4LzMxT9zlgaZMrkCa659lUqg2hjACWU?=
 =?us-ascii?Q?gc7+pXjs3bgF8qTFSHXPtrgkJxeoiBXElHmIpIpuFpt+OJYrSd4rvGj/YNCM?=
 =?us-ascii?Q?WPuq6NInfVfwFx78KkM3bMtVQQFd91PudVDONwyfmvGA007Xu+N2IKqsi2eN?=
 =?us-ascii?Q?ixuAToPEJ281CBldzxfQ4J7fS0bvHV3pfYnImWHR9QghM+gMj7Tj0wVPw7MK?=
 =?us-ascii?Q?LOd0QU+e2UoNdvxppzG/Ub0YCfK6KbvfzGfsNDqEaMq35e5NYsKaVbhyIxwU?=
 =?us-ascii?Q?R+9xWuMV/N9Kwvf5wbIzK8uaf2ldvZw2SzV4p24HrGUyHj2qH0srC+0cWMHh?=
 =?us-ascii?Q?GSrMVHbdl9HDxdfVQlxMvDa+AnVGqg2PQp5wOgrGubPmQ7yE4rg4HzDhScQ5?=
 =?us-ascii?Q?6wHe8qifsrKKzxnKPMI4+PrglxPL7NEPuWUmWs6TVuT61SGtNwv117y039Ak?=
 =?us-ascii?Q?Y212nuU92J+tEZr0olwySKlm3yghvkoALLKjOffMfJi6pJCkM3oMLPXxcgmw?=
 =?us-ascii?Q?stfHHG9mND9UvSScjrJzljCVkqYwExg7/oum/wb9ImAXxQrv6W2246j88/c4?=
 =?us-ascii?Q?WIreBLFghqAEddCxDUH/1MihQWUfLaspPo5v27l/NmXdf1l7hw6lUKXhmX7g?=
 =?us-ascii?Q?jziLZSolfTJP4Sf7QnKEr4jmhfWoNVGx3GHZG/fjZ5JafarH7Qq/O5Gk2uz7?=
 =?us-ascii?Q?v/E+k7K+bovAMgRWckOutWvHXD0MQCTyqo5MJP7NvpkDikLEHmiLabgljxWI?=
 =?us-ascii?Q?3hgK03UsMEBNRyy+5+IwWVQVT7B5Zg5VgybJeWRcwUnFuhjbefgvT6swuV6s?=
 =?us-ascii?Q?A71pdrMNl3srVZJpvGxBo65Rwn5ffiZAHGkYMtdj9hj/+R6imYLlQbOFsO8k?=
 =?us-ascii?Q?Wa7pzda8su0AfMNewlIVeYkN3qx5WGdmxcH4KS0/4nx+SN/io3bQU6L+qKvX?=
 =?us-ascii?Q?eHyxcAfF0uFzzH/kaFBTU1CJT92XjGlJP0f3uopbud6oCg6X4vRR5vkLDIDC?=
 =?us-ascii?Q?fFXY6YDsYA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f5a100-b121-442f-2eb2-08dec7576e4a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 01:19:06.0804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKQ+QVlAchh85IGOHDPaomgPFQprIJLvJZdOOa2qpjo8lcq8+PzqajgA1nXWCsKV/npU1nHaePz67kfw/Y8cYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6060

Hopper has its own FBHUB sysmem flush page registers, but the Hopper
framebuffer HAL delegates to the Ampere NISO path, which encodes the
address with an 8-bit right-shift. That programs the wrong value into
the wrong registers, so the GPU's sysmembar flush targets the wrong
system memory address.

Add Hopper's FBHUB flush registers and program them directly from the
Hopper HAL.

This has not yet been tested on real Hopper hardware (that's true for
nova-core in general).

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal/gh100.rs | 31 ++++++++++++++++++++++++---
 drivers/gpu/nova-core/regs.rs         | 19 ++++++++++++++++
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-core/fb/hal/gh100.rs
index 5450c7254dad..d39fe99537ed 100644
--- a/drivers/gpu/nova-core/fb/hal/gh100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
@@ -2,24 +2,49 @@
 // SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 use kernel::{
+    io::Io,
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
 
 struct Gh100;
 
+fn read_sysmem_flush_page_gh100(bar: Bar0<'_>) -> u64 {
+    let lo = u64::from(bar.read(regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO).adr());
+    let hi = u64::from(bar.read(regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI).adr());
+
+    (hi << 32) | lo
+}
+
+/// Write the sysmem flush page address through the Hopper FBHUB registers.
+fn write_sysmem_flush_page_gh100(bar: Bar0<'_>, addr: Bounded<u64, 52>) {
+    // Write HI first. The hardware will trigger the flush on the LO write.
+    bar.write_reg(
+        regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed()
+            .with_adr(addr.shr::<32, 20>().cast::<u32>()),
+    );
+    bar.write_reg(
+        // CAST: lower 32 bits. Hardware ignores bits 7:0.
+        regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr(*addr as u32),
+    );
+}
+
 impl FbHal for Gh100 {
     fn read_sysmem_flush_page(&self, bar: Bar0<'_>) -> u64 {
-        super::ga100::read_sysmem_flush_page_ga100(bar)
+        read_sysmem_flush_page_gh100(bar)
     }
 
     fn write_sysmem_flush_page(&self, bar: Bar0<'_>, addr: u64) -> Result {
-        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+        let addr = Bounded::<u64, 52>::try_new(addr).ok_or(EINVAL)?;
+
+        write_sysmem_flush_page_gh100(bar, addr);
 
         Ok(())
     }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 5ab7ccfb9855..7982778fd6cb 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -189,6 +189,25 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
     }
 }
 
+register! {
+    /// Low bits of the physical system memory address used by the GPU to perform
+    /// sysmembar operations on Hopper.
+    ///
+    /// Like the GB20x FBHUB0 registers, and unlike the Ampere
+    /// `NV_PFB_NISO_FLUSH_SYSMEM_ADDR` registers (which encode the address with an
+    /// 8-bit right-shift), these take the raw address split into lower and upper
+    /// halves. Hardware ignores bits 7:0 of the LO register.
+    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x00100a34 {
+        31:0    adr => u32;
+    }
+
+    /// High bits of the physical system memory address used by the GPU to perform
+    /// sysmembar operations on Hopper.
+    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x00100a38 {
+        19:0    adr;
+    }
+}
+
 impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
-- 
2.54.0

