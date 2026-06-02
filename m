Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615203546E9
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370508; cv=fail; b=pErMOs5NQ3QN928AyAm/8MN8sZZUNWk05pZoEeoBO+52iT1l8r20q86lOsGfheJa1TRnEbfLuwyBmJt+HAnZC35hS/zwdGRNhosRk5I81zS8te4l/YBVcWDbiohqQNPymacxkkFw2YMbCbuf+sbJEupyzI/HPZTBI3CcSFtX5wE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370508; c=relaxed/simple;
	bh=ZP0LaWKGVzeDKpAWe8/5Rhu5aSGj+0HlpyuVm0dUr8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dlCgbRQZTCuTor+E1Lk+Q6NgNJ1LC6sNJ0IMvdrB9BxrqRdgTDK+N+C53+9e24l5lXmD0ByJNlUABmReD1/RpMWyz1jBOJ8a9rfAQ+hXJt7g8/mFqFIEuz3y7mWP+QtePJazr0KzwBmm/NvZJCx/aIk0nFziTHmFDJL8LjVafSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QFnOLt6i; arc=fail smtp.client-ip=52.101.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QFnOLt6i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+v7r/yOM3CCOsOrP1Jw8uEGQPLaS7ZqSm0vLkxvP4rI4ppGUDy7ZrLuKSVSzgk4E2/xQk4iLvoh74NRZhvgN5ix2xoNXA41e6DbdAQRjvF2ZgVnAE/xeFFBHBXlbyvM0wQyQTB1IadVQDOOpwtyme2Ith07f0ssJWUbE7GkeiT9+oi4XoF/aefoyxzb8yKI+GLjJPqXyXEBhG1+Wh2LaUfWZAG0RHRrd8aGaW9v0ImonKxB5UQMUut1hz8H963rDWegspNsPGc+slTcG3Sfbu47zwBVz8UCBT+xO37Rfz5JJkmGiK4puh2ePI4g4eUZSjeP5pAWCu9PqCvuj3K1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wy63nH21jhOYtW2ebLA1W3CpqTKcfjZZeRi4G+7Dmg=;
 b=qMhrPNBrZSHhy64iBK0WSDa3oRAyY8ubnUnYLDqUZPzY/H+VKLfG42xhpcOQOrxlcx4qAFPqefds3GMfRaG5R/uGtXLGTCShlZ8kX0WbRWw9YNdrNf4G5r5t399YJX2sjx+HS+hGBxDtjeFhOQKE0D9C+PgxobDbROtIPpIP5Ing3w2Sa+bcO81wGyCTUzG9MCnYmnbxJSVdHHTXlN4I88JR1wdYmy9hIxGeRvL0DVpwBmL419mlwSQtB2Qwf/tRVbQxTv0LNnkViErZfMtl6tp4pyM/wtpc4iDKFZfvESXbRbI8hHcxGItBiPKOl1emsbAARa4TqmU3mi/1DvEhLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wy63nH21jhOYtW2ebLA1W3CpqTKcfjZZeRi4G+7Dmg=;
 b=QFnOLt6izF1VxHvFKtbumatsrJ/SJqPi4Yw26LDG92IOsc0QZPqLthCP6rfiCtvBvpaNdNQUSxdR7k1zWQ0kuD3v/JdS6RKpChFgJRfZ5BTzj2KNBMoQuboMrLRqO+vabXLWa0w/dAd7C6NUeLSWyxuin0E8bvy0KfyBBntvXoy5iKlu62DnyjPeNJ/clxsHsc7f+XCRVBJFwZzsTbefIR0ZSbbeFtdN0fwps+stuqnmOjEa7qI3DEmGtIZ7rS/WKOuT8IoYT2/aQlqvJagmDKZr51nDvWJEnvrxwtSrTvDtZNbVOFNjBOuIYuJEHFOfqrJkrwh5J6yYkNLCUX1VUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:17 +0000
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
Subject: [PATCH v12 03/22] gpu: nova-core: Blackwell: compute PMU-reserved framebuffer size
Date: Mon,  1 Jun 2026 20:20:51 -0700
Message-ID: <20260602032111.224790-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:a03:333::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 21513d3b-0800-41d5-0a84-08dec0560255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	2OWnPxTc4rUh1LH2CvzZJKDNRfbmAoceRUY1qsf922VucJVyXus/asVXYZbMf3i5LAXqKGoILflcavlmapHshsxP+114bJBZh+qF0HWfxYlZkMG+bGid19j4lnrGWbQU2YrVucwVUE9SkfGM9lBEk7WnnQe4W8QU8KzY2cKgz5GBhn4U5u+LNvDws4B+vbsrAu9hgq4JIXjQ0gw9457a+XQZW0RwHgF4AeFACxZ0/H5U2TLC4QZ800UthwrK9OzqdjKu+8oVhLShRptk981NQZ6JZDRSV0KbjAY7+WjMGm4PxIp98W3mNjwQ4p1joxjLR5PU5ts8U0i+NjYERwM0yjJPag1+dgDjbgDv4xTqhP9tb0odMzEwds7kxkMVtDApybMLPHcdYgeA1h7GaRzyyI/9rkjA9BMGq7OQLa0mnX/6/XlljJ7V0BZxh3sfcOBnh7cBUnRJT0L6h/xZObemo3+sm1fUwqnDDu+Lv86s3MKrQkwlFTjqTlnW4IltFnK2rpGgD1n49KJrO+VXMHlkulRbO8sjS+xsCaaNfF5AIKIvv4/7V5yL5Xw2IyVKcbeKYbl42eR+GTWj5Txsk3eoKp4L8tfn5yNK1v2S18IlfDTzs2W/WWzurumAJFcW8zYyz4t3WLfDsEdDUMrAXF/0REH8HhYdjS0y8ToV+JM+8xzbyFDFmOKvwCzqpuc+WJV5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aUpIhDJSpIlaBlAA3+Tv/EHe1e2ZKLUd+dXvxRap1DHn0nzJ+LGxByiPp5wR?=
 =?us-ascii?Q?ZYqtusbStShj+EHwp7EunWN5lQFapfuVelCrA5WxXyRrbHdycrUyq71g57MB?=
 =?us-ascii?Q?e8NvtjvsYZdq+4ZyVkwXoeRnMoadECnae7W57gTork/W+ykYfSNvGIjxZ3/C?=
 =?us-ascii?Q?72QbwqZ6jR47Fd0fsUj0NzHNaB5olwmGFrPcEPE9bNqxh8ky8dmrXYNo9IF5?=
 =?us-ascii?Q?hQPn0NaRi/6+ldyT5mqcysFSV8H5kIDUJyszB6iRQ7rfVFEMQgdAT0GOqszz?=
 =?us-ascii?Q?5hrkrmYh8rHPMkTaxts6ePtFLBmHPXynQsDPxAWVylvVlS3e7VzlzT3vxqMY?=
 =?us-ascii?Q?JcsRR9mncEyctPCVFJ+YWmeNO9CHcR4wgVsTGMPtFBY2zikKVHMeFjiE9kXC?=
 =?us-ascii?Q?yMrXmDW8o38Mdbq5v4GIsqIOnGruW8vBgF0fSvqYKn7HREPS1HipZ/60aaRx?=
 =?us-ascii?Q?tCppm+ZhZMq8Kcu7XdRyaNTUx+NuktBh5J6H6V/Hkh8pDQVN61t0fv0KiOlc?=
 =?us-ascii?Q?2o9d4Lv/tfMMJ2EgINPRJ0fhPIfCd9TpzOXOhoq72W0A0+OzyEW5bvM4tkX0?=
 =?us-ascii?Q?zNIQhG/z3A2USs0UKN4Z6EURbXd3YkOGBdM5P3D6Y43XzPXeF5s2Hy/gkWzb?=
 =?us-ascii?Q?DPw2/DGsK7zEwo/V8HJNVm6vSdhH9meigo/YJiBnjrrirGxBA9F9SS8iVPb4?=
 =?us-ascii?Q?UIr4xp+xw7T5FMXLzrk+0nl0zxdun7+k9FIVtqZv6MA0Ityc2WCDMeapJByy?=
 =?us-ascii?Q?fMktHeoBwsg9mrEfaSYvJpXYhcYFnZ1kJamqVs5XJMY6w4AoajHsECBfwvDr?=
 =?us-ascii?Q?6DpetrIVMYOguSqNsBfpkfH0HxZildanP1hF32AP0ZaZJcsCda3Ql3yEpdmj?=
 =?us-ascii?Q?pOE7Qnj/U+ODCM2Ar4A8jefm+h1Sh4NxodYHZtS6R0uHmTC+aw8V1M3k06Iz?=
 =?us-ascii?Q?Dyg23G71wo8BZ2bMy3H8p1CrwENG0TLzpSI5jIpey/ojKoGgofkuPS0t6phS?=
 =?us-ascii?Q?EbxKSqFNydo8/QcpVcBz0Lutp75GBq4uaV3HNN0/53W9Utd7BXyyfB3B7GDm?=
 =?us-ascii?Q?m1VXVWGdSMobsZmD/p8H+Y/hVuyKoi0c9XBHzOnXxhxnBKU88ABjgThLgjZK?=
 =?us-ascii?Q?D29G4V5Qs+laqIlMKGx1K75WijWjvZrE9O3mB/Uu4k9KjG/8+V2uLTN8bzv0?=
 =?us-ascii?Q?NDJhr9eyrysQp9c8+ts/aPtLgaBnZ//xDXk4npCvbv/72df03wq2Hv/UJvk6?=
 =?us-ascii?Q?Ehvo1j1ZShCmALiF7Dokq8V9WEhI/+nSOsJGfe4lotCaX9DQIFFF7QwgfA0L?=
 =?us-ascii?Q?HwRBaY2S0or4z7Re9VA7iUnLsJF7FqZBCnJrHkHbZ+wZomW0PMfbmTe6bit3?=
 =?us-ascii?Q?XGWRpaOIn6LeA57xxq2/bB5nJIng4WjiFvP76r5ye69/zYbfUUjQNk8AhOSk?=
 =?us-ascii?Q?9UyYzMW5Vd/GQ9Qy6oxop3Ff2tNIvpTXhMPZONVhum/wIdFhlZ4S9kMQuiHi?=
 =?us-ascii?Q?OnKG/9sP6nH/2NbpHzEY9JhZ4iKAuL8XuWEeHhGx87yoLkBgoVdz4CNmIY+3?=
 =?us-ascii?Q?85eNGb4hD/WIn7/k2RbqXIjZ+FO2Sf70XuoE8ntwduuRw7c1nbrwcS/oVbmx?=
 =?us-ascii?Q?XKo2lrpLQlq7PRrVtdqn2Fwt5TQ1p/62QCmLqCH1CD3JW2Vu0+xoTM9Agq7M?=
 =?us-ascii?Q?OD92xY1JH7UEMjqIv0fbtSlMVMm36uerw/73ugSki/nHSCnnU7xxmnKooDQu?=
 =?us-ascii?Q?5mbBI+6nDQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21513d3b-0800-41d5-0a84-08dec0560255
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:17.3618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5e4G1NO0lpo82XWyztbgNJTBWl5+FRghOSmMKZlFEs38r5ijLbup69t23mMSe4zyobAWOVbYjTgkU1vxOlR8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

