Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1782F3C07
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363732; cv=fail; b=G1vTRpWtqhsAYDQyjcNCkZsGCST14a0yulcydZUWt7pPt5x8Q0DVlCHaQg8R822uoRCYEr3l/KS/c2g11PAXAcS8HqZZG1t2ESzqUfq6arn4PVHWUJd+Esp8i6XwDvDLbhYLj36XP1UxI7enn3TiuSJ/W508f5JSKx+KTOygaoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363732; c=relaxed/simple;
	bh=hMWQ/0RN/5QzDdL0/AEYubIIeLlfxkXuG7N6WixwXBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mFcxyEEQmoVHAApYD4lriWnq1KpgHUcaQ89XFGECJQTKROUSvZkKbKjS9/kUnqYfYPNpNHaomJ7J8ctJPXkEsbLAlFhIXpVwiRDtiKqFjqEdrAN1S5oEIha8WXqR18Q+jZ7DVZK/oWr2GYMXCRTqzpI8neQxFqLiyztsBD2tywc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EawxZ+Oo; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EawxZ+Oo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5M1PcrjcL0ydLeOpr4YVkgGEfkdwyBnH8+73i1xS/VjXRHIWZIkY09+2fd5lGeOGI1CTI5TbCY2dY88s31tOI2W6yCEl65n0Xzp3nJbplJhy9cMqh84r9jLerV5bumtmkxzpu3BXHGs0E4cedJcaJNoOuHfu7EXDAx7Eo9CB5lax4sDixrFkTx8Z/QYw8lM8qY5SG85tfS0CkVFxvqkdI5FS7L6iuuNSN9c1aPyHHB+sF5CdLJdD58ffClSzUfGFYcId/LLUdLTWFMUS8lYpWjWMojFLqXcOyxa6wshArlTwmm8vGvqxpFH7TdBDhW0cg03gHBFI95Y8R7gVLhVsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTqS0iaUyzXOPAP7G1bRN2eIAGFAUWRphBV77NG22Og=;
 b=CJFn1U9873UDT0a76d1bPhfnUOKhshPwMezGnHbmiR2GSiAqI94x/Ml5a3SujZfTzjH+NIOB8rb4+GeRQmOaNGUH4HREyEBjtQANbdeVCE0F60C+1ee01sZCSxSs3jWUkQgakU4QphWYoBO+KCFWrf44pRyt+1/WxA7wuWHU6JuKGwgc/5X7QH0Y09XCePcC7md8pRAzZJ+okrgYoSCJVGrr1miphBu28V0rzF0359Z73+vs9/bDpwqhY4D7z94Tm06aqKIEF1J5fQwdHy9Ld5VL/gzOHGzGt5VPNncBqH4FFdIxvM8k8geqvpOoMPW2sCXoow+MdSWoUk0nOLwoVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTqS0iaUyzXOPAP7G1bRN2eIAGFAUWRphBV77NG22Og=;
 b=EawxZ+OofEWglOEhmihP3qAPCsu7C7u2HUZtUfZ4cFxlFaVGZZeOuYeOAlE+AKTrhiP1OLwn3g/UA9hS+SrIs/GHwP1dvH3jE+nqXbYckG0zdaj+QSg/G0O7FCzYXvBvcNdHRgXwwASLONZNKcP0E/u81E2mo1C9zFzKQqVP83TvVV9RganYnkIknMk+7TzgWl2C4pV0Q37/U3NjigLCSGpCO5pQ0+OPOwtXImHkggeXiYnLLI3/5AWYo5tbTy3EFtIINSMhziEC6Yd1t3cZCkzB78PO5RSN3KWFswlg39GnzyIYKcShO7ngQBIO2Hkh4uzlGZf5R46wGf9Y+EQUxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 01:55:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:22 +0000
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
Subject: [PATCH v2 08/31] gpu: nova-core: add optional ucodes firmware loading
Date: Fri, 21 Aug 2026 18:54:25 -0700
Message-ID: <20260822015448.238214-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: c79e396a-b681-467a-8076-08defff06d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|56012099006|10067099003|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	m6HbGFeyUJxgZX2kWL26xhAZv1mKm/qSl7wz2kQG79I+NTqlSSeU6pZOqA3yBuFa/yO9OGzuFE7RqfvUPM01gpK79m/WvENZ2CkoioGwIeu74YHv6oRlWFIDmeBa/jR74Bidlabc9T+ITyDTHY0QIrfTOdnl4I9s+Yq9W0397KZ4DeBbkRShl15Zde09VU8uMm6XC8J91UKNpfsL1dkPq2n+Tzjt2jB7na9jk2mViDTQ9XqRtI0XUWXlK0TFSgNDz0xTZ4r1B4CJuIWLCaVAbozbH53ELwZ4nbCHsV122FLUU+xY+o0fepo5JdHLigvvOK1Sic7336XDORcC0WUXNinltTHTY/U6gi2cSEg3cHwc1iQpAYXoP5EwElLFI/FwEDTlXeMivOE/vIOqwgDxYNddzpqjbIHQWaXkcoNyc0+ZWpwG52eSlyk0yMlHBZxdt4+bUL1sxRWiQjMn38PPGLMmpwpa/U3yPi+qdtySyOuvIj0bQ5/oZKn1FNwO73P60pSzoLbkPdRq04rvpdIqKOX0ZrSFSnwTuvBxk+ItCBm/uJEscpecrakpsU1GHL6DgZJP/phe5gCPPMbvp9bCcXF+F++zLU7juUye7R3FuC1S0bvNoza3kKZQPQmFHjzY5dUks39wfdQTAwig7MUQRg3ja7Ng3oXkQvlW6jJFc6c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(56012099006)(10067099003)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WHRB86kGf1yC6RMYQYJvTOdyv0VaMmKhfFlpoDZvi2LZoGmW9DPXlgE6EmUG?=
 =?us-ascii?Q?dErjRWrX1Wji7Rav+0snt0PuIixhiKQOC3aPPfM1a1gX4PkN7ehqCfLh4+S3?=
 =?us-ascii?Q?agWVoSGTeKUBq9It/B/7IgeQgw6TqxCiPEUlx2CsDHoiDU+FwdTgltL19iXQ?=
 =?us-ascii?Q?4bcEat6OyhQZQSzI2h+YdLD2+/QG9KAUGDTzYs5FP/Q9rDSV6dTP7xQnWFdQ?=
 =?us-ascii?Q?dYl7xzgt+93Gn/IgSwBFIfCQM524dGMmz8uD9YBjkebYb4DXv+grcUyOzVPa?=
 =?us-ascii?Q?si9fg0tgg7ijEFN8jVMY/2rrsqI0PcYysACsV/MRCAQxFjMTvaT1RzkLp/Qz?=
 =?us-ascii?Q?BZ4r5+C/Dq+rgGEKdjz+YOje4cA7B0BZACAQvFH/1bvQcb/2Iq0pLWrwYpKE?=
 =?us-ascii?Q?9wdWQmhf2RxSphuR+FCUUVPMdFTXSWuGHu9Tx5jD8Wz3jXGr4uGhyHod4wmM?=
 =?us-ascii?Q?o/5ikdrgQrQVnT0d5mbdopqGhHTI3ADkoap1cutY6mwTb0mWbJh+6B9Ue65c?=
 =?us-ascii?Q?MKysQ12nhclvfU3eTlDXT9xdCpvQ4oD4XixNXMziOxgmsXiVJHVSUDxvbQjn?=
 =?us-ascii?Q?AQJkxJVZ0bUnrT8S02C7tschgS8SaD3YHNzCbebjhRvjNbL+EJt2E0bedT3l?=
 =?us-ascii?Q?aUj5jrbUf9RV/XtaOCkXXh4V1l2ePJDQKap6poYXIU5bzCtbakd4/XtJRxi4?=
 =?us-ascii?Q?tK8M9yjl7kDtHrWYQ6K15PNxsT2Ohwz5FvYx52ujshQHWmQ8BoOE3SufAsXY?=
 =?us-ascii?Q?rbUXqDS2hemLgcqgLxvF7I5FAeIeZKzdiTMydjhiN8LL5MZ1WkwIpMxnjbTX?=
 =?us-ascii?Q?kWBBOvRVX53kYfXEj4ANdOMkEv8H8h5NtpAYFneYStVLxaFkNx+t6t8SZ5kp?=
 =?us-ascii?Q?LPOTLynetXPdMevLU6goJ7B2isCuCn6V1qD7C9m48/obHt4vMNcqlXBKMvuL?=
 =?us-ascii?Q?sIKb/SLUrec17nTu5SZSZYJJOS+Yq9U69c/u/PY4YJBqBxUcoZVpE24mqBah?=
 =?us-ascii?Q?X+g75lRFMWLuVeiLZk0YfSKeu7Ljj1wxA67rZNHFpEjtFxUZaDo89syZf/Ua?=
 =?us-ascii?Q?oShbs+in0dLZHBxTetlHuZEO3QEQoXSHBUJOKPT1+6PXUafqFeSnI5YuLn7N?=
 =?us-ascii?Q?S6nGrcuiS+DtLN9QBUIvmi7BObAIdwfHwrqfAcKzrulyD0A/BqxbausslMIX?=
 =?us-ascii?Q?yb7xYLiI6fkYMuVRdf0eFS9j3BcOAVklbA8KCG9L6sedS9t5V9N6os1vOZj2?=
 =?us-ascii?Q?hFxOuJZL1EVUKUKDkqH/OkeFMRAADAqpyPB2l2EfZo2JKrRXHZPFv7NmzuOw?=
 =?us-ascii?Q?ZCaMnWgnYfouMFmb02SEylfAg5iAjpNiv5OX/heSLdOSeWJ/3WRjddnNDbE3?=
 =?us-ascii?Q?AEPxsN3hof+VvdqgSpW7ACHHG8SVqIY3KbgsYf/oMHEmgaj2k8Tibv9VpEkq?=
 =?us-ascii?Q?JtPf/xZ2ZKym/naG75tqLEkmDMM2Tvi6l/ZY9Ht6ZsxaJWIdWE0wWCq+/4w2?=
 =?us-ascii?Q?NgBNQEs2xb4Q8LhYO3RyGWKHyw2qmwgjDFTFdTjF5vbTGReLQ8wYonB5x9Fr?=
 =?us-ascii?Q?NCvXZUhDANUrPN3vjawXmkfiy8GwjdqdgNyGhdDGuOczv9JgJliAtSsELzgz?=
 =?us-ascii?Q?LkD2ngidow90YxmEeW/5OjNoCCVQeO3oo5t/mckNNXXoC/E9ihv4DGPp86Uz?=
 =?us-ascii?Q?YtFB4178pM4SuD5zmaRHo7taIudk5GrwNAqfWoLqNeoHQgYt+IqjBcoTSZGo?=
 =?us-ascii?Q?KF/vins8Mw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c79e396a-b681-467a-8076-08defff06d01
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:22.3310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMkdG+jcc0jArQw+VLlJ934GAN5EM54MpMV0+QbkBz9tTkVSUob2Pi23IpWwT3Y1jxDAVqEKBh5tczC3tdUrGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

