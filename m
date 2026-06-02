Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011024.outbound.protection.outlook.com [40.93.194.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A29436827E
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370509; cv=fail; b=F39Xoy+e5asyymGWf3+wHJ4xAd4YBbUQVibqVqPevqpJhyredps8njyvYAkMG9Ij4+VIxfSgXZVLtbxELWgbpA4xuVIDLYbSjJzy9ZU8dfD1qHdb2o1i9MMbGx6TSS+i07vIDM0b5JlUVx7xwLZnhRpMoP3SoZCVe8TYpAldSjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370509; c=relaxed/simple;
	bh=L0/BCrtXpp3fCZAA9cnmi45T2bogBjOAW32AyCJb7mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OaeERYbshWxirVBAj03qdEuCm9sRrpcrkjfYYiqfssIHldUWzT1siwblkqoUzFtncwLmhIzOPiWFcM7MJFxMx+rTPhVjD3g7iqxYRyT+Y2ZqiSrpVmtSZLFP849z1L37fjcJJNeOz/MGzPxA1uYm4m2xj8sPg4f+nHrZ22Tt934=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ss8XJbb2; arc=fail smtp.client-ip=40.93.194.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ss8XJbb2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfvZyCHXu3NHh0L7nbkkauajqw/4z2vJISVe9DI+9uXitdE0DMStX2zQ6LNxozYXyUYf8FQU+TnJ8WJKQEt9I/C7IIkBJKW122XotwBCLALLrU9jvX2fSZhwNlgW7WLy0UZ5ieU1RCqlAbsT+HcPwIZTz8c2F+PCUj7yUkI+D0kPr3FLcy5MTuH3NT0eRcxsHtAbEbkqlcB9jQQot1id7/Sk18pTCjEvLhQnzxAMiFBtlpxRvSyJcWLgfVlDNxZY2D9gq5Gzi1/TmzrTXYkWVO5mcZlBNcBDrk0lwT8VNi7sDTZoZ+VQKyq8HsoEQTxFYMTt834VstX5++cbc9+WyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLHB282HA3iJatq/pRVPfuJHEZzzvDvtETHHX6t8/Iw=;
 b=fPFeAWtjuifs6LB8ps6FvPqH6gDRUpaCbt+IQEN4O5l0rLszLgOY+mmwMBEShkGZgCz70EhGxWAT6RwS1gf8tVr13RyAxODbgjzBXlK5EvVDnerpK70woTaJlm/vI0i6gl1dBUMbNeBVkpeZaUI9Rk8wqNe0ritut1euFI+xX6zNT4gzce++qhaX6rMXvhoL6+Q1YQA7zsx4YN5BU9pYbjbnAkR+Fno9x3Y/ov+2mMtWpq7sv99sbs8W/ZQjwbPrE0WQK2iTO/1K2pHZoq6hx9hySKX/ncox3LU9SrtH7eGSRoWxT4sFvdejGuqw44vM435rIElWCUjXXVb1crpFKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLHB282HA3iJatq/pRVPfuJHEZzzvDvtETHHX6t8/Iw=;
 b=ss8XJbb2RJ/7uavKVY3qXJB/3YbzS6Sre7MoCQr1scYOOYhAE+MvUFtBDUwdw6lG1rRYBZIeBQaJkSFD/cPwTeRdgVHkKB9toUTS4sXXU/0MyD/n6m9dZVe2Jabdyuzzj4XOC4Yuctet0SmEXTyLDQLMZ7288k9AsC1St776oF1njy1vjEZAid6tonpGHh1J7jjH8reQgtchTVuhBBfK0TNUm/x/C+N5lqcu7Du3RfzaReBcnTSqluVWxPrlBHbEH/k433qLJBPzRqRYNm3oEqt7g4R6PZMNTnShaknCLafT9KVB1rr+XH4b1sKitni25FyYRvWaPdijlKKATrBwuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:36 +0000
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
Subject: [PATCH v12 18/22] gpu: nova-core: Hopper/Blackwell: select FSP Chain of Trust version
Date: Mon,  1 Jun 2026 20:21:06 -0700
Message-ID: <20260602032111.224790-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0078.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: a0fa5be4-b69a-4f3c-bcc8-08dec0560de6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|56012099006|3023799007|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	mHD6qf1asK8IhzL8qcG9oEFQdZrHSUp8pLLqxMyuzyH59ftblByrhgs6kcmMo13DPqVe3O5kbwQeydA+H5zwMJEz54BihnMClvAXyki5TP1qPCnDm3RBwNDvfS/1aEurIW0/wKQy4TJ943a2gaCV+qGNxWWLkYJkkx8iP5AAU+dz9ZKBbstLXG033bMicqRh/d2OfS2AGcjgo6IE2HFSX5Wde1bzZwKe0UbGNzcI9JnapF7tfm4mPTlmjVng6uwdFUPFZ+TvyfTNtMvChTFvy1QEPsIrUrgg+O8EHLkzRhBtyMqfXse0/09FsJzHZlQWYXKJrJhEMe43CLAwZVT2O73b/aVcMeabZ+ShCKqu7C92zR56h5rZOjRsDzB+55qkoVwyPBEwAucqfWICYMGAZEam79EJEl58wFL3C3qP9HVYvnUJ0TlWwHeZqa4rg9drZ09JjNKTu+3A/9nsLH+0nBzF4w7I6zyrl7okMzo57emS3fr+KHQnxDOMJRkSGqleHWOwWKXJASHShzR3gB9Fnn2Pq+V+dRy3vNMbuytqmOA6sreAxYFPIMWXHLpUl7Yj0bVMQx7ksyr6o+V9f/IPXte5QLLeaS8b9yf4K4irsSB90YROqYxDikGU6i1wVuaOCIwV0wz2QcIerMm2jh5UhCnOSMAxFrTtdPrUGY6VBFvWwNDCMTfNz83zFclE3CG/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(56012099006)(3023799007)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gqdUuyD12g4Xxe9kqB8Wl2A185EAjfa7s0uhhgx1zZdVfU3B1BtuGu7a8RMO?=
 =?us-ascii?Q?F1D3cxJa3Xr+/jedeM46ip1oYR2/zEMTcWj7QEQUI3cCGPGumlFZRGOhQvxY?=
 =?us-ascii?Q?nJxqwhJZHtp6MnvhISsmrfLw3zswlVMB+tCOXITFlvv67gSeyKJcZIG9Udox?=
 =?us-ascii?Q?4jg4E89HRHOr3kNm+C91S3ZcjIRKrV4MN1IMA54oMpleYpCg4tQ06HruDl5P?=
 =?us-ascii?Q?9jr24/ra9TUgutiPpANQoTJEPooiMcEAKeH53jtx0UmNIepOXuqdmoXw3HNO?=
 =?us-ascii?Q?xG22BEgSsqgm38ukBgzg/CGJS2D+lJd59hYDkK0FY5o8q8r567KtGYyeVWdG?=
 =?us-ascii?Q?TZAZnnntkAAw3CxkUMz3kjru+k7UjQOqqpebfnB+wXAxHObmQw9x2qBCsPAM?=
 =?us-ascii?Q?Y2rShlU9RF8Woon3Ta6/Zl30gl52H9TGCUh4Y08UZcvXBaqTWVRQEP8/GLp8?=
 =?us-ascii?Q?8AFN1KJbNScdj1+9yhu8YmZAU1cxhq5Tkmjy9bpAOGefiBJsIkWhpxnD5QpK?=
 =?us-ascii?Q?/HIwFVYQ8g6rnYjMDlMesR45ULH4y6IrPJ7lS8RHSXoDg2+8McC86G8+Qqqg?=
 =?us-ascii?Q?sbb5c/51yco6vI1jZhQf5gRhf0KUEdB0/VQsr5VqLdoUj/jXCT3hMFAQOOKC?=
 =?us-ascii?Q?UAeAYM8Sy5AtyY7Tse0IE48biIVaJwGDtdGDvPY5EHsE3oedpp+hFMe3BA/K?=
 =?us-ascii?Q?q2vnRQi9Ia6EsFpbiVaWY+esfh7CbwtKK8VNhG08quoKeySOHwtiPTnbf2kR?=
 =?us-ascii?Q?VMkb+kjMYGNw0lCKotCL7ao7AdaUcN9hDk3DDY+ttTuNdU3f0qkFA6547dcH?=
 =?us-ascii?Q?HTeVJRj0yQHcPaY5Dq2l0ZFJ2bhIc8azaB/tHX6pdCUOC2pl3TaP1S5Ww3kF?=
 =?us-ascii?Q?RDGSeDkko8vDaqKzxiEjzgF/nFoq8Mtkm0V67c8ZK9a8PvWOenUIAnI8repc?=
 =?us-ascii?Q?6IsNbUG+xWxlPmHAOTROspXJaeENImNdTl3vSC3KwcGKaSFNYEUAgEyQwsYm?=
 =?us-ascii?Q?CIhrf0kqm7qfNW7Z9Ex+ALA4J5UK0nlxQkC1yQgFZED13zhRbQ4cXf8M/277?=
 =?us-ascii?Q?9JEUF/SACv3ZQMJgkTPFOtaurEWdN9Cp6m3/ONwlXvNFd3DFRZo8/xzhtZ4H?=
 =?us-ascii?Q?WzONa8cZBk0bWZZ8dtbUqAIIu7Gepqu3tNV6oxev68oZAV7jSQKqDhjk5bmX?=
 =?us-ascii?Q?0r0fd/6S1M3vUTBaxltQ1Yl72CqPYpG4iwKXRTy1k6CTdmLWjNRrxsqm55G0?=
 =?us-ascii?Q?bfGCyhrCQgRpxR8yqxobuXatlL7jofeHIGTzmPPHF5HHPdoXpxBVdTxDoaK4?=
 =?us-ascii?Q?+EU+iA2d33ALOgbCRmuvWTTOsCR605KGaQA1r+ZQUtQjZx9SKqjIdqQww33t?=
 =?us-ascii?Q?PC2lG/bGQGPfLbnxgvQgqBnNUfRWHNjY2iUkq3ripUUNtWxfzcklGu7cp/Zj?=
 =?us-ascii?Q?x6ZpJ5spNf1KsQ7clmFqWGHF2ulmxL2ZSp2h2DuCDfN8i1rRkdiTLvUtZpsE?=
 =?us-ascii?Q?/AnjzLVi6jcR0xC8tM60MEcqnen2OH18f479L9Go1x/SwfZ0wgffNj4hy4Pv?=
 =?us-ascii?Q?4gDgKxVIMfUjnEVdlY6YdVCvNfFO2ria1FUrE+l8A3Z4eFeTlhz20z7Rzgaj?=
 =?us-ascii?Q?xz76WWyI4izzjN2dJR1vcJ16+O3yr+SN9W2EGju1W89IblMu+kapJlftBbNN?=
 =?us-ascii?Q?ZfSIK2dLUI/xkGx2FxWsjReK7XaSKJL6fggTJ5B0OWOytJH/KyB+9XiOOsMv?=
 =?us-ascii?Q?aZh+Tqj4wQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fa5be4-b69a-4f3c-bcc8-08dec0560de6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:36.7510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLZb/0N+h6SnHYfIH9eNtAL21NYLGnZHlqVE2Z2JJtPnsqzMtrEUP5/tpV7zu4BLgQRLD4/7guFaUHuyBEjIWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974

The FSP Chain of Trust handshake is versioned: Hopper speaks version 1
and Blackwell speaks version 2. Provide the version through the FSP HAL
so the boot message carries the value FSP expects, and so chipsets that
do not use FSP need not express a version at all.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp/hal.rs       |  8 +++++++-
 drivers/gpu/nova-core/fsp/hal/gb100.rs | 23 +++++++++++++++++++++++
 drivers/gpu/nova-core/fsp/hal/gb202.rs |  4 ++++
 drivers/gpu/nova-core/fsp/hal/gh100.rs | 15 ++++++++++++---
 4 files changed, 46 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fsp/hal/gb100.rs

diff --git a/drivers/gpu/nova-core/fsp/hal.rs b/drivers/gpu/nova-core/fsp/hal.rs
index 83d1e7daa998..8f9c031102e0 100644
--- a/drivers/gpu/nova-core/fsp/hal.rs
+++ b/drivers/gpu/nova-core/fsp/hal.rs
@@ -9,19 +9,25 @@
     },
 };
 