GSP boot needs to know how much framebuffer memory is reserved for
the PMU. Compute it per architecture: Blackwell dGPUs reserve a
non-zero amount, earlier architectures leave it at zero, matching
Open RM behavior.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           |  3 ++
 drivers/gpu/nova-core/fb/hal.rs       | 12 +++---
 drivers/gpu/nova-core/fb/hal/ga100.rs |  5 +++
 drivers/gpu/nova-core/fb/hal/ga102.rs |  7 +++-
 drivers/gpu/nova-core/fb/hal/gb100.rs | 57 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal/tu102.rs |  9 +++++
 drivers/gpu/nova-core/gsp/fw.rs       |  1 +
 7 files changed, 88 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 1fb65d4eb290..d7a4dc944131 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -165,6 +165,8 @@ pub(crate) struct FbLayout {
     pub(crate) wpr2: FbRange,
     pub(crate) heap: FbRange,
     pub(crate) vf_partition_count: u8,
+    /// PMU reserved memory size, in bytes.
+    pub(crate) pmu_reserved_size: u32,
 }
 
 impl FbLayout {
@@ -265,6 +267,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             wpr2,
             heap,
             vf_partition_count: 0,
+            pmu_reserved_size: hal.pmu_reserved_size(),
         })
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 8b192a503363..b45784ad5f2e 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 use kernel::prelude::*;
 