The new GSP firmware takes an optional ucodes image, a bindata blob of
microcode that GSP-RM loads at runtime. Open RM fetches it for every
chip family except GB10Y and fails firmware load without it, so the
driver will require it too once it boots the new firmware. The helper
added here reports a missing metadata file rather than failing, and
leaves that policy to its caller.

Load the ucodes metadata with the existing TLV request helper, and give
the TLV parser a method for the payload convention it uses: a FILE
basename together with its SIZE. A FILE tag may only name a basename in
the metadata file's own directory, so one holding a path separator or
naming a special directory is rejected. The GSP firmware image is named
the same way, so both go through the same method. Nothing calls this
until the driver switches to the new firmware.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs         |  8 ++++-
 drivers/gpu/nova-core/firmware/bindata.rs | 39 +++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/gsp.rs     | 14 ++------
 drivers/gpu/nova-core/firmware/tlv.rs     | 37 +++++++++++++++++++++
 4 files changed, 86 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/nova-core/firmware/bindata.rs

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 34657004568c..dfd41364cc77 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -22,6 +22,7 @@
     num::IntoSafeCast, //
 };
 
+pub(crate) mod bindata;
 pub(crate) mod booter;
 pub(crate) mod fsp;
 pub(crate) mod fwsec;
@@ -348,7 +349,12 @@ const fn make_entry_chipset(self, chipset: gpu::Chipset) -> Self {
         let mut this = self
             .make_entry_file(name, "gsp_bootloader.tlv")
             .make_entry_file(name, "gsp.tlv")
-            .make_entry_file(name, "gsp.bin");
+            .make_entry_file(name, "gsp.bin")
+            .make_entry_file(name, "ucodes.tlv")
+            // `ucodes.tlv` may name another safe basename in its FILE tag, but module firmware
+            // metadata cannot describe a runtime-selected filename. Advertise the conventional
+            // filename used by the distributed metadata.
+            .make_entry_file(name, "ucodes.bin");
 
         // Add the firmware files specific to the GSP boot method of `chipset`.
         let boot_files = boot_firmware_files(chipset);
diff --git a/drivers/gpu/nova-core/firmware/bindata.rs b/drivers/gpu/nova-core/firmware/bindata.rs
new file mode 100644
index 000000000000..5bc35f8819ea
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/bindata.rs
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! GSP bindata firmware loading.
+
+use kernel::{
+    device,
+    prelude::*, //
+};
+
+use crate::{
+    firmware::tlv::{
+        request_tlv,
+        Tlv, //
+    },
+    gpu::Chipset,
+};
+
+/// Requests the optional `ucodes` bindata metadata and loads its payload.
+///
+/// A missing metadata file is reported as [`None`] so that the eventual caller can decide whether
+/// ucodes are optional for its boot path. Once the metadata has been found, all parse and payload
+/// loading errors, including a missing referenced file, are returned as errors.
+#[expect(dead_code)]
+pub(crate) fn request_ucodes_firmware(
+    dev: &device::Device,
+    chipset: Chipset,
+) -> Result<Option<VVec<u8>>> {
+    let firmware = match request_tlv(dev, chipset, "ucodes") {
+        Ok(firmware) => firmware,
+        Err(e) if e == ENOENT => return Ok(None),
+        Err(e) => return Err(e),
+    };
+
+    let tlv = Tlv::new(firmware.data())?;
+    let (_, ucodes) = tlv.load_file(dev, chipset)?;
+
+    Ok(Some(ucodes))
+}
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 48c73a676ecb..754df6849e43 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -6,7 +6,6 @@
         Coherent,
         DmaAddress, //
     },