+mod gb100;
 mod gb202;
 mod gh100;
 
 pub(super) trait FspHal {
     /// Returns the secure boot status from the architecture-specific `NV_THERM_I2CS_SCRATCH` register.
     fn fsp_boot_status(&self, bar: &Bar0) -> u32;
+
+    /// Returns the FSP Chain of Trust protocol version this chipset advertises.
+    #[expect(dead_code)]
+    fn cot_version(&self) -> u16;
 }
 
 /// Returns the FSP HAL, or `None` if the architecture doesn't support FSP.
 pub(crate) fn fsp_hal(chipset: Chipset) -> Option<&'static dyn FspHal> {
     match chipset.arch() {
         Architecture::Turing | Architecture::Ampere | Architecture::Ada => None,
-        Architecture::Hopper | Architecture::BlackwellGB10x => Some(gh100::GH100_HAL),
+        Architecture::Hopper => Some(gh100::GH100_HAL),
+        Architecture::BlackwellGB10x => Some(gb100::GB100_HAL),
         Architecture::BlackwellGB20x => Some(gb202::GB202_HAL),
     }
 }
diff --git a/drivers/gpu/nova-core/fsp/hal/gb100.rs b/drivers/gpu/nova-core/fsp/hal/gb100.rs
new file mode 100644
index 000000000000..d50aaba0a84f
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp/hal/gb100.rs
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use crate::{
+    driver::Bar0,
+    fsp::hal::FspHal, //
+};
+
+struct Gb100;
+
+impl FspHal for Gb100 {
+    fn fsp_boot_status(&self, bar: &Bar0) -> u32 {
+        // GB10x shares Hopper's FSP secure boot status register.
+        super::gh100::fsp_boot_status_gh100(bar)
+    }
+
+    fn cot_version(&self) -> u16 {
+        2
+    }
+}
+
+const GB100: Gb100 = Gb100;
+pub(super) const GB100_HAL: &dyn FspHal = &GB100;
diff --git a/drivers/gpu/nova-core/fsp/hal/gb202.rs b/drivers/gpu/nova-core/fsp/hal/gb202.rs
index 2f08b6c9f308..2bca76c8fd64 100644
--- a/drivers/gpu/nova-core/fsp/hal/gb202.rs
+++ b/drivers/gpu/nova-core/fsp/hal/gb202.rs
@@ -17,6 +17,10 @@ fn fsp_boot_status(&self, bar: &Bar0) -> u32 {
             .fsp_boot_complete()
             .into()
     }
+
+    fn cot_version(&self) -> u16 {
+        2
+    }
 }
 
 const GB202: Gb202 = Gb202;
diff --git a/drivers/gpu/nova-core/fsp/hal/gh100.rs b/drivers/gpu/nova-core/fsp/hal/gh100.rs
index 290fb55a81da..c38a7e96eb60 100644
--- a/drivers/gpu/nova-core/fsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/fsp/hal/gh100.rs
@@ -11,11 +11,20 @@
 
 struct Gh100;
 
+/// Reads the FSP secure boot status from the Hopper/GB10x thermal scratch register.
+pub(super) fn fsp_boot_status_gh100(bar: &Bar0) -> u32 {
+    bar.read(regs::gh100::NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE)
+        .fsp_boot_complete()
+        .into()
+}
+
 impl FspHal for Gh100 {
     fn fsp_boot_status(&self, bar: &Bar0) -> u32 {
-        bar.read(regs::gh100::NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE)
-            .fsp_boot_complete()
-            .into()
+        fsp_boot_status_gh100(bar)
+    }
+
+    fn cot_version(&self) -> u16 {
+        1
     }
 }
 
-- 
2.54.0