@@ -12,6 +13,7 @@
 
 mod ga100;
 mod ga102;
+mod gb100;
 mod tu102;
 
 pub(crate) trait FbHal {
@@ -29,6 +31,9 @@ pub(crate) trait FbHal {
     /// Returns the VRAM size, in bytes.
     fn vidmem_size(&self, bar: &Bar0) -> u64;
 
+    /// Returns the amount of VRAM to reserve for the PMU.
+    fn pmu_reserved_size(&self) -> u32;
+
     /// Returns the FRTS size, in bytes.
     fn frts_size(&self) -> u64;
 }
@@ -38,10 +43,7 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset.arch() {
         Architecture::Turing => tu102::TU102_HAL,
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
-        Architecture::Ampere => ga102::GA102_HAL,
-        Architecture::Ada
-        | Architecture::Hopper
-        | Architecture::BlackwellGB10x
-        | Architecture::BlackwellGB20x => ga102::GA102_HAL,
+        Architecture::Ampere | Architecture::Ada | Architecture::Hopper => ga102::GA102_HAL,
+        Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => gb100::GB100_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index 2f5871d915c3..0f5132aa9c31 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 use kernel::{
     io::Io,
@@ -67,6 +68,10 @@ fn vidmem_size(&self, bar: &Bar0) -> u64 {
         super::tu102::vidmem_size_gp102(bar)
     }
 
+    fn pmu_reserved_size(&self) -> u32 {
+        super::tu102::pmu_reserved_size_tu102()
+    }
+
     // GA100 is a special case where its FRTS region exists, but is empty.  We
     // return a size of 0 because we still need to record where the region starts.
     fn frts_size(&self) -> u64 {
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
index 3bb66f64bef7..17a2fef1ad44 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 use kernel::{
     io::Io,
@@ -11,7 +12,7 @@
     regs, //
 };
 
-fn vidmem_size_ga102(bar: &Bar0) -> u64 {
+pub(super) fn vidmem_size_ga102(bar: &Bar0) -> u64 {
     bar.read(regs::NV_USABLE_FB_SIZE_IN_MB).usable_fb_size()
 }
 
@@ -36,6 +37,10 @@ fn vidmem_size(&self, bar: &Bar0) -> u64 {
         vidmem_size_ga102(bar)
     }
 
+    fn pmu_reserved_size(&self) -> u32 {
+        super::tu102::pmu_reserved_size_tu102()
+    }
+
     fn frts_size(&self) -> u64 {
         super::tu102::frts_size_tu102()
     }
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
new file mode 100644
index 000000000000..c78027c26a9e
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Blackwell framebuffer HAL.
+
+use kernel::{
+    prelude::*,
+    ptr::{
+        const_align_up,
+        Alignment, //
+    },
+    sizes::*, //
+};
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal,
+    num::usize_into_u32, //
+};
+
+struct Gb100;
+
+const fn pmu_reserved_size_gb100() -> u32 {
+    usize_into_u32::<{ const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ_128K>()).unwrap() }>(
+    )
+}
+
+impl FbHal for Gb100 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        super::ga100::read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::ga102::vidmem_size_ga102(bar)
+    }
+
+    fn pmu_reserved_size(&self) -> u32 {
+        pmu_reserved_size_gb100()
+    }
+
+    fn frts_size(&self) -> u64 {
+        super::tu102::frts_size_tu102()
+    }
+}
+
+const GB100: Gb100 = Gb100;
+pub(super) const GB100_HAL: &dyn FbHal = &GB100;
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index 22c174bf1472..1755bbc27866 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 use kernel::{
     io::Io,
@@ -39,6 +40,10 @@ pub(super) fn vidmem_size_gp102(bar: &Bar0) -> u64 {
         .usable_fb_size()
 }
 
+pub(super) const fn pmu_reserved_size_tu102() -> u32 {
+    0
+}
+
 pub(super) const fn frts_size_tu102() -> u64 {
     u64::SZ_1M
 }
@@ -62,6 +67,10 @@ fn vidmem_size(&self, bar: &Bar0) -> u64 {
         vidmem_size_gp102(bar)
     }
 
+    fn pmu_reserved_size(&self) -> u32 {
+        pmu_reserved_size_tu102()
+    }
+
     fn frts_size(&self) -> u64 {
         frts_size_tu102()
     }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 33c9f5860771..919d3ab00075 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -247,6 +247,7 @@ pub(crate) fn new<'a>(
             fbSize: fb_layout.fb.end - fb_layout.fb.start,
             vgaWorkspaceOffset: fb_layout.vga_workspace.start,
             vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            pmuReservedSize: fb_layout.pmu_reserved_size,
             ..Zeroable::init_zeroed()
         });
 
-- 
2.54.0