-    firmware,
     prelude::*,
     str::CString,
 };
@@ -20,8 +19,7 @@
             Tlv,
         },
     },
-    gpu::Chipset,
-    num::FromSafeCast,
+    gpu::Chipset, //
 };
 
 /// GSP firmware with 3-level radix page tables for the GSP bootloader.
@@ -59,19 +57,13 @@ pub(crate) fn new<'a>(
                 fw_version.to_str().unwrap_or("unknown")
             );
 
-            let size = usize::from_safe_cast(tlv.get_u32(b"SIZE")?);
-            let mut fw_vvec = VVec::zeroed(size, GFP_KERNEL).map_err(|_| ENOMEM)?;
-
-            let chip_name = chipset.name();
-            let file = tlv.get_string(b"FILE")?;
-            let filename = CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{file}"))?;
-            firmware::request_into_buf(&filename, dev, fw_vvec.as_mut_slice())?;
+            let (fw_path, fw_vvec) = tlv.load_file(dev, chipset)?;
 
             let signatures = Coherent::from_slice(dev, tlv.get_bytes(b"SIGN")?, GFP_KERNEL)?;
 
             Ok(try_pin_init!(Self {
                 radix3 <- Radix3::new(dev, fw_vvec),
-                fw_path: filename,
+                fw_path,
                 fw_version,
                 signatures,
                 bootloader: {
diff --git a/drivers/gpu/nova-core/firmware/tlv.rs b/drivers/gpu/nova-core/firmware/tlv.rs
index 7b879f13a61e..e4b003f20088 100644
--- a/drivers/gpu/nova-core/firmware/tlv.rs
+++ b/drivers/gpu/nova-core/firmware/tlv.rs
@@ -198,6 +198,43 @@ fn iter(&self) -> TlvIter<'_, 'a> {
         self.iter().find(|b| b.tag == *tag).ok_or(EINVAL)
     }
 
+    /// Loads the file that this TLV references.
+    ///
+    /// A TLV that names its payload rather than carrying it inline holds a `FILE` basename and
+    /// the payload's `SIZE`. The basename is resolved against the metadata file's own directory,
+    /// so an empty name, `.`, `..`, or a name holding a `/` is rejected.
+    ///
+    /// On success, returns the firmware path that was requested and a [`VVec`] holding `SIZE`
+    /// bytes of file contents.
+    ///
+    /// Returns `EINVAL` if either tag is absent or the basename is rejected, and `ENODATA` if
+    /// `SIZE` is zero.
+    pub(crate) fn load_file(
+        &self,
+        dev: &device::Device,
+        chipset: gpu::Chipset,
+    ) -> Result<(CString, VVec<u8>)> {
+        let file = self.get_string(b"FILE")?;
+
+        // FILE is a basename relative to the TLV's directory, not an arbitrary firmware path.
+        if file.is_empty() || matches!(file, "." | "..") || file.contains('/') {
+            return Err(EINVAL);
+        }
+
+        let chip_name = chipset.name();
+        let path = CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{file}"))?;
+
+        let size = usize::from_safe_cast(self.get_u32(b"SIZE")?);
+        if size == 0 {
+            return Err(ENODATA);
+        }
+
+        let mut data = VVec::zeroed(size, GFP_KERNEL).map_err(|_| ENOMEM)?;
+        firmware::request_into_buf(&path, dev, data.as_mut_slice())?;
+
+        Ok((path, data))
+    }
+
     /// Return a slice of bytes.
     ///
     /// Returns `EINVAL` if the value is empty.
-- 
2.55.0

